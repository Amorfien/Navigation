//
//  SecondController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tView = UITableView()
        tView.backgroundColor = .lightGray
//        tView.tableHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 265))
        tView.dataSource = self
        tView.delegate = self
        tView.showsVerticalScrollIndicator = false
        tView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()

    var viewModel: [Post] = [post1, post2, post3, post4]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        setup()
    }

    func setup() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell()
        cell.backgroundColor = .white
        cell.fillData(with: postArray, indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = ProfileHeaderView()
        return sectionHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 265
    }

}
