//
//  CustomTextField.swift
//  LFP-project
//
//  Created by MacBook on 15.12.21.
//

import UIKit

class CustomTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    init() {
        super.init(frame: .zero)
        borderStyle = .roundedRect
        layer.borderWidth = 1
        textColor = .black
        backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 1.0, alpha: 1.0)
        layer.borderColor = CGColor(red: 0.73, green: 0.74, blue: 0.85, alpha: 1.0)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

