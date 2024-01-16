//
//  BeerConst.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

enum BeerConst {
    enum URL: String {
        case beerURL = "https://api.punkapi.com/v2/beers/random"
        case defaultImageURL = "https://images.punkapi.com/v2/keg.png"
    }
    
    enum Title {
        case title
        case buttonTitle
        
        var value: String {
            switch self {
            case .title:
                "오늘은 이 맥주를 추천합니다!"
            case .buttonTitle:
                "다른 맥주 추천받기"
            }
        }
    }
    
    enum Image {
        static let lodingImage =  UIImage(named: "loadingImage")
        static let buttonImage = UIImage(systemName: "text.magnifyingglass")?.withTintColor(.beerOrangeColor, renderingMode: .alwaysOriginal)
    }
}
