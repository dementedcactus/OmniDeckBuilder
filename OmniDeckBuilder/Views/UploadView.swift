//
//  UploadView.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/19/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import UIKit

class UploadView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .purple
        setupViews()
    }
    
    private func setupViews() {
        
    }

}
