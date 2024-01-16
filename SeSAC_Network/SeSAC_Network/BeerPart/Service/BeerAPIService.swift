//
//  BeerAPIService.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import Foundation

import Alamofire

final class BeerAPIService {
    
    func requestBeerAPI(url: String, completion: @escaping ([Beer]) -> Void) {
        AF.request(url)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success):
                    completion(success)
                case .failure(let failure):
                    print("\(failure)")
                }
            }
    }
}
