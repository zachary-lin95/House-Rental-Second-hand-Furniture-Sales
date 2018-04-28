//
//  ExploreViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/23.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit
class ExploreViewController: UIViewController,SliderGalleryControllerDelegate,UITableViewDelegate,UITableViewDataSource{
    
    
    let screenWidth =  UIScreen.main.bounds.size.width
    
    @IBAction func SwitchAction(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        exploretableview.reloadData()
    }
    @IBOutlet weak var exploretableview: UITableView!
    @IBOutlet weak var btnsearch: UIButton!
    @IBAction func btnsearch(_ sender: Any) {
        let SearchView = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        SearchView.modalTransitionStyle = .crossDissolve
        self.present(SearchView, animated: true, completion: nil)
    }
    
    
    //图片轮播组件
    var sliderGallery : SliderGalleryController!
    
    var p: Int!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //segment switch
        p = 0
        exploretableview.dataSource = self
        exploretableview.delegate = self
        
        //exploretableview.separatorStyle = .none
        
        
        btnsearch.setImage(#imageLiteral(resourceName: "search"), for:.normal)
        btnsearch.imageView?.frame = CGRect(x: 67, y: 0, width: 240, height: 30)
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
        return [#imageLiteral(resourceName: "explore1"),#imageLiteral(resourceName: "explore2"),#imageLiteral(resourceName: "explore3")]
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
    // table view

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(p == 0){
            return  furniturelist.count
            
        }else{
            return rentalroomlist.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exploretableview.dequeueReusableCell(withIdentifier: "ExploreTableViewCell") as! ExploreTableViewCell
        if (p == 0){
            cell.reloadData(images: furniturelist[indexPath.row].imagelist)
            cell.ItemDiscriptionTextFiled.text = furniturelist[indexPath.row].discription
            cell.Price.text = furniturelist[indexPath.row].price
            cell.UserName.text = furniturelist[indexPath.row].owner.UserName
            cell.UserImg.image = furniturelist[indexPath.row].owner.pic
            cell.UserDiscription.text = furniturelist[indexPath.row].owner.Introduction
            
        }else{
            cell.reloadData(images: rentalroomlist[indexPath.row].imagelist)
            cell.ItemDiscriptionTextFiled.text = rentalroomlist[indexPath.row].discription
            cell.Price.text = rentalroomlist[indexPath.row].price
            cell.UserName.text = rentalroomlist[indexPath.row].owner.UserName
            cell.UserImg.image = rentalroomlist[indexPath.row].owner.pic
            cell.UserDiscription.text = rentalroomlist[indexPath.row].owner.Introduction
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedindex = indexPath.row
        if(p == 1){
        performSegue(withIdentifier: "showroomdetails", sender: self)
        
        }else{
            performSegue(withIdentifier: "showfurnituredetail", sender: self)
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(p == 1){
        if let destination = segue.destination as? RoomDetail{
            destination.room = rentalroomlist[(exploretableview.indexPathForSelectedRow?.row)!]
        }
        }else{
            if let destination = segue.destination as? FurnitureDetail{
                destination.furniture = furniturelist[(exploretableview.indexPathForSelectedRow?.row)!]
              }
        
        }
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedindex = indexPath.row
//        performSegue(withIdentifier: "     ", sender: self)
//    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as?CustomerDetails{
//            destination.customer = customerlist[(tableView.indexPathForSelectedRow?.row)!]
//        }
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}
class ExploreTableViewCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate{
    var images: [UIImage] = []
    @IBOutlet weak var ItemDiscriptionTextFiled: UITextView!
    @IBOutlet weak var ItemImageCollectionView: UICollectionView!{
        didSet{
            ItemImageCollectionView.delegate = self
            ItemImageCollectionView.dataSource = self
        }
    }
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var UserDiscription: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserImg: UIImageView!
    func reloadData(images:[UIImage]) {
        self.images = images
        self.ItemImageCollectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        print(images.count)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreTableViewCellCollectionView", for: indexPath) as! ExploreTableViewCellCollectionView
        cell.ItemImage.image = images[indexPath.item]
        return cell
    }
}


class ExploreTableViewCellCollectionView : UICollectionViewCell{
    @IBOutlet weak var ItemImage: UIImageView!
    var image: UIImage! {
        didSet{
             self.ItemImage.image = image
            self.setNeedsLayout()
        }
    }
}
