//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Pavel Grigorev on 28.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatarImage = UIImage(named: "cat")
    private var avatarView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 65
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
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
        avatarView.image = avatarImage
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
        let gap = 16
        let avatar = 130
        let header = 44
        let statusbar = 48
        avatarView.frame = CGRect(x: gap, y: statusbar + header + gap, width: avatar, height: avatar)
        nameLabel.frame = CGRect(x: gap + avatar + gap, y: statusbar + header + 27,
                                 width: Int(UIScreen.main.bounds.width) - (3 * gap + avatar), height: 22)
        statusLabel.frame = CGRect(x: gap + avatar + gap, y: statusbar + header + gap + avatar + gap - 34 - 18,
                                   width: Int(UIScreen.main.bounds.width) - (3 * gap + avatar), height: 18)
        statusButton.frame = CGRect(x: gap, y: statusbar + header + gap + avatar + gap + 22 + gap,
                                    width: Int(UIScreen.main.bounds.width) - (2 * gap), height: 50)
        setStatusTextField.frame = CGRect(x: gap + avatar + gap, y: statusbar + header + gap + avatar + gap - 34 + gap,
                                          width: Int(UIScreen.main.bounds.width) - (3 * gap + avatar), height: 40)
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
