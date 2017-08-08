//
//  RentData.swift
//  rentSplitter
//
//  Created by Vatsal Rustagi on 5/12/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import Foundation

var roomDict: Dictionary<String, Double> = [:]
var roomPeople: Dictionary<String, Int> = [:]

class RentData{
    private static var _totalRent: Double!
    private static var _totalCarpetArea: Double!
    private static var _totalRooms: Int!
    private static var _utilities: Double!
    
    static var totalRent: Double{
        set{
            _totalRent = newValue
        }
        get{
            if _totalRent == nil{
                _totalRent = 1.0
            }
                return _totalRent
        }
    }
    
    static var totalCarpetArea: Double{
        set{
            _totalCarpetArea = newValue
        }
        get{
            if _totalCarpetArea == nil{
                _totalCarpetArea = 1.0
            }
            return _totalCarpetArea
        }
    }
    
    static var totalRooms: Int{
        set{
            _totalRooms = newValue
        }
        get{
            if _totalRooms == nil{
                _totalRooms = 1
            }
            return _totalRooms
        }
    }
    
    static var utilities: Double{
        set{
            _utilities = newValue
        }
        get{
            if _utilities == nil{
                _utilities = 1.0
            }
            return _utilities
        }
    }
    
    static var rentRatio: Double{
        return self.totalRent/self.totalCarpetArea
    }
    
    static var commonRoomArea: Double{
        var totalAreaFromRooms = 0.0
        for (_,v) in roomDict{
            totalAreaFromRooms += v
        }
        return totalCarpetArea - totalAreaFromRooms
    }
    
    static var totalPeople: Int{
        var people = 0
        for (_,v) in roomPeople{
            people += v
        }
        return people
    }
    
    static var rentForCommonRoomPerPerson: Double{
        if totalPeople == 0{
            return 0.0
        }
        return (commonRoomArea * rentRatio) / Double(totalPeople)
    }
    
    
}
