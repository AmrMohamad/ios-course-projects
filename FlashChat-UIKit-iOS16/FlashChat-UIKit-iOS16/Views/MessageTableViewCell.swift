//
//  MessageTableViewCell.swift
//  FlashChat-UIKit-iOS16
//
//  Created by Amr Mohamad on 14/05/2023.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    static let indentifier = "MessageCell"
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        return label
    }()
    
    let messageBubble: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Constants.BrandColors.purple)
        return view
    }()
    
    let avaterImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "MeAvatar"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let avaterSecondImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "YouAvatar"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        messageBubble.layer.cornerRadius = contentView.frame.size.height / 3
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setConstraints() {
        let stack = UIStackView(
            arrangedSubviews: [
                avaterSecondImage,
                messageBubble,
                avaterImage
            ]
        )
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis         = .horizontal
        stack.alignment    = .top
        stack.distribution = .fill
        stack.spacing      = 16
        
        let stackConstraints = [
          stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
          stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
          stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
          stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ]
        messageBubble.addSubview(messageLabel)
        let messageLabelConstraints = [
            messageLabel.leadingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: -10),
            messageLabel.topAnchor.constraint(equalTo: messageBubble.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor, constant: -10)
        ]
        
        let avaterImageConstraints = [
            avaterImage.heightAnchor.constraint(equalToConstant: 40),
            avaterImage.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        let avaterSecondImageConstraints = [
            avaterSecondImage.heightAnchor.constraint(equalToConstant: 40),
            avaterSecondImage.widthAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(stackConstraints)
        NSLayoutConstraint.activate(messageLabelConstraints)
        NSLayoutConstraint.activate(avaterImageConstraints)
        NSLayoutConstraint.activate(avaterSecondImageConstraints)
    }
}



//        let messageBubbleConstraints = [
//            messageBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            messageBubble.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            messageBubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ]
//
//        let messageLabelConstraints = [
//            messageLabel.leadingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: 10),
//            messageLabel.trailingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: -10),
//            messageLabel.topAnchor.constraint(equalTo: messageBubble.topAnchor, constant: 10),
//            messageLabel.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor, constant: -10)
//        ]
//
//        let avaterImageConstraints = [
//            avaterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            avaterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            avaterImage.leadingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: 10),
//            avaterImage.heightAnchor.constraint(equalToConstant: 40),
//            avaterImage.widthAnchor.constraint(equalToConstant: 40)
//        ]
//
//        NSLayoutConstraint.activate(messageBubbleConstraints)
//        NSLayoutConstraint.activate(messageLabelConstraints)
//        NSLayoutConstraint.activate(avaterImageConstraints)
