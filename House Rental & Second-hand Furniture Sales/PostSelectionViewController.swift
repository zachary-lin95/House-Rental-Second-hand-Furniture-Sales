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
    
    @IBOutlet weak var textBtn: UIStackView!
    @IBOutlet weak var mediaBtn: UIStackView!
    @IBOutlet weak var topBtn: UIStackView!
    @IBOutlet weak var checkinBtn: UIStackView!
    @IBOutlet weak var dianpingBtn: UIStackView!
    @IBOutlet weak var moreBtn: UIStackView!
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        
        
        let WINDOW_HEIGHT = self.view.frame.height
        let BTN_HEIGHT = self.textBtn.frame.height
        
        UIView.animate(withDuration: 0.7, delay: 0.5, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.textBtn.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.3, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.mediaBtn.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.1, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.topBtn.frame.origin.y = WINDOW_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.4, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.checkinBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.2, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.dianpingBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.moreBtn.frame.origin.y = WINDOW_HEIGHT + BTN_HEIGHT
        }, completion: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
