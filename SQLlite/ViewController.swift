//
//  ViewController.swift
//  SQLlite
//
//  Created by R Shantha Kumar on 12/17/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import SQLite


class ViewController: UIViewController {
    
    
    var path:String?
         var dataBase:Connection?
         
    static var buttonTapped:String!
    
    @IBOutlet weak var stackView1: UIStackView!
    
    @IBOutlet weak var stackView2: UIStackView!
    
    var button1 = [UIButton]()
    var button2 = [UIButton]()
    var int = [Int64]()
    var upDate = [Int64]()
    
    override func viewDidLoad() {
          super.viewDidLoad()
      SQLite()
        
          // Do any additional setup after loading the view.
      }
    
    
    
    @IBAction func addContacts(_ sender: Any) {
        
        ViewController.buttonTapped = "b"
        
        
        for y in button1{

            y.removeFromSuperview()
        }
        for s in button2{
            s.removeFromSuperview()

        }

        button1 = [UIButton]()

        button2 = [UIButton]()

        
       let target = storyboard?.instantiateViewController(identifier: "secondview") as! SecondViewController
        
        navigationController?.pushViewController(target, animated: true)
        
        
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
         
              
  
    
    @IBAction func deleted(_ sender: Any) {
  
    }
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        stackView1.spacing = 30
         stackView2.spacing = 30
        
        int = [Int64]()
        FormData.shared.upDates = [Int64]()
        
        FormData.shared.firstName1 = [String]()
        FormData.shared.lastName2 = [String]()
        FormData.shared.mobileNo3 = [String]()
        
        do{
                let statement = try dataBase!.run("SELECT * FROM CONTACTS")
                    
                    
            for (t,row) in statement.enumerated(){
                        
                        
                        var text = String()
                        
                        for (index,name) in statement.columnNames.enumerated(){
                            
                            if(name == "ID"){
                               
                               int.append(row[index] as! Int64)
                                FormData.shared.upDates.append(row[index] as! Int64)
                           }
                           
                            else if(name == "FirstName"){
                                
                             text = row[index] as! String
                                FormData.shared.firstName1.append(row[index] as! String)
                               
                            }
                            else if(name == "lastName"){

                                text += " " + (row[index]! as! String)
                                FormData.shared.lastName2.append(row[index] as! String)
                                     }
                                
                           else if(name == "MobileNo"){

                                text += "\n" + (row[index]! as! String)
                                FormData.shared.mobileNo3.append(row[index] as! String)
                            }
                            
                            
                            
                            print("ttttttttt" ,text)
                           
                           
                            
                            }
                
                
                
                         let names = UIButton()
                        
                        names.setTitle(text, for: UIControl.State.normal)
                             names.backgroundColor = .blue
                        names.titleLabel!.numberOfLines = 0
                        names.tag = t
                        names.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        button1.append(names)
                         names.addTarget(self, action: #selector(buttonTarget2(obj:)), for: UIControl.Event.touchUpInside)
                              names.tintColor = .black
                             stackView1.addArrangedSubview(names)
                        
                
                
                
                
                
                                let buttonDelete = UIButton()
                                buttonDelete.backgroundColor = .red
                                 buttonDelete.titleLabel?.numberOfLines = 0
                                  buttonDelete.tag = t
                        buttonDelete.heightAnchor.constraint(equalToConstant: 50).isActive = true
                                buttonDelete.setTitle("DELETE", for: UIControl.State.normal)
                                buttonDelete.addTarget(self, action: #selector(buttonTarget(obj:)), for: UIControl.Event.touchUpInside)
                        button2.append(buttonDelete)
                                stackView2.addArrangedSubview(buttonDelete)

                            }
                
                         
                    
                 
            
//            let statemen = try dataBase!.run("UPDATE FROM CONTACTS")
            
            print("updated")
            
        }
                
                
                
                catch{
                    
                    print("not fetched")
                    
                }
        
    }
    
   @objc func buttonTarget(obj:UIButton){
        
      FormData.shared.deleteBtn = obj.tag
    
      print(FormData.shared.deleteBtn)
    
    do{
   
        let statement = try dataBase!.run("DELETE FROM CONTACTS WHERE ID = \(int[FormData.shared.deleteBtn!])")
    
        print(int[FormData.shared.deleteBtn!])
        print(int)
        print("row deleted")
                        
                            }
    
   
    catch{
        
        print("not deleted")
        
    }
  
    
    }
    
    
    @objc func buttonTarget2(obj:UIButton){
        
        
        ViewController.buttonTapped = "a"
        
        FormData.shared.contactsBtn = obj.tag
        
        
        for y in button1{

            y.removeFromSuperview()
        }
        for s in button2{
            s.removeFromSuperview()

        }

        button1 = [UIButton]()

        button2 = [UIButton]()
        
        
        
     
     
//         try dataBase!.run("UPDATE CONTACTS SET Name = FirstName AND Name = lastName AND Name = MobileNo  WHERE Id = \(int[FormData.shared.contactsBtn!])")
//
//        print(int[FormData.shared.contactsBtn!])
     
//
//                         for row in statement{
//
//                             for (index,name) in statement.columnNames.enumerated(){
//
//                                 print("\(name):\(row[index]!)")
//                             }
//                             }
//         print("contact updated")
//
     //                            if(name == "FirstName"){
     //
     //                            let names = UILabel()
     //                            names.backgroundColor = .red
     //                            names.text = row[0] as! String
     //                            stackView1.addArrangedSubview(names)
     //                            }
     
     
     
     let target = storyboard?.instantiateViewController(identifier: "secondview") as! SecondViewController
     
     navigationController?.pushViewController(target, animated: true)
     
     
     
     
     }
    
    
    
    


}

