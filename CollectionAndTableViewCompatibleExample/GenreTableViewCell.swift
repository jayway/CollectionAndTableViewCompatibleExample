//
//  GenreTableViewCell.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 31/01/2017.
//  Copyright © 2017 Fredrik Nannestad. All rights reserved.
//

import UIKit

class GenreTableViewCell: UITableViewCell, Configurable, ChangeListener {
    
    @IBOutlet weak var label: UILabel!
    
    var model: GenreCellModel? {
        didSet {
            model?.changeListener = self
        }
    }
    
    override func willDisplay() {
        
    }
    
    override func didEndDisplay() {
        
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
