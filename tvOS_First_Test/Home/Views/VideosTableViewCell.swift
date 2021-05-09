//
//  VideosTableViewCell.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 02/05/21.
//

import UIKit

protocol VideoTableViewCellDelegate: AnyObject {
    func didSelectItem()
}

class VideosTableViewCell: UITableViewCell {

    @IBOutlet weak var videosCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: VideoTableViewCellDelegate?
    var type: CellType = .latestVideos
    
    var latestVideos = ["debugging","lazyView","appleSignIn","inheritance","copyOnWrite","methodDispatch"]
    var carousalVideos = ["tvOS_development","iCode_Banner_Small"]
    var classifiedVideos = ["Interviews", "Swift UI", "Core Concepts", "DSA"]
    var toolsVideos = ["simsim","instruments","pusher"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videosCollectionView.dataSource = self
        videosCollectionView.delegate = self
        registerNibs()
    }
    
    func registerNibs() {
        videosCollectionView.register(UINib(nibName: "VideosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideosCollectionViewCell")
        videosCollectionView.register(UINib(nibName: "ClassifiedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClassifiedCollectionViewCell")
        videosCollectionView.register(UINib(nibName: "ToolsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ToolsCollectionViewCell")
    }
}

extension VideosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch type {
        case .carousal:
            return carousalVideos.count
        case .latestVideos:
            return latestVideos.count
        case .classified:
            return classifiedVideos.count
        case .tools:
            return toolsVideos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch type {
        case .carousal:
            if let cell: VideosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell", for: indexPath) as? VideosCollectionViewCell {
                cell.type = type
                cell.posterImageView.image = UIImage(named: carousalVideos[indexPath.row])
                cell.posterImageView.contentMode = .scaleAspectFill
                return cell
            }
            return UICollectionViewCell()
        case .latestVideos:
            if let cell: VideosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell", for: indexPath) as? VideosCollectionViewCell {
                cell.type = type
                cell.posterImageView.image = UIImage(named: latestVideos[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        case .classified:
            if let cell: ClassifiedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassifiedCollectionViewCell", for: indexPath) as? ClassifiedCollectionViewCell {
                cell.configureView(text: classifiedVideos[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        case .tools:
            if let cell: ToolsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ToolsCollectionViewCell", for: indexPath) as? ToolsCollectionViewCell {
                cell.posterImageView.image = UIImage(named: toolsVideos[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch type {
        case .carousal:
            return CGSize(width: collectionView.frame.size.width - 180, height: collectionView.frame.size.height)
        case .latestVideos, .tools:
            return CGSize(width: (16/9) * collectionView.frame.size.height, height: collectionView.frame.size.height)
        case .classified:
            return CGSize(width: 360, height: 360)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem()
    }
}
