//
//  CustomNavigationBar.swift
//  IGListKitLesson
//
//  Created by Angelina on 7/24/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    var statusOn = false

    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "MARSLINK"
        label.font = AppFont()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "RECEIVING"
        label.font = AppFont(size: 13)
        label.textAlignment = .center
        label.textColor = UIColor(hex6: 0x42c84b)
        label.sizeToFit()
        return label
    }()

    let statusIndicator: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 1
        layer.fillColor = UIColor.black.cgColor
        let size: CGFloat = 8
        let frame = CGRect(x: 0, y: 0, width: size, height: size)
        layer.path = UIBezierPath(roundedRect: frame, cornerRadius: size / 2).cgPath
        layer.frame = frame
        return layer
    }()

    let highlightLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor(hex6: 0x76879D).cgColor
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(highlightLayer)
        layer.addSublayer(statusIndicator)
        addSubview(titleLabel)
        addSubview(statusLabel)
        barTintColor = .black
//        updateStatus()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let titleWidth: CGFloat = 130
        let borderHeight: CGFloat = 4

        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: titleWidth, y: 0))
        path.addLine(to: CGPoint(x: titleWidth, y: bounds.height - borderHeight))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height - borderHeight))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.close()
        highlightLayer.path = path.cgPath

        titleLabel.frame = CGRect(x: 0, y: 0, width: titleWidth, height: bounds.height)
        statusLabel.frame = CGRect(
            x: bounds.width - statusLabel.bounds.width - CommonInsets.right,
            y: bounds.height - borderHeight - statusLabel.bounds.height - 6,
            width: statusLabel.bounds.width,
            height: statusLabel.bounds.height
        )
        statusIndicator.position = CGPoint(x: statusLabel.center.x - 50, y: statusLabel.center.y - 1)
    }

    func updateStatus() {
        statusOn.toggle()
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        statusIndicator.fillColor = (statusOn ? UIColor.white : UIColor.black).cgColor
        CATransaction.commit()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
            self.updateStatus()
        }
    }
}
