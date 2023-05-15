//
//  Modle.swift
//  FoodZone
//
//  Created by Mukund vaghasiya  on 14/05/23.
//


// STATIC : static Data
import Foundation

struct Modle{
    var id:Int = 0
    var name:String = ""
    var img:String = ""
    var price:String = ""
    
    init(id: Int, name: String, img: String,price:String) {
        self.id = id
        self.name = name
        self.img = img
        self.price = price
    }
}




class Item{
    
    var FastFood:[Modle] = [
    
        .init(id: 1, name: "Pizza", img: "Pizza",price: "150"),
        .init(id: 2, name: "Pasta", img: "Pasta",price: "70"),
        .init(id: 3, name: "Sandwich", img: "Sandwich",price: "90"),
        .init(id: 4, name: "Fries", img: "Fries",price: "100"),
        .init(id: 5, name: "Sammosa", img: "Sammosa",price: "30"),
    ]
    
    var Drinks:[Modle] = [

        .init(id: 6, name: "Cock", img: "Unknown" ,price:"20"),
        .init(id: 7, name: "Sprite", img: "Sprite",price:"20"),
        .init(id: 8, name: "Thumb'sUp", img:"Thumb's up" ,price:"20"),
        .init(id: 9, name: "DiteCock", img:"DietCock" ,price:"20"),
    ]
    
}
