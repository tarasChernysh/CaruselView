//
//  CaruselItem.swift
//  CollectionViewPeekingPages
//
//  Created by Taras Chernysh on 25.09.2025.
//  Copyright © 2025 Shai Balassiano. All rights reserved.
//

import Foundation

enum CaruselItem: Int, CaseIterable {
    case hz396, hz417, hz432, hz528, hz639, hz741
    
    var imageName: String {
        switch self {
        case .hz396:
            return "396hz"
            
        case .hz417:
            return "417hz"
        case .hz432:
            return "432hz"
        case .hz528:
            return "528hz"
        case .hz639:
            return "639hz"
        case .hz741:
            return "741hz"
        }
    }
}
