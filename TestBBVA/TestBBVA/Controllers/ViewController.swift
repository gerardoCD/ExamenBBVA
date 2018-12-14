//
//  ViewController.swift
//  TestBBVA
//
//  Created by Gerardo on 12/13/18.
//  Copyright © 2018 Gerardo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var labelParameters: UILabel!
    @IBOutlet weak var textFieldParameters: UITextField!
    
    @IBOutlet weak var textViewParameters: UITextView!
   
    @IBOutlet weak var textFieldURL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.removeObject(forKey: "User")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func segGetPost(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 0{
            labelParameters.isHidden = true
            textViewParameters.isHidden = true
            textFieldParameters.isHidden = true
        }else {
            labelParameters.isHidden = false
            textViewParameters.isHidden = false
            textFieldParameters.isHidden = false
        }
    }
    
    
    @IBAction func buttonQuery(_ sender: UIButton) {
        let query = MyRequestController()
        if (textFieldURL.text?.isEmpty)!{
            let alert = UIAlertController(title: "Alert", message: "You must put a query", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")

                case .cancel:
                    print("cancel")
                case .destructive:
                    print("destructive")
                }}))
            self.present(alert, animated: true, completion: nil)
        }else{
            query.sendRequestGET(url: textFieldURL.text!)
            let user = UserDefaults.standard.array(forKey: "User")
                if user?.count == 0 || user == nil{
                let alert = UIAlertController(title: "Alert", message: "Please check your query", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")

                    case .cancel:
                        print("cancel")
                    case .destructive:
                        print("destructive")

                    }}))
                self.present(alert, animated: true, completion: nil)
                CoreData.createData(url: textFieldURL.text!)
            }else{
                    CoreData.createData(url: textFieldURL.text!)
                    performSegue(withIdentifier: "segue", sender: nil)

            }
            
            
            
        }
        
    }
    
    
    }
    
    
   
  
    


