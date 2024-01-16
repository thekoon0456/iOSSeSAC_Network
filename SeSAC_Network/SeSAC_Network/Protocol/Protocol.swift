//
//  Protocol.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import Foundation

//Model 공통 채택
protocol Model { }

//뷰컨 공통 채택
protocol SetUI {
    func configureUI()
}

//cell 채택
protocol SetCell: SetUI {
    associatedtype T: Model
    
    static var identifier: String { get }
    
    func configureCellData(_ data: T)
}

extension SetUI {
    static var identifier: String {
        return String(describing: self)
    }
}
