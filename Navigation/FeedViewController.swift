//
//  FirstController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var dataSource = Post(title: "Название поста")

    private let postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray4
        button.setTitle("POST", for: .normal)
        button.layer.borderWidth = 2
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 50)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "Лента"
        view.addSubview(postButton)
        addTarget()
    }

    func addTarget() {
        postButton.addTarget(self, action: #selector(tapOnBtn), for: .touchUpInside)
    }
    @objc
    func tapOnBtn() {
        let postView = PostViewController()
        navigationController?.pushViewController(postView, animated: true)
    }
    
}
