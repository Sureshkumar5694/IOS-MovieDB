//
//  MovieTableViewCell.swift
//  movie
//
//  Created by SureshKumar on 05/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Movie? {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI () {
        if let movieImageUrl = movie?.urlPoster {
            do{
                let imageData = try Data(contentsOf: URL(string: movieImageUrl)!)
                movieImage.image = UIImage(data: imageData)
            }catch{
                print(error)
            }
            
        }
        title.text = movie?.title!
        
        if let movieYear = movie?.year{
            year.text = "(\(movieYear))"
        }else{
            year.text = ""
        }
        
        if let movieRating =  movie?.rating{
            rating.text = movieRating
        }else{
            rating.text = "0.0"
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
