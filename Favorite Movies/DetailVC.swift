//
//  DetailVC.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/19/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleView = UIImageView(image: UIImage(named: "NavBar.png"))
        self.navigationItem.titleView = titleView
    }

    

}
