//
//  Profile-Search.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/26.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class SearchViewController:UIViewController{
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
