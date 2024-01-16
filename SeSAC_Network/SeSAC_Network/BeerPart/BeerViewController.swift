//
//  BeerViewController.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

import Kingfisher

final class BeerViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var recommendButton: UIButton!
    
    let placeHolderImage = BeerConst.Image.lodingImage
    
    let service = BeerAPIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        getBeer()
    }
    
    @IBAction func recommendButtonTapped(_ sender: UIButton) {
        getBeer()
    }
}

// MARK: - Helpers

extension BeerViewController {
    func getBeer() {
        service.requestBeerAPI { beers in
            dump(beers)
            DispatchQueue.main.async { [weak self] in
                guard
                    let self,
                    let beer = beers.first
                else { return }
                beerImage.kf.setImage(with: URL(string: beer.imageURL ?? BeerConst.URL.defaultImageURL.rawValue),
                                      placeholder: placeHolderImage)
                beerNameLabel.text = beer.name
                descriptionLabel.text = beer.description
            }
        }
    }
}

// MARK: - UI

extension BeerViewController: SetUI {
    
    func configureUI() {
        titleLabel.text = BeerConst.Title.title.value
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .center
        
        beerImage.contentMode = .scaleAspectFit
        
        beerNameLabel.font = .boldSystemFont(ofSize: 20)
        beerNameLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        recommendButton.setImage(BeerConst.Image.buttonImage, for: .normal)
        recommendButton.setTitle(BeerConst.Title.buttonTitle.value, for: .normal)
        recommendButton.setTitleColor(.beerOrangeColor, for: .normal)
    }
}
