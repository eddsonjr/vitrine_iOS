//
//  TableViewCell.swift
//  VitrineProdutos
//
//  Created by Edson  Jr on 14/10/2019.
//  Copyright © 2019 Edson  Jr. All rights reserved.
//
//
//
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var sectionNameLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
