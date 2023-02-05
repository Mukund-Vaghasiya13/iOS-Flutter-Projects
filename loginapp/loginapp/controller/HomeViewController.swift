//
//  HomeViewController.swift
//  loginapp
//
//  Created by Mukund vaghasiya  on 20/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "logout", style: .done, target: self, action: #selector(action))
     
       
    }
    @objc func action()
    {
        navigationController?.popToRootViewController(animated: true)
    }
   
}
