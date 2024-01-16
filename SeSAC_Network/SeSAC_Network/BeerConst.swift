//
//  BeerConst.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

enum BeerConst {
    enum URL {
        case beerRandomURL
        case beerListURL
        case defaultImageURL
        
        var value: String {
            switch self {
            case .beerRandomURL:
                "https://api.punkapi.com/v2/beers/random"
            case .beerListURL:
                "https://api.punkapi.com/v2/beers"
            case .defaultImageURL:
                "https://images.punkapi.com/v2/keg.png"
            }
        }
    }

    enum Title {
        case naviTitle
        case title
        case noticeTitle
        case buttonTitle
        
        var value: String {
            switch self {
            case .naviTitle:
                "추천 맥주"
            case .title:
                "오늘은 이 맥주를 추천합니다!"
            case .noticeTitle:
                "사진을 누르시면 다양한 맥주를 보실 수 있어요"
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
