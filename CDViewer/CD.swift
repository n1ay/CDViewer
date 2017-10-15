//
//  CD.swift
//  CDViewer
//
//  Created by Kamil on 15/10/2017.
//  Copyright © 2017 Kamil Kos. All rights reserved.
//

import Foundation

class CD {
    var album: String
    var artist: String
    var genre: String
    var year: Int
    var tracks: Int
    
    init(album: String, author: String, genre: String, year: Int, tracks: Int) {
        self.album = album
        self.artist = author
        self.genre = genre
        self.year = year
        self.tracks = tracks
    }
}
