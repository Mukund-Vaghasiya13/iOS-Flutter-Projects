//
//  newData.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 16/03/23.
//

import Foundation

struct Apidecoder:Codable{
    var articles:[Articals]?

}

struct Articals:Codable{
    var source:Source?
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    
}

struct Source:Codable{
    var name:String?
}


