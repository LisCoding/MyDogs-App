//
//  AddNewDogInfoDelegate.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import Foundation

import UIKit

protocol addNewDogInfoDelegate {
    func addDogInfo(by: AddNewImageViewController, dogName : String,  dogColor : String, dogTreat : String, image : UIImage)
}
