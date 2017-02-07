//
//  FavouriteMovieTableViewController.swift
//  movie
//
//  Created by SureshKumar on 07/02/17.
//  Copyright © 2017 ajira. All rights reserved.
//

import UIKit
import RealmSwift

class FavouriteMovieTableViewController: UITableViewController {
    
    let favoriteMovieRepository  = FavouriteMovieRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovieRepository.getAllFavoriteMovies().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite Movie", for: indexPath)
        
        let movie = favoriteMovieRepository.getAllFavoriteMovies()[indexPath.row]
        if let favoriteMovieCell = cell as? FavoriteMovieTableViewCell {
            favoriteMovieCell.movie = movie
        }

        return cell
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") { (action : UITableViewRowAction, indexPath : IndexPath) in
            self.favoriteMovieRepository.removeMovie(movie: (self.favoriteMovieRepository.getAllFavoriteMovies()[indexPath.row]))
            tableView.deleteRows(at: [indexPath], with: .fade)}
        deleteAction.backgroundColor = UIColor.gray
        return[deleteAction]
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
