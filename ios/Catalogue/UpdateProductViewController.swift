//
//  UpdateProductViewController.swift
//  Catalogue iOS
//
//  Created by MacBook Pro on 13/07/2018.
//  Copyright © 2018 Seer Technologies. All rights reserved.
//

import UIKit
import Alamofire

class UpdateProductViewController: UIViewController {

    var id = 0
    var name = ""
    var price = ""
    var category = 1
    var desc = ""
    var stock = 0
    var imageUrl = ""
    var editMode = false
    
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productStock: UITextField!
    @IBOutlet weak var productDesc: UITextField!
    @IBOutlet weak var productUrl: UITextField!
    
    @IBOutlet weak var productBtn: UIButton!
    
    @IBAction func updateProduct(_ sender: Any) {

        let parameters: [String: Any] = [
            "category": category,
            "description": productDesc.text as! String,
            "imageUrl": productUrl.text as! String,
            "name": productName.text as! String,
            "price": productPrice.text as! String,
            "stock": Int(productStock.text!) ?? 0
        ]
        
        var url = "http://localhost:8000/api/v1/products/"
        var method = HTTPMethod.post
        
        if (editMode) {
            url = "http://localhost:8000/api/v1/products/\(id)/"
            method = HTTPMethod.put
        }
        
        print(parameters)
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                let alert = UIAlertController(title: "Confirmation", message: "Product updated!", preferredStyle: .alert)
                        
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                        action in self.performSegue(withIdentifier: "UpdateToCollection", sender: self)
                    }))
                
                self.present(alert, animated: true)
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()

        if (id > 0) {
            editMode = true
            if (name != "") {
                productName.text = name
            }
            if (stock > 0) {
                productStock.text = String(stock)
            }
            if (price != "") {
                productPrice.text = price
            }
            if (desc != "") {
                productDesc.text = desc
            }
            if (imageUrl != "") {
                productUrl.text = imageUrl
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
