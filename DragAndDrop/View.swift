//
//  View.swift
//  DragAndDrop
//
//  Created by Stanley Chiang on 3/6/16.
//  Copyright © 2016 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

protocol ViewDelegate {
    func reset()
}

class View: UIView, draggableViewDelegate {

    var draggableView:DraggableView!
    var trashArea:UIView!
    var resetButton:UIButton!
    
    var delegate:ViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trashArea = initTrashArea()
        addSubview(trashArea)
        
        resetButton = initResetButton()
        addSubview(resetButton)
        
        draggableView = initDraggableView()
        addSubview(draggableView)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDraggableView() -> DraggableView {
        let view = DraggableView(frame: CGRectMake(100,100,100,100))
        view.delegate = self
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
        delegate.reset()
    }
    
    func didDragToTrash() -> Bool {
        return draggableView.frame.intersects(trashArea.frame)
    }
}
