//
//  RentDisplayVC.swift
//  rentSplitter
//
//  Created by Vatsal Rustagi on 5/12/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import UIKit

class RentDisplayVC: UIViewController {
    
    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var roomPeopl: UITextField!
    @IBOutlet weak var roomName: rentTextField!
    @IBOutlet weak var roomArea: UITextField!
    @IBAction func nextButton(_ sender: UIBarButtonItem) {
        if RentData.totalRooms == currentRoomNumber{
            roomDict[roomName.text!] = (roomArea.text! as NSString).doubleValue
            roomPeople[roomName.text!] = (roomPeopl.text! as NSString).integerValue
            performSegue(withIdentifier: "finalVC", sender: nil)
        }else{
            currentRoomNumber += 1
            setRoomNumber()
            roomDict[roomName.text!] = (roomArea.text! as NSString).doubleValue
            roomPeople[roomName.text!] = (roomPeopl.text! as NSString).integerValue
            clearFields()
        }
    }
    
    var currentRoomNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
        }
        setRoomNumber()
    }
    
    func setRoomNumber(){
        roomNumber.text = "Room #\(currentRoomNumber)"
    }
    
    func clearFields(){
        for tf in [roomPeopl,roomName,roomArea]{
            tf?.text = ""
        }
    }
}
