//
//  MovieDetailViewController.swift
//  movie
//
//  Created by SureshKumar on 05/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import UIKit
import RealmSwift

class MovieDetailViewController: UIViewController {
    
    var movie: Movie?

    @IBOutlet weak var plot: UILabel!
   
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var userRating: UILabel!
   
    @IBOutlet weak var generes: UILabel!
    
    @IBOutlet weak var votes: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var directors: UILabel!
    
    @IBOutlet weak var writers: UILabel!
   
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addToWatchList(_ sender: UIButton) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(FavouriteMovie(value: ["id": movie?.idIMDB!, "title" : movie?.title!, "year": movie?.year!, "urlPoster": movie?.urlPoster!, "rating": movie?.rating!]), update: true)
        }
    }
    
    private var formatDate: String {
        
        var releasedDate = movie?.releaseDate!
        
        for position in [4,7]{
            releasedDate?.insert("-", at: (releasedDate?.index((releasedDate?.startIndex)!, offsetBy:position))!)
        }
        return releasedDate!

    }
    
    private func updateUI(){
        
        if let moviePlot = movie?.simplePlot{
            self.plot.text = moviePlot
        }
        
        self.movieTitle.text = movie?.title!
        
        if let movieYear = movie?.year{
            self.movieYear.text = movieYear
        }
        
        if let movieImageUrl = movie?.urlPoster {
            do{
                let imageData = try Data(contentsOf: URL(string: movieImageUrl)!)
                self.moviePoster.image = UIImage(data: imageData)
            }catch{
                print(error)
            }
            
        }
        
        if movie?.releaseDate != nil{
            releaseDate.text = self.formatDate
        }
        
        
        if let rating = movie?.rating{
            self.userRating.text = rating
        }else{
            self.userRating.text = "0.0"
        }
        
        if let generes = movie?.genres{
            let initialValue : String = ""
            var generesName: String
            
            if generes.count == 1 {
                generesName = generes[0]
            }else{
                generesName = generes.reduce(initialValue) {genersList, genere in "\(genersList)\(genere) | "}
            }
            
            self.generes.text = generesName
        }
        
        if let votes = movie?.votes{
            self.votes.text = votes
        }
        
        if let directors = movie?.directors{
            let initialValue : String = ""
            var directorsName: String
            
            if directors.count == 1 {
                directorsName = directors[0].name!
            }else{
                directorsName = directors.reduce(initialValue) {directorList, director in "\(directorList)\(director.name!) | "}
            }
            
            self.directors.text = directorsName
        }
        
        
        if let writers = movie?.writers{
            let initialValue : String = ""
            var writersName: String
            
            if writers.count == 1 {
                writersName = writers[0].name!
            }else{
                writersName = writers.reduce(initialValue) {writersList, writer in "\(writersList)\(writer.name!) | "}
            }

            self.writers.text = writersName
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
