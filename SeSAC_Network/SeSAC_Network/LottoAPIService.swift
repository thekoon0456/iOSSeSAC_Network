//
//  LottoAPIService.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import Foundation

import Alamofire

final class LottoAPIService {
    
    func callRequest(number: String,
                     completionHandler: @escaping (Lotto) -> Void) { //매개변수로 회차 전달
        let url = LottoConst.requestURL.rawValue + String(number)
        
        AF.request(url)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let failure):
                    print("\(failure.localizedDescription)")
                }
            }
    }
}
