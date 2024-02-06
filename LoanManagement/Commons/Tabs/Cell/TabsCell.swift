//
//  TabsCell.swift
//  LoanManagement
//
//  Created by Muhammad Fachri Nuriza on 05/02/24.
//

import UIKit

class TabsCell: UICollectionViewCell, TabsCellProtocol {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var container: CustomUIView!
    static let cellIdentifier = "TabsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    public func update(with item: TabItem, isSelected: Bool) {
        label.text = item.name
        label.textColor = isSelected ? UIColor.white : Color.primary30
        container.backgroundColor = isSelected ? Color.primary30 : HexCodeColor.hexStringToUIColor(hex: "#EFF3F6")
    }

}
