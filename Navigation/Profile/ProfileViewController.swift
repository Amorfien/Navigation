//
//  SecondController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        self.title = "Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
}
