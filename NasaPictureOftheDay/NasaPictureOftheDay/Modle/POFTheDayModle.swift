//
//  POFTheDayModle.swift
//  NasaPictureOftheDay
//
//  Created by Mukund vaghasiya  on 04/07/23.
//

import Foundation

struct POTheDay:Codable{
    var copyright:String?
    var date:String?
    var explanation:String?
    var hdurl:String?
    var title:String?
}


enum ApiError:Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}
