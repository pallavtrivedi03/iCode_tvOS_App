//
//  VideosCollectionViewCell.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 01/05/21.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    var type: CellType = .latestVideos
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 20
        posterImageView.clipsToBounds = true
        posterImageView.layer.borderWidth = 10
        posterImageView.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({ [weak self] in
            if self?.isFocused ?? false{
                self?.posterImageView.transform = self?.type == .carousal ? CGAffineTransform(scaleX: 1.01, y: 1.01) : CGAffineTransform(scaleX: 1.05, y: 1.05)
                self?.posterImageView.layer.borderColor = UIColor.white.cgColor
            } else {
                self?.posterImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self?.posterImageView.layer.borderColor = UIColor.clear.cgColor
            }
        }, completion: nil)
    }
}
