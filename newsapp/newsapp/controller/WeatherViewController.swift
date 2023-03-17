//
//  WeatherViewController.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 17/03/23.
//

//25c95d52fa1646af995164907231603

/* https://api.weatherapi.com/v1/current.json?key=25c95d52fa1646af995164907231603&q=India*/

import UIKit

class WeatherViewController: UIViewController {

    
    var weatherData:LocationsWeather?
    
    
    @IBOutlet weak var Celcius: UILabel!
    
    
    @IBOutlet weak var Cloudy: UILabel!
    @IBOutlet weak var Humid: UILabel!
    @IBOutlet weak var Wind: UILabel!
    
    @IBOutlet weak var WindLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=25c95d52fa1646af995164907231603&q=India")
        
        URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            if let data = data,error == nil{
                do{
                    let object = try JSONDecoder().decode(LocationsWeather.self, from: data)
                    print(object)
                    weatherData = object
                    DispatchQueue.main.async { [self] in
                        Celcius.text = "\(String(describing: weatherData!.current!.temp_c!))" + "°"
                        Cloudy.text = "\(String(describing: weatherData!.current!.cloud!))"
                        Humid.text = "\(weatherData!.current!.humidity!)" + "%"
                        Wind.text = "Speed:" + "\(weatherData!.current!.wind_kph!)"
                        WindLb.text = "Dir:" + "\(weatherData!.current!.wind_dir!)"
                    }
                  
                }
                catch{
                    print("Fail")
                }
            }
        }.resume()
        
        
        
        
    }
    

    

}
