//
//  ViewController.swift
//  SwiftUI07-Swift中的手势操作
//
//  Created by liutao on 17/4/6.
//  Copyright © 2017年 UTOUU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var rect:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //< UISwipeGestureRecognizer 滑动手势
        let swip = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(swip:)))
        swip.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swip)
        
        let swipUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(swip:)))
        swipUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipUp)
        
        //< UITapGestureRecognizer 点击手势
        let tapone = UITapGestureRecognizer(target: self, action:#selector(ViewController.tapOne))
        tapone.numberOfTapsRequired = 1
        tapone.numberOfTouchesRequired = 1
        
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapTwo))
        tapTwo.numberOfTapsRequired = 2
        tapTwo.numberOfTouchesRequired = 1
        tapone.require(toFail: tapTwo)
        self.view.addGestureRecognizer(tapone)
        self.view.addGestureRecognizer(tapTwo)
        
        //< UIPinchGestureRecognizer 捏合手势
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchDid(pinch:)))
        
        self.view.addGestureRecognizer(pinch)
        
        // < UIRotationGestureRecognizer 旋转手势
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.rotationDid(rotation:)))
        self.view.addGestureRecognizer(rotation)
        
        // < UIPanGestureRecognizer 拖动手势
        
        
        rect = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        rect!.center = self.view.center
        rect!.backgroundColor = UIColor.cyan
        self.view.addSubview(rect!)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panDid(pan:)))
        pan.maximumNumberOfTouches = 1
        rect!.addGestureRecognizer(pan)
        
        // < UILongPressGestureRecognizer 长按手势
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(longpress:)))
        rect!.addGestureRecognizer(longPress)
        
        
    }

    // 滑动响应
    func swipeGesture(swip:UISwipeGestureRecognizer) -> Void {
            print("开始滑动")
        if swip.direction == UISwipeGestureRecognizerDirection.up {
            print("向上滑动")
        }else if swip.direction == UISwipeGestureRecognizerDirection.down {
            print("向下滑动")
        
        }
    }
    
    
    //点击响应
    func tapOne() -> Void {
        print("单击")
    }
    
    func tapTwo() -> Void {
        print("双击")
    }
    
    // 捏合响应
    func pinchDid(pinch:UIPinchGestureRecognizer) -> Void {
        print("捏合")
        print(pinch.scale)
        print(pinch.velocity)
    }
    
    // 旋转响应
    func rotationDid(rotation:UIRotationGestureRecognizer) -> Void {
        print("旋转")
        print(rotation.rotation*(180/(CGFloat(M_PI))))
    }
    
    // 拖动手势
    
    func panDid(pan:UIPanGestureRecognizer) -> Void {
        let point = pan.location(in: self.view)
        rect!.center = point
    }
    
    // 长按手势响应
    func longPress(longpress:UILongPressGestureRecognizer) -> Void {
        if longpress.state == .began {
            print("长按开始")
        }else {
            print("长按结束")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("begin touch screen")
    }


}

