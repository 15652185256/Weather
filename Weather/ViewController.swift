//
//  ViewController.swift
//  Weather
//
//  Created by 赵晓东 on 16/4/13.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.redColor()
        
        self.dataLoad()
        
        let userDefault = NSUserDefaults(suiteName: "group.com.Weather")
        userDefault?.setObject("太原", forKey: "weather.city")
        userDefault?.setObject("16:48", forKey: "weather.currentTime")
        userDefault?.setObject("26℃", forKey: "weather.temp")
        userDefault?.synchronize()
    }
    
    
    func dataLoad() {
    
        var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
        
        var data = NSData(contentsOfURL: url!)
        //NSData转换成NSString打印输出
        let json : AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments)
        
        var weatherInfo:AnyObject! = json.objectForKey("weatherinfo")
        var city:AnyObject! = weatherInfo.objectForKey("city")
        var temp:AnyObject! = weatherInfo.objectForKey("temp")
        
        
        var timeNow = NSDate()
        var cadendor = NSCalendar.currentCalendar()
        var comps = cadendor.components(NSCalendarUnit.Hour, fromDate: timeNow)
        
        
        print(city,temp,comps)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

