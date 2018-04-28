//
//  LoginViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/21.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
var rightnowuser = UserInfo.init(name: "", introduce: "", pic: #imageLiteral(resourceName: "lin's image"), password: "")

class LogInViewController: UIViewController{
    
    @IBOutlet weak var usernametxt: LogInTextField!
    @IBOutlet weak var passwordtxt: LogInTextField!
    
    @IBAction func btnRegister(_ sender: Any) {
        let username = usernametxt.text
        let password = passwordtxt.text
        for user in userlist{
            if user.UserName == username {
                if user.PassWord == password {
                  print("1")
                  rightnowuser = searchuser(username: username!)
                  performSegue(withIdentifier: "LoginSegue", sender: self)
                  
                }else {
                    print("wrong password")
                    let alert = UIAlertController(title: "Error", message: " wrong password ", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: {
                        ACTION in
                        print("Back to check")
                    })
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                print("this user do not exist!")
                let alert = UIAlertController(title: "Error", message: " this user do not exist! ", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: {
                    ACTION in
                    print("Back to check")
                })
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    @IBOutlet weak var ForgetPassWordbtn: UIButton!
    override func viewDidLoad() {
        
        initList()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?TabBarViewController{
            destination
//            if tableView.indexPathForSelectedRow?.row != nil{
//                destination.booking = bookinglist[(tableView.indexPathForSelectedRow?.row)!]
//
//            }else {
//
//                destination.booking = tmpbookingsearchresultlist[(resultcontroller.tableView.indexPathForSelectedRow?.row)!]
//
//                resultcontroller.self.dismiss(animated: true, completion: nil)
//            }
        }
    }
}

func initList()  {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "MM_dd,yyyy"
    let Lin = UserInfo.init(name: "Lin", introduce: "HaHa", pic: #imageLiteral(resourceName: "lin's image"), password: "1")
    userlist.append(Lin)
    let imagelist :[UIImage] = [#imageLiteral(resourceName: "peterborough1"),#imageLiteral(resourceName: "peterborough2"),#imageLiteral(resourceName: "peterborough3")]
    
    let Peterbourough =  RentalRoom.init(owner: "Lin", price: "1000", discription: "Welcome to the room!", imagelist: imagelist, fromdate: dateformatter.date(from: "02_11,2018")!, enddate: dateformatter.date(from: "07_16,2018")!,address: "75 Peterborough St")
    rentalroomlist.append(Peterbourough)
    let sofalist :[UIImage] = [#imageLiteral(resourceName: "sofa"),#imageLiteral(resourceName: "peterborough3"),#imageLiteral(resourceName: "peterborough2"),#imageLiteral(resourceName: "peterborough1")]
    let Sofa = Furniture.init(seller: "Lin", price: "200", discription: "This is a nice sofa!", imagelist: sofalist, name:"sofa")
    furniturelist.append(Sofa)
    let leopardYinlist : [UIImage] = [#imageLiteral(resourceName: "Wechat")]
    let leopardYin = Furniture.init(seller: "Lin", price: "0.1", discription: "傻逼殷若华", imagelist: leopardYinlist, name: "leopardyin")
    furniturelist.append(leopardYin)
}
func searchuser(username:String) -> UserInfo {
    var user1 = UserInfo(name: "", introduce: "", pic: #imageLiteral(resourceName: "myApp"), password: "1")
    
    for user in userlist{
        if user.UserName == username{
            user1 = user
        }
        
    }
    return user1
}



@IBDesignable
class LogInTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor(white: 231/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds:bounds)
    }
}
