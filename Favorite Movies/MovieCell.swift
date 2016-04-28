//
//  MovieCell.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/19/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieLink: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.movieImage.layer.cornerRadius = 5.0
        self.movieImage.clipsToBounds = true
        
    }
    
    func configureCell(movie: Movie) {
        self.movieImage.image = movie.getMovieImage()
        self.movieTitle.text = movie.title
        self.movieDescription.text = movie.desc
        movieLink.setTitle(movie.link, forState: UIControlState.Normal)
    }

}
