//
//  ShowKidView.swift
//  KidModeIOS
//
//  Created by Admin on 8/4/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class ShowKidView: UIViewController {
    
    @IBOutlet weak var view_child: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        self.scrollView.frame = self.view.bounds;         scrollView.contentSize.width = 120 * 10 + 100 / 2;
        self.view_child.frame.size.width = 120 * 10 + 100 / 2;
        for(var index = 0; index < 10; ++index){
            
            //Images
            var btnImage: UIButton
            btnImage = UIButton(frame:CGRectMake(CGFloat(120 * index),70, 100, 100))
            var imageBtn = UIImage(named:"kid.png")
            btnImage.setImage(imageBtn, forState: UIControlState.Normal)
            self.view_child.addSubview(btnImage)
            btnImage.addTarget(self, action: "playVideo:", forControlEvents: UIControlEvents.TouchUpInside)
            btnImage.tag = index
            
            //Text
            var lblText: UILabel
            lblText = UILabel(frame: CGRectMake(btnImage.frame.origin.x + 25, 165, 192, 50))
            
            lblText.text = "Name"
            self.view_child.addSubview(lblText)
            
            
        }
    }
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
