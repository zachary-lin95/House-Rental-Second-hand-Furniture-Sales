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
    var wantlist:[Any]
    
    init(name:String,introduce:String,pic:UIImage,password:String){
        self.UserName = name
        self.Introduction = introduce
        self.pic = pic
        self.PassWord = password
        self.wantlist = []
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
    
    init(owner:String, price:String,discription:String,imagelist: [UIImage],fromdate:Date,enddate:Date,address:String){
        self.owner = searchowner(ownername: owner)
        self.price = price
        self.discription = discription
        self.imagelist = imagelist
        self.fromdate = fromdate
        self.enddate = enddate
        self.address = address
    }
}

class Furniture {
    var name:String!
    var owner:UserInfo!
    var price:String!
    var discription:String!
    var imagelist:[UIImage]!
    
    init(seller:String,price:String,discription:String,imagelist:[UIImage],name:String) {
        self.owner = searchowner(ownername: seller)
        self.price = price
        self.discription = discription
        self.imagelist = imagelist
        self.name = name
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

