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
    
    let service = BeerAPIService()
    let placeHolderImage = BeerConst.Image.lodingImage
    let url = BeerConst.URL.beerRandomURL.value
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureImageTap()
        getBeer()
    }
    
    @IBAction func recommendButtonTapped(_ sender: UIButton) {
        getBeer()
    }
    
    @objc func imageTapped() {
        print("눌림")
        guard let vc = storyboard?.instantiateViewController(identifier: BeerListViewController.identifier) as? BeerListViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Helpers

extension BeerViewController {
    func getBeer() {
        service.requestBeerAPI(url: url) { beers in
            dump(beers)
            DispatchQueue.main.async { [weak self] in
                guard
                    let self,
                    let beer = beers.first
                else { return }
                beerImage.kf.setImage(with: URL(string: beer.imageURL ?? BeerConst.URL.defaultImageURL.value),
                                      placeholder: placeHolderImage)
                beerNameLabel.text = beer.name
                descriptionLabel.text = beer.description
            }
        }
    }
    
    func configureImageTap() {
        beerImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self,
                                          action: #selector(imageTapped))
        beerImage.addGestureRecognizer(gesture)
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
