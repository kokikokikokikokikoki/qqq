//
//  TableViewCell.swift
//  Test
//
//  Created by Buratsakorn Petchdee on 18/2/2565 BE.
//

import UIKit

class TableViewCell: UITableViewCell {
  
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var labeldesc: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
