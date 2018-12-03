//
//  Meetup.swift
//  NotMyMeetups
//
//  Created by Zehra Abacioglu on 12/3/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import Foundation

class Meetup {
    //var name: String?
    var event: String?
    //var address: String?
    var date: String?
    //var latitude: Float?
    //var longitude: Float?
    
    //init(name: String, event: String, address: String, date: String, latitude: Float, longitude: Float) {
    init(event_string: String?, date_string: String?) {
        //self.name = name
        self.event = event_string
        //self.address = address
        self.date = date_string
        //self.latitude = latitude
        //self.longitude = longitude
        
    }
}
