//
//  ViewController.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit
import CoreData

class CollectionViewController: UICollectionViewController, addNewDogInfoDelegate, EditDogInfoDelegate {

    //MOC instance (coreData)
    let manageObjectContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var things = [Dog]()
    override func viewDidLoad() {
        super.viewDidLoad()
    fetchAllItems()
    }
    
    //number of views
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return things.count
    }
    
    //populates with the content
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! Mycell

        let dog = things[indexPath.row]
        let title = dog.name
        cell.dogNameLabel.text = title
        cell.imageView.image = UIImage.init(data:dog.photo! as Data)
 
        return cell
    }
    
    func addDogInfo(by: AddNewImageViewController, dogName : String,  dogColor : String, dogTreat : String, image : UIImage){
        let newDog = NSEntityDescription.insertNewObject(forEntityName: "Dog", into: manageObjectContext)  as! Dog
        newDog.name = dogName
        newDog.color = dogColor
        newDog.favoriteTreat = dogTreat
        newDog.photo = UIImagePNGRepresentation(image)! as NSData
        
        things.append(newDog)
        
        do {
            
            try manageObjectContext.save()
            
        } catch {
            print("\(error)")
        }
        collectionView?.reloadData()
        navigationController?.popViewController(animated: true)
       
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addNewDogSegue" {
            let destination = segue.destination as! AddNewImageViewController
            destination.delegate = self
        } else if segue.identifier == "editDogSegue" {
            let navigationController = segue.destination as! UINavigationController
            let destination = navigationController.topViewController as! EditViewController
            destination.delegate = self
            //pass info along
            
            let indexPath = self.collectionView!.indexPath(for: sender as! UICollectionViewCell)!
        
            let dog = things[indexPath.row]
            let dogName = dog.name
            let dogColor = dog.color
            let dogTreat = dog.favoriteTreat
            destination.dogName = dogName
            destination.dogColor = dogColor
            destination.dogTreat = dogTreat
            destination.dogImage = UIImage.init(data:dog.photo! as Data)
        
            destination.indexPath = indexPath as NSIndexPath
        }
    }
    
    func cancelButtonWasPressed(by: EditViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonWasPressed(by: EditViewController, dogNameEdit : String, dogColorEdit: String, dogTreatEdit: String, image : UIImage?, at : NSIndexPath){
        let newDog = NSEntityDescription.insertNewObject(forEntityName: "Dog", into: manageObjectContext)  as! Dog
        newDog.name = dogNameEdit
        newDog.color = dogColorEdit
        newDog.favoriteTreat = dogTreatEdit
        newDog.photo = UIImagePNGRepresentation(image!)! as NSData
    
        things.append(newDog)
        
        do {
            
            try manageObjectContext.save()
            
        } catch {
            print("\(error)")
        }
       
        collectionView?.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    //fetch data from the database
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Dog")
        do {
            //fetching the data from the dataBase and putting into the todos array
            let result = try manageObjectContext.fetch(request)
            things = result as! [Dog]
            
        } catch {
            print("\(error)")
        }
    }
    
    

}

