# Deezer Dart Package

<p align="center">
<a href="https://pub.dev/packages/deezer"><img src="https://img.shields.io/pub/v/deezer" alt="pub: deezer"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: AGPL"></a>
<a href="https://pub.dev/packages/lint"><img src="https://img.shields.io/badge/style-lint-4BC0F5.svg" alt="style: lint"></a>
</p>

A Dart package for easy music downloading from Deezer.

## Overview
The Deezer Dart package provides a convenient way to interact with the Deezer music streaming platform in Dart applications. With this package, developers can easily search for songs, retrieve track information, fetch favorite songs, and download music from Deezer.

## Future

- Search functionality for songs
- Expanded track information retrieval
- Batch operations for fetching track information
- Playlist support
- Optimization for song downloading
- Capability to retrieve favorite songs
- Manage favorite songs (add and delete)
- Stream songs

## Prerequisites

Before using this package, ensure you have the following:

- **Deezer Account:** You don't need a Deezer subscription. Simply create a Deezer account.
- **`arl` Parameter:** Obtain the arl parameter from your Deezer account's browser cookies. This parameter is necessary to authenticate your requests to the Deezer API.

    > **Note:** The `arl` key will expire after approximately 3 months. Make sure to refresh it when needed to continue using the package seamlessly.

## Installation
To use this package
 1. With Dart:
    ```
    $ dart pub add deezer
    ```
 2. With Flutter:
    ```
    $ flutter pub add deezer
    ```
 3. With  pubspec.yaml 
    ```
    dependencies:
      deezer: ^version_number
    ```
    > Run `dart pub get` or `flutter pub get` to install the package.
    
## Usage 

 1. **Import the Package:** Import the `deezer` package in your Dart file:
 
    `import 'package:deezer/deezer.dart';` 
    
2.  **Obtain ARL Parameter:** Obtain the `arl` parameter from your Deezer account's browser cookies. This parameter is required to authenticate your requests to the Deezer API.
    
3.  **Create Deezer Instance:** Use the obtained `arl` parameter to create a Deezer instance:

    ```
    String arl = "get it from your browser cookies";
    Deezer deezer = await Deezer.create(arl: arl);
    ```
    
4.  **Search for a Song:** Use the `search` method to search for a song:
    
    ```
    var searchResult = await deezer.search("Hello");
    ```
    
5.  **Get Track Information:** Use the `getTrack` method to retrieve information about a specific track:
    
    ```
    var trackInfo = await deezer.getTrack("138545995");
    ```
    
6.  **Get Tracks Information:** Use the `getTracks` method to retrieve information about multiple tracks:
    
    ```
    var tracksInfo = await deezer.getTracks(["138545995", "1439299952"]);
    ``` 
    
7.  **Get Favorite Songs:** Use the `favSongs` method to retrieve information about favorite songs:
    
    ```
    var favoriteSongs = await deezer.favSongs();
    ```

8.  **Add Favorite Songs:** Use the `addFavSongs` method to add songs to favorites:
     ```
    bool addFav = await deezer.addFavSongs(["1439299952"]);
    print("Add Favorites: $addFav");
    ```

9.  **Remove Favorite Songs:** Use the `removeFavSongs` method to remove songs from favorites:

    ``` 
    bool removeFav = await deezer.removeFavSongs(["1439299952"]);
    print("Remove Favorites: $removeFav");
    ```

10.  **Download a Song:** Use the `getSong` method to download a song:
    
     ```
     final song = await deezer.getSong("1439299952");
     ```
     Write the downloaded song to a file:

     ```
     if (song?.data != null) {
       File file = File("song.mp3");
         file.writeAsBytesSync(song.data!);
     }      
     ```     

11. **Stream a Song:** Use the `streamSong` method to stream a song:

     ```
     final stream = deezer.streamSong("1439299952");
     ```
     Write the streamed song to a file:
 
    ```   
    File streamFile = File("stream_song.mp3");
    IOSink sink = streamFile.openWrite();
    await for (List<int> chunk in stream) {
        sink.add(chunk);
    }
    await sink.flush();
    await sink.close();
    ```

> Ensure to replace `["1439299952"]` with the actual list of song IDs you want 

## External Libraries
- [**Encrypt**](https://github.com/leocavalcante/encrypt)
- [**Dio**](https://pub.dev/packages/dio)
- [**Blowfish**](https://github.com/sirimathxd/Blowfish)

## Contributing

Contributions are welcome! If you'd like to contribute to this package

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.

