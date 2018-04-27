//
//  TabbarViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/19.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import UIKit
var userlist = [UserInfo]()
var furniturelist = [Furniture]()
var rentalroomlist = [RentalRoom]()


class TabBarViewController: UITabBarController {
    
    var rentalBtn: UIStackView!
    var furnitureBtn: UIStackView!
    var cancelBtn: UIButton!
    var rentalbtn: UIButton!
    var furniturebtn: UIButton!
    
    var rentalBtnPosY: CGFloat!
    var furnitureBtnPosY: CGFloat!
    
    var popView: UIView!
    var blurView: UIView!
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let WINDOW_HEIGHT = self.view.frame.height
        let TAB_HEIGHT = self.tabBar.frame.height
        let GRID_WIDTH = self.view.frame.width / 5
        let MARGIN_X = CGFloat(2)
        let MARGIN_Y = CGFloat(5)
        let BTN_WIDTH = TAB_HEIGHT - MARGIN_X * 2
        let BTN_HEIGHT = TAB_HEIGHT - MARGIN_Y * 2+8
        
        let modalView = UIView()
        modalView.frame = CGRect(x: GRID_WIDTH * 2, y: WINDOW_HEIGHT - TAB_HEIGHT, width: GRID_WIDTH, height: TAB_HEIGHT)
        self.view.addSubview(modalView)
        
        let postBtn = UIButton() //+
        postBtn.frame = CGRect(x: GRID_WIDTH * 2 + (GRID_WIDTH - BTN_WIDTH) / 2, y: WINDOW_HEIGHT - TAB_HEIGHT + MARGIN_Y-39, width: BTN_WIDTH, height: BTN_HEIGHT)
        postBtn.setBackgroundImage(UIImage(named: "add"), for: UIControlState())
        
        self.view.addSubview(postBtn)
        
        postBtn.addTarget(self, action: #selector(TabBarViewController.postButtonClicked(_:)), for: .touchUpInside)
        
        
        
    }
    
    @objc func postButtonClicked(_ sender: UIButton) {
        if !flag {
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
            self.view.addSubview(blurView)
            
            self.blurView = blurView
            
            
            let PSVC = self.storyboard?.instantiateViewController(withIdentifier: "PostSelectionViewController") as! PostSelectionViewController
            PSVC.modalTransitionStyle = .crossDissolve
            self.view.addSubview(PSVC.view)
            
            self.rentalBtn = PSVC.RentalStackview
            self.furnitureBtn = PSVC.FurnitureStackView
            self.cancelBtn = PSVC.btnCanceled
            self.rentalbtn = PSVC.btnRental
            self.furniturebtn = PSVC.btnFurniture
            
            self.rentalBtnPosY = PSVC.RentalStackview.frame.origin.y
            self.furnitureBtnPosY = PSVC.FurnitureStackView.frame.origin.y
            
            
            
            self.popView = PSVC.view
            
            self.popView.alpha = 0
            self.blurView.alpha = 0
            
            self.cancelBtn!.addTarget(self, action: #selector(TabBarViewController.cancelBtnPressed(_:)), for: .touchUpInside)
            self.rentalbtn!.addTarget(self, action: #selector(TabBarViewController.rentalbtnPressed(_:)), for: .touchUpInside)
            self.furniturebtn!.addTarget(self, action: #selector(TabBarViewController.furniturebtnPressed(_:)), for: .touchUpInside)
            self.flag = true
        }
        
        UIView.animate(withDuration: 0.7, animations: { () -> Void in
            
            self.cancelBtn.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            self.popView.alpha = 1
            self.blurView.alpha = 1
        })
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.rentalBtn .frame.height
        self.rentalBtn.frame.origin.y = WINDOW_HEIGHT
        
        
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.rentalBtn.frame.origin.y = self.rentalBtnPosY
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: [], animations: { () -> Void in
            self.furnitureBtn.frame.origin.y = self.furnitureBtnPosY
        }, completion: nil)
        
    }
    @objc func rentalbtnPressed(_ sender: UIButton){
        let AddRental = self.storyboard?.instantiateViewController(withIdentifier: "AddRentalViewController") as! AddRentalViewController
        AddRental.modalTransitionStyle = .crossDissolve
        self.present(AddRental, animated: true, completion: nil)
        
    }
    @objc func furniturebtnPressed(_ ender: UIButton){
        let AddFurniture = self.storyboard?.instantiateViewController(withIdentifier: "AddFurnitureViewController") as! AddFurnitureViewController
        AddFurniture.modalTransitionStyle = .crossDissolve
        self.present(AddFurniture, animated: true, completion: nil)
    }
    @objc func cancelBtnPressed(_ sender: UIButton) {
        
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.rentalBtn!.frame.height
        
        
        UIView.animate(withDuration: 0.7, delay: 0.5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.rentalBtn.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.3, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.furnitureBtn.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 1.3, animations: { () -> Void in
            self.blurView.alpha = 0
            self.popView.alpha = 0
            self.cancelBtn.transform = CGAffineTransform(rotationAngle: CGFloat(0))
        })
        
    }
    
    func initList()  {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM_dd,yyyy"
        let Lin = UserInfo.init(name: "Lin", introduce: "HaHa", pic: #imageLiteral(resourceName: "lin's image"), password: "1")
        userlist.append(Lin)
        let imagelist :[UIImage] = [#imageLiteral(resourceName: "peterborough1"),#imageLiteral(resourceName: "peterborough2"),#imageLiteral(resourceName: "peterborough3")]

        let Peterbourough =  RentalRoom.init(owner: "Lin", price: "1000", discription: "Welcome to the room!", imagelist: imagelist, fromdate: dateformatter.date(from: "02_11,2018")!, enddate: dateformatter.date(from: "07_16,2018")!)
        Lin.rentroomlist.append(Peterbourough)
        rentalroomlist.append(Peterbourough)
        let sofalist :[UIImage] = [#imageLiteral(resourceName: "sofa"),#imageLiteral(resourceName: "setting"),#imageLiteral(resourceName: "user head image"),#imageLiteral(resourceName: "peterborough1"),#imageLiteral(resourceName: "peterborough2"),#imageLiteral(resourceName: "peterborough3")]
        let Sofa = Furniture.init(seller: "Lin", price: "200", discription: "This is a nice sofa!", imagelist: sofalist)
        Lin.sellfurniturelist.append(Sofa)
        furniturelist.append(Sofa)
        
    }
    
}
