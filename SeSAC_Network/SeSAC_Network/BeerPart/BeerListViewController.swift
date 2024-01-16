//
//  BeerListViewController.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

final class BeerListViewController: UIViewController {
    
    @IBOutlet var beerCollectionView: UICollectionView!
    
    let service = BeerAPIService()
    
    var beerData: [Beer] = [] {
        didSet {
            beerCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollectionView()
        getBeer(url: BeerConst.URL.beerListURL.value)
    }
}

// MARK: - Helpers

extension BeerListViewController {
    func getBeer(url: String) {
        service.requestBeerAPI(url: url) { beers in
            self.beerData = beers
        }
    }
}

// MARK: - UI

extension BeerListViewController: SetUI {
    func configureUI() {
        navigationItem.title = BeerConst.Title.naviTitle.value
    }
    
    func configureCollectionView() {
        beerCollectionView.delegate = self
        beerCollectionView.dataSource = self
        
        let xib = UINib(nibName: BeerCollectionViewCell.identifier, bundle: nil)
        beerCollectionView.register(xib, forCellWithReuseIdentifier: BeerCollectionViewCell.identifier)
        
        let width = (UIScreen.main.bounds.width / 2) - 20
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width,
                                 height: width * 2)
        layout.sectionInset = .init(top: 0,
                                    left: 10,
                                    bottom: 0,
                                    right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        beerCollectionView.collectionViewLayout = layout
    }
}

extension BeerListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        beerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerCollectionViewCell.identifier, for: indexPath) as? BeerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCellData(beerData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: BeerViewController.identifier) as? BeerViewController
        else { return }
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .close, primaryAction: UIAction { action in
            self.dismiss(animated: true)
        })
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        present(nav, animated: true)
    }
}
