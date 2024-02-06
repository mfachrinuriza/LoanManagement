//
//  Tabs.swift
//  LoanManagement
//
//  Created by Muhammad Fachri Nuriza on 05/02/24.
//

import UIKit

class Tabs: UIView {
    public var insets: UIEdgeInsets? {
        didSet {
            self.updateUI()
        }
    }
    public var removeTabItemInsets: Bool = false
    
    public var items: [TabItem] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    public lazy var selected: Int = 0 {
        didSet {
            self.collectionView.reloadData()

            guard !items.isEmpty, selected < items.count else { return }
            let indexPath = IndexPath(row: selected, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    public var selectedItem: TabItem? {
        return self.items[self.selected]
    }
    public var onChange: ((_ selected: Int) -> Void)?
    
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
        
    private func setupUI() {
        let contentView = Bundle.main.loadNibNamed("Tabs", owner: self, options: nil)![0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
                
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: TabsCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: TabsCell.cellIdentifier)
    }
    
    private func updateUI() {
        if let insets = insets {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = insets
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            collectionView.collectionViewLayout = layout
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        collectionView.collectionViewLayout = layout
    }
}

extension Tabs: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell & TabsCellProtocol
        let item = items[indexPath.row]
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabsCell.cellIdentifier, for: indexPath) as! TabsCell

        
        cell.update(with: item, isSelected: items[selected].name == item.name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.row]

        let width = 16 // horizontal insets
        + (item.name.count * 8) // text width
        
        let height =  30
        return CGSize(
            width: width,
            height: height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onChange?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

protocol TabsCellProtocol {
    func update(with item: TabItem, isSelected: Bool) -> Void
}
