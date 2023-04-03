//
//  ViewController.swift
//  practiceset1
//
//  Created by Mukund vaghasiya  on 24/03/23.
//

import UIKit

class ViewController: UIViewController {

    // answer data
    @IBOutlet weak var TableViewTb: UITableView!
    var arrrowCounter = [Int]()
    var id:Int = 0
    var ansArr:Double = 0
    
    
    var Value:Double = 0
    var sine:String = ""
    var userValue:Double = 0
    
    var arrofamount = 0
    
    var amt:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func leftButton(_ sender: Any) {
        TableViewTb.reloadData()
        
    }
    
    
    @IBAction func rightButton(_ sender: Any) {
        id = id + 1;
        arrrowCounter.append(id)
        TableViewTb.reloadData()
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrrowCounter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! tableViewcellTableViewCell
        Value = Double(cell.Amount.text ?? "0")!
        sine = cell.Sine.text ?? "0"
        userValue = Double(cell.Value.text ?? "0")!
        Answer()
        print(amt)
        cell.Answer.text = String(ansArr)
        return cell
    }
    
    func Answer()
    {
        switch sine{
        case "+":ansArr = Value + userValue
            amt.append(ansArr)
                break
        case "-":ansArr = Value - userValue
            amt.append(ansArr)
                break
        case "*":ansArr = Value * userValue
            amt.append(ansArr)
                break
        case "/":ansArr = Value / userValue
            amt.append(ansArr)
                break
            
        default:
            let alert = UIAlertController(title: sine + "/Empety", message: "Inavid", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .destructive)
            alert.addAction(action)
            present(alert, animated: true)
            
        }
    }
    
    
}

