//
//  InfoVC.swift
//  Habka
//
//  Created by monir shembesh on 17/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit


class InfoVC: UIViewController  {

    
   // let SettingsLauncher = SettingLauncher()
    
    override func viewDidLoad() {
        super.viewDidLoad()

                
        
    }

    
    
    //Below Function Needed for returning in segue with same animation
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
        let segue = prepareForUnwind(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        
        segue.perform()
        
    }

    
    @IBAction func goToTwitter(_ sender: Any) {

        let url = NSURL(string: "https://twitter.com/HabkaMagazine")!
        UIApplication.shared.open(url as URL, options: [ : ])
    }
    
    @IBAction func goToFacebook(_ sender: Any) {
        
        let url = NSURL(string: "https://www.facebook.com/HabkaMagazine/")!
        UIApplication.shared.open(url as URL, options: [ : ])
    }
    
    
    @IBAction func goToWebsite(_ sender: Any) {
        
        let url = NSURL(string: "http://www.habkamagazine.com/")!
        UIApplication.shared.open(url as URL, options: [ : ])
    }
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    ///// Gesture Recognizer needed to turn on ////
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    

    

}
