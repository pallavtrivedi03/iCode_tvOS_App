//
//  ProfileViewController.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 05/05/21.
//

import UIKit

enum ProfileOption: Int, CaseIterable {
    case subscription
    case library
    case settings
    case logout
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var settingsTableView: UITableView!
    
    @IBOutlet weak var libraryView: UIView!
    @IBOutlet weak var subscriptionView: UIView!
    
    var selectedProfileOption: ProfileOption = .subscription {
        didSet {
            switch self.selectedProfileOption {
            case .subscription:
                subscriptionView.isHidden = false
                libraryView.isHidden = true
            case .library:
                subscriptionView.isHidden = true
                libraryView.isHidden = false
            case .settings:
                subscriptionView.isHidden = true
                libraryView.isHidden = true
            case .logout:
                subscriptionView.isHidden = true
                libraryView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        settingsTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscriptionView.isHidden = false
    }

    
    @IBAction func didClickOnSubmitButton(_ sender: UIButton) {
        loginView.isHidden = true
        profileView.isHidden = false
        libraryView.isHidden = true
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ProfileOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") {
            let profileOption = ProfileOption(rawValue: indexPath.row)
            switch profileOption {
            case .subscription:
                cell.textLabel?.text = "Subscription Status"
            case .library:
                cell.textLabel?.text = "My Library"
            case .settings:
                cell.textLabel?.text = "Video Quality Settings"
            case .logout:
                cell.textLabel?.text = "Logout"
            case .none:
                break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        if let profileOption = ProfileOption(rawValue: indexPath.row) {
            selectedProfileOption = profileOption
        }
        return true
    }
}
