//
//  ViewController.swift
//  DragAndDrop
//
//  Created by John Regner on 2/23/16.
//  Copyright © 2016 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewDelegate {

    var mainView:View!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.whiteColor()
    mainView = View(frame: self.view.frame)
    mainView.delegate = self
    self.view.addSubview(mainView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

    func reset() {
        mainView.removeFromSuperview()

        mainView = View(frame: self.view.frame)
        mainView.delegate = self
        self.view.addSubview(mainView)
    }

}

