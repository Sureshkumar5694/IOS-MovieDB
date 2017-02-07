//
//  FavoriteMovieRepository.swift
//  movie
//
//  Created by SureshKumar on 07/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import Foundation
import RealmSwift

class FavouriteMovieRepository {
    
    let realm = try! Realm()
    
    func getAllFavoriteMovies() -> Results<FavouriteMovie>{
        return realm.objects(FavouriteMovie.self)
    }
    
    func removeMovie(movie: FavouriteMovie){
        try! realm.write {
            realm.delete(movie)
        }
    }
}
