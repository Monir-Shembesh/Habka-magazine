//
//  ViewController.swift
//  Habka
//
//  Created by monir shembesh on 16/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate {

    var habkaVolumesArr = [volumes]()
 //   let SettingsLauncher = SettingLauncher()
    
    @IBOutlet weak var BannerView: UIView!
    @IBOutlet weak var VolumeTableView: UITableView!

    
    var cellNameArr = ["004", "003", "002", "001"]
    var volumEDnum = "001"
    var volumEDnum1 = "002"
    var volumEDnum2 = "003"
    var volumEDnum3 = "004"

    var LeftViewConstraint: NSLayoutConstraint!
    var RightViewConstraint: NSLayoutConstraint!
    var buttonOn: Bool = false
    
    
    var testArray1 = [String]()
    var testArray2 = [String]()
    var testArray3 = [String]()
    var testArray4 = [String]()
    
    var arrayOfPageNumbers = [Int]()
    
    

    
    @IBOutlet weak var SideMenu: UIView!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPersonData1()
        getPersonData2()
        getPersonData3()
        getPersonData4()
        

        
        
        SideMenu.translatesAutoresizingMaskIntoConstraints = false
        
        settingSideMenuConstrains()
        hideSM()
        
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(hideSM))
                    swipeLeft.direction = UISwipeGestureRecognizerDirection.left
                    self.view.addGestureRecognizer(swipeLeft)
       
        
        BannerView.layer.shadowOpacity = 0.4
        BannerView.layer.shadowOffset = CGSize (width: 0.0, height: 4.0)
        BannerView.layer.shadowRadius = 3.0
        
        VolumeTableView.backgroundView = UIImageView(image: UIImage(named: "tableViewBG.png"))
        VolumeTableView.backgroundView?.contentMode = UIViewContentMode.scaleAspectFill
        
        
        
        VolumeTableView.delegate = self
        VolumeTableView.dataSource = self
        
        
        
        
        let test = volumes.init(volumeImage: "http://i.imgur.com/Y0QEyql.jpg", volumeTitle: volumEDnum)
        
        
        let test1 = volumes.init(volumeImage: "http://i.imgur.com/oxLgjrH.jpg", volumeTitle: volumEDnum1)
        
        
        let test2 = volumes.init(volumeImage: "http://i.imgur.com/cQmFQaN.jpg", volumeTitle: volumEDnum2)
        
        
        let test3 = volumes.init(volumeImage: "http://i.imgur.com/OybuOBd.jpg", volumeTitle: volumEDnum3)
        

        
        habkaVolumesArr.append(test)
        habkaVolumesArr.append(test1)
        habkaVolumesArr.append(test2)
        habkaVolumesArr.append(test3)

        
        habkaVolumesArr.sort(by: { (first: volumes, second: volumes) -> Bool in
            first.volumeTitle > second.volumeTitle
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSeque" {
            
            
            if let destination = segue.destination as? VolumeImgVC {
                if let indexPath = self.VolumeTableView.indexPathForSelectedRow {
                    let volumeNum = cellNameArr[indexPath.row]
                    destination.Vtitle = volumeNum
                    arrayOfPageNumbers.append(testArray4.count)
                    arrayOfPageNumbers.append(testArray3.count)
                    arrayOfPageNumbers.append(testArray2.count)
                    arrayOfPageNumbers.append(testArray1.count)
                    let pagesCount = arrayOfPageNumbers[indexPath.row]
                    destination.PagesCount = pagesCount - 1


                    
                }
                

            }
            
            
            
            
                      
    }
    }
    
    @IBAction func prepareForUnwind (segue: UIStoryboardSegue){
    
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = VolumeTableView.dequeueReusableCell(withIdentifier: "volumeCell", for: indexPath) as? volumeCell{

            let volumesInfo = habkaVolumesArr[indexPath.row]
            cell.UpdateUI(volumes: volumesInfo)
            cell.backgroundColor = UIColor.clear
            return cell
        }else {
            
            return UITableViewCell()
        }
        
        
        
        }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habkaVolumesArr.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
    }
    
    
    
    //Showing side menu
    
    @IBAction func sideMenueAppear(_ sender: Any) {
        
        
        
        
        showSM()
        
        
       
    }
   
    
    
    func showSM(){
    
        
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        if width <= 414 {

    UIView.animate(withDuration: 0.2) {
        

        
            self.SideMenu.layer.shadowOpacity = 0.6
            self.SideMenu.layer.shadowOffset = CGSize (width: 8.0, height: 0)
            self.SideMenu.layer.shadowRadius = 8.0
            self.SideMenu.alpha = 1
            self.LeftViewConstraint.constant = 0
            self.RightViewConstraint.constant = -140
            self.view.layoutIfNeeded()

        }
    
        
        } else {
        
        
            UIView.animate(withDuration: 0.2) {
                
                
                
                self.SideMenu.layer.shadowOpacity = 0.6
                self.SideMenu.layer.shadowOffset = CGSize (width: 8.0, height: 0)
                self.SideMenu.layer.shadowRadius = 8.0
                self.SideMenu.alpha = 1
                self.LeftViewConstraint.constant = 0
                self.RightViewConstraint.constant = -550
                self.view.layoutIfNeeded()
                
            }
            
            
        }
    
    }
    func hideSM(){
        
        
        //self.view.removeGestureRecognizer(oneTap)
        
        UIView.animate(withDuration: 0.2) {
            
            self.SideMenu.alpha = 0
            self.LeftViewConstraint.constant = -190
            self.RightViewConstraint.constant = -320
            self.view.layoutIfNeeded()
   
        }
        
    }
    
    
    
    
//    
//    func animateButtonPressed(){
//    
//    
//        if buttonOn{
//        
//            hideSM()
//            
//        }else {
//        
//            showSM()
//        
//        }
//    
//    
//    
//    }
    
    
    func settingSideMenuConstrains(){
    
    
        let TopViewConstraint = NSLayoutConstraint (item: SideMenu, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        
        LeftViewConstraint = NSLayoutConstraint (item: SideMenu, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0)
        
        let BottomViewConstraint = NSLayoutConstraint (item: SideMenu, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        
        RightViewConstraint = NSLayoutConstraint (item: SideMenu, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -140)
        
        view.addConstraints([TopViewConstraint,LeftViewConstraint,BottomViewConstraint, RightViewConstraint])
    
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func AboutUS(_ sender: Any) {
        
        hideSM()
        
    }
    
    @IBAction func contactUs(_ sender: Any) {
        
        hideSM()
    }
    
    
    func getPersonData1() {
        let request = URLRequest(url: URL(string: "http://habkamagazine.com/app/getEdition.php?ar&&ed=001")!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            // Parse JSON data
            if let data = data {
                self.parseJsonData1(data)
                OperationQueue.main.addOperation{() -> Void in
                    
                }
            }
        })
        task.resume()
    }
    func getPersonData2() {
        let request = URLRequest(url: URL(string: "http://habkamagazine.com/app/getEdition.php?ar&&ed=002")!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            // Parse JSON data
            if let data = data {
                self.parseJsonData2(data)
                OperationQueue.main.addOperation{() -> Void in
                    
                }
            }
        })
        task.resume()
    }
    func getPersonData3() {
        let request = URLRequest(url: URL(string: "http://habkamagazine.com/app/getEdition.php?ar&&ed=003")!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            // Parse JSON data
            if let data = data {
                self.parseJsonData3(data)
                OperationQueue.main.addOperation{() -> Void in
                    
                }
            }
        })
        task.resume()
    }
    func getPersonData4() {
        let request = URLRequest(url: URL(string: "http://habkamagazine.com/app/getEdition.php?ar&&ed=004")!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            // Parse JSON data
            if let data = data {
                self.parseJsonData4(data)
                OperationQueue.main.addOperation{() -> Void in
                    
                }
            }
        })
        task.resume()
    }

    
    
    
    /////////////////////////////////////////////////////////////
    
    
    func parseJsonData1(_ data: Data) {
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            
            
            let jsonPeople = jsonResult?["array"] as! [[String:Any]]
            for jsonPeople in jsonPeople {
                let person =  jsonPeople["url"] as! String
                
                
                testArray1.append(person)
            }
            
            
        } catch {
            print(error)
        }
        
    }
    func parseJsonData2(_ data: Data) {
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            
            
            let jsonPeople = jsonResult?["array"] as! [[String:Any]]
            for jsonPeople in jsonPeople {
                let person =  jsonPeople["url"] as! String
                
                
                testArray2.append(person)
            }
            
            
        } catch {
            print(error)
        }
        
    }
    func parseJsonData3(_ data: Data) {
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            
            
            let jsonPeople = jsonResult?["array"] as! [[String:Any]]
            for jsonPeople in jsonPeople {
                let person =  jsonPeople["url"] as! String
                
                
                testArray3.append(person)
            }
            
            
        } catch {
            print(error)
        }
        
    }
    func parseJsonData4(_ data: Data) {
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            
            
            let jsonPeople = jsonResult?["array"] as! [[String:Any]]
            for jsonPeople in jsonPeople {
                let person =  jsonPeople["url"] as! String
                
                
                testArray4.append(person)
            }
            
            
        } catch {
            print(error)
        }
        
    }


    
    
}

