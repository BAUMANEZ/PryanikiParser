//
//  Extensions.swift
//  PryanikiParser
//
//  Created by Арсений Токарев on 04.03.2021.
//

import UIKit

extension UILabel {
    func styleLabel(font: UIFont, textColor: UIColor) {
        self.font = font
        self.textColor = textColor
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
    }
}
