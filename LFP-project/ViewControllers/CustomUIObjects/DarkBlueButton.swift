//
//  CustomUIButton.swift
//  LFP-project
//
//  Created by MacBook on 15.12.21.
//

import UIKit

class DarkBlueButton: UIButton {
    
    
   override init(frame: CGRect) {
       super.init(frame: frame)
       
   }
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = UIColor(red: 0.16, green: 0.17, blue: 0.25, alpha: 1.0)
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
