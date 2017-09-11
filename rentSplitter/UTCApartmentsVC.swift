//
//  UTCApartmentsVC.swift
//  rentSplitter
//
//  Created by Vatsal Rustagi on 9/11/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import UIKit

class UTCApartmentsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var apartmentPicker: UIPickerView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var apartments = ["Berkeley & Columbia Court",
                      "Ambrose",
                      "Dartmouth Court",
                      "Harvard & Cornell",
                      "Stanford Court"]
    
    var plans = [UTCModel(img: #imageLiteral(resourceName: "Columbia_1"), plan: "Plan A", rooms: 1, area: 650),
                 UTCModel(img: #imageLiteral(resourceName: "Columbia_2"), plan: "Plan B", rooms: 1, area: 750),
                 UTCModel(img: #imageLiteral(resourceName: "Columbia_3"), plan: "Plan C", rooms: 2, area: 850),
                 UTCModel(img: #imageLiteral(resourceName: "Columbia_4"), plan: "Plan D", rooms: 2, area: 950)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plans.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "apartmentCell", for: indexPath) as? ApartmentCell{
            let plan = plans[indexPath.row]
            cell.updateUI(model: plan)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension UTCApartmentsVC: UIPickerViewDelegate,UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return apartments.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return apartments[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

class ApartmentCell: UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var planAndRooms: UILabel!
    

    func updateUI(model: UTCModel){
        image.image = model.image
        area.text = "\(model.area) Sq Ft."
        planAndRooms.text = "\(model.plan) | \(model.rooms) Rooms"
    }
    
}

class UTCModel{
    private var _image: UIImage!
    private var _plan: String!
    private var _rooms: Int!
    private var _area: Int!
    
    init(img: UIImage, plan: String, rooms: Int, area: Int) {
        _image = img
        _plan = plan
        _rooms = rooms
        _area = area
    }
    
    var image: UIImage{
        set{
            _image = newValue
        }
        get{
            if _image == nil{
                return UIImage()
            }
            return _image
        }
    }
    
    var plan: String{
        set{
            _plan = newValue
        }
        get{
            if _plan == nil{
                return " "
            }
            return _plan
        }
    }
    
    var rooms: Int {
        set{
            _rooms = newValue
        }
        get{
            if _rooms == nil{
                return 1
            }
            return _rooms
        }
    }
    
    var area: Int{
        set{
            _area = newValue
        }
        get{
            if _area == nil{
                return 1
            }
            return _area
        }
    }
}
