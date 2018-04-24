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
    var settingitem:[String] = ["published","bought","wanted","setting"]
    
    @IBOutlet weak var UserInfoTableView: UITableView!
    @IBOutlet weak var UserTableView: UITableView!
    override func viewDidLoad() {
        UserTableView.delegate = self
        UserTableView.dataSource = self
        UserInfoTableView.delegate = self
        UserInfoTableView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView.tag == 1{
            return 1
        }else {
            return settingitem.count
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1{
            return 100
        }else {
            return 77
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if tableView.tag == 1{
            let cell = UserTableView.dequeueReusableCell(withIdentifier: "UserMainCell") as! UserMainCell
            cell.UserName.text = user.UserName
            cell.UserIntroduction.text = user.Introduction
            cell.UserImage.image = user.pic
            cell.UserImage.layer.cornerRadius = cell.UserImage.frame.width / 2
            return cell
        }else  {
            let cell = UserInfoTableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as! UserInfoCell
                cell.UserInfoItem.text = self.settingitem[indexPath.row]
            cell.UserInfoImage.image = UIImage(named:"\(String(cell.UserInfoItem.text!))")
                return cell
        }

    }
    
    
    
}
class UserMainCell:UITableViewCell{
    @IBOutlet weak var UserInfoView: UIView!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserIntroduction: UILabel!
    
}
class UserInfoCell: UITableViewCell {
    @IBOutlet weak var UserInfoItem: UILabel!
    @IBOutlet weak var UserInfoImage: UIImageView!
}
