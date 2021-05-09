//
//  CollectionTableViewCell.swift
//  Carousel
//
//  Created by Saher on 5/9/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import UIKit

struct CollectionTableViewCellViewModel {
    let viewModels: [TileCollectionViewCellViewModel]
}

protocol CollectionTableViewCellDelegate : AnyObject {
    func collectionTableViewCellDidTapItem(with viewModel:TileCollectionViewCellViewModel)
}

class CollectionTableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CollectionTableViewCell"
    
    weak var delegate : CollectionTableViewCellDelegate?
    
    private var viewModels : [TileCollectionViewCellViewModel] = []
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        collectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .systemBackground
    return collectionView
        
    }()
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        contentView.addSubview(collectionView)
        contentView.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    //MARK: - layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    //MARK: - collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TileCollectionViewCell.identifier, for: indexPath)
            as? TileCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func configure(with viewModel: CollectionTableViewCellViewModel) {
        self.viewModels = viewModel.viewModels
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = contentView.frame.size.width/2.5
        return CGSize(width: width, height: width/1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewModel = viewModels[indexPath.row]
        delegate?.collectionTableViewCellDidTapItem(with: viewModel)
    }
}
