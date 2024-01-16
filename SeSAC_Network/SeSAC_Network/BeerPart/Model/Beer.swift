//
//  Beer.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import Foundation

struct Beer: Codable {
    let name: String
    let description: String
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case imageURL = "image_url"
    }
}
