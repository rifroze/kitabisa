//
//  DetailViewController.swift
//  Sempoaa
//
//  Created Nugroho Arief Widodo on 27/03/19.
//  Copyright © 2019 KitaBisa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewTopContainer: UIView!
    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var tfFirstInput: UITextField!
    @IBOutlet weak var tfSecondInput: UITextField!
    @IBOutlet weak var tvOutput: UITextView!
    @IBOutlet weak var tfOutput: UITextField!
    @IBOutlet weak var btnCalculate: UIButton!
    @IBOutlet weak var firstInputTrailling: NSLayoutConstraint!
    
    var card: CardType
	var presenter: DetailPresenterProtocol?
    
    @IBAction func calculate(_ sender: UIButton) {
        presenter?.calculate(first: tfFirstInput.text!, second: tfSecondInput.text!, type: card.type)
    }
    
    @IBAction func dismissController(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    private func initialize() {
        lblTitle.text = card.title
        viewContainer.backgroundColor = UIColor(card.backgroundColor)
        adjustLayout()
    }
    
    private func adjustLayout() {
        switch card.type {
        case .sum:
            lblOperator.text = "+"
        case .multiply:
            lblOperator.text = "x"
        case .prime, .fibonacci:
            firstInputTrailling.isActive = false
            NSLayoutConstraint.activate([
                tfFirstInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
            ])
            lblOperator.isHidden = true
            tfSecondInput.isHidden = true
        }
    }
    
    init(card: CardType) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailViewController: DetailViewProtocol {
    func didGet(value: String) {
        self.tvOutput.text = value
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldString = textField.text, let range = Range(range, in: textFieldString) else {
            return false
        }
        let newString = textFieldString.replacingCharacters(in: range, with: string)
        if newString.isEmpty {
            textField.text = "0"
            return false
        } else if textField.text == "0" {
            textField.text = string
            return false
        }
        return true
    }
}
