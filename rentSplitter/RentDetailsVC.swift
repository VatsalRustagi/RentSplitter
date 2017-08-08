//
//  RentDetailsVC.swift
//  rentSplitter
//
//  Created by Vatsal Rustagi on 8/8/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import UIKit

class RentDetailsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let rooms: [String] = Array(roomDict.keys)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}

extension RentDetailsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RentData.totalRooms
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? rentCell{
            cell.configureCell(room: rooms[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

class rentCell: UITableViewCell{
    @IBOutlet weak var rent: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func calcRent(forRoom room: String) -> Double{
        if let people = roomPeople[room]{
            if let area = roomDict[room]{
                let rent = (area * RentData.rentRatio) / Double(people) + RentData.rentForCommonRoomPerPerson
                return rent + RentData.utilities / Double(RentData.totalPeople)
            }
        }
        return 0.0
    }
    
    func configureCell(room: String){
        self.name.text = room
        let rent = calcRent(forRoom: room)
        self.rent.text = "$ \( Double(round(rent*100)/100) )"
        
    }
}
