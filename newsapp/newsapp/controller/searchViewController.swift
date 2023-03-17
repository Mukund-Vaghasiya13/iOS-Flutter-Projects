//
//  searchViewController.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 17/03/23.
//



import UIKit
import SafariServices

class searchViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    
   
    var data:Apidecoder?
    
    let search = UISearchController(searchResultsController: nil)
    var arr = [Articals]()
    var new:[Articals] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = search
        search.searchBar.delegate = self
        search.searchResultsUpdater = self
        tableView.delegate = self
        tableView.dataSource = self
        arr = (data?.articles)!
    }
    
        
}

extension searchViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let textseach = search.searchBar.text
            if textseach == ""{
                arr = (data?.articles)!
            }else{
                arr = arr.filter({ articals in
                    articals.title!.hasPrefix(textseach!)
                })
            }
        tableView.reloadData()
        
    }
    
    
}
extension searchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seccell", for: indexPath) as! secTableViewCell
        cell.txtview.text = arr[indexPath.row].title
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let svc = SFSafariViewController(url:URL(string: arr[indexPath.row].url!)! )
        present(svc, animated: true)
    }
}
