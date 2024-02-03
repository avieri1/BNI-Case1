//
//  HomeMenuCell.swift
//  Case1
//
//  Created by aldo on 31/01/24.
//

import UIKit

class HomeMenuCell: UICollectionViewCell {

    static let identifier = String(describing: HomeMenuCell.self)
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: UIImage, title: String) {
        self.image.image = image
        titleLbl.text = title
    }

}
