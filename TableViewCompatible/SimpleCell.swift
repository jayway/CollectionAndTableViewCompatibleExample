//
//  SimpleCell.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 25/10/2016.
//  Copyright © 2016 Fredrik Nannestad. All rights reserved.
//

import UIKit

class SimpleCell: UITableViewCell, Configurable {
    
    @IBOutlet weak var label: UILabel!
    var model: SimpleCellModel?
    
    func configureWithModel(_ model: SimpleCellModel) {
        self.model = model
        label.text = model.string
    }
    
}

class SimpleCellModel: TableViewCompatible {
    
    var reuseIdentifier: String {
        return MainStoryboard.SimpleCellIdentifier
    }
    
    var selected: Bool = false
    var string: String?
    
    init(string: String) {
        self.string = string
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    }
    
}


