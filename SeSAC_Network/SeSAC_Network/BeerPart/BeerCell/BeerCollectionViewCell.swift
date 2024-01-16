//
//  BeerCollectionViewCell.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

import Kingfisher

class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerTitle: UILabel!
    @IBOutlet var beerDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
}

extension BeerCollectionViewCell: SetCell {
    
    typealias T = Beer

    func configureUI() {
        beerImage.contentMode = .scaleAspectFit
        beerTitle.font = .boldSystemFont(ofSize: 15)
        beerTitle.textAlignment = .left
        beerDescription.font = .systemFont(ofSize: 12)
        beerDescription.textAlignment = .left
        beerDescription.numberOfLines = 0
    }
    
    func configureCellData(_ data: Beer) {
        beerImage.kf.setImage(with: URL(string: data.imageURL ?? BeerConst.URL.defaultImageURL.value))
        beerTitle.text = data.name
        beerDescription.text = data.description
    }
}
