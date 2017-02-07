
//  ViewController.swift
//  movie
//
//  Created by SureshKumar on 04/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//
import UIKit
import Alamofire
import Gloss
import DZNEmptyDataSet
import SVProgressHUD
import Toaster

class MovieListController: UIViewController, UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, MovieServiceDelegate {

    @IBOutlet weak var searchedMovie: UITextField!
    
    @IBOutlet weak var movieTableView: UITableView!
    
    let movieService = MovieService()
    
    var moviesInfoList = [Movie](){
        didSet{
            self.movieTableView.reloadData()
        }
    }
    
    struct StoryBoard {
        static let movieDetailSegue = "showMovieDetails"
    }
    
    private var movieUrl: String {
        let searchString = searchedMovie.text!
        return "http://www.myapifilms.com/imdb/idIMDB?title=\(searchString)&token=443ed3e8-972a-4cca-b47c-ffeb3f3568b9&format=json&language=en-us&limit=10"
    }
    
    @IBAction func getMovie(_ sender: UIButton) {
        self.moviesInfoList = []
        SVProgressHUD.show()
        DispatchQueue.global(qos: .userInitiated).async {
            self.movieService.getMoviesList(searchUrl : self.movieUrl)
        }
    
    }
    
    func notifyObserverWithResult(result : Any){
        self.moviesInfoList = result as! [Movie]
        SVProgressHUD.dismiss()
    }
    
    func notifyObserverWithError(error : Error){
        Toast(text: error.localizedDescription, duration: Delay.short).show()
        SVProgressHUD.dismiss()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.movieDetailSegue{
            let destinationViewController = segue.destination as? MovieDetailViewController
            destinationViewController?.movie = moviesInfoList[(movieTableView.indexPathForSelectedRow?.row)!]
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.emptyDataSetSource = self
        movieTableView.emptyDataSetDelegate = self
        movieTableView.tableFooterView = UIView()
        movieService.delegate = self
    }

    // TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.moviesInfoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
        
        let movie = moviesInfoList[indexPath.row]
        if let movieCell = cell as? MovieTableViewCell {
            movieCell.movie = movie
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Empty data set
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = "Movie Database"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
        return NSAttributedString(string: title, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "No Movies to show"
        let attrs = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "moviedb")
    }

}

