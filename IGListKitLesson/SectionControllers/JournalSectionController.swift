//
//  JournalSectionController.swift
//  IGListKitLesson
//
//  Created by Angelina on 7/25/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import IGListKit

class JournalSectionController: ListSectionController {

    var entry: JournalEntry!
    let solFormatter = SolFormatter()

    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension JournalSectionController {
    override func numberOfItems() -> Int {
        return 2
    }

    override func sizeForItem(at index: Int) -> CGSize {
        // 1
        guard
            let context = collectionContext,
            let entry = entry
            else {
                return .zero
        }
        // 2
        let width = context.containerSize.width
        // 3
        if index == 0 {
            return CGSize(width: width, height: 30)
        } else {
            return JournalEntryCell.cellSize(width: width, text: entry.text)
        }
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        // 1
        let cellClass: AnyClass = index == 0 ? JournalEntryDateCell.self : JournalEntryCell.self
        // 2
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        // 3
        if let cell = cell as? JournalEntryDateCell {
            cell.label.text = "SOL \(solFormatter.sols(fromDate: entry.date))"
        } else if let cell = cell as? JournalEntryCell {
            cell.label.text = entry.text
        }
        return cell
    }
    // this method is always called before any of the cell protocol methods
    // saving the passed object in `entry`.
    override func didUpdate(to object: Any) {
        entry = object as? JournalEntry
    }
}
