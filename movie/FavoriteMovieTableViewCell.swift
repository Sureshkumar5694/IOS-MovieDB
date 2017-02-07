//
//  FavoriteMovieTableViewCell.swift
//  movie
//
//  Created by SureshKumar on 07/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell {
    
    var movie: FavouriteMovie? {
        didSet{
            updateUI()
        }
    }

    @IBOutlet weak var moviePoster: UIImageView!

    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var userRating: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateUI() {
         let movieImageUrl = movie?.urlPoster
            do{
                let imageData = try Data(contentsOf: URL(string: movieImageUrl!)!)
                moviePoster.image = UIImage(data: imageData)
            }catch{
                print(error)
            }
        movieName.text = movie?.title
        userRating.text = movie?.rating
    }
    
    

}
