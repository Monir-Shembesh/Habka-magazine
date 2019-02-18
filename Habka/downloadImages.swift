//
//  downloadImages.swift
//  Habka
//
//  Created by monir shembesh on 23/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import Foundation

import UIKit


class downloadImages: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    

    
    
    var imgArr = [UIImage]()
    
    
    
    
    func updateView(mangaPages: mangaPages){
        
        
        let ImgUrl = URL (string: mangaPages.pageImageURL)!
        
        DispatchQueue.global().async {
            
            do {
                
                let data = try Data(contentsOf: ImgUrl)
                DispatchQueue.global().sync {
                    
                    self.imgArr.append(UIImage(data: data)!)
                    
                }
                
            } catch {
                //handle the error
            }
        }
        
        
    }
    
    
    
}
