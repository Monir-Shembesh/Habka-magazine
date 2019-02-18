//
//  VolumeImgVC.swift
//  Habka
//
//  Created by monir shembesh on 18/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit
import SDWebImage


class VolumeImgVC: UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Linking outlets that are used in this VC //
    
    
    
    @IBOutlet var MainViewTap: UIView!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var mangaTitle: UILabel!
    @IBOutlet weak var mangaPageCount: UILabel!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var pageSlider: UISlider!
    @IBOutlet weak var mangaPageImage: UIImageView!
    @IBOutlet weak var goRightButton: UIButton!
    @IBOutlet weak var goLeftButton: UIButton!
    @IBOutlet weak var sliderBarMin: UILabel!
    @IBOutlet weak var sliderBarMax: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var oneTapGesture: UITapGestureRecognizer!
    
    
    
    
    
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Creating Variables for this VC //
    
    
    var imgArr = [UIImage]()
    var imageIndex: NSInteger = 0
    private var _Vtitle: String!
    private var _PagesCount: Int!
    var swipeRight = UIGestureRecognizer()
    var swipeLeft = UIGestureRecognizer()
    var testArray1 = [String]()
    var pictureNum = 0
    var VolumLink = String()
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Getter and setter for _vtitle var //
    
    
    var Vtitle: String {
        
        get {
            
            return _Vtitle
            
        } set {
            
            _Vtitle = newValue
        }
        
    }
    
    var PagesCount: Int {
        
        get {
            
            return _PagesCount
            
        } set {
            
            _PagesCount = newValue
        }
        
    }
    
    
    
    
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // deciding the functions that starts with view did load //
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if _Vtitle == "001"{
            VolumLink = "http://habkamagazine.com/app/getEdition.php?ar&&ed=001"
        }else if _Vtitle == "002"{
            VolumLink = "http://habkamagazine.com/app/getEdition.php?ar&&ed=002"
        }else if _Vtitle == "003"{
            VolumLink = "http://habkamagazine.com/app/getEdition.php?ar&&ed=003"
        }else if _Vtitle == "004"{
            VolumLink = "http://habkamagazine.com/app/getEdition.php?ar&&ed=004"
        }
        
        //// Json Test ///
        
        
        
        getPersonData()
        mangaPageCount.text = "0/\(PagesCount)" // setting top bar labels
        

        
        
        
        // Hiding navBar and sliderView
        
        navBar.isHidden = true
        sliderView.isHidden = true
        
        
        //   addMangaPages() // adding images to array function
        
        
        sliderBarMax.text = "\(PagesCount)"
        
        
        mangaTitle.text = _Vtitle
       // mangaPageCount.text = "0/\(testArray1.count - 1)" // setting top bar labels
        
        
        
        scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0 // zooming functions
        self.scrollView.maximumZoomScale = 3.0
        
        
        // displaying Cover Picture //
        
        mangaPageImage.image = UIImage(named: "0.pdf")
        
        
        ///////////////////// /////////////////////  ///////////////////// /////////////////////
        // swipe gesture to display pages //
        
        
        
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapZoom(_:)))
        doubleTap.numberOfTapsRequired = 2
        self.scrollView.addGestureRecognizer(doubleTap)
        
        
        
        
        
        
    }
    
    
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// ///////////////////// Currently not used ////
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Function to hide status bar //
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Tap function to hid navBar and Slider bar //
    
    
    @IBAction  func hideNavBar (recognizer:UITapGestureRecognizer){
        
        if navBar.isHidden  == false {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.navBar.alpha = 0.0
            }, completion: { _ in
                self.navBar.isHidden = true
                
                
            })
            
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.sliderView.alpha = 0.0
            }, completion: { _ in
                self.sliderView.isHidden = true
                
                
            })
            
            
        }else {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.navBar.alpha = 1.0
            }, completion: { _ in
                self.navBar.isHidden = false
                
            })
            
            UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                self.sliderView.alpha = 1.0
            }, completion: { _ in
                self.sliderView.isHidden = false
                
            })
            
            navBar.isHidden = false
            self.sliderView.isHidden = false
            
            
        }}
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // slider function //
    
    
    
    @IBAction func slidePages(_ sender: UISlider) {
        
        scrollView.setZoomScale(1.0, animated: true)
        let sliderNumber = Int(sender.value)
        
        if testArray1.count != 0 {
        
        let imgUrl = URL(string: testArray1[sliderNumber])!
        
        do {
            let data = try Data(contentsOf: imgUrl as URL)
            if let image = UIImage(data: data) {
                mangaPageImage.image = image
                pictureNum -= sliderNumber
            }
        } catch {
            print("Unable to load data: \(error)")
        }
        
        mangaPageCount.text = "\(sliderNumber)/\(testArray1.count - 1)"
        pictureNum = sliderNumber
        }
        
    }
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Left and right scroll buttons //
    
    @IBAction func goLeft(_ sender: Any) {
        
        imageIndex = NSInteger(pageSlider.value)
        
        imageIndex -= 1
        
        // check if index is in range
        
        if imageIndex < 0 {
            
            imageIndex = 0
            
        }
        
        displayImageUsingIndexMinus()
        
        
        
        mangaPageCount.text = "\(pictureNum)/\(testArray1.count - 1)"
        pageSlider.value = Float(pictureNum)
        
        
    }
    
    @IBAction func goRight(_ sender: Any) {
        
        imageIndex = NSInteger(pageSlider.value)
        
        
        imageIndex += 1
        
        // check if index is in range
        
        if imageIndex >= imgArr.count {
            
            
            
            imageIndex = (imgArr.count - 1)
            
            
        }
        
        // print(imageIndex)
        
        displayImageUsingIndexPlus()
        
        mangaPageCount.text = "\(pictureNum)/\(testArray1.count - 1)"
        pageSlider.value = Float(pictureNum)
    }
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // zooming double tap //
    
    func doubleTapZoom(_ sender: UIGestureRecognizer){
        
        if scrollView.zoomScale == 1 {
            
            //oneTapGesture.isEnabled = false
            goLeftButton.isEnabled = true
            goRightButton.isEnabled = true
            
            let touch = sender.location(in: self.scrollView)
            let tapPlace = CGRect(origin: touch, size: .init(width: 50, height: 50))
            
            scrollView.zoom(to: tapPlace, animated: true)
        }else{
            
            //oneTapGesture.isEnabled = true
            goLeftButton.isEnabled = false
            goRightButton.isEnabled = false
            scrollView.setZoomScale(1.0, animated: true)
            
        }
        
    }
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // function for swipe Gesture //
    
    func swiped(_ sender: UIGestureRecognizer) {
        
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                // decrease index first
                
                imageIndex -= 1
                
                // check if index is in range
                
                if PagesCount < 0 {
                    
                    PagesCount = 0
                    
                }
                
                displayImageUsingIndexMinus()
                
                
                
                
                
                
                mangaPageCount.text = "\(pictureNum)/\(testArray1.count - 1)"
                pageSlider.value = Float(pictureNum)
                
                
                
                
                
            case UISwipeGestureRecognizerDirection.left:
                
                // increase index first
                
                imageIndex += 1
                
                // check if index is in range
                
                if imageIndex >= imgArr.count {
                    
                    
                    
                    imageIndex = (imgArr.count - 1)
                    
                    
                }
                
                // print(imageIndex)
                
                
                displayImageUsingIndexPlus()
                
                
                mangaPageCount.text = "\(pictureNum)/\(testArray1.count - 1)"
                pageSlider.value = Float(pictureNum)
                
                
            case UISwipeGestureRecognizerDirection.down :
                
                
                // dismissing page
                
                self.dismiss(animated: true, completion: nil)
                
                
                
                
            default:
                break //stops the code/codes nothing.
                
                
            }
        }
    }
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // function for back button //
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
        let segue = prepareForUnwind(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        
        segue.perform()
        
    }
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    ///// Gesture Recognizer needed to turn on ////
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    
    
    
    
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // Returning the zoom in view //
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.mangaPageImage
        
    }
    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // disabling buttons after zooming in with pinch //
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
        if goLeftButton.isEnabled == false && goRightButton.isEnabled == false {
            
            goLeftButton.isEnabled = true
            goRightButton.isEnabled = true
            
        }else {
            
            
            goLeftButton.isEnabled = false
            goRightButton.isEnabled = false
            
            
        }
        
        
        
    }
    
    
    
    
    ///////////////////////////////////////////////////////////
    
    
    
    
    
    func getPersonData() {
        let request = URLRequest(url: URL(string: VolumLink)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }
            // Parse JSON data
            if let data = data {
                self.parseJsonData(data)
                OperationQueue.main.addOperation{() -> Void in
                    self.updateViewPlus()
                    
                }
            }
        })
        task.resume()
    }
    
    
    
    /////////////////////////////////////////////////////////////
    
    
    func parseJsonData(_ data: Data) {
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            
            
            let jsonPeople = jsonResult?["array"] as! [[String:Any]]
            for jsonPeople in jsonPeople {
                let person =  jsonPeople["url"] as! String
                
                
                testArray1.append(person)
            }
            
            pageSlider.maximumValue = Float(testArray1.count - 1)
            
        } catch {
            print(error)
        }
        
    }
    
    /////////////////////////////////////
    
    func displayImageUsingIndexPlus() {
        
        //mangaPageImage.image = imgArr[imageIndex]
        updateViewPlus()
        
    }
    
    func displayImageUsingIndexMinus() {
        
        //mangaPageImage.image = imgArr[imageIndex]
        updateViewMinus()
        
    }
    
    
 
    
    func updateViewPlus(){

        if testArray1.count != 0 {
                let imgUrl = URL(string: testArray1[pictureNum])!
                
                do {
                    let data = try Data(contentsOf: imgUrl as URL)
                    if let image = UIImage(data: data) {
                        mangaPageImage.image = image
                        pictureNum += 1
                    }
                } catch {
                    print("Unable to load data: \(error)")
                }
            }
    }

    
    
    
    ///New code will be here //
    


        func updateViewMinus(){
            
            if pictureNum != 0 {
            
            let imgUrl = URL(string: testArray1[pictureNum])!
            
            do {
                let data = try Data(contentsOf: imgUrl as URL)
                if let image = UIImage(data: data) {
                    mangaPageImage.image = image
                    pictureNum -= 1
                }
            } catch {
                print("Unable to load data: \(error)")
            }

        }
    }
    

    
    ///////////////////// /////////////////////  ///////////////////// /////////////////////
    // class end //
    
    
}


