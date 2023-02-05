//
//  ViewController.swift
//  jasonDecodePractice
//
//  Created by Mukund vaghasiya  on 05/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OurAppTable: UITableView!
    var arr = [Apicalling]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://restcountries.com/v2/all")
        if let url = url{
            print("ALL goood👍")
            URLSession.shared.dataTask(with: url, completionHandler: {
                (data,response,error) in
                guard let data = data,error == nil else{ return}
                do{
                    self.arr = try JSONDecoder().decode([Apicalling].self, from: data)
                    print(self.arr)
                    print("\n\n\n\n\n",self.arr.count)
                    
                    DispatchQueue.main.async {
                        self.OurAppTable.reloadData()
                    }
                    
                } catch {
                    print("Error 😮‍💨:",error.localizedDescription)
                }
                
            }).resume()
        }
    }
}

// table coding

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowOftable = OurAppTable.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        rowOftable.nameOfCont.text = arr[indexPath.row].name ?? "nil"
        rowOftable.Capital.text = arr[indexPath.row].capital ?? "nil"
        rowOftable.region.text = arr[indexPath.row].region ?? "nil"
        return rowOftable
    }
    
    
}

