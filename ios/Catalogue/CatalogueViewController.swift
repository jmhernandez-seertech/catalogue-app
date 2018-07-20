//
//  ViewController.swift
//  Catalogue
//
//  Created by MacBook Pro on 09/07/2018.
//  Copyright © 2018 Seer Technologies. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class CatalogueViewController: UICollectionViewController  {
    fileprivate let reuseIdentifier = "CatalogueCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate var items = [[String:AnyObject]]()
    @IBOutlet weak var roleControl: UISegmentedControl!
   
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBAction func indexChanged(_ sender: AnyObject) {
        switch roleControl.selectedSegmentIndex
        {
        case 0:
            print("Admin");
            GlobalVariables.sharedManager.role = 0
            self.addButton.isEnabled = true
            self.addButton.tintColor = UIColor.blue
        case 1:
            print("Guest");
            GlobalVariables.sharedManager.role = 1
            self.addButton.isEnabled = false
            self.addButton.tintColor = UIColor.clear
        default:
            break
        }
    }
    
    @IBAction func addNewProduct (sender: UIBarItem) {
        performSegue(withIdentifier: "ProductToAdd", sender: self)
    }

}

extension CatalogueViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("booting")
        Alamofire.request("http://localhost:8000/api/v1/products/").responseJSON { response in
            if((response.result.value) != nil) {
                let json = JSON(response.result.value!)
                
                if let resData = json["data"].arrayObject {
                    var itemlist = resData as! [[String:AnyObject]]
                    
                    for i in 0 ..< itemlist.count {
                        itemlist[i]["image"] = nil
                    }
                    
                    self.items = resData as! [[String:AnyObject]]
                }
                if self.items.count > 0 {
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension CatalogueViewController {
    // tell the collection view how many cells to make
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dict = items[indexPath.row]
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CatalogueViewCell
        
        cell.productName.text = dict["name"] as? String
        
        Alamofire.request(dict["imageUrl"] as! String).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    self.items[indexPath.row]["image"] = UIImage(data: data)
                    cell.productImg.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}

extension CatalogueViewController {
    // MARK: - UICollectionViewDelegate protocol
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dict = items[indexPath.row]
        
        print (dict)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        vc.id = dict["id"] as! Int
        vc.name = dict["name"] as! String
        vc.price = dict["price"] as! String
        vc.desc = dict["description"] as! String
        vc.stock = dict["stock"] as! Int
        vc.imageUrl = dict["imageUrl"] as! String
        if dict["image"] != nil {
            vc.image = (dict["image"] as? UIImage)!
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

