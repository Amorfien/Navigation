//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Pavel Grigorev on 14.11.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private let photo: UIImageView = {
        let photo = UIImageView()
//        photo.backgroundColor = .black
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.contentView.addSubview(self.photo)

        NSLayoutConstraint.activate([
            self.photo.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.photo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.photo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.photo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            photo.widthAnchor.constraint(lessThanOrEqualToConstant: (UIScreen.main.bounds.width - 32.5) / 3),
            photo.heightAnchor.constraint(lessThanOrEqualToConstant: (UIScreen.main.bounds.width - 32.5) / 3)
        ])
    }

    func fill(indexPath: IndexPath) {
        let imageName: String = "i-\(indexPath.row + 1)"
        photo.image = UIImage(named: imageName)
    }

}
