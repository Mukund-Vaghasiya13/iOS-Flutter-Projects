//
//  tableViewcellTableViewCell.swift
//  practiceset1
//
//  Created by Mukund vaghasiya  on 26/03/23.
//

import UIKit

class tableViewcellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var Amount: UITextField!
    
    
    @IBOutlet weak var Sine: UITextField!
    
    
    @IBOutlet weak var Value: UITextField!
    
    @IBOutlet weak var Answer: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
