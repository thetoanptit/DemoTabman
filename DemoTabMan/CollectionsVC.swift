//
//  CollectionsVC.swift
//  DemoTabMan
//
//  Created by ToanNT on 7/25/18.
//  Copyright © 2018 ToanNT. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class CollectionsVC: TabmanViewController, PageboyViewControllerDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return 4
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        let vc =  ChildCollectionsVC()
        vc.numb = index + 1
        return vc
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.bar.items = [
            Item(title: "All"),
            Item(title: "Art"),
            Item(title: "Summer"),
            Item(title: "Winter")
        ]
        
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in            
            appearance.state.selectedColor = UIColor.red
            appearance.text.font = .systemFont(ofSize: 16.0)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
