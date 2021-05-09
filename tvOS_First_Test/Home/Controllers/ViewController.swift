//
//  ViewController.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 01/05/21.
//

import UIKit

enum CellType: Int, CaseIterable {
    case carousal
    case latestVideos
    case classified
    case tools
}

class ViewController: UIViewController {

    @IBOutlet weak var homeDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        homeDataTableView.register(UINib(nibName: "VideosTableViewCell", bundle: nil), forCellReuseIdentifier: "VideosTableViewCell")
        homeDataTableView.estimatedRowHeight = 300
        homeDataTableView.rowHeight = UITableView.automaticDimension
        homeDataTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: VideosTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as? VideosTableViewCell, let cellType = CellType(rawValue: indexPath.row) {
            cell.type = cellType
            switch cellType {
            case .carousal:
                    cell.titleLabel.isHidden = true
                    cell.videosCollectionViewHeightConstraint.constant = 540
            case .latestVideos:
                    cell.titleLabel.text = "Latest by iCode"
                    cell.videosCollectionViewHeightConstraint.constant = 360
                    cell.delegate = self
            case .classified:
                    cell.titleLabel.text = "Classified"
                    cell.videosCollectionViewHeightConstraint.constant = 360
                    cell.videosCollectionView.reloadData()
            case .tools:
                    cell.titleLabel.text = "Useful Tools"
                    cell.videosCollectionViewHeightConstraint.constant = 300
                    cell.videosCollectionView.reloadData()
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension ViewController: VideoTableViewCellDelegate {
    func didSelectItem() {
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            self.present(detailVC, animated: true, completion: nil)
        }
    }
}
