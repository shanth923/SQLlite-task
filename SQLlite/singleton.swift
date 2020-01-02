//
//  singleton.swift
//  SQLlite
//
//  Created by R Shantha Kumar on 12/17/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import Foundation
import SQLite

class FormData : NSObject {

    static var shared = FormData()
    
    var contactsBtn:Int?
    var deleteBtn:Int?
    var upDates = [Int64]()
    
    var firstName1 = [String]()
    var lastName2 = [String]()
    var mobileNo3 = [String]()

    
    
    
    var firstName:String?
    var lastName:String?
    var mobileNo:String?
    
    
    private override init(){
        
        super.init()
    }
    

}
