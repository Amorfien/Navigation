//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Pavel Grigorev on 28.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var avatarView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 65
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "cat")
        return view
    }()

    private let statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set status", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Кошка Плюша"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "В ожидании еды..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let statusBarLayer: UIView = {
        let layer = UIView()
        layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height, height: 48)
        layer.backgroundColor = .white
        return layer
    }()

//    Дополнительное задание
    private var statusText = ""
    private var setStatusTextField: TextFieldWithPadding = {
        let tfield = TextFieldWithPadding()
        tfield.backgroundColor = .white
        tfield.layer.cornerRadius = 12
        tfield.layer.borderWidth = 1
        tfield.layer.borderColor = UIColor.black.cgColor
        tfield.textColor = .black
        tfield.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        tfield.placeholder = "Установите статус"
        return tfield
    }()

    override init(frame: CGRect) {

        super.init(frame: frame)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusBarLayer)
        addSubview(setStatusTextField)
        setupFrames()
        addTarget()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFrames() {
        avatarView.frame = CGRect(x: Constants.leftMarggin, y: Constants.systemTop + Constants.topMarggin,
                                  width: Constants.avatar, height: Constants.avatar)
        nameLabel.frame = CGRect(x: 2 * Constants.leftMarggin + Constants.avatar, y: Constants.systemTop + 27,
                                 width: Int(UIScreen.main.bounds.width) - (3 * Constants.leftMarggin + Constants.avatar), height: 22)
        statusLabel.frame = CGRect(x: 2 * Constants.leftMarggin + Constants.avatar,
                                   y: Constants.systemTop + 2 * Constants.topMarggin + Constants.avatar - 34 - 18,
                                   width: Int(UIScreen.main.bounds.width) - (3 * Constants.leftMarggin + Constants.avatar), height: 18)
        statusButton.frame = CGRect(x: Constants.leftMarggin,
                                    y: Constants.systemTop + Constants.topMarggin + Constants.avatar + 2 * Constants.topMarggin + 22,
                                    width: Int(UIScreen.main.bounds.width) - (2 * Constants.leftMarggin), height: 50)
        setStatusTextField.frame = CGRect(x: 2 * Constants.leftMarggin + Constants.avatar,
                                          y: Constants.systemTop + 2 * Constants.topMarggin + Constants.avatar - 34 + Constants.gap,
                                          width: Int(UIScreen.main.bounds.width) - (3 * Constants.topMarggin + Constants.avatar), height: 40)
    }

    func addTarget() {
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    @objc
    func buttonPressed() {
        statusLabel.text = statusText
        setStatusTextField.text = ""
    }
    @objc
    func statusTextChanged( _textField: UITextField) {
        statusText = setStatusTextField.text ?? ""
    }

}
