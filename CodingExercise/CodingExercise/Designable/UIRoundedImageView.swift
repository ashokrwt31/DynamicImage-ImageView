//
//  IBDesignable.swift
//  CodingExercise
//
//  Created by Ashok Rawat on 26/12/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import UIKit

class UIRoundedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    let imageCache = NSCache<NSString, UIImage>()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    override func prepareForInterfaceBuilder() {
        sharedInit()
    }

    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }

    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }

    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
}
