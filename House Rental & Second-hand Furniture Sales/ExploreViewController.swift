//
//  ExploreViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/23.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class ExploreViewController: UIViewController,SliderGalleryControllerDelegate {
    let screenWidth =  UIScreen.main.bounds.size.width
    
    @IBOutlet weak var searchbar: UITableView!

    
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.frame = CGRect(x: 0, y: 90, width: 375,
                                          height: 150);
        
        //将图片轮播组件添加到当前视图
        self.addChildViewController(sliderGallery)
        self.view.addSubview(sliderGallery.view)
        
        //添加组件的点击事件
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(ExploreViewController.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tap)
    }
    
    
    //图片轮播组件协议方法：获取内部scrollView尺寸
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: 375, height: 150)
    }
    
    //图片轮播组件协议方法：获取数据集合
    func galleryDataSource() -> [UIImage] {
        return [#imageLiteral(resourceName: "myApp"),#imageLiteral(resourceName: "city的副本"),#imageLiteral(resourceName: "cityscape"),#imageLiteral(resourceName: "loginbackground"),#imageLiteral(resourceName: "loginitem")]
    }
    
    //点击事件响应
    @objc func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
        //获取图片索引值
        let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：",
                                                message: "\(index)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //self.itemtableview.endEditing(true)
        //self.sliderGallery.view.endEditing(true)
        
    }
}
