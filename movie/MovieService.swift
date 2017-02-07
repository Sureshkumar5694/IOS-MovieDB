//
//  MovieService.swift
//  movie
//
//  Created by SureshKumar on 07/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

protocol MovieServiceDelegate {
    func notifyObserverWithResult(result : Any)
    func notifyObserverWithError(error : Error)
}

class MovieService {
    
    var delegate: MovieServiceDelegate?
    
    func getMoviesList (searchUrl : String){
        
        var moviesList = [Movie]()
        
        Alamofire.request(searchUrl).responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value as? NSDictionary {
                    let data = json["data"] as! NSDictionary!
                    let moviesInfo = data?["movies"] as! [JSON]
                    DispatchQueue.main.async {
                        for movieInfo in moviesInfo{
                            moviesList.append(Movie(json: movieInfo)!)
                        }
                        self.delegate?.notifyObserverWithResult(result: moviesList)
                    }
                }
            case .failure(let error):
                self.delegate?.notifyObserverWithError(error: error)
            }
                
        }
    }    
}
