//
//  ViewController.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 1/31/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageGesture()
    }
    
    private func setupImageGesture() {
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(onTapOneImage))
        mainImageView?.addGestureRecognizer(imageGesture)
    }
  
    @objc func onTapOneImage() {
        mainLabel.text = "Нажали: \(count)"
        count+=1
    }
  
    @IBAction func buttonNextVC(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newController = storyBoard.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        self.present(newController, animated: true, completion: nil)
    }
    
    
}

