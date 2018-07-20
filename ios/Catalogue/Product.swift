//
//  Product.swift
//  
//
//  Created by MacBook Pro on 10/07/2018.
//

import UIKit
import Alamofire
import SwiftyJSON

class Product {
    var id: Int?
    var name: String
    var category: Int
    var stock: Int
    var price: Decimal
    var desc: String
    var imageUrl: String
    
    required init?(name: String, id: Int?, category: Int, stock: Int, price: Decimal, desc: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.category = category
        self.stock = stock
        self.price = price
        self.desc = desc
        self.imageUrl = imageUrl
    }
}
