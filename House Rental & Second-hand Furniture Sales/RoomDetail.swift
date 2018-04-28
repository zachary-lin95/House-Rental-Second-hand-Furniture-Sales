//
//  RoomDetail.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/27.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class RoomDetail: UIViewController {
    
    var imagearray = [UIImage]()
    
    @IBOutlet weak var discriptionview: UITextView!
    @IBAction func returnbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var returnbtn: UIButton!
    @IBOutlet weak var imagescrollview: UIScrollView!
    @IBOutlet weak var addresstxt: UITextField!
    @IBOutlet weak var pricetxt: UITextField!
    @IBAction func btnfavorite(_ sender: Any) {
        if(btnfavorite.isSelected == false)
        {
            btnfavorite.isSelected = true
            // rightnowuser.wantlist.append(room)
        }else{
           btnfavorite.isSelected = false
            //rightnowuser.wantlist.removeLast()
        }
    }
    
    @IBAction func btnshare(_ sender: Any) {
        btnshare.isSelected = true
    }
    @IBOutlet weak var btnshare: UIButton!
    @IBAction func btnmassage(_ sender: Any) {
        
        btnmassage.isSelected = true
//        let alert = UIAlertController(title: "Create success", message: "New Room has been created!", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "OK", style: .default, handler: {
//            ACTION in
//        })
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var detailview2: UIView!
    @IBOutlet weak var btnmassage: UIButton!
    @IBOutlet weak var btnfavorite: UIButton!
    @IBOutlet weak var detailview: UIView!
    var room : RentalRoom?
//    let screenWidth =  UIScreen.main.bounds.size.width
//    var sliderGallery : SliderGalleryController!
//    func galleryDataSource() -> [UIImage] {
//        return [#imageLiteral(resourceName: "explore1"),#imageLiteral(resourceName: "explore2"),#imageLiteral(resourceName: "explore3")]
////        return (room?.imagelist)!
//    }
//
//    func galleryScrollerViewSize() -> CGSize {
//        return CGSize(width: 375, height: 288)
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        pricetxt.text = room?.price
        addresstxt.text = room?.address
        imagearray = (room?.imagelist)!
        discriptionview.text = room?.discription
        
        detailview.layer.cornerRadius = 10
        detailview2.layer.cornerRadius = 10
        imagescrollview.frame = CGRect(x: 0, y: -80, width: 375, height: 368)
        for i in 0..<imagearray.count{
            let  imageview = UIImageView()
            imageview.image = imagearray[i]
            imageview.contentMode = .scaleToFill

            let xPosition = self.view.frame.width * CGFloat(i)
            imageview.frame = CGRect(x: xPosition, y: 0, width: self.imagescrollview.frame.width, height: self.imagescrollview.frame.height)
            imagescrollview.contentSize.width = imagescrollview.frame.width * CGFloat(i+1)
            imagescrollview.addSubview(imageview)
        }
        //初始化图片轮播组件
       // sliderGallery = SliderGalleryController()
 //       sliderGallery.pageControl?.pageIndicatorTintColor = UIColor.black

       // sliderGallery.delegate = self
       // sliderGallery.view.frame = CGRect(x: 0, y: 0, width: 375,
         //                                 height: 288);
        //sliderGallery.view.addSubview(detailview)
        //将图片轮播组件添加到当前视图
       // self.addChildViewController(sliderGallery)
      //  self.view.addSubview(sliderGallery.view)
        
        //添加组件的点击事件
       // let tap = UITapGestureRecognizer(target: self,
             //                            action: #selector(ExploreViewController.handleTapAction(_:)))
      //  sliderGallery.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
//    @objc func handleTapAction(_ tap:UITapGestureRecognizer)->Void{
//        //获取图片索引值
//        let index = sliderGallery.currentIndex
//        //弹出索引信息
//        let alertController = UIAlertController(title: "您点击的图片索引是：",
//                                                message: "\(index)", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
