//
//  ChatCell.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 24.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let background: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(red: 0, green: 134/255, blue: 249/255, alpha: 1)
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        //backgroundColor = UIColor(red: 0, green: 134/255, blue: 249/255, alpha: 1)
        
        addSubview(background)
        addSubview(label)
        addSubview(profileImage)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImage]))
        
    }
    
    func setupCell(with message: Message) {
        label.text = message.text
        profileImage.image = UIImage(named: (message.user?.photo)!)
    }
}
