//
//  Volumes.swift
//  Habka
//
//  Created by monir shembesh on 18/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import Foundation


class volumes {
    
    
    private var _volumeImage: String!
    private var _volumeTitle: String!
    
    var volumeImage: String! {
        return _volumeImage
     }

    var volumeTitle: String! {
        return _volumeTitle
    }
    
    init(volumeImage: String, volumeTitle: String) {
        
        _volumeImage = volumeImage

        _volumeTitle = volumeTitle
    }

}
