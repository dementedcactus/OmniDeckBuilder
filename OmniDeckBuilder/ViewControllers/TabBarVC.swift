//
//  TabBarVC.swift
//  OmniDeckBuilder
//
//  Created by Richard Crichlow on 4/19/18.
//  Copyright © 2018 Richard Crichlow. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainFeedVC = MainFeedVC()
        let uploadVC = UploadVC()
        
        mainFeedVC.tabBarItem = UITabBarItem(title: "Main Feed", image: UIImage(named: "mainTab"), tag: 0)
        
        uploadVC.tabBarItem = UITabBarItem(title: "Upload", image: UIImage(named: "uploadTab"), tag: 1)
        let navCon = UINavigationController(rootViewController: uploadVC)
        self.viewControllers = [mainFeedVC,navCon]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBar.barTintColor = Stylesheet.Colors.Dark
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}
