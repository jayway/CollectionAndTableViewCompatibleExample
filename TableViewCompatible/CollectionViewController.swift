//
//  CollectionViewController.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 31/01/2017.
//  Copyright © 2017 Fredrik Nannestad. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var data: MyCollectionViewDataSource!
    var user: User = User(name: "Fredrik", imageName: "fredrik.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = MyCollectionViewDataSource(user: self.user, andGenres: Genre.allGenres, collectionView: collectionView!)
        data.prepareData()
        collectionView?.reloadData()
    }
    
    @IBAction func edit(sender: UIBarButtonItem!) {
        self.setEditing(!self.isEditing, animated: true)
        updateLeftItem()
    }
    
    private func updateLeftItem() {
        let systemItem: UIBarButtonSystemItem = self.isEditing ? .done : .edit
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: #selector(edit(sender:)))
    }
    
}
