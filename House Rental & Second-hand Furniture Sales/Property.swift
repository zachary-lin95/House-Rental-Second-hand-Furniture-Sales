//
//  Property.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/18.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit

class UserInfo {
    var UserName: String!
    var Introduction :String!
    
    var pic: UIImage!
    
    init(name:String,introduce:String,pic:UIImage){
        self.UserName = name
        self.Introduction = introduce
        self.pic = pic
        
    }
}

