//
//  TableViewCell.swift
//  jasonDecodePractice
//
//  Created by Mukund vaghasiya  on 05/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfCont: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var Capital: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
