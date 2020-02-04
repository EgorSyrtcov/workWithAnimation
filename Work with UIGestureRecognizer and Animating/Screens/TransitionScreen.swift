//
//  Transition Screen.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 2/4/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class TransitionScreens: UIViewController {
    
    var window: UIWindow?
    var initialViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGray" {
            
        }
    }
    
    @IBAction func transitionButtonToNCPush(_ sender: UIButton) {
        let lastVC = storyboard?.instantiateViewController(withIdentifier: "LastScreen") as! LastScreen
        navigationController?.pushViewController(lastVC, animated: true)
    }
    
    @IBAction func transitionButtonToNCPresent(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "TransitionScreens", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "LastScreen") as! LastScreen
        navigationController?.present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func transitionButtonToAppDelegate(_ sender: UIButton) {
        let lastVC = self.storyboard?.instantiateViewController(withIdentifier: "LastScreen") as! LastScreen
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window??.rootViewController = lastVC
    }
    
    @IBAction func transitionButtonTabBar(_ sender: UIButton) {
        let newVC = TabBarViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
