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
    
    ### Album Functions
    
    | Function           | Description                |
    | :----------------- | :------------------------- |
    | getAlbum           | Get album information      |
    | getAlbumTracks     | Get album tracks           |

    ### Artist Functions

    | Function           | Description                |
    | :----------------- | :------------------------- |
    | getArtist          | Get artist information     |
    | getArtistTopTracks | Get artist top tracks      |
    | getArtistAlbums    | Get artist albums          |
    | getArtistRelated   | Get related artists        |
    | getArtistRadios    | Get artist radios          |
    | getArtistPlaylists | Get artist playlists       |

    ### Chart Functions

    | Function            | Description                |
    | :-----------------  | :------------------------- |
    | getChart            | Get chart                  |
    | getChartTopTracks   | Get chart top tracks       |
    | getChartTopAlbums   | Get chart top albums       |
    | getChartTopArtists  | Get chart top artists      |
    | getChartTopPlaylists| Get chart top playlists    |
    | getChartTopPodcasts | Get chart top podcasts     |

    ### Editor Functions

    | Function            | Description                |
    | :-----------------  | :------------------------- |
    | getEditorial        | Get editorial              |
    | getEditorials       | Get editorials             |

    ### Genre Functions

    | Function            | Description                |
    | :-----------------  | :------------------------- |
    | getGenre            | Get genre details          |
    | getGenres           | Get details list of genres |
    | getGenreArtists     | Get genre artists          |
    | getGenreRadios      | Get genre radios           |

    ### Playlist Functions

    | Function            | Description                |
    | :-----------------  | :------------------------- |
    | getPlaylist         | Get playlist details       |
    | getPlaylistTracks   | Get playlist tracks        |

    ### Radio Functions

    | Function            | Description                |
    | :-----------------  | :------------------------- |
    | getRadio            | Get radio details          |
    | getRadioTracks      | Get radio tracks           |
    | getRadioGenres      | Get radio genres           |
    | getRadioTop         | Get top radios             |
    | getRadioLists       | Get radio lists            |

    ### Search Functions

    | Function            | Description                |
    | :-----------------  | :------------------------- |
    | searchAlbums        | Search for albums          |
    | searchArtists       | Search for artists         |
    | searchPlaylists     | Search for playlists       |
    | searchTracks        | Search for tracks          |
    | searchUsers         | Search for users           |
    | searchRadios        | Search for radios          |

    ### User Functions

    | Function             | Description                |
    | :-----------------   | :------------------------- |
    | getUser              | Get user details           |
    | getUserAlbums        | Get user albums            |
    | getUserArtists       | Get user artists           |
    | getUserTracks        | Get user tracks            |
    | getUserRadios        | Get user radios            |
    | getUserChartTracks   | Get user chart tracks      |
    | getUserChartAlbums   | Get user chart albums      |
    | getUserChartArtists  | Get user chart artists     |
    | getUserChartPlaylists| Get user chart playlists   |
    | getUserFlow          | Get user flow              |
    | getUserFollowings    | Get user followings        |
    | getUserFollowers     | Get user followers         |
    | getUserPlaylists     | Get user playlists         |

    ### Track Functions

    | Function             | Description                |
    | :-----------------   | :------------------------- |
    | getTrack             | Get track details          |
    | getTracks            | Get track details list     |

    ### Favorite Functions

    | Function             | Description                |
    | :-----------------   | :------------------------- |
    | favSongs             | Get favorite songs         |
    | addFavSongs          | Add favorite songs         |
    | removeFavSongs       | Remove favorite songs      |

    ### Download Functions

    | Function             | Description                |
    | :-----------------   | :------------------------- |
    | getSong              | Download a song            |
    | streamSong           | Stream a song              |

4.  **Download a Song:** Use the `getSong` method to download a song:
    
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

5. **Stream a Song:** Use the `streamSong` method to stream a song:

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

