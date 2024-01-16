//
//  UIView+.swift
//  SeSAC_Network
//
//  Created by Deokhun KIM on 1/16/24.
//

import UIKit

extension SetUI {
    func setLabel(
        _ label: UILabel,
        text: String = "",
        font: UIFont = .systemFont(ofSize: 16),
        lines: Int = 1,
        color: UIColor = .label,
        alignment: NSTextAlignment = .left
    ) {
        label.text = text
        label.font = font
        label.numberOfLines = lines
        label.textColor = color
        label.textAlignment = alignment
    }
    
    func setRoundedView(_ view: UIView,
                         cornerRadius: CGFloat) {
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
    }
}
