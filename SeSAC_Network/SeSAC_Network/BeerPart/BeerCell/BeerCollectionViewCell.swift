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
        
        setLabel(beerTitle,
                 font: .boldSystemFont(ofSize: 15),
                 alignment: .left)
        setLabel(beerDescription,
                 font: .systemFont(ofSize: 12),
                 lines: 0,
                 alignment: .left)
    }
    
    func configureCellData(_ data: Beer) {
        beerImage.kf.setImage(with: URL(string: data.imageURL ?? BeerConst.URL.defaultImageURL.value))
        beerTitle.text = data.name
        beerDescription.text = data.description
    }
}
