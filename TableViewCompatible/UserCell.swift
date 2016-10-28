//
//  ImageCell.swift
//  TableViewCompatible
//
//  Created by Fredrik Nannestad on 24/10/2016.
//  Copyright © 2016 Fredrik Nannestad. All rights reserved.
//

import UIKit

class UserCellModel: TableViewCompatible {
    
    var reuseIdentifier: String {
        return MainStoryboard.UserCellIdentifier
    }

    let imageName: String
    let userName: String
    
    var selected: Bool = false
    
    init(userName: String, imageName: String) {
        self.userName = userName
        self.imageName = imageName
    }
    
    convenience init(user: User) {
        self.init(userName: user.name, imageName: user.imageName)
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.configureWithModel(self)
        return cell
    }
    
    func prefetch() {
        // Start long running tasks like fetching images from the internet
    }
    
    func cancelPrefetch() {
        // Stop any task you started in prefetch
    }
    
}

class UserCell: UITableViewCell, Configurable {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var model: UserCellModel?
    
    func configureWithModel(_ model: UserCellModel) {
        self.model = model
        userImageView.image = UIImage(named: model.imageName)
        userNameLabel.text = model.userName
    }
    
}
