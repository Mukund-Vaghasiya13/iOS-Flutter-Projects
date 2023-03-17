//
//  ViewController.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 16/03/23.
//
//https://newsapi.org/v2/top-headlines?category=business&apiKey=750a1ffc45194fe0922a46ad88c2be79
//https://newsapi.org/v2/top-headlines?category=sport&apiKey=750a1ffc45194fe0922a46ad88c2be79
//https://newsapi.org/v2/top-headlines?category=health&apiKey=750a1ffc45194fe0922a46ad88c2be79
//https://newsapi.org/v2/top-headlines?category=science&apiKey=750a1ffc45194fe0922a46ad88c2be79
//https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=750a1ffc45194fe0922a46ad88c2be79
//https://newsapi.org/v2/top-headlines?category=technology&apiKey=750a1ffc45194fe0922a46ad88c2be79

// default
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=750a1ffc45194fe0922a46ad88c2be79




import UIKit
import SafariServices
class ViewController: UIViewController {

    var Object:Apidecoder? = nil
    
    
    @IBOutlet weak var TopHedlineTable: UITableView!
    
    
    var ch:String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        TopHedlineTable.delegate = self
        TopHedlineTable.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var url:URL?
        if ch == ""{
            url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=750a1ffc45194fe0922a46ad88c2be79")
        }
        else
        {
            url = URL(string:ch)
        }
        
        let task = URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            
            if let data = data ,error == nil{
                do {
                     Object = try JSONDecoder().decode(Apidecoder.self, from: data)
                    print(Object?.articles![0] as Any)
                    DispatchQueue.main.async {
                        self.TopHedlineTable.reloadData()
                    }
                }
                catch{
                    print("Error 😵")
                }
            }
           
        }
        task.resume()
        
    }
    
    @IBAction func MenuButton(_ sender: Any) {
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "menu") as! menuBarViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "search") as! searchViewController
        vc.data = Object
        navigationController?.pushViewController(vc, animated: true)
    }
    
}




extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Object?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TopHedlineTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.TItle.text = Object?.articles![indexPath.row].title ?? "nil"
        cell.Description.text = Object?.articles![indexPath.row].description ?? "nil"
        
        
        let url = URL(string:((Object?.articles?[indexPath.row].urlToImage ?? "nil")))
        if url == nil {
            cell.Headimage.image = UIImage(named: "Not.jpeg")
        }
        else{
            URLSession.shared.dataTask(with: url!) { data, _, error in
                if let data = data ,error == nil{
                    DispatchQueue.main.async {
                        cell.Headimage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: (Object?.articles![indexPath.row].url)!)
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true)
    }
    
}


