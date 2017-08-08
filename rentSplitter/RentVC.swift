//
//  ViewController.swift
//  rentSplitter
//
//  Created by Vatsal Rustagi on 5/12/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import UIKit

class RentVC: UIViewController {

    @IBOutlet weak var totalRent: UITextField!
    @IBOutlet weak var totalCarpetArea: UITextField!
    @IBOutlet weak var numberOfRooms: UITextField!
    @IBOutlet weak var utilities: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalRent.becomeFirstResponder()
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @IBAction func nextBtn(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "nextVC", sender: nil)
        
        
        RentData.totalCarpetArea = (totalCarpetArea.text! as NSString).doubleValue
        RentData.totalRent = (totalRent.text! as NSString).doubleValue
        RentData.utilities = (utilities.text! as NSString).doubleValue
        RentData.totalRooms = (numberOfRooms.text! as NSString).integerValue
    }


}

