//
//  ViewController.swift
//  DemoTabMan
//
//  Created by ToanNT on 7/25/18.
//  Copyright © 2018 ToanNT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewCollections: UIView!
    var collectionVC : CollectionsVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionVC = storyboard?.instantiateViewController(withIdentifier: "CollectionsVC") as? CollectionsVC
        view.addSubview((collectionVC.view)!)
        setFrame(view1: collectionVC.view, equal: viewCollections)
        self.addChildViewController(collectionVC)
        collectionVC.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController {
    func setFrame(view1: UIView, equal view2: UIView) {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.centerXAnchor.constraint(equalTo: view2.centerXAnchor).isActive = true
        view1.centerYAnchor.constraint(equalTo: view2.centerYAnchor).isActive = true
        view1.widthAnchor.constraint(equalTo: view2.widthAnchor).isActive = true
        view1.heightAnchor.constraint(equalTo: view2.heightAnchor).isActive = true
    }
    
}
