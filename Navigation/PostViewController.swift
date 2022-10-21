//
//  PostViewController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import UIKit

class PostViewController: UIViewController {

    var dataTitle = FeedViewController().dataSource.title

    override func viewDidLoad() {
        view.backgroundColor = .yellow
        self.title = dataTitle
        showBarButton()
    }

    func showBarButton() {
        let barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapOnInfo))
        self.navigationItem.rightBarButtonItem = barButton
    }
    @objc
    func tapOnInfo() {
        let infoView = InfoViewController()
        present(infoView, animated: true)
    }
}
