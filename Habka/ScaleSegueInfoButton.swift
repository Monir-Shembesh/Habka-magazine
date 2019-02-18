//
//  ScaleSegueInfoButton.swift
//  Habka
//
//  Created by monir shembesh on 17/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit

class ScaleSegueInfoButton: UIStoryboardSegue {
    
    
    override func perform() {
        
        fromRight()
        
        
    }
    

    
    
//    func fromMiddle(){
//    
//        let toInfoVC = self.destination
//        let fromMainVC = self.source
//        
//        let containerView = fromMainVC.view.superview
//        let originalCentre = fromMainVC.view.center
//        
//        toInfoVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
//        toInfoVC.view.center = originalCentre
//        containerView?.addSubview(toInfoVC.view)
//        
//        
//        
//        
//        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
//            toInfoVC.view.transform = CGAffineTransform.identity
//        }, completion: { success in
//            
//            fromMainVC.present(toInfoVC, animated: false , completion: nil)
//        
//            
//        })
//        
//    
//    
//    }
    
 
//     func fromLeft(){
//        
//        let src = self.source
//        let dst = self.destination
//        
//        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
//        dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
//        
//        UIView.animate(withDuration: 0.25,
//                                   delay: 0.0,
//                                   options: UIViewAnimationOptions.curveEaseInOut,
//                                   animations: {
//                                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
//        },
//                                   completion: { finished in
//                                    src.present(dst, animated: false, completion: nil)
//        }
//        )
//    }
    
    
    func fromRight(){
        
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.35,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },
                       completion: { sucess in
                        src.present(dst, animated: false, completion: nil)
        }
        )
        
        
        
    }

    
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class prepareForUnwind: UIStoryboardSegue {

    
    
    
    override func perform() {
        
        fromLeft()
        
        
    }
    
    //    func fromMiddle(){
    //
    //        let toInfoVC = self.destination
    //        let fromMainVC = self.source
    //
    //        let containerView = fromMainVC.view.superview
    //        let originalCentre = fromMainVC.view.center
    //
    //        toInfoVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)         // Needs Fixing Youtube Video
    //        toInfoVC.view.center = originalCentre
    //        containerView?.addSubview(toInfoVC.view)
    //
    //
    //
    //
    //        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
    //            toInfoVC.view.transform = CGAffineTransform.identity
    //        }, completion: { success in
    //
    //            fromMainVC.present(toInfoVC, animated: false , completion: nil)
    //
    //
    //        })
    //
    //
    //
    //    }
    
    
    //     func fromLeft(){
    //
    //        let src = self.source
    //        let dst = self.destination
    //
    //        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
    //        dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
    //
    //        UIView.animate(withDuration: 0.25,
    //                                   delay: 0.0,
    //                                   options: UIViewAnimationOptions.curveEaseInOut,
    //                                   animations: {
    //                                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
    //        },
    //                                   completion: { sucess in
    //                                     src.dismiss(animated: false, completion: nil)
    //        }
    //        )
    //    }
    

    func fromLeft(){
        
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: -src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.35,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },
                       completion: { sucess in
                        src.dismiss(animated: false, completion: nil)
        }
        )
    }

    
    

}
