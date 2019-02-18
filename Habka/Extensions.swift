//
//  Extensions.swift
//  Habka
//
//  Created by monir shembesh on 26/06/2017.
//  Copyright © 2017 monir shembesh. All rights reserved.
//

import UIKit

extension UIView {


    func addConstraintsWithFormat(format: String, views: UIView...){
    
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
        let key = "v\(index)"
        view.translatesAutoresizingMaskIntoConstraints = false
        viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }


}
