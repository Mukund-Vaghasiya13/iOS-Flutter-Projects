//
//  wheatherApi.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 17/03/23.
//

import Foundation

struct LocationsWeather:Codable{
    var name:location?
    var region:String?
    var country:String?
    var current:Current?
}

struct location:Codable{
    var name:String?
    var region:String?
    var country:String?
}
struct Current:Codable{
    var temp_c:Int?
    var temp_f:Float?
    var condition:Condition?
    var wind_mph:Float?
    var wind_kph:Float?
    var wind_degree:Int?
    var wind_dir:String?
    var humidity:Int?
    var cloud:Int?
}

struct Condition:Codable{
    var icon:String?
   
    
}
