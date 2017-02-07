//
//  watchList.swift
//  movie
//
//  Created by SureshKumar on 06/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import Foundation
import RealmSwift

class FavouriteMovie: Object {
    
    dynamic var id: String = ""
    dynamic var title : String = ""
    dynamic var year : String = ""
    dynamic var urlPoster : String = ""
    dynamic var rating: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

