//
//  SecondController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 20.10.2022.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {

    static var tableView: UITableView = {
        let tView = UITableView()
        tView.backgroundColor = .lightGray
        tView.tableHeaderView = ProfileTableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 265))
//        tView.dataSource = self
//        tView.delegate = self
        tView.showsVerticalScrollIndicator = false
        tView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tView.translatesAutoresizingMaskIntoConstraints = false
        return tView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(Self.tableView)
        Self.tableView.dataSource = self
        Self.tableView.delegate = self

        setup()
    }

    private func setup() {
        NSLayoutConstraint.activate([
            Self.tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            Self.tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            Self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            Self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = PhotosTableViewCell()
            cell.backgroundColor = .white
            return cell
        } else {
            let cell = PostTableViewCell()
            cell.backgroundColor = .white
            cell.fillData(with: postArray, indexPath: indexPath)
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    // отрисовка маленькой перемычки между секциями с помощью футера с пустым тайтлом
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return (section == 0 ? " " : nil)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: [0, 0], animated: true)
        if indexPath == [0, 0] {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }

}
