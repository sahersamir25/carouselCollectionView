//
//  TileCollectionViewCell.swift
//  Carousel
//
//  Created by Saher on 5/9/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let backgroundColor : UIColor
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    private let label:UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15 , weight : .medium)
        return label
        
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 5
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
}
