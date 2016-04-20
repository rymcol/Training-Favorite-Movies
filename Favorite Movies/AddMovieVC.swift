//
//  AddMovieVC.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/19/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        moviePoster.layer.cornerRadius = moviePoster.frame.size.width / 2
        moviePoster.clipsToBounds = true
        
        addButton.layer.cornerRadius = 5.0
        addButton.clipsToBounds = true
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        moviePoster.image = image
        
    }
    
    func presentAnAlert(title: String, message: String, ackowledgement: String?) {
        let buttonMessage: String
        
        if ackowledgement != nil {
            buttonMessage = ackowledgement!
        } else {
            buttonMessage = "Okay"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: buttonMessage, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func setImagePressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addTheMovie(sender: AnyObject) {
        if let titleToSave = titleTextField.text where titleToSave != "", let descToSave = descTextField.text where descToSave != "", let linkToSave = linkTextField.text where linkToSave != "", let imageToSave = moviePoster.image {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            movie.title = titleToSave
            movie.desc = descToSave
            movie.link = linkToSave
            movie.setMovieImage(imageToSave)
            
            context.insertObject(movie)
            
            do {
                try context.save()
                print("saved")
            } catch {
                print("Could not save movie")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            presentAnAlert("All Fields are Required", message: "It looks like something is missing...", ackowledgement: nil)
        }
    }

}
