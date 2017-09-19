//
//  EditDogInfoDelegate.swift
//  myDogs
//
//  Created by Liseth Cardozo Sejas on 9/18/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import Foundation
import UIKit

protocol EditDogInfoDelegate {
    func cancelButtonWasPressed(by: EditViewController)
    func saveButtonWasPressed(by: EditViewController, dogNameEdit : String, dogColorEdit: String, dogTreatEdit: String, image : UIImage?, at: NSIndexPath)
}
