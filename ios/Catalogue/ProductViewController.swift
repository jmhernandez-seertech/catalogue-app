//
//  ProductViewController.swift
//  Catalogue iOS
//
//  Created by MacBook Pro on 11/07/2018.
//  Copyright © 2018 Seer Technologies. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productBtn: UIButton!
    
    var id = 0
    var name = ""
    var price = ""
    var desc = ""
    var stock = 0
    var imageUrl = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productName.text = name;
        productPrice.text = "₱" + price;
        productDesc.text = desc;
        productImg.image = image
        // Do any additional setup after loading the view.
        
        var label = "Add to Cart"
        if (GlobalVariables.sharedManager.role == 0) {
            label = "Edit Product"
        }
        
        productBtn.setTitle (label, for: .normal)
        productBtn.setTitle (label, for: .highlighted)
    }
    @IBAction func productBtnAction(_ sender: Any) {
        
        // if admin go to Edit Product
        if (GlobalVariables.sharedManager.role == 0) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "UpdateProductViewController") as! UpdateProductViewController
            vc.id = self.id
            vc.name = self.name
            vc.price = self.price
            vc.desc = self.desc
            vc.stock = self.stock
            vc.imageUrl = self.imageUrl
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
