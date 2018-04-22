//
//  LoginViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/21.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController{
    
    @IBOutlet weak var ForgetPassWordbtn: UIButton!
    override func viewDidLoad() {
        
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
