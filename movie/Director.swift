//
//  Directors.swift
//  movie
//
//  Created by SureshKumar on 05/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import Foundation
import Gloss

struct Director: Decodable {
    let name : String?
    let id : String?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.id = "id" <~~ json
    }
}

  
