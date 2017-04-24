//
//  ViewController.swift
//  messenger
//
//  Created by Mateusz Siepietowski on 23.04.2017.
//  Copyright © 2017 Mateusz Siepietowski. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var messages = [[Message]]()

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
        
        cell.message = messages[indexPath.item][0]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let chatVC = ChatViewController(collectionViewLayout: layout)
        chatVC.title = messages[indexPath.item][0].user?.username
        chatVC.messages = messages[indexPath.row]
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
    func setupContent() {
        
        let userMati = User()
        userMati.username = "Mateusz Siepietowski"
        userMati.photo = "mati"
        let userRoksi = User()
        userRoksi.username = "Roksana Cis"
        userRoksi.photo = "roksi"
        
        var messageMatiArray = [Message]()
        let messageMati1 = Message()
        messageMati1.text = "Cześć. Co słychać? :)"
        messageMati1.date = Date()
        messageMati1.user = userMati
        let messageMati2 = Message()
        messageMati2.text = "U mnie wszystko w porządku. Mam się całkiem dobrze."
        messageMati2.date = Date()
        messageMati2.user = userMati
        let messageMati3 = Message()
        messageMati3.text = "Astra turbo jest bardzo szybka i zwinna. 170 koni mechanicznych mocy robi robotę."
        messageMati3.date = Date()
        messageMati3.user = userMati
        let messageMati4 = Message()
        messageMati4.text = "Bardzo mi się podoba jej kolor i szklany dach."
        messageMati4.date = Date()
        messageMati4.user = userMati
        messageMatiArray = [messageMati1, messageMati2, messageMati3, messageMati4]
        
        var messageRoksiArray = [Message]()
        let messageRoksi1 = Message()
        messageRoksi1.text = "Jak się masz? U mnie wszystko w porządku. :)"
        messageRoksi1.date = Date()
        messageRoksi1.user = userRoksi
        let messageRoksi2 = Message()
        messageRoksi2.text = "Kończę właśnie licencjat. Napisałam go pierwsza w grupie. Taki ze mnie kujon."
        messageRoksi2.date = Date()
        messageRoksi2.user = userRoksi
        let messageRoksi3 = Message()
        messageRoksi3.text = "W lato jadę do USA do Chicago."
        messageRoksi3.date = Date()
        messageRoksi3.user = userRoksi
        let messageRoksi4 = Message()
        messageRoksi4.text = "Będę tam przez 6 miesięcy zajmować się dziećmi i studiować."
        messageRoksi4.date = Date()
        messageRoksi4.user = userRoksi
        messageRoksiArray = [messageRoksi1, messageRoksi2, messageRoksi3, messageRoksi4]
        
        messages = [messageMatiArray, messageRoksiArray]
        
    }
}

