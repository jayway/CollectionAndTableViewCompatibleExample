//
//  GenreCell.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 25/10/2016.
//  Copyright © 2016 Fredrik Nannestad. All rights reserved.
//

import UIKit

class GenreCellModel: TableViewCompatible, CollectionViewCompatible, ChangeNotifier {
    
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
    
    var editable: Bool = true
    var movable: Bool = true
    
    init(genre: Genre) {
        self.genre = genre
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! GenreTableViewCell
        cell.configureWithModel(self)
        return cell
    }
    
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GenreCollectionViewCell
        cell.configureWithModel(self)
        return cell
    }
    
    func prefetch() {
        // Perform prefetching, for instance fetching data from the internet
    }
    
    func cancelPrefetch() {
        // Cancel any prefetching started in prefetch()
    }
    
}
