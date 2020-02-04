//
//  TabBarViewController.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 2/4/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    private let newsVc = NewsVC()
    private let emailVc = EmailVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewControllers = [createController(title: "News VC", imageName: "news", vc: newsVc), createController(title: "Email VC", imageName: "mail", vc: emailVc)]
    }
    
    private func createController(title: String, imageName: String, vc: UIViewController) -> UINavigationController {
        let recent = UINavigationController(rootViewController: vc)
        recent.tabBarItem.image = UIImage(named: imageName)
        recent.tabBarItem.title = title
        return recent
    }
    
}
