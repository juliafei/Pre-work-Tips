//
//  SettingsViewController.swift
//  Tips
//
//  Created by Julia Lau on 12/14/15.
//  Copyright © 2015 Julia Lau. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLearnMoreClick(sender: AnyObject) {
        let application=UIApplication.sharedApplication()
        
        application.openURL(NSURL(string: "http://github.com/mimming/swift-tip-calculator")!);
    }
    @IBAction func onTouchDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onEditDefaultTip(sender: UISegmentedControl) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.integerForKey("default_tip")
        print("got default tip: \(defaultTip)")
        switch defaultTip {
        case 0...2:
            defaultTipControl.selectedSegmentIndex = defaultTip
        default:
            defaultTipControl.selectedSegmentIndex = 0
        }
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


