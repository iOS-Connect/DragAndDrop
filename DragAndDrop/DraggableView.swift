//
//  Drag.swift
//  DragAndDrop
//
//  Created by Stanley Chiang on 3/6/16.
//  Copyright © 2016 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

protocol draggableViewDelegate {
    func didDragToTrash() -> Bool
}

class DraggableView: UIView {
    
    var panGestureRecognizer:UIPanGestureRecognizer!
    var initialPosition:CGPoint!
    
    var delegate:draggableViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialPosition = frame.origin
        panGestureRecognizer = UIPanGestureRecognizer()
        panGestureRecognizer.addTarget(self, action: "updatePosition:")
        addGestureRecognizer(panGestureRecognizer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updatePosition(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(self)

        frame.origin.x = initialPosition.x + translation.x
        frame.origin.y = initialPosition.y + translation.y
        
        let willTrash: Bool = delegate.didDragToTrash()
        
        if willTrash {
            layer.borderColor = UIColor.redColor().CGColor
            layer.borderWidth = 3
        } else {
            layer.borderWidth = 0
        }

        if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if !willTrash {
                snapToOriginAnimation()
            } else {
                trashActionAnimation()
            }
        }
    }
    
    func snapToOriginAnimation() {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.frame.origin = self.initialPosition
        }
    }
    
    func trashActionAnimation() {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.alpha = 0
            }) { (complete) -> Void in
                if complete {
                    self.removeFromSuperview()
                }
        }
    }
}