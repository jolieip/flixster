//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by Jolie Ip Ying See on 27/09/2020.
//  Copyright © 2020 ecotegrity. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {

    var movie : [String:Any]!
    
    
    @IBOutlet var backgroundView: UIImageView!
    
    @IBOutlet var posterView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var sypnosisLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        posterView.af_setImage(withURL: posterUrl)
        sypnosisLabel.text = movie["overview"] as? String
        sypnosisLabel.sizeToFit()
        
        
        let backgroundPath = movie["backdrop_path"] as! String
        let backgroundUrl = URL(string: baseUrl + backgroundPath)!
        backgroundView.af_setImage(withURL: backgroundUrl)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
