//
//  AddRentalViewController.swift
//  House Rental & Second-hand Furniture Sales
//
//  Created by 林轲 on 2018/4/23.
//  Copyright © 2018年 Northeastern University. All rights reserved.
//

import Foundation
import UIKit

class AddRentalViewController:UIViewController,UITabBarDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    var imagelist : [UIImage] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagelist.count
    }
    func reloadData(images:[UIImage]) {
        self.imagelist = images
        self.addphotocollectionview.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var resultcell : UICollectionViewCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photocellcollcollectionview", for: indexPath) as! photocellcollcollectionview
            cell.addphotoimageview.image = imagelist[indexPath.item]
            resultcell = cell
        return resultcell
    }
    
    @IBAction func addphoto(_ sender: Any) {
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
    }
    

    
    //    @IBOutlet weak var btnaddphoto: UIButton!
//
//
//
//    @IBAction func btnaddphoto(_ sender: Any) {
//        let imagecontroller = UIImagePickerController()
//        imagecontroller.delegate = self
//        imagecontroller.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        self.present(imagecontroller, animated: true, completion: nil)
//    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagelist.append((info[UIImagePickerControllerOriginalImage] as? UIImage)!)
//        customerimageview.contentMode = .scaleAspectFit
        self.dismiss(animated: true, completion: nil)
        self.reloadData(images: imagelist)
    }
    @IBOutlet weak var enddatetxt: UITextField!
    @IBOutlet weak var fromdatetxt: UITextField!
    
    @IBOutlet weak var discriptiontxtview: UITextView!
    @IBOutlet weak var addphotocollectionview: UICollectionView!
    @IBOutlet weak var addresstxt: UITextField!
    @IBOutlet weak var pricetxt: UITextField!
    //    @IBOutlet weak var rentalroomtableview: UITableView!
    var discription :String!
    var rentalroomimagelist: [UIImage]!
    var price:String!
    var address:String!
    var fromdate:Date!
    var enddate:Date!
    let fromdatepicker = UIDatePicker()
    let todatepicker = UIDatePicker()
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0{
//            return 146
//        }else if indexPath.row == 1{
//            return 221
//        }else {
//            return 50
//        }
//
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        var resultcell:UITableViewCell
//        if indexPath.row == 0 {
//            let cell = rentalroomtableview.dequeueReusableCell(withIdentifier: "discriptioncellclass") as! discriptioncellclass
//            cell.discriptionTxt.text = ""
//            discription = cell.discriptionTxt.text
//            resultcell = cell
//        }else if indexPath.row == 1 {
//            let cell = rentalroomtableview.dequeueReusableCell(withIdentifier: "photocell") as! photocell
//            rentalroomimagelist = cell.imagelist
//
//            resultcell = cell
//
//        }else if indexPath.row == 2 {
//            let cell = rentalroomtableview.dequeueReusableCell(withIdentifier: "pricecell") as! pricecell
//            price = cell.price.text
//            resultcell = cell
//        }else  {
//            let cell = rentalroomtableview.dequeueReusableCell(withIdentifier: "addresscell") as! addresscell
//            address = cell.address.text
//            resultcell = cell
//
//        }
////        }else if indexPath.row == 4 {
////            let cell = rentalroomtableview.dequeueReusableCell(withIdentifier: "fromdatecell") as! fromdatecell
////            cell.createDatePicker()
////
//////            fromdate = cell.donepressed()
////            resultcell = cell
////        }else {
////            let cell = rentalroomtableview.dequeueReusableCell(withIdentifier: "enddatecell") as! enddatecell
////            cell.createtodatepicker()
//////            enddate = cell.donetodatepressed()
////            resultcell = cell
////        }
//        return resultcell
//
//    }
    
    
    @IBAction func btncancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func btnpost(_ sender: UIBarButtonItem) {
        discription = discriptiontxtview.text
        price = pricetxt.text
        address = addresstxt.text
        fromdate = donepressed()
        enddate = donetodatepressed()
        rentalroomimagelist = imagelist
        let newroom = RentalRoom.init(owner: rightnowuser.UserName, price: price, discription: discription, imagelist: rentalroomimagelist, fromdate: fromdate, enddate: enddate, address: address)
        rentalroomlist.append(newroom)
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addphotocollectionview.delegate = self
        addphotocollectionview.dataSource = self
//        rentalroomtableview.delegate = self
//        rentalroomtableview.dataSource = self
        createDatePicker()
        createtodatepicker()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        toolbar.setItems([done], animated: false)
        fromdatetxt.inputAccessoryView = toolbar
        fromdatetxt.inputView = fromdatepicker
        fromdatepicker.datePickerMode = .date
        
    }
    func createtodatepicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let donetodate = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donetodatepressed))
        toolbar.setItems([donetodate], animated: false)
        enddatetxt.inputAccessoryView = toolbar
        enddatetxt.inputView = todatepicker
        todatepicker.datePickerMode = .date
    }
    @objc func donetodatepressed() ->Date{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let datestring = formatter.string(from: todatepicker.date)
        
        enddatetxt.text = "\(datestring)"
        self.view.endEditing(true)
        return todatepicker.date
    }
    @objc func donepressed() -> Date{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let datestring = formatter.string(from: fromdatepicker.date)
        
        fromdatetxt.text = "\(datestring)"
        self.view.endEditing(true)
        return fromdatepicker.date
    }

}

//class discriptioncellclass:UITableViewCell{
//    @IBOutlet weak var discriptionTxt: UITextView!
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.discriptionTxt.endEditing(true)
//    }
//    func getdiscription() ->String{
//        let discription :String = discriptionTxt.text
//        return discription
//    }
//
//}

//class photocell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource{
//    var imagelist: [UIImage] = []
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        print(imagelist.count)
//        return (imagelist.count+1)
//    }

//
//    @IBOutlet weak var ImageCollectionView: UICollectionView!{
//        didSet{
//            ImageCollectionView.delegate = self
//            ImageCollectionView.dataSource = self
//        }
//    }
//}
class photocellcollcollectionview:UICollectionViewCell{

    @IBOutlet weak var addphotoimageview: UIImageView!
    
    var image: UIImage! {
        didSet{
            self.addphotoimageview.image = image
            self.setNeedsLayout()
        }
    }
}
//






//
//class fromdatecell :UITableViewCell{
//
//    let fromdatepicker = UIDatePicker()
//    @IBOutlet weak var fromdate: UITextField!
//    func createDatePicker() {
//        print("333333")
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
//        toolbar.setItems([done], animated: false)
//        fromdate.inputAccessoryView = toolbar
//        fromdate.inputView = fromdatepicker
//        fromdatepicker.datePickerMode = .date
//
//    }
//    @objc func donepressed() -> Date{
//        print("1111111")
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        let datestring = formatter.string(from: fromdatepicker.date)
//        fromdate.text = "\(datestring)"
//        self.endEditing(true)
//        return fromdatepicker.date
//    }
//}

//
//class enddatecell: UITableViewCell{
//    let todatepicker = UIDatePicker()
//    @IBOutlet weak var enddate: UITextField!
//    func createtodatepicker(){
//        print("444444")
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let donetodate = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donetodatepressed))
//        toolbar.setItems([donetodate], animated: false)
//        enddate.inputAccessoryView = toolbar
//        enddate.inputView = todatepicker
//        todatepicker.datePickerMode = .date
//    }
//    @objc func donetodatepressed() ->Date{
//        print("2222222")
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        let datestring = formatter.string(from: todatepicker.date)
//        enddate.text = "\(datestring)"
//        self.endEditing(true)
//        return todatepicker.date
//    }
//}

//class pricecell:UITableViewCell{
//    @IBOutlet weak var price: UITextField!
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.price .endEditing(true)
//    }
//}
//class addresscell:UITableViewCell{
//    @IBOutlet weak var address: UITextField!
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.address.endEditing(true)
//    }
//}

//imagecollectionview
//+ button in imagecollectionview

