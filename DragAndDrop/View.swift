//
//  View.swift
//  DragAndDrop
//
//  Created by Stanley Chiang on 3/6/16.
//  Copyright © 2016 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class View: UIView {

    var draggableView:UIView!
    var trashArea:UIView!
    var resetButton:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        draggableView = initDraggableView()
        addSubview(draggableView)
        
        trashArea = initTrashArea()
        addSubview(trashArea)
        
        resetButton = initResetButton()
        addSubview(resetButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDraggableView() -> UIView {
        let view = UIView(frame: CGRectMake(100,100,100,100))
        view.backgroundColor = UIColor.orangeColor()
        return view
    }
    
    func initTrashArea() -> UIView {
        let view = UIView(frame: CGRectMake(0, frame.height * 2 / 3,frame.width,frame.height / 3 - 50))
        view.backgroundColor = UIColor.lightGrayColor()
        return view
    }
    
    func initResetButton() -> UIButton {
        let button = UIButton(frame: CGRectMake(0,frame.height - 50,frame.width, 50))
        button.setTitle("Reset", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.lightTextColor(), forState: UIControlState.Normal)
        button.backgroundColor = UIColor.darkGrayColor()
        
//        TODO: learn more about what it means to pass target as self all the time
        button.addTarget(self, action: "resetAction:", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    func resetAction(sender: UIButton){
        print("reset")
    }
}
