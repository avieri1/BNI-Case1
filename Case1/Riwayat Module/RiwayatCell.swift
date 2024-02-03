//
//  RiwayatCell.swift
//  Case1
//
//  Created by aldo on 01/02/24.
//

import UIKit

class RiwayatCell: UITableViewCell {

    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    
    static let identifier = String(describing: RiwayatCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
