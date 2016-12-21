//
//  GameViewController.swift
//  GameCollector
//
//  Created by Marc Streeter on 12/20/16.
//  Copyright © 2016 Developer Warriors. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       imagePicker.delegate = self
    }

    @IBAction func photosTapped(_ sender: AnyObject) {
   imagePicker.sourceType = .photoLibrary
        
    present(imagePicker, animated: true, completion: nil)
        
    }

    @IBOutlet weak var cameraTapped: UIBarButtonItem!

    @IBAction func addTapped(_ sender: AnyObject) {
    }
}