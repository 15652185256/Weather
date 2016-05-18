//
//  TodayViewController.swift
//  Weather Today Extension
//
//  Created by 赵晓东 on 16/4/13.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_currentTime: UILabel!
    
    @IBOutlet weak var lbl_temp: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = NSUserDefaults(suiteName: "group.com.Weather")
        
        let city:String = userDefault?.objectForKey("weather.city") as! String
        let currentTime:String = userDefault?.objectForKey("weather.currentTime") as! String
        let temp:String = userDefault?.objectForKey("weather.temp") as! String
        
        lbl_city.text = city
        lbl_currentTime.text = currentTime
        lbl_temp.text = temp
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
