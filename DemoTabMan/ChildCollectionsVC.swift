//
//  ChildCollectionsVC.swift
//  DemoTabMan
//
//  Created by ToanNT on 7/25/18.
//  Copyright © 2018 ToanNT. All rights reserved.
//

import UIKit
import CollectionKit
import Hero

class ChildCollectionsVC: UIViewController {
    var numb = 0
    let collectionView = CollectionView()
    var dataProvider = ArrayDataSource<Int>(data: Array(0..<5))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataProvider = ArrayDataSource<Int>(data: Array(0..<numb))

        let viewSource = ClosureViewSource(viewUpdater: { (view: UIImageView, data: Int, index: Int) in
            view.backgroundColor = .red
            view.image = UIImage(named: "\(index + 1)")
        })

        collectionView.provider = BasicProvider(identifier: nil,
                                                dataSource: dataProvider,
                                                viewSource: viewSource,
                                                sizeSource: { (index, data, collectionSize) in
                                                    let width: CGFloat = (collectionSize.width)
                                                    return CGSize(width: width, height: width)
        },
                                                layout: FlowLayout(spacing: 5).inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)),
                                                animator: nil,
                                                tapHandler: { [weak self] handler in
                                                    self?.cellTapped(cell: handler.view, data: handler.index)
        })

        view.addSubview(collectionView)
        setFrame(view1: collectionView, equal: view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cellTapped(cell: UIImageView, data: Int) {
        // MARK: Hero configuration
        
        // here we are using the data as the hero.id, we have to make sure that this id is
        // unique for each cell. a random hero.id will also work.
        let heroId = "cell\(data)"
        cell.heroID = heroId
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
        vc.isHeroEnabled = true

        // copy over the backgroundColor and hero.id over to the next view
        // controller. In a real app, we would be passing some data correspoding to the cell
        // being tapped. then configure the next view controller according to the data.
        // and make sure that views that need to be transitioned have the same hero.id

        vc.image = cell.image
        vc.view.heroID = heroId

        present(vc, animated: true, completion: nil)
    }

}
