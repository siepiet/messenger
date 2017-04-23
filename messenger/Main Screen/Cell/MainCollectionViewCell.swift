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
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let onePixDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let detailsView: UIView = {
        let view = UIView()
        return view
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.gray
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let hourLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        label.textAlignment = .right
        return label
    }()
    
    let hasUserReadMessageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell() {
        
        profileImageView.image = UIImage(named: "profile")
        hasUserReadMessageImage.image = UIImage(named: "profile")
        usernameLabel.text = "Mateusz Siepietowski"
        messageLabel.text = "Cześć. Co słychać?"
        hourLabel.text = "08:43 PM"
        
        addSubview(profileImageView)
        addSubview(onePixDivider)
        addSubview(detailsView)
        detailsView.addSubview(usernameLabel)
        detailsView.addSubview(messageLabel)
        detailsView.addSubview(hourLabel)
        detailsView.addSubview(hasUserReadMessageImage)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        onePixDivider.translatesAutoresizingMaskIntoConstraints = false
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hasUserReadMessageImage.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0(68)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-90-[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": onePixDivider]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": onePixDivider]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-90-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailsView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":detailsView]))
        
        detailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": usernameLabel]))
        detailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": messageLabel]))
        detailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[v0(200)]-4-[v1]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":usernameLabel, "v1": hourLabel]))
        detailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[v0]-4-[v1(20)]-4-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":messageLabel, "v1": hasUserReadMessageImage]))
        detailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": hourLabel]))
        detailsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(20)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":hasUserReadMessageImage]))
        
    }
}
