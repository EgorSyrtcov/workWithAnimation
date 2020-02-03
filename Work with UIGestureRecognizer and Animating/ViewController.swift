//
//  ViewController.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 1/31/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0 {
        didSet {
            mainLabel.text = "\(count)"
        }
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView?
    @IBOutlet weak var gestureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageGesture()
        setupSwipeRecognizer()
    }
    
    private func setupImageGesture() {
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(onTapOneImage))
        mainImageView?.addGestureRecognizer(imageGesture)
    }
  
    @objc func onTapOneImage() {
        count+=1
    }
    
   private func setupSwipeRecognizer() {
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGestRecognizer))
    swipeRight.direction = UISwipeGestureRecognizer.Direction.right
    mainImageView?.addGestureRecognizer(swipeRight)
    
    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGestRecognizer))
    swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
    mainImageView?.addGestureRecognizer(swipeLeft)
    
    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressed))
    mainImageView?.addGestureRecognizer(longPress)
    
    }
    
    
    @IBAction func swipeGestRecognizer(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case .left:
            gestureLabel.text = "Сделан swipe влево"
            print("Сделан swipe влево")
        case .right:
            gestureLabel.text = "Сделан swipe вправо"
            print("Сделан swipe вправо")
        default:
            print("Error")
        }
    }
    
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            let controller = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func buttonNextVC(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newController = storyBoard.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        self.present(newController, animated: true, completion: nil)
    }
    
    
}

