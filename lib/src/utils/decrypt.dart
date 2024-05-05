import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:blowfish/blowfish.dart';

// Function to decrypt using Blowfish algorithm
Future<List<int>> decryptBlowfish(
    List<int> encryptedData, Blowfish blowfish) async {
  try {
    if (encryptedData.length % 8 != 0) {
      throw Exception("Invalid data length");
    }
    return blowfish.decryptCBC(encryptedData, [0, 1, 2, 3, 4, 5, 6, 7]);
  } catch (e) {
    print("Failed to decrypt Blowfish: $e");
    return [];
  }
}

// Function to generate Blowfish key
String generateBlowfishKey(String id) {
  try {
    String idMd5 = md5.convert(utf8.encode(id)).toString();
    String bfKey = "";
    for (int i = 0; i < 16; i++) {
      bfKey += String.fromCharCode(
        idMd5.codeUnitAt(i) ^
            idMd5.codeUnitAt(i + 16) ^
            "g4el58wc0zvf9na1".codeUnitAt(i),
      );
    }
    return bfKey;
  } catch (e) {
    print("Failed to generate Blowfish key: $e");
    return "";
  }
}

// Function to get download link
Future<String> getDownloadLink(
  String md5origin,
  String id,
  String format,
  String version,
) async {
  try {
    String url = "$md5origin¤$format¤$id¤$version";
    // print("url: $url");
    List<int> bytes = url.codeUnits;
    url = "${md5.convert(bytes)}¤$url¤";
    int padding = 16 - (url.codeUnits.length % 16);
    List<int> text = url.codeUnits + List.filled(padding, padding);
    final encrypter = Encrypter(
      AES(Key.fromUtf8("jo6aey6haid2Teih"), mode: AESMode.ecb),
    );
    final encrypted = encrypter.encryptBytes(text, iv: IV.fromLength(16));
    return "https://e-cdns-proxy-${md5origin[0]}.dzcdn.net/mobile/1/${encrypted.base16}";
  } catch (e) {
    print("Failed to get download link: $e");
    return "";
  }
}

// Function to decrypt media
Future<List<int>> decryptMedia(List<int> data, String sid) async {
  try {
    String bfkey = generateBlowfishKey(sid);
    if (bfkey.isEmpty || bfkey.length != 16) {
      throw Exception("Invalid Blowfish key");
    }
    // print(bfkey);
    final blowfish = newBlowfish(utf8.encode(bfkey));
    int streamLen = data.length;
    int chunksize = 2048;
    List<int> dest = [];
    for (int position = 0, i = 0;
        position < streamLen;
        position += chunksize, i++) {
      List<int> chunk = [];
      if (streamLen - position >= 2048) {
        chunksize = 2048;
      } else {
        chunksize = streamLen - position;
      }
      List<int> buf = data.sublist(position, position + chunksize);
      if (i % 3 == 0 && chunksize == 2048) {
        chunk = await decryptBlowfish(buf, blowfish);
      } else {
        chunk = buf;
      }
      dest.addAll(chunk);
    }
    return dest;
  } catch (e) {
    print("Failed to decrypt media: $e");
    return [];
  }
}

Stream<List<int>> decryptStream(Response response, String sid) async* {
  try {
    List<int> buffer = [];
    int totalBytesReceived = 0;
    int blockCount = 0;

    await for (List<int> data in response.data.stream) {
      buffer.addAll(data);
      while (buffer.length >= 2048) {
        // print("Buffer size: ${buffer.length}");
        List<int> block = buffer.sublist(0, 2048);
        if (blockCount % 3 == 0) {
          // print("Decrypting block $blockCount");
          // Decrypt the block of data
          String bfkey = generateBlowfishKey(sid);
          if (bfkey.isEmpty || bfkey.length != 16) {
            throw Exception("Invalid Blowfish key");
          }
          final blowfish = newBlowfish(utf8.encode(bfkey));
          if (block.length != 2048) {
            throw Exception("Invalid block size");
          }
          yield await decryptBlowfish(block, blowfish);
        } else {
          // print("Passing block $blockCount");
          yield block;
        }
        buffer.removeRange(0, 2048);
        totalBytesReceived += 2048;
        // print("Total bytes received: $totalBytesReceived");
        blockCount++;
      } // end while
      if (buffer.length + totalBytesReceived == response.data.contentLength) {
        // print("end of stream, yielding remaining buffer");
        yield buffer;
      }
    }
  } catch (e) {
    print("Failed to decrypt media: $e");
  }
}
