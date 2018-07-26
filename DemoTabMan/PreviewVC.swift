//
//  PreviewVC.swift
//  DemoTabMan
//
//  Created by toannt on 7/26/18.
//  Copyright © 2018 ToanNT. All rights reserved.
//

import UIKit

class PreviewVC: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    var image : UIImage? 
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}
