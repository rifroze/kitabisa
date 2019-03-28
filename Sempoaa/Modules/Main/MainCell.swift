//
//  MainCell.swift
//  Sempoaa
//
//  Created by Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class MainCell: FSPagerViewCell {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblOpen: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(card: CardType) {
        self.viewBackground.backgroundColor = UIColor(card.backgroundColor)
        self.lblOpen.textColor = UIColor(card.backgroundColor)
        self.lblTitle.text = card.title
        self.imgBanner.image = UIImage(named: card.backgroundImage)
    }
}
