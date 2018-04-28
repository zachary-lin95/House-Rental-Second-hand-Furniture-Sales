//
//  FurnitureDetail.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/27.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class FurnitureDetail: UIViewController{
    func searchfurniture(name: Furniture) -> Int {
        var indexnum : Int = 0
        var indexnum1 :Int = 0
        for furniture in furniturelist{
            if furniture.name == name.name {
                indexnum1 = indexnum
            }else{
                indexnum += 1
            }
            
        }
        return indexnum1
    }
    
    @IBAction func btnbuy(_ sender: Any) {
        furniturelist.remove(at: searchfurniture(name: furniture!))
        rightnowuser.boughtfurniturelist.append(furniture!)
        furniture?.owner = rightnowuser
        
//        for furniture in rightnowuser.wantlist{
//            if let furniture as! Furniture {
//
//            }
//        }
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBOutlet weak var btnbuy: UIButton!
    @IBOutlet weak var detailview: UIView!
    @IBOutlet weak var detailview2: UIView!
    var furniture : Furniture?
    var imagearray = [UIImage]()
    @IBOutlet weak var discriptionview: UITextView!
    @IBAction func btnshared(_ sender: Any) {
        btnshared.isSelected = true
    }
    @IBOutlet weak var btnshared: UIButton!
    @IBAction func btnmessage(_ sender: Any) {
        btnmessage.isSelected = true
    }
    @IBOutlet weak var btnmessage: UIButton!
    @IBAction func btnfavorite(_ sender: Any) {
        if(btnfavorite.isSelected == false)
        {
            btnfavorite.isSelected = true
            print("\(rightnowuser.PassWord)")
            print("\(furniture?.name)")
            rightnowuser.wantlist.append(furniture)
            
        }else{
            btnfavorite.isSelected = false
             rightnowuser.wantlist.removeLast()
        }
    }
    @IBOutlet weak var btnfavorite: UIButton!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var imagescrollview: UIScrollView!
    @IBAction func btncanceled(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        price.text = furniture?.price
        nametxt.text = furniture?.name
        imagearray = (furniture?.imagelist)!
        discriptionview.text = furniture?.discription
        detailview.layer.cornerRadius = 10
        detailview2.layer.cornerRadius = 10
        
        imagescrollview.frame = CGRect(x: 0, y: -80, width: 375, height: 368)
        for i in 0..<imagearray.count{
            let  imageview = UIImageView()
            imageview.image = imagearray[i]
            imageview.contentMode = .scaleToFill
            
            let xPosition = self.view.frame.width * CGFloat(i)
            imageview.frame = CGRect(x: xPosition, y: 0, width: self.imagescrollview.frame.width, height: self.imagescrollview.frame.height)
            imagescrollview.contentSize.width = imagescrollview.frame.width * CGFloat(i+1)
            imagescrollview.addSubview(imageview)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
