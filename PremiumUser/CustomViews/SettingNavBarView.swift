//
//  SettingNavBarView.swift
//  PremiumUser
//
//  Created by Oleg  on 27.06.2023.
//

import UIKit


class NavBar: UINavigationBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {

        let customView = ViewWithGradient(with: .premiumGradient)
        let layer = CAGradientLayer.premiumGradient

        layer.frame = bounds
        layer.insertSublayer(layer, at: 0)
    }
}




class SettingNavBarView: UIView {
    private let imageView: UIImageView = .init()
    private let label: UILabel = .init()
    private let separatorView: UIView = .init()
    private let chevronView: UIImageView = .init(image: UIImage(named: "chevron-right"))
    
    var onTouchEvent: (() -> Void)?


    init(text: String, image: UIImage?, withSeparator: Bool = true) {
        super.init(frame: CGRect())
        self.label.text = text
        self.imageView.image = image
        if withSeparator { setupSeparator() }

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        backgroundColor = .systemGray5.withAlphaComponent(0.5)
        onTouchEvent?()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        backgroundColor = .clear
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        backgroundColor = .clear
    }

    func setup() {
        addSubview(imageView)
        addSubview(label)
        addSubview(chevronView)
        backgroundColor = .clear

        label.font = UIFont(name: "Roboto-Medium", size: 20)
        label.textColor = .white

        setupConstraints()
    }

    private func setupSeparator() {
        addSubview(separatorView)
        separatorView.backgroundColor = UIColor.Settings.separator
        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(self.snp.width)
            $0.height.equalTo(1)
        }
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.bottom.equalToSuperview().inset(10)
            $0.width.equalTo(imageView.snp.height)
        }

        label.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.center.equalTo(self.snp.center)
        }

        chevronView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.top.bottom.equalToSuperview().inset(10)
        }
    }
}
