//
//  ViewController.swift
//  HW_lesson1
//
//  Created by Almas Nurzhanov on 18.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var imgViewTwo: UIImageView!
    @IBOutlet weak var imgViewOne: UIImageView!
    
    var name = ""
    var desc = ""
    var price = ""
    var image1 = ""
    var image2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelName.text = name
        labelDesc.text = desc
        labelPrice.text = price
        imgViewOne.image = UIImage(named: image1)
        imgViewTwo.image = UIImage(named: image2)
    }


}

