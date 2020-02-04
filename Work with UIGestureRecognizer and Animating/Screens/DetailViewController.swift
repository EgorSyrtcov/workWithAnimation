//
//  DetailViewController.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 2/3/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

 final class DetailViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    
    var longPressGRStartPoint: CGPoint?
    var didCancelLongPressGR = false 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapButton1(_ sender: Any) {
        print("Сработала кнопка 1")
    }
    
    @IBAction func tapButton2(_ sender: UIButton) {
         print("Сработала кнопка 2")
    }
    
    @IBAction func longTappedGesture(_ sender: UILongPressGestureRecognizer) {
        let currentPoint = sender.location(in: self.view)
        switch sender.state {
        case .began:
            longPressGRStartPoint = sender.location(in: self.view)
            didCancelLongPressGR = false
            highlightView()
        case .changed:
            if didCancelLongPressGR { return }
            guard longPressGRStartPoint != nil else { return }

            let distance = hypotf(Float(currentPoint.x - longPressGRStartPoint!.x), Float(currentPoint.y - longPressGRStartPoint!.y))
          
            if distance > 55 {
                didCancelLongPressGR = true
                unhighlightView(shouldTakeAction: false)
            }
        case .ended:
            if didCancelLongPressGR { return }
            unhighlightView(shouldTakeAction: true)
        default:
            break
        }
    }
    
    func highlightView() {
        if didCancelLongPressGR {
            print("Сработала кнопка 1")
        } else {
            print("Сработала кнопка 2")
        }
    }
    func unhighlightView(shouldTakeAction: Bool) {
      
        if !shouldTakeAction { return }
      
       
    }
    
}
