//
//  TabelViewBG.swift
//  Habka
//
//  Created by monir shembesh on 17/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit

class TabelViewBG: UIStoryboardSegue {

    
    func viewDidLoad() {
        
    var imageView = UIImageView(frame: self.view.frame)
    var image = UIImage(named: "BG.png")!
    imageView.image = image
    self.view.addSubview(imageView)
    self.view.sendSubviewToBack(imageView)

}
}
