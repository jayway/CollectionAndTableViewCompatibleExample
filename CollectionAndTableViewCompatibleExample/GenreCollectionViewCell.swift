//
//  GenreCollectionViewCell.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 31/01/2017.
//  Copyright © 2017 Fredrik Nannestad. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell, Configurable, ChangeListener {
    
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
        
    }
}
