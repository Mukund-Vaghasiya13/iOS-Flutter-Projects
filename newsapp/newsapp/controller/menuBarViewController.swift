//
//  menuBarViewController.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 17/03/23.
//

import UIKit

class menuBarViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    
    
    var arr = ["Bussiness","Sport","Health","Science","Entertainment","Technology"]
    var link = [
    "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=750a1ffc45194fe0922a46ad88c2be79",
    "https://newsapi.org/v2/top-headlines?category=sport&apiKey=750a1ffc45194fe0922a46ad88c2be79",
    "https://newsapi.org/v2/top-headlines?category=health&apiKey=750a1ffc45194fe0922a46ad88c2be79",
    "https://newsapi.org/v2/top-headlines?category=science&apiKey=750a1ffc45194fe0922a46ad88c2be79",
    "https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=750a1ffc45194fe0922a46ad88c2be79",
    "https://newsapi.org/v2/top-headlines?category=technology&apiKey=750a1ffc45194fe0922a46ad88c2be79"]
    var index = ""

    @IBOutlet weak var Menutable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        Menutable.delegate = self
        Menutable.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Menutable.dequeueReusableCell(withIdentifier: "MCell") as! MTableViewCell
        cell.LableofMenue.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc  = storyboard?.instantiateViewController(withIdentifier: "view") as! ViewController
        vc.ch = link[indexPath.row]
        navigationController?.pushViewController(vc,animated: true)
    }
    
    
}


