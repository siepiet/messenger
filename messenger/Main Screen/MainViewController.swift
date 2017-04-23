//
//  ViewController.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 23.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var messages = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ostatnie"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        setupContent()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainCollectionViewCell
        
        cell.message = messages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    func setupContent() {
        
        let userMati = User()
        userMati.username = "Mateusz Siepietowski"
        userMati.photo = "mati"
        let userRoksi = User()
        userRoksi.username = "Roksana Cis"
        userRoksi.photo = "roksi"
        
        let messageMati = Message()
        messageMati.text = "Cześć. Co słychać? :)"
        messageMati.date = Date()
        messageMati.user = userMati
        let messageRoksi = Message()
        messageRoksi.text = "Jak się masz? U mnie wszystko w porządku. :)"
        messageRoksi.date = Date()
        messageRoksi.user = userRoksi
        
        messages = [messageMati, messageRoksi]
        
        
        
        
    }
}

