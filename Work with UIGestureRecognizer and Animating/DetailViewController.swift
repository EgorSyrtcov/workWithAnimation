//
//  DetailViewController.swift
//  Work with UIGestureRecognizer and Animating
//
//  Created by Egor Syrtcov on 2/3/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    
    var longPressGRStartPoint: CGPoint?
    var didCancelLongPressGR = false 
    
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        button2.becomeFirstResponder()
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                    action: #selector(tapView))
        view.addGestureRecognizer(gesture)
//        button2.resignFirstResponder()
    }
    
    @objc func tapView() {
        view.backgroundColor = .green
    }
    
    @IBAction func tapButton1(_ sender: UIButton) {
        print("Сработала кнопка 1")
        view.backgroundColor = sender.backgroundColor
    }
    
    @IBAction func tapButton2(_ sender: UIButton) {
         print("Сработала кнопка 2")
        view.backgroundColor = sender.backgroundColor
    }
    
    
    func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return nil
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


extension UIButton {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("first View touch started", touches.first?.location(in: self))
        
        (touches.first?.view as? UIButton)?.resignFirstResponder()
        super.touchesBegan(touches, with: event)
    }
    
    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let test = CGRect(origin: point, size: CGSize(width: 10, height: 10))
        if test.contains(CGPoint(x: 11, y: 42)) {
            return nil
        }
        return super.hitTest(point, with: event)
    }
    
}
