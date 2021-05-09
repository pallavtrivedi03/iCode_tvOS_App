//
//  ClassifiedCollectionViewCell.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 02/05/21.
//

import UIKit

class ClassifiedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        containerView.layer.cornerRadius = containerView.frame.size.height/2
        containerView.clipsToBounds = true
        containerView.backgroundColor = .random
        containerView.layer.borderWidth = 10
        containerView.layer.borderColor = UIColor.clear.cgColor
    }
 
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            containerView.layer.borderColor = UIColor.white.cgColor
            containerView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            titleLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } else {
            containerView.layer.borderColor = UIColor.clear.cgColor
            containerView.transform = CGAffineTransform(scaleX: 1, y: 1)
            titleLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func configureView(text: String) {
        containerView.backgroundColor = UIColor.random
        titleLabel.text = text
    }
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0.65...1),
                       green: .random(in: 0.65...1),
                       blue: .random(in: 0.65...1),
                       alpha: 0.8)
    }
}
