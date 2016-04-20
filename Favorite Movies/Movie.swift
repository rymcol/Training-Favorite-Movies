//
//  Movie.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/19/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {
    
    func setMovieImage(image: UIImage) {
        let data  = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getMovieImage() -> UIImage? {
        let image = UIImage(data: self.image!)
        return image
    }
    
}