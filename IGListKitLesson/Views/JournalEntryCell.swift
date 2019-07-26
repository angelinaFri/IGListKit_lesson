//
//  JournalEntryCell.swift
//  IGListKitLesson
//
//  Created by Angelina on 7/24/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import UIKit

class JournalEntryCell: UICollectionViewCell {
    static let font = AppFont()
    static let inset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    static func cellSize(width: CGFloat, text: String) -> CGSize {
        return TextSize.size(text, font: self.font, width: width, insets: self.inset).size
    }

    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = JournalEntryCell.font
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
        contentView.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds.inset(by: JournalEntryCell.inset)
    }
}
