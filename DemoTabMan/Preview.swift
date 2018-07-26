//
//  Preview.swift
//  DemoTabMan
//
//  Created by ToanNT on 7/25/18.
//  Copyright © 2018 ToanNT. All rights reserved.
//

import UIKit

class Preview: UIView {
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("Preview", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
