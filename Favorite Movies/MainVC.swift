//
//  ViewController.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/15/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit
import CoreData
import SafariServices

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    var detailVC: DetailVC!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleView = UIImageView(image: UIImage(named: "NavBar.png"))
        self.navigationItem.titleView = titleView
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("movieCell") as? MovieCell {
            let movieContent = movies[indexPath.row]
            cell.configureCell(movieContent)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        detailVC = DetailVC(nibName: "DetailVC", bundle: nil, movie: movies[indexPath.row])
        presentViewController(detailVC, animated: true, completion: nil)
        
    }
    
    func fetchAndSetResults() {
        let application = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedObjectContext = application.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        do {
            let results = try managedObjectContext.executeFetchRequest(fetchRequest)
            self.movies = results as! [Movie]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func linkTapped(sender: UIButton) {
        let svc = SFSafariViewController(URL: NSURL(string: (sender.titleLabel?.text)!)!)
        self.presentViewController(svc, animated: true, completion: nil)
    }

}

