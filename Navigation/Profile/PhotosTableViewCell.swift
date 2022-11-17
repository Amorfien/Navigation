//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Pavel Grigorev on 14.11.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let photoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let forwardLabel: UILabel = {
        let forward = UILabel()
        forward.font = UIFont.systemFont(ofSize: 24, weight: .thin)
        forward.textColor = .black
        forward.text = "➔"
        forward.translatesAutoresizingMaskIntoConstraints = false
        return forward
    }()

    private let photoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.clipsToBounds = true
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private var previewImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "i-1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var previewImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "i-2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var previewImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "i-3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var previewImage4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "i-4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(photoLabel)
        titleStackView.addArrangedSubview(forwardLabel)
        contentView.addSubview(photoStackView)
        photoStackView.addArrangedSubview(previewImage1)
        photoStackView.addArrangedSubview(previewImage2)
        photoStackView.addArrangedSubview(previewImage3)
        photoStackView.addArrangedSubview(previewImage4)

        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            photoStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 12),
            photoStackView.leadingAnchor.constraint(equalTo: titleStackView.leadingAnchor),
            photoStackView.trailingAnchor.constraint(equalTo: titleStackView.trailingAnchor),
            photoStackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
            photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

}
