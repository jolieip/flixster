//
//  MovieGridViewController.swift
//  flixster
//
//  Created by Jolie Ip Ying See on 28/09/2020.
//  Copyright © 2020 ecotegrity. All rights reserved.
//

import UIKit
import AlamofireImage
class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var collectionView: UICollectionView!
    

    var movies = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        let width = (view.frame.size.width - layout.minimumInteritemSpacing*2)/3
        layout.itemSize = CGSize(width: width, height: width*1.5)
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=7b83206203399287fcbddf826d122c2b")!
       
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.movies = dataDictionary["results"] as! [[String: Any]]
            self.collectionView.reloadData()
            print(self.movies)
        // Do any additional setup after loading the view.
    }
        }
    
    task.resume()
    
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath)
        as! MovieGridCell
        
        let movie = movies[indexPath.item]
        let baseUrl = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        cell.posterView.af_setImage(withURL: posterUrl)
        
        
        return cell
    }
    
}
