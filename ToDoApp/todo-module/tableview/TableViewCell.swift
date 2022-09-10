//
//  TableViewCell.swift
//  ToDoApp
//
//  Created by Macbook on 4.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblThingsToDo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
