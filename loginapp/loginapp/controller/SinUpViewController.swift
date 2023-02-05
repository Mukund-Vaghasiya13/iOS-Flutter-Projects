//
//  SinUpViewController.swift
//  loginapp
//
//  Created by Mukund vaghasiya  on 19/01/23.
//

import UIKit

class SinUpViewController: UIViewController {

    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var PhoneNo: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var sinup = [SinUpData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SinUpSave(_ sender: Any) {
            let dic = ["email":Email.text!,"username":Username.text!,"phoneno":PhoneNo.text!,"password":Password.text!]
            DataBaseHelper.instanceOf.saveSinUp(object: dic)
            navigationController?.popViewController(animated: true)
        
        
    }
    
}
