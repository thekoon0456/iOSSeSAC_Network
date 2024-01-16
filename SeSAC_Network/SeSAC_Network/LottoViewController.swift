//
//  ViewController.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

final class LottoViewController: UIViewController {
    
    @IBOutlet var lottoTitleLable: UILabel!
    @IBOutlet var numberTextfield: UITextField!
    
    @IBOutlet var drawLabel: UILabel!
    
    @IBOutlet var resultStackView: UIStackView!
    @IBOutlet var bonusLabel: UILabel!
    
    let service = LottoAPIService()
    let resultNumber = 1102
    //picker
    let pickerView = UIPickerView()
    lazy var episodeNumber: [Int] = (1...resultNumber).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        getResult(number: resultNumber)
    }
}

// MARK: - Helpers

extension LottoViewController {
    func getResult(number: Int) {
        service.callRequest(number: String(number)) { lotto in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                //TextField 글 설정
                drawLabel.text = "선택한 회차는 \(lotto.drwNo)회 입니다."
                
                //하나씩 돌면서 이미지 추가
                lotto.resultArr.forEach { [weak self] num in
                    guard let self else { return }
                    let image = UIImage(systemName: "\(num).circle")?.withTintColor(.randomColor, renderingMode: .alwaysOriginal)
                    let imageView = UIImageView(image: image)
                    imageView.contentMode = .scaleAspectFill
                    
                    resultStackView.addArrangedSubview(imageView)
                }
            }
        }
    }
}

// MARK: - UI

extension LottoViewController: SetUI {
    
    func configureUI() {
        configureTextField()
        configurePicker()
        
        lottoTitleLable.text = LottoConst.title.rawValue
        lottoTitleLable.font = .systemFont(ofSize: 30)
        lottoTitleLable.textAlignment = .center
        bonusLabel.text = LottoConst.bonus.rawValue
        bonusLabel.font = .systemFont(ofSize: 12)
        
        drawLabel.font = .systemFont(ofSize: 20)
        drawLabel.textColor = .randomColor
        
        numberTextfield.text = LottoConst.numberTextFieldTitle.rawValue
        
        resultStackView.spacing = 10
        resultStackView.alignment = .center
        resultStackView.axis = .horizontal
        resultStackView.distribution = .fillEqually
    }
    
    func configureTextField() {
        numberTextfield.font = .systemFont(ofSize: 20)
        numberTextfield.textAlignment = .center
        numberTextfield.tintColor = .clear
        numberTextfield.inputView = pickerView
        numberTextfield.borderStyle = .roundedRect
        numberTextfield.layer.borderWidth = 2
        numberTextfield.layer.cornerRadius = 5
        numberTextfield.clipsToBounds = true
    }
    
    func configurePicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        episodeNumber.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //기존 스택뷰 삭제
        resultStackView.subviews.forEach { $0.removeFromSuperview() }
        drawLabel.text = "선택한 회차는 \(episodeNumber[row])회 입니다."
        getResult(number: episodeNumber[row])
        
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(episodeNumber[row])회"
    }
}

