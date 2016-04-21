//
//  DetailVC.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/21/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieLink: UIButton!
    @IBOutlet weak var imdbLabel: UILabel!
    
    var movie: Movie?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, movie: Movie?) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.movie = movie
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(animated: Bool) {
        
        self.moviePoster.image = movie?.getMovieImage()
        self.movieTitle.text = movie?.title
        self.movieDesc.text = movie?.desc
    }
    
    @IBAction func closeTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
