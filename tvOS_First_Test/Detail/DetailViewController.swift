//
//  DetailViewController.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 05/05/21.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var similarTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        similarTableView.register(UINib(nibName: "VideosTableViewCell", bundle: nil), forCellReuseIdentifier: "VideosTableViewCell")
        similarTableView.estimatedRowHeight = 300
        similarTableView.rowHeight = UITableView.automaticDimension
        similarTableView.reloadData()
    }
    
    @IBAction func didClickOnPlayButton(_ sender: UIButton) {
        
        //Put any video in Resources directory, replace "Debugging" with it's name. I haven't pushed this video.
        guard let path = Bundle.main.path(forResource: "Debugging", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        playerController.player?.currentItem?.externalMetadata = makeExternalMetadata()
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    func makeExternalMetadata() -> [AVMetadataItem] {
        var metadata = [AVMetadataItem]()
        
        // Build title item
        let titleItem = makeMetadataItem(.commonIdentifierTitle, value: "Improve your Debugging Skills")
        metadata.append(titleItem)
        
        // Build artwork item
        if let image = UIImage(named: "debugging"), let pngData = image.pngData() {
            let artworkItem = makeMetadataItem(.commonIdentifierArtwork, value: pngData)
            metadata.append(artworkItem)
        }
        
        // Build description item
        let descItem = makeMetadataItem(.commonIdentifierDescription, value: """
            Because we spend a lot of time in fixing bugs and improving the performance of the apps, it is very important to have good debugging skills.
            In this video, I’ve summarised some of the debugging skills that I’ve learnt from my experience. These include Breakpoints, LLDB (po, p, v), Network Link Conditioner, Identifying tricky issues which do not occur on simulator/debug mode, View Hierarchy.
            """
        )
        metadata.append(descItem)
        
        // Build genre item
        let genreItem = makeMetadataItem(.quickTimeMetadataGenre, value: "Education")
        metadata.append(genreItem)
        return metadata
    }


    
    private func makeMetadataItem(_ identifier: AVMetadataIdentifier, value: Any) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.identifier = identifier
        item.value = value as? NSCopying & NSObjectProtocol
        item.extendedLanguageTag = "und"
        return item.copy() as! AVMetadataItem
    }
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: VideosTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as? VideosTableViewCell {
            cell.type = .latestVideos
            cell.latestVideos.removeFirst()
            cell.titleLabel.text = "You May Like"
            cell.videosCollectionViewHeightConstraint.constant = 200
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
