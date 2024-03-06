//
//  MyCollectionViewController.swift
//  CollectionViewPeekingPages
//
//  Created by Shai Balassiano on 06/04/2018.
//  Copyright © 2018 Shai Balassiano. All rights reserved.
//

import UIKit

class MyCollectionViewController: HorizontalPeekingPagesCollectionViewController {

    var dataSource = [0, 1, 2, 3, 4, 5, 6] {
        didSet {
            collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func calculateSectionInset() -> CGFloat {
        return 80
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return configureCell(cell, forItemAt: indexPath)
    }
    
    func configureCell(_ cell: UICollectionViewCell, forItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCenterX = cell.frame.origin.x + cell.frame.width / 2
        let distance = collectionView!.contentOffset.x + collectionView!.bounds.width / 2 - cellCenterX
        let normalizedDistance = min(1, max(-1, distance / (collectionView!.bounds.width / 2)))

        let scaleFactor: CGFloat = 0.8 // Adjust this value for the desired scale factor
        let scale = 1 - abs(normalizedDistance) * (1 - scaleFactor)

        let yOffset = abs(normalizedDistance) * collectionView.bounds.height / 5
        cell.transform = CGAffineTransform(translationX: 0, y: -yOffset).scaledBy(x: scale, y: scale)

        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Get the visible cells
        let visibleCells = collectionView?.visibleCells ?? []

        // Iterate through visible cells and apply the transform
        for cell in visibleCells {
            let distance = collectionView!.contentOffset.x + collectionView!.bounds.width / 2 - (cell.frame.origin.x+(cell.frame.width/2))
            let normalizedDistance = min(1, max(-1, distance / (collectionView!.bounds.width / 2)))

            let scaleFactor: CGFloat = 0.8 // Adjust this value for the desired scale factor
            let scale = 1 - abs(normalizedDistance) * (1 - scaleFactor)
            
            // Adjust the vertical position
            let yOffset = abs(normalizedDistance) * collectionView.bounds.height / 5
            cell.transform = CGAffineTransform(translationX: 0, y: -yOffset).scaledBy(x: scale, y: scale)
        }
    }
    
}
