//
//  VideoForKidViewController.swift
//  KidModeIOS
//
//  Created by Tuan Anh on 8/4/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class VideoForKidViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var labelCDTimer: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var child_view: UIView!
    
    var videoArray = [VideoObject]()
    
    @IBOutlet weak var scollViewWidth: NSLayoutConstraint!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!

    var  tagVideo = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items?.first as? UITabBarItem
        loadDataDefaultVideo()
        showVideo()
       
    }

    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        switch(item.tag)
        {
        case 1:
            loadDataDefaultVideo()
            showVideo()
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        default:
            break;
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
   
    func loadDataDefaultVideo()
    {
        videoArray.removeAll(keepCapacity: false)
        for var i = 0; i < 10; i++
        {
            var video = VideoObject()
            video.title = "Những cuộc phiêu lưu của Xin bát"
            video.thumbailImage = "https://i.ytimg.com/vi_webp/4UtaBo-_SyY/default.webp"
            video.ID = "PLEFGsKqrJmBQosxBJEMRmfN1c92-oIHx_"
            videoArray.append(video)
        }
    }
    
    func showVideo() {
        
        let subViews = self.child_view.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }
        
        //self.scrollView.frame = self.view.bounds
        self.scrollView.contentSize.width = 192 * 10 + 192/2
      
       // println()
        
        child_view.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0)
        self.child_view.frame.size.width = 192 * 10 + 192/2;
        
        for(var index = 0; index < videoArray.count; ++index){
            
            var backgroundIMG : UIImageView
            backgroundIMG  = UIImageView(frame:CGRectMake(CGFloat(192 * index),70, 192, 120));
            backgroundIMG.image = UIImage(named:"g_conveyor_middle.png")
            self.child_view.addSubview(backgroundIMG)
            
            var lblVideoName: UILabel
            lblVideoName = UILabel(frame: CGRectMake(backgroundIMG.frame.origin.x, 100, 180, 70))
            lblVideoName.text = videoArray[index].title
            self.child_view.addSubview(lblVideoName)
            lblVideoName.textAlignment = .Center
            lblVideoName.numberOfLines = 3
            lblVideoName.textColor = UIColor.whiteColor()
            
            var btnVideoImage: UIButton
            btnVideoImage = UIButton(frame: CGRectMake(backgroundIMG.frame.origin.x + 31, 20, 130, 85))
                       var videoImage = UIImage(named:"playlist_logo.jpg")
            btnVideoImage.setImage(videoImage, forState: UIControlState.Normal)
            self.child_view.addSubview(btnVideoImage)
            btnVideoImage.addTarget(self, action: "playVideo:", forControlEvents: UIControlEvents.TouchUpInside)
            btnVideoImage.tag = index
            
        }
    }
    
    func playVideo(sender: UIButton)
    {
        self.performSegueWithIdentifier("playVideo", sender: nil)
        tagVideo = sender.tag
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "playVideo"
        {
            if let controller: VideoPlayerViewController = segue.destinationViewController as? VideoPlayerViewController
            {
                //println(videoDefaultArray[tagVideo].ID)
                controller.idYT = videoArray[tagVideo].ID
            }
        }
    }
    
    @IBAction func btnBackPress(sender: UIButton) {
    }
}
