//
//  UIColor+.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

extension UIColor {
    //오렌지 버튼 컬러
    static let beerOrangeColor = UIColor(named: "BeerOrangeColor")!
    
    static var randomColor: UIColor {
        let randomInt = CGFloat.random(in: 0...1)
        let randomInt2 = CGFloat.random(in: 0...1)
        let randomInt3 = CGFloat.random(in: 0...1)
        
        return UIColor(red: randomInt,
                       green: randomInt2,
                       blue: randomInt3,
                       alpha: 1)
    }
}
