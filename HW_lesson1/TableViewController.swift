//
//  TableViewController.swift
//  HW_lesson1
//
//  Created by Almas Nurzhanov on 18.03.2021.
//

import UIKit

class TableViewController: UITableViewController{

    
    var items: [Item] = [
        Item (
            itemName: "FRIHETEN",
            itemDesc : "Sleeper sectional,3 seat w/storage, Skiftebo dark gray",
            itemPrice: "599.00",
            itemStar : "4.6",
            itemImg  : "sofa1_img1.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa1_img2.jpg"
            
        ),
        Item (
            itemName: "FINNALA",
            itemDesc : "Sofa, Gunnared medium gray",
            itemPrice: "699.00",
            itemStar : "4.0",
            itemImg  : "sofa2_img1.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa2_img2.jpg"
        ),
        Item (
            itemName: "EKTORP",
            itemDesc : "Sofa, Lofallet beige",
            itemPrice: "399.00",
            itemStar : "4.6",
            itemImg  : "sofa3_img1.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa3_img2.jpg"
        ),
        Item (
            itemName: "SÖDERHAMN",
            itemDesc : "Sofa, with open end/Finnsta white",
            itemPrice: "459.00",
            itemStar : "4.3",
            itemImg  : "sofa4_img1.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa4_img2.jpg"
        ),
        Item (
            itemName: "SÖDERHAMN",
            itemDesc : "Sectional, 4-seat, with chaise/Samsta dark gray",
            itemPrice: "729.00",
            itemStar : "4.0",
            itemImg  : "sofa5_img1.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa5_img2.jpg"
        ),
        Item (
            itemName: "KLIPPAN",
            itemDesc : "Loveseat, Vissle gray",
            itemPrice: "729.00",
            itemStar : "3.0",
            itemImg  : "sofa6_img1.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa6_img2.jpg"
        )
        
        
    ]
 
   

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "Furniture"
        navigationController?.navigationBar.prefersLargeTitles = true
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //из табл достаем строчку
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        
        let labelName = cell.viewWithTag(1000) as! UILabel
        let labelDesc = cell.viewWithTag(1001) as! UILabel
        let labelStar = cell.viewWithTag(1004) as! UILabel
        let labelPrice = cell.viewWithTag(1006) as! UILabel
        
        labelName.text = item.itemName
        labelDesc.text = item.itemDesc
        labelStar.text = item.itemStar
        labelPrice.text = item.itemPrice
        
        let imgViewAvatar = cell.viewWithTag(1002) as! UIImageView
        imgViewAvatar.image = UIImage(named:item.itemImg)
        
        let imgViewStar = cell.viewWithTag(1003) as! UIImageView
        imgViewStar.image = UIImage(named:item.itemImgStar)
        
        let imgViewPrice = cell.viewWithTag(1005) as! UIImageView
        imgViewPrice.image = UIImage(named:item.itemImgPrice)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let detailVC = (storyboard?.instantiateViewController(identifier: "DetailViewCont"))! as ViewController
        detailVC.name = item.itemName
        detailVC.desc = item.itemDesc
        detailVC.price = item.itemPrice
        detailVC.image1 = item.itemImg
        detailVC.image2 = item.itemImg2
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        let itemNew  = Item (
            itemName: "New item",
            itemDesc : "Description goes here",
            itemPrice: "0.00",
            itemStar : "0.0",
            itemImg  : "sofa3_sample.jpg",
            itemImgStar: "star",
            itemImgPrice: "dollar_sign",
            itemImg2 :"sofa3_sample.jpg"
        )
        
        items.append(itemNew)
        tableView.reloadData()
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
