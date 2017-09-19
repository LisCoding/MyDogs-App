//
//  AddNewImageViewController.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class AddNewImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var delegate : addNewDogInfoDelegate?
    
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    @IBOutlet weak var dogNameLabel: UITextField!
    
    @IBOutlet weak var dogColorLabel: UITextField!
    
    @IBOutlet weak var favoriteTreatLabel: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func selectPhotoWasPressed(_ sender: UITapGestureRecognizer) {
        //inititialize the variable
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
     
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedPhoto
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addPhotoButtonWasPressed(_ sender: UIButton) {
        
        print("button Was pressed")
        delegate?.addDogInfo(by: self, dogName : dogNameLabel.text!, dogColor : dogColorLabel.text!, dogTreat : favoriteTreatLabel.text!, image : imageView.image!)
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("we are here")
        imageView.image = UIImage(named: "bunny1.jpg")
        imageTitleLabel.text = "Add Photo"
        // Do any additional setup after loading the view.
    }
    
    



}
