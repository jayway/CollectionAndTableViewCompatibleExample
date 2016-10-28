//
//  MyTableViewData.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 25/10/2016.
//  Copyright © 2016 Fredrik Nannestad. All rights reserved.
//

import UIKit

enum Sections: Int {
    case GenreSection
    case UserSection
}

class MyTableViewData: NSObject, TableViewData {
    
    var sections: [TableViewSection] = []
    let user: User
    let genres: [Genre]

    init(user: User, andGenres genres: [Genre]) {
        self.user = user
        self.genres = genres
        super.init()
    }
    
    func prepareData() {
        
        var items = [TableViewCompatible]()
        
        let userCellModel = UserCellModel(user: user)
        
//        items.append(userCellModel)
        
        for genre in self.genres {
            let genreCellModel = GenreCellModel(genre: genre)
            genreCellModel.selected = user.genres.contains(genre)
            items.append(genreCellModel)
        }
        
        let userSection = TableViewSection(sortOrder: Sections.UserSection.rawValue, items: [userCellModel]);
        
        let section = TableViewSection(sortOrder: Sections.GenreSection.rawValue, items: items, headerTitle: "Genres", footerTitle: nil)
        
        sections = [userSection, section].sorted {
            return $0.sortOrder < $1.sortOrder
        }
    }
    
}

extension MyTableViewData: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }
    
    // Optional
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForFooterInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self[indexPath].editable
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self[indexPath].movable
    }
    
}

extension MyTableViewData: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        prefetchObjectsAtIndexPaths(indexPaths: indexPaths)
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        cancelPrefetchingObjectsAtIndexPaths(indexPaths: indexPaths)
    }
    
}
