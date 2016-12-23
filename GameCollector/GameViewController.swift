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
    var game : Game? = nil
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var addupdatebutton: UIButton!
   
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       imagePicker.delegate = self
    
        if game != nil {
         gameImageView.image = UIImage(data: game!.image as! Data)
        titleTextField.text = game!.title
       
        addupdatebutton.setTitle("Update", for: .normal)
        }else{
            deleteButton.isHidden = true
        }
    
    }

    @IBAction func photosTapped(_ sender: AnyObject) {
   imagePicker.sourceType = .photoLibrary
        
    present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
      
        imagePicker.dismiss(animated: true, completion: nil)
    } 
    
    @IBOutlet weak var cameraTapped: UIBarButtonItem!
 
    @IBAction func addTapped(_ sender: AnyObject) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
   let game = Game(context: context)
   game.title = titleTextField.text
   game.image = UIImagePNGRepresentation(gameImageView.image!) as NSData?
(UIApplication.shared.delegate as! AppDelegate).saveContext()

        navigationController?.popViewController(animated: true)

    
    }

}
