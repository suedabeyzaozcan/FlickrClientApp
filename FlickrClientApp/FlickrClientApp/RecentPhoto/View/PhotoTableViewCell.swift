//
//  PhotoTableViewCell.swift
//  FlickrClientApp
//
//  Created by Sueda Beyza Özcan on 20.08.2024.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    var photo: Photo?
    
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ownerImageView.layer.cornerRadius = 24.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
