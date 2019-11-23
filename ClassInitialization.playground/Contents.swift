import UIKit

class Song {
    
    let name: String
    let duration: Int
    
    init(name: String, duration: Int) {
        self.name = name
        self.duration = duration
    }
    
    init?(dictionary: [String: Any]) {
        if let name = dictionary["name"] as? String,
           let duration = dictionary["duration"] as? Int {
            self.name = name
            self.duration = duration
        } else {
            return nil
        }
    }
    
}

class Album {
    
    let title: String
    let releaseDate: Date
    let songs: [Song]
    
    init(title: String, releaseDate: Date, songs: [Song]) {
        self.title = title
        self.releaseDate = releaseDate
        self.songs = songs
    }
    
    init?(dictionary: [String: Any]) {
        if let title = dictionary["title"] as? String,
           let timestamp = dictionary["releaseDate"] as? Int,
           let songsArray = dictionary["songs"] as? [[String: Any]] {
            self.title = title
            self.releaseDate = Date(timeIntervalSince1970: Double(timestamp))
            
            var fetchedSongs = [Song]()
            for item in songsArray {
                if let song = Song(dictionary: item) {
                    if fetchedSongs.isEmpty {
                        fetchedSongs = [song]
                    } else {
                        fetchedSongs.append(song)
                    }
                } else {
                    print("ERROR: Song object failed to init?() inside Album init?()")
                }
            }
            
            if fetchedSongs.isEmpty {
                return nil
            } else {
                self.songs = fetchedSongs
            }
            
        } else {
            return nil
        }
    }
    
}

class Artist {
    
    let name: String
    var albums: [Album]?
    
    init(name: String, albums: [Album]?) {
        self.name = name
        self.albums = albums
    }
    
    init?(dictionary: [String: Any]) {
        if let name = dictionary["name"] as? String {
            self.name = name
            if let albumsArray = dictionary["albums"] as? [[String: Any]] {
                for item in albumsArray {
                    if let album = Album(dictionary: item) {
                        if var albums = albums {
                            albums.append(album)
                        } else {
                            albums = [album]
                        }
                    } else {
                        print("ERROR: Album object failed to init?() inside Artist init?()")
                    }
                }
            }
        } else {
            return nil
        }
    }
    
}



let artistData = [
    [
        "name": "Jake Jones",
        "albums": [
            [
                "title": "Shady Lane",
                "releaseDate": 1574471030,
                "songs": [
                    [
                        "name": "Cracks",
                        "duration": 224
                    ],
                    [
                        "name": "Seams",
                        "duration": 209
                    ]
                ]
            ]
        ]
    ]
]

for (index, data) in artistData.enumerated() {
    print("-------------------------------------------------------------")
    if let artist = Artist(dictionary: data) {
        print("Artist:", artist.name)
        if let albums = artist.albums {
            for album in albums {
                print("\nAlbum: \(album.title) released on \(album.releaseDate)")
                print("\nSongs include:")
                for song in album.songs {
                    print(song.name)
                }
            }
        }
    }
    if index + 1 == artistData.count {
        print("-------------------------------------------------------------")
    }
}
