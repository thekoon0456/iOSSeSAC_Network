//
//  Array+.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import Foundation

extension Array {
    //Index safe 검사
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
