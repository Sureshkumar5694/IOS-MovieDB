//
//  Movie.swift
//  movie
//
//  Created by SureshKumar on 04/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import Foundation
import Gloss

struct Movie: Decodable {
    let title : String?
    let originalTitle : String?
    let year : String?
    var releaseDate : String?
    let directors : Array<Director>?
    let writers : Array<Writer>?
    let runtime : String?
    let urlPoster : String?
    let genres: [String]?
    let simplePlot : String?
    let rating : String?
    let votes : String?
    let idIMDB : String?
    let urlIMDB : String?
    let type : String?

    
    init?(json: JSON) {
        self.title = "title" <~~ json
        self.originalTitle = "originalTitle" <~~ json
        self.year = "year" <~~ json
        self.releaseDate = "releaseDate" <~~ json
        self.directors = "directors" <~~ json
        self.writers = "writers" <~~ json
        self.runtime = "runtime" <~~ json
        self.urlPoster = "urlPoster" <~~ json
        self.genres = "genres" <~~ json
        self.simplePlot = "simplePlot" <~~ json
        self.rating = "rating" <~~ json
        self.votes = "votes" <~~ json
        self.idIMDB = "idIMDB" <~~ json
        self.urlIMDB = "urlIMDB" <~~ json
        self.type = "type" <~~ json
    }
}
