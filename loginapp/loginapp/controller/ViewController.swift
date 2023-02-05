//
//  ViewController.swift
//  loginapp
//
//  Created by Mukund vaghasiya  on 19/01/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var password: UITextField!
    var arr = [SinUpData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "key"){
            let nav = storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
            navigationController?.pushViewController(nav, animated: true)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func LogIn(_ sender: Any) {
        arr = DataBaseHelper.instanceOf.fetchData()
        
        for i in 0..<arr.count{
            if (txtField.text == arr[i].email || txtField.text == arr[i].phoneno || txtField.text == arr[i].username) && (password.text == arr[i].password){
                UserDefaults.standard.set(true, forKey: "key")
                let nav = storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
                navigationController?.pushViewController(nav, animated: true)
            }
            else{
                let alert = UIAlertController(title: "Login fail", message: "Login details is incorrect☠️", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true)
                txtField.text = ""
                password.text = ""
            }
        }
    }
    
    
    @IBAction func SinUp(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "SinUp") as! SinUpViewController
        navigationController?.pushViewController(nav, animated: true)
        
    }
    
}

