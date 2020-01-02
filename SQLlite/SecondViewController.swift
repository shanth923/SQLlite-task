//
//  SecondViewController.swift
//  SQLlite
//
//  Created by R Shantha Kumar on 12/17/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import SQLite



class SecondViewController: UIViewController {

    
     var int = [Int64]()
    
    
    
  public  var path:String?
  public  var dataBase:Connection?
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var secondName: UITextField!
    
    @IBOutlet weak var mobileNo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SQLite()
        if(ViewController.buttonTapped == "a")
        {
            upadte()
        }
       
        // Do any additional setup after loading the view.
    }
    
    
    func SQLite(){
        
        
        path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!

        do{
            dataBase = try Connection("\(path!)/db.sqlite3")
            print(dataBase!)
            
            try dataBase!.run("CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT,FirstName Text,lastName Text,MobileNo Text)")
            
  
        }
     
        catch{
            
            print("data not connected")
            
        }
        
        
    }
    
    @IBAction func saveBarButton(_ sender: Any) {
        
        do{
            
            
            try dataBase!.run("INSERT INTO CONTACTS(FirstName,lastName,MobileNo) VALUES (?,?,?)",firstName.text!,secondName.text!,mobileNo.text!)
            self.navigationController?.popViewController(animated: true)
        }catch{
            
           print("not insert Data")
            
        }
        
    

    }
    
    
    
    @IBAction func fetchData(_ sender: Any) {
        
   do{
    print(FormData.shared.upDates[FormData.shared.contactsBtn!])

    let statement = try dataBase!.run("UPDATE CONTACTS SET FirstName = '\(firstName.text!)', lastName = '\(secondName.text!)' , MobileNo = '\(mobileNo.text!)'  WHERE ID =  \(FormData.shared.upDates[FormData.shared.contactsBtn!])")
           
           self.navigationController?.popViewController(animated: true)
    
   }catch{
       
       
       print("")
       
       
   }
        
    }
    
    func upadte() {

      
        

        firstName.text = FormData.shared.firstName1[FormData.shared.contactsBtn!]
        secondName.text = FormData.shared.lastName2[FormData.shared.contactsBtn!]
        mobileNo.text = FormData.shared.mobileNo3[FormData.shared.contactsBtn!]

    }

 
}
