//
//  TableViewCell.swift
//  newsapp
//
//  Created by Mukund vaghasiya  on 16/03/23.
//

import UIKit
import WebKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var TItle: UILabel!
    @IBOutlet weak var Description: UILabel!
  
    @IBOutlet weak var Headimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
