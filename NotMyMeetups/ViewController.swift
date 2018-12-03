//
//  ViewController.swift
//  NotMyMeetups
//
//  Created by Zehra Abacioglu on 12/3/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import Firebase



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableViewMeetups: UITableView!
    
    var db: Firestore!
    var refMeetups: DatabaseReference!
    var meetupList = [Meetup]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetupList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //the meetup object
        let meetup: Meetup
        
        //getting the meetup of selected position
        meetup = meetupList[indexPath.row]
        
        //adding values to labels
        cell.labelEvent.text = meetup.event
        cell.labelDate.text = meetup.date
        
        //returning cell
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectToDatabase()
        refMeetups = Database.database().reference().child("meetups");
        
        //observing the data changes
        refMeetups.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.meetupList.removeAll()
                
                //iterating through all the values
                for meetups in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let meetupObject = meetups.value as? [String: AnyObject]
                    //let meetupName = meetupObject?["id"]
                    let meetupEvent  = meetupObject?["event"]
                    //let meetupAddress  = meetupObject?["address"]
                    let meetupDate = meetupObject?["date"]
                    //let meetupLatitude = meetupObject?["latitude"]
                    //let meetupLongitude = meetupObject?["longitude"]
                    
                    //creating meetup object with model class and fetched values
                    let meetup = Meetup(event_string: meetupEvent as! String?, date_string: meetupDate as! String?)
                    
                    //appending it to list
                    self.meetupList.append(meetup)
                }
                
                //reloading the tableview
                self.tableViewMeetups.reloadData()
            }
        })
    }
    
    func connectToDatabase() {
        db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }

    
}

