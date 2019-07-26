//
//  JournalEntryDateCell.swift
//  IGListKitLesson
//
//  Created by Angelina on 7/24/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class JournalEntryDateCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = AppFont(size: 14)
        label.textColor = UIColor(hex6: 0x42c84b)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
        contentView.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding = CommonInsets // global constant from Theme
        label.frame = bounds.inset(by: UIEdgeInsets(top: 0, left: padding.left, bottom: 0, right: padding.right))
    }
}
