//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Pavel Grigorev on 14.11.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width - 32)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let cV = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        cV.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCell")
        cV.backgroundColor = .white
        cV.dataSource = self
        cV.translatesAutoresizingMaskIntoConstraints = false
        return cV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"

        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    private func setupUI() {
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        22
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotosCollectionViewCell
        cell?.fill(indexPath: indexPath)
        return cell!
    }


}
