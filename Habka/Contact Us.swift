//
//  Contact Us.swift
//  Habka
//
//  Created by monir shembesh on 28/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit
import MessageUI

class Contact_Us: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var MapPic: UIButton!
    
     let strPhoneNumber = "00218928325853"
    let strPhoneNumber2 = "00218928325853"
    
  //  let settingsLauncher = SettingLauncher()


    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.MapPic.layer.shadowOpacity = 0.4
        self.MapPic.layer.shadowOffset = CGSize (width: 4.0, height: 4.0)
        self.MapPic.layer.shadowRadius = 3.0
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func sideMenu(_ sender: Any) {
        
      //  settingsLauncher.showSideMenu()
        
    }
    
    @IBAction func goMap(_ sender: Any) {
        
        let url = NSURL(string: "https://www.google.co.uk/maps/place/Habka+Magazine/@32.0948279,20.0877701,17z/data=!3m1!4b1!4m5!3m4!1s0x13831c58d46f1c7f:0xc045b5e80dda7a9a!8m2!3d32.0948279!4d20.0899437")!
        UIApplication.shared.open(url as URL, options: [ : ])
        
    }
    
    @IBAction func sendMail(_ sender: Any) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["info@Habkamagazine.com"])
        mailComposerVC.setSubject("أدخل العنوان هنا")
        
        return mailComposerVC
    }

    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "لم نتمكن من ارسال الرسالة", message: "هاتفك لم يستطيع ارسال الرسالة بنجاح. الرجاء التأكد من الأعدادات و المحاولة مرّة لاحقة.", delegate: self, cancelButtonTitle: "موافق")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
   
      
    
    @IBAction func callNum2(_ sender: Any) {
        
        
        if let phoneCallURL:URL = URL(string: "tel:\(strPhoneNumber2)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                let alertController = UIAlertController(title: "حبكة", message: "هل تريد الأتصال بالرقم الموجود في الأسفل؟ \n\(self.strPhoneNumber2)?", preferredStyle: .alert)
                let yesPressed = UIAlertAction(title: "نعم", style: .default, handler: { (action) in
                    application.openURL(phoneCallURL)
                })
                let noPressed = UIAlertAction(title: "لا", style: .default, handler: { (action) in
                    
                })
                alertController.addAction(yesPressed)
                alertController.addAction(noPressed)
                present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    

}
