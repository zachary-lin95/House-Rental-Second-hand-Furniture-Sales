//
//  TransitionSegue1.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/19.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class TransitionSegue: UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    func scale(){
        let toviewcontroller = self.destination
        let fromviewcontroller = self.source
        
        let containerview = fromviewcontroller.view.superview
        let orignalcenter = fromviewcontroller.view.center
        toviewcontroller.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        toviewcontroller.view.center = orignalcenter
        
        containerview?.addSubview(toviewcontroller.view)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toviewcontroller.view.transform = CGAffineTransform.identity
        }, completion: { success in
            fromviewcontroller.present(toviewcontroller, animated: false, completion: nil)
            
        })
    }
}

