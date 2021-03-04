//
//  PryanikiTableView.swift
//  PryanikiParser
//
//  Created by Арсений Токарев on 04.03.2021.
//

import UIKit

class PryanikiTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        registerCells()
        alwaysBounceVertical = false
        alwaysBounceHorizontal = false
        showsHorizontalScrollIndicator = false
    }
    
    func registerCells() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
