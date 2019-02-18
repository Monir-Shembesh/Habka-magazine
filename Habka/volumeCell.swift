//
//  Volume Cell.swift
//  Habka
//
//  Created by monir shembesh on 18/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import Foundation
import UIKit


class volumeCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    @IBOutlet weak var VolumeImg: UIImageView!
    @IBOutlet weak var VolumeNumLbl: UILabel!

    
    

    
    func UpdateUI(volumes: volumes){
        

        VolumeNumLbl.text = volumes.volumeTitle
        let ImgUrl = URL (string: volumes.volumeImage)!
        

        
        DispatchQueue.global().async {
            
            do {
                
                let data = try Data(contentsOf: ImgUrl)
                DispatchQueue.global().sync {
                    self.VolumeImg.image = UIImage(data: data)
                }
                
            } catch {
                //handle the error
            }
        }
        
        
    }
    
    

}
