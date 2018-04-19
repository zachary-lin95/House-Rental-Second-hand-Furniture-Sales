//
//  ProfileViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/18.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var user = UserInfo.init(name: "Lin", introduce: "Haha", pic: #imageLiteral(resourceName: "user head image"))
    
    @IBOutlet weak var UserTableView: UITableView!
    override func viewDidLoad() {
        UserTableView.delegate = self
        UserTableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UserTableView.dequeueReusableCell(withIdentifier: "UserMainCell") as! UserMainCell
        cell.UserName.text = user.UserName
        cell.UserIntroduction.text = user.Introduction
        cell.UserImage.image = user.pic
        cell.UserImage.layer.cornerRadius = cell.UserImage.frame.height / 2
        return cell
    }
    
    
    
}
class UserMainCell:UITableViewCell{
    @IBOutlet weak var UserInfoView: UIView!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserIntroduction: UILabel!
    
}
