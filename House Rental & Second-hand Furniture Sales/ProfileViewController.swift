//
//  ProfileViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/18.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class ProfileViewController: UIViewController,UITableViewDelegate{
    var user = UserInfo.init(name: "Lin", introduce: "Haha", pic: #imageLiteral(resourceName: "user head image"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
class UserMainCell:UITableViewCell{
    @IBOutlet weak var UserInfoView: UIView!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserIntroduction: UILabel!
    
}
