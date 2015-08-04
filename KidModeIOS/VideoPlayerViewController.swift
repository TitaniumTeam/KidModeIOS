//
//  VideoPlayerViewController.swift
//  KidModeIOS
//
//  Created by Tuan Anh on 8/4/15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class VideoPlayerViewController: UIViewController {

    @IBOutlet var playerView: YouTubePlayerView!
    @IBOutlet var playButton: UIButton!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnLock: UIButton!
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var labelCode: UILabel!
    
    var idYT = String()
    
    var code = String()
    
    var correctCode = "1234"
    
    var isPutCorrectPass = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play()
        loadPlaylist(idYT)
        labelCode.text = ""
        playerView.play()
        for var i = 0; i < 10; i++
        {
            var button = UIButton(frame: CGRectMake(CGFloat(24*i+10), 2, 22, 22))
            button.setTitle("\(i)", forState: .Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.titleLabel?.font.fontWithSize(12)
            button.backgroundColor = UIColor.blueColor()
            button.tag = i
            button.addTarget(self, action: "touchCode:", forControlEvents: .TouchUpInside)
            buttonView.addSubview(button)
        }
        buttonView.hidden = true
    }
    
    func play() {
        if playerView.ready {
            if playerView.playerState != YouTubePlayerState.Playing {
                playerView.play()
        }
        }
    }
    
    @IBAction func prev(sender: UIButton) {
        playerView.previousVideo()
    }
    
    @IBAction func next(sender: UIButton) {
        playerView.nextVideo()
    }
    
    func loadVideo() {
        playerView.playerVars = ["playsinline": "1"]
        playerView.loadVideoID("09R8_2nJtjg")
    }
    
    func loadPlaylist(playList: String) {
        playerView.loadPlaylistID(playList)
    }
    
    func showAlert(message: String) {
        self.presentViewController(alertWithMessage(message), animated: true, completion: nil)
    }
    
    func alertWithMessage(message: String) -> UIAlertController {
        let alertController =  UIAlertController(title: "", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        
        return alertController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    @IBAction func btnLockPress(sender: UIButton) {
    
        if isPutCorrectPass
        {
           self.dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
            buttonView.hidden = false
            labelCode.hidden = false
            labelCode.text = ""
        }
    }
    func touchCode(sender: UIButton)
    {
        if count(code) < 4
        {
            code += "\(sender.tag)"
            labelCode.text = code
        }
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("checkCode"), userInfo: nil, repeats: false)
    }
    
    func checkCode() {
        if count(code) >= 4
        {
            labelCode.text = code
            if code == correctCode
            {
                var backImage = UIImage(named: "video-back.png")
                btnLock.setImage(backImage, forState: UIControlState.Normal)
                isPutCorrectPass = true
                code = ""
                buttonView.hidden = true
                labelCode.hidden = true
            }
            else
            {
                var backImage = UIImage(named: "lock.png")
                btnLock.setImage(backImage, forState: UIControlState.Normal)
                isPutCorrectPass = false
                code = ""
                labelCode.text = ""
            }
        }

    }
}
