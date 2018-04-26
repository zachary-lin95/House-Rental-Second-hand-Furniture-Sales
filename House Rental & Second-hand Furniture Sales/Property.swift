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
    var PassWord:String!
    
    var rentroomlist:[RentalRoom]!
    var sellfurniturelist:[Furniture]!
    var leaseroomlist:[RentalRoom]!
    var boughtfurniturelist:[Furniture]!
    
    init(name:String,introduce:String,pic:UIImage,password:String){
        self.UserName = name
        self.Introduction = introduce
        self.pic = pic
        self.PassWord = password
    }
}

class RentalRoom {
    var owner: UserInfo!
    var tenant: UserInfo!
    var fromdate:Date!
    var enddate:Date!
    var price:String!
    var discription:String!
    var imagelist:[UIImage]!
    var address: String!
    
    init(owner:String, price:String,discription:String,imagelist: [UIImage],fromdate:Date,enddate:Date){
        self.owner = searchowner(ownername: owner)
        self.price = price
        self.discription = discription
        self.imagelist = imagelist
        self.fromdate = fromdate
        self.enddate = enddate
    }
}

class Furniture {
    var seller:UserInfo!
    var buyer:UserInfo!
    var price:String!
    var discription:String!
    var imagelist:[UIImage]!
    
    init(seller:String,price:String,discription:String,imagelist:[UIImage]) {
        self.seller = searchowner(ownername: seller)
        self.price = price
        self.discription = discription
        self.imagelist = imagelist
        
    }
    
    
}
func searchowner(ownername:String) -> UserInfo {
    var user = UserInfo(name: "", introduce: "", pic: #imageLiteral(resourceName: "myApp"), password: "1")
    
    for owner in userlist{
        if owner.UserName == ownername{
            user = owner
        }
        
    }
    return user
}

