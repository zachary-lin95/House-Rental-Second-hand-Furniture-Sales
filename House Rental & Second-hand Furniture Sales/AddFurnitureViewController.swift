//
//  AddFurnitureViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/23.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit

class AddFurnitureViewController: UIViewController,UITabBarDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    var imagelist : [UIImage] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagelist.count
    }
    func reloadData(images:[UIImage]) {
        self.imagelist = images
        self.imagecollectionview.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var resultcell : UICollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "furniturephotocellcollectionview", for: indexPath) as! furniturephotocellcollectionview
        cell.furnitureimageview.image = imagelist[indexPath.item]
        resultcell = cell
        return resultcell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagelist.append((info[UIImagePickerControllerOriginalImage] as? UIImage)!)
        //        customerimageview.contentMode = .scaleAspectFit
        self.dismiss(animated: true, completion: nil)
        self.reloadData(images: imagelist)
    }
    @IBOutlet weak var addphotobtn: UIButton!
    @IBOutlet weak var imagecollectionview: UICollectionView!
    @IBOutlet weak var discriptionview: UITextView!
    
    @IBOutlet weak var pricetxt: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBAction func addphotoBtn(_ sender: Any) {
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
    }
    @IBAction func btnpost(_ sender: Any) {
        discription = discriptionview.text
        price = pricetxt.text
        furnitureimagelist = imagelist
        name = nametxt.text
        let newfurniture = Furniture.init(seller: rightnowuser.UserName, price: price, discription: discription, imagelist: furnitureimagelist, name: name)
        furniturelist.append(newfurniture)
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var btnpost: UIBarButtonItem!
    @IBAction func btncancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var discription :String!
    var price : String!
    var furnitureimagelist:[UIImage]!
    var name:String!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        imagecollectionview.dataSource  = self
        imagecollectionview.delegate = self
        
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


class furniturephotocellcollectionview:UICollectionViewCell{
    
    @IBOutlet weak var furnitureimageview: UIImageView!
    var image: UIImage! {
        didSet{
            self.furnitureimageview.image = image
            self.setNeedsLayout()
        }
    }
    

}
