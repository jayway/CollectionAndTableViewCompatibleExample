//
//  GenreCell.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 25/10/2016.
//  Copyright © 2016 Fredrik Nannestad. All rights reserved.
//

import UIKit

class GenreCellModel: TableViewCompatible, ChangeNotifier {
    
    weak var changeListener: ChangeListener?
    
    var reuseIdentifier: String {
        return MainStoryboard.GenreCellIdentifier
    }
    
    let genre: Genre
    
    var selected: Bool = false {
        didSet {
            changeListener?.notify(notifier: self)
        }
    }
    
    init(genre: Genre) {
        self.genre = genre
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! GenreCell
        cell.configureWithModel(self)
        return cell
    }
    
    func prefetch() {
        print(#function)
    }
    
    func cancelPrefetch() {
        
    }
    
}

class GenreCell: UITableViewCell, Configurable, ChangeListener {
    
    @IBOutlet weak var label: UILabel!
    
    var model: GenreCellModel? {
        didSet {
            model?.changeListener = self
        }
    }
    
    func configureWithModel(_ model: GenreCellModel) {
        self.model = model
        self.label.text = model.genre.description
        self.updateCheckmark()
    }

    func notify(notifier: ChangeNotifier) {
        self.updateCheckmark()
    }
    
    private func updateCheckmark() {
        if let model = self.model {
            self.accessoryType = model.selected ? .checkmark : .none
        }
    }
}

