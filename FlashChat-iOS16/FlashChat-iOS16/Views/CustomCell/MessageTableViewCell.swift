//
//  MessageTableViewCell.swift
//  FlashChat-iOS16
//
//  Created by Amr Mohamad on 15/05/2023.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var avaterImage: UIImageView!
    @IBOutlet weak var messageBubble: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
