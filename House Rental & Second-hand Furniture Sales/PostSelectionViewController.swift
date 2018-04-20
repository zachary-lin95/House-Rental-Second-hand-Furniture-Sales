//
//  PostSelectionViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/19.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit

class PostSelectionViewController: UIViewController {
    
    @IBOutlet weak var RentalStackview: UIStackView!
    
    @IBOutlet weak var FurnitureStackView: UIStackView!
    
    @IBOutlet weak var btnCanceled: UIButton!
    
    @IBAction func btnCanceled(_ sender: Any) {
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.RentalStackview.frame.height
        UIView.animate(withDuration: 0.7, delay: 0.5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.RentalStackview.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.3, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.FurnitureStackView.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
