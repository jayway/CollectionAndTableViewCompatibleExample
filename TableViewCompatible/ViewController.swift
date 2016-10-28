//
//  ViewController.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 21/10/2016.
//  Copyright © 2016 Fredrik Nannestad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: AutolayoutTableView!
    lazy var data: MyTableViewData = MyTableViewData(user: self.user, andGenres: Genre.allGenres)
    var user: User = User(name: "Fredrik", imageName: "fredrik.jpg")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self.data
        self.tableView.delegate = self
        self.tableView.prefetchDataSource = self.data
        
        data.prepareData()
        
        self.tableView.reloadData()
    }

}
