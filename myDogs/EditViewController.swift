//
//  EditViewController.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var delegate : EditDogInfoDelegate? 
    
    var dogName : String?
    var dogColor: String?
    var dogTreat: String?
    var dogImage: UIImage?
    var indexPath : NSIndexPath?
    @IBOutlet weak var dogNameEdit: UITextField!
    @IBOutlet weak var dogColorEdit: UITextField!
    @IBOutlet weak var dogTreatEdit: UITextField!
    
    
    @IBOutlet weak var dogImageEdit: UIImageView!
    
    @IBAction func cancelButtonWasPressef(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonWasPressed(by: self)
    }
    
    
    @IBAction func saveButtonWasPressed(_ sender: UIBarButtonItem) {
        
        delegate?.saveButtonWasPressed(by: self, dogNameEdit : dogNameEdit.text!, dogColorEdit: dogColorEdit.text!, dogTreatEdit: dogTreatEdit.text!, image: dogImageEdit!.image, at: indexPath!)

    
    }
//    
    //edit picture
    @IBAction func changeImageButtonWasPressed(_ sender: UIButton) {
        
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
        dogImageEdit.image = selectedPhoto
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dogNameEdit.text = dogName
        dogColorEdit.text = dogColor
        dogTreatEdit.text = dogTreat
        dogImageEdit.image = dogImage

    }

}
