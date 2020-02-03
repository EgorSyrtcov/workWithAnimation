//
//  SecondViewController.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 1/31/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {
    
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backVCButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonAnimation(_ sender:
        Any) {
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.greenView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.45, options: UIView.AnimationOptions.curveEaseIn, animations: { [weak self] in
            self?.greenView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
        }, completion: nil)
    }
}
