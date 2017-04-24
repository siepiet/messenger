//
//  ChatViewController.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 24.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let chatCellId = "chatCellId"
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(ChatCell.self, forCellWithReuseIdentifier: chatCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: chatCellId, for: indexPath) as! ChatCell
        cell.setupCell(with: messages[indexPath.item])
        
        if let message = messages[indexPath.item].text {
            
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
            
            cell.label.frame = CGRect(x: 48, y: 0, width: estimatedFrame.width + 6, height: estimatedFrame.height + 20)
            cell.background.frame = CGRect(x: 42, y: 0, width: estimatedFrame.width + 6, height: estimatedFrame.height + 20)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let message = messages[indexPath.item].text {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: message).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
            return CGSize(width: collectionView.frame.size.width, height: estimatedFrame.height + 20)
        }
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
}
