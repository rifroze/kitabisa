//
//  MainViewController.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    var cards: [CardType]
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(UINib(nibName: Constant.Cell.main, bundle: nil), forCellWithReuseIdentifier: Constant.Cell.main)
            self.pagerView.transformer = FSPagerViewTransformer(type: .linear)
            self.pagerView.interitemSpacing = 10
            self.pagerView.itemSize = CGSize(width: Constant.Screen.width - 64, height: Constant.Screen.height/4*3)
        }
    }
    
	var presenter: MainPresenterProtocol?
    
    init(cards: [CardType]) {
        self.cards = cards
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    private func initialize() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.title = Constant.App.name
    }
}

extension MainViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return cards.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: Constant.Cell.main, at: index) as! MainCell
        cell.setData(card: cards[index])
        cell.viewBackground.hero.id = Constant.Hero.background
        
        return cell
    }
    
}

extension MainViewController: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        print("didSelectItemAt: \(index)")
        presenter?.openDetail(withCard: cards[index])
    }
}
