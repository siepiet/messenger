//
//  MainCollectionViewCell.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 23.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import Foundation
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    func setupCell() {
        self.backgroundColor = UIColor.green
    }
}
