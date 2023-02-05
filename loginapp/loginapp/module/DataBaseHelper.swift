//
//  DataBaseHelper.swift
//  loginapp
//
//  Created by Mukund vaghasiya  on 19/01/23.
//

import UIKit
import CoreData

class DataBaseHelper: NSObject {
    static var instanceOf = DataBaseHelper()
    var contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveSinUp(object:[String:String])
    {
        let sinups = NSEntityDescription.insertNewObject(forEntityName: "SinUpData", into: contex) as! SinUpData
        sinups.email = object["email"]
        sinups.username = object["username"]
        sinups.phoneno = object["phoneno"]
        sinups.password = object["password"]
        
        do{
            try contex.save()
        }
        catch{
            print("Opps data not save...!☠️")
        }

    }
    func fetchData() -> [SinUpData]{
        var sinup = [SinUpData]()
        
        let fetchDt = NSFetchRequest<NSManagedObject>(entityName: "SinUpData")
        do{
            sinup = try contex.fetch(fetchDt) as! [SinUpData]
        }
        catch{
            print("oops data not able to fetch.....!")
        }
        
        
        return sinup
    }
}
