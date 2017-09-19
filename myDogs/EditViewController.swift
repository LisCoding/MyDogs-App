//
//  EditViewController.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class EditViewController: UIViewController  {
    var delegate : EditDogInfoDelegate? 
    
    var dogName : String?
    var dogColor: String?
    var dogTreat: String?
    @IBOutlet weak var dogNameEdit: UITextField!
    @IBOutlet weak var dogColorEdit: UITextField!
    @IBOutlet weak var dogTreatEdit: UITextField!
    
    
    @IBOutlet weak var dogImageEdit: UIImageView!
    
    @IBAction func cancelButtonWasPressef(_ sender: UIBarButtonItem) {
        print("cancel button pressed")
        delegate?.cancelButtonWasPressed(by: self)
        
    }
    
    
    @IBAction func saveButtonWasPressed(_ sender: UIBarButtonItem) {
        print("save button was pressed")
        delegate?.saveButtonWasPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogNameEdit.text = dogName
        print("hahhahha",
             dogName)
        dogColorEdit.text = dogColor
        dogTreatEdit.text = dogTreat


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
