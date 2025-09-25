//
//  CaruselItemView.swift
//  CollectionViewPeekingPages
//
//  Created by Taras Chernysh on 25.09.2025.
//  Copyright © 2025 Shai Balassiano. All rights reserved.
//

import UIKit

final class CaruselItemCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CaruselItemCollectionCell.self)
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Add container view to the cell
        addSubview(containerView)
        
        // Add image view to the container
        containerView.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Make container circular and position it
        let containerSize = min(bounds.width, bounds.height)
        let containerFrame = CGRect(
            x: (bounds.width - containerSize) / 2,
            y: (bounds.height - containerSize) / 2,
            width: containerSize,
            height: containerSize
        )
        containerView.frame = containerFrame
        containerView.layer.cornerRadius = containerSize / 2
        containerView.layer.masksToBounds = true
        
        // Make image view fill the container
        imageView.frame = containerView.bounds
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
