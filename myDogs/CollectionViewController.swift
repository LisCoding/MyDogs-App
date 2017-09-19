//
//  ViewController.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, addNewDogInfoDelegate, EditDogInfoDelegate {


    var things = [[Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //number of views
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return things.count
    }
    
    //populates with the content
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! Mycell
        cell.imageView.image = things[indexPath.row][3] as? UIImage
        var title = things[indexPath.row][0] as? String

        cell.dogNameButton.setTitle(title, for: .normal)
     
        
        return cell
    }
    
    func addDogInfo(by: AddNewImageViewController, dogName : String,  dogColor : String, dogTreat : String, image : UIImage){
        things.append([dogName, dogColor, dogTreat, image])
        collectionView?.reloadData()
        navigationController?.popViewController(animated: true)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addNewDogSegue" {
            let destination = segue.destination as! AddNewImageViewController
            destination.delegate = self
        } else if segue.identifier == "editSegue" {
            let navigationController = segue.destination as! UINavigationController
            let destination = navigationController.topViewController as! EditViewController
            destination.delegate = self
            //pass info along
            let indexPath = sender as! NSIndexPath
            let dogName = things[indexPath.row][0]
            let dogColor = things[indexPath.row][1]
            let dogTreat = things[indexPath.row][2]
            destination.dogName = dogName as! String
            destination.dogColor = dogColor as! String
            destination.dogTreat = dogTreat as! String
        }
    }
    
    func cancelButtonWasPressed(by: EditViewController) {
        print("please work")
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonWasPressed(by: EditViewController) {
        print("hey:")
        dismiss(animated: true, completion: nil)
    }
    

}

