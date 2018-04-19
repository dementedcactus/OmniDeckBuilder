//
//  UploadVC.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/19/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import UIKit

class UploadVC: UIViewController {

    let uploadView = UploadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        view.addSubview(uploadView)
        // Set Title for VC in Nav Bar
        navigationItem.title = "New Post"
        
    }
    

}
