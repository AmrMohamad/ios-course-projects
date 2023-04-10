//
//  ViewController.swift
//  Tipsy-UIKit-iOS16
//
//  Created by Amr Mohamad on 08/04/2023.
//

import UIKit

class BillViewController: UIViewController {
    
    let billUI = BillScreenUI()
    
    var tipValue      : Double?
    var billPerPerson : Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        configUI()
    }
    
    @objc func selectTipValue (_ sender:UIButton){
        billUI.billValueTextField.endEditing(true)
        
        billUI.zeroPresentValueButton.isSelected = false
        billUI.tenPresentValueButton.isSelected = false
        billUI.twentyPresentValueButton.isSelected = false
        
        let selectedButton = true
        
        switch sender.currentTitle! {
        case "0%":
            billUI.zeroPresentValueButton.isSelected = selectedButton
            tipValue = 0.0
        case "10%":
            billUI.tenPresentValueButton.isSelected = selectedButton
            tipValue = 0.1
        case "20%":
            billUI.twentyPresentValueButton.isSelected = selectedButton
            tipValue = 0.2
        default:
            print("wrong select")
        }
    }
    
    @objc func stepperValueChaged(_ sender: UIStepper) {
        billUI.splitValueLabel.text = String(Int(sender.value))
    }
    
    @objc func calculateButtonPressed(_ sender:UIButton){
        let billValue = billUI.billValueTextField.text!
        
        if billValue.isEmpty == false {
            billPerPerson = ((Double(billValue)! * (tipValue ?? 0.0)) + Double(billValue)!) / billUI.stepperOfSplitValue.value
        }
        
        
        let resultScreen = ResultViewController()
        resultScreen.sentTotalValue = String(format: "%.2f", billPerPerson ?? 0.0)
        resultScreen.numberOfPersons = Int(billUI.stepperOfSplitValue.value)
        resultScreen.valueOfTip = "\(Int((tipValue ?? 0.0)*100))%"
        
        resultScreen.modalPresentationStyle = .pageSheet
        resultScreen.sheetPresentationController?.prefersGrabberVisible = true
        present(resultScreen, animated: true)
    }
    
    

}

extension BillViewController {
    
    func configUI(){
        billUI.calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .touchUpInside)
        
        billUI.zeroPresentValueButton.addTarget(self, action: #selector(selectTipValue), for: .touchUpInside)
        billUI.tenPresentValueButton.addTarget(self, action: #selector(selectTipValue), for: .touchUpInside)
        billUI.twentyPresentValueButton.addTarget(self, action: #selector(selectTipValue), for: .touchUpInside)
        
        billUI.stepperOfSplitValue.addTarget(self, action: #selector(stepperValueChaged), for: .valueChanged)
    }
    
    func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(billUI.billTotalView)
        view.addSubview(billUI.tipsValueView)
        view.addSubview(billUI.calculateButton)
        view.addSubview(billUI.selectTipLabel)
        view.addSubview(billUI.zeroPresentValueButton)
        view.addSubview(billUI.twentyPresentValueButton)
        view.addSubview(billUI.tenPresentValueButton)
        view.addSubview(billUI.chooseSplitLabel)
        view.addSubview(billUI.splitValueLabel)
        view.addSubview(billUI.stepperOfSplitValue)
        view.addSubview(billUI.enterBillValueLabel)
        view.addSubview(billUI.billValueTextField)
        
        
        let billTotalViewConstraints = [
            billUI.billTotalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billUI.billTotalView.topAnchor.constraint(equalTo: view.topAnchor),
            billUI.billTotalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billUI.billTotalView.heightAnchor.constraint(equalToConstant: 140)
        ]
        
        let tipsValueViewConstraints = [
            billUI.tipsValueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            billUI.tipsValueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            billUI.tipsValueView.topAnchor.constraint(equalTo: billUI.billTotalView.bottomAnchor),
            billUI.tipsValueView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let calculateButtonConstraints = [
            billUI.calculateButton.bottomAnchor.constraint(equalTo: billUI.tipsValueView.bottomAnchor, constant: -25),
            billUI.calculateButton.centerXAnchor.constraint(equalTo: billUI.tipsValueView.centerXAnchor),
            billUI.calculateButton.heightAnchor.constraint(equalToConstant: 54),
            billUI.calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
            
        ]
        
        let selectTipLabelConstraints = [
            billUI.selectTipLabel.topAnchor.constraint(equalTo: billUI.tipsValueView.topAnchor,
                                                       constant: 16),
            billUI.selectTipLabel.leadingAnchor.constraint(equalTo: billUI.tipsValueView.leadingAnchor,
                                                           constant: 30),
            billUI.selectTipLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let zeroPresentValueButtonConstraints = [
            billUI.zeroPresentValueButton.leadingAnchor.constraint(equalTo: billUI.tipsValueView.leadingAnchor,
                                                                   constant: 15),
            billUI.zeroPresentValueButton.topAnchor.constraint(equalTo: billUI.selectTipLabel.bottomAnchor,
                                                               constant: 20),
            billUI.zeroPresentValueButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
            billUI.zeroPresentValueButton.heightAnchor.constraint(equalToConstant: 54)
        ]
        
        let twentyPresentValueButtonConstraints = [
            billUI.twentyPresentValueButton.centerYAnchor.constraint(equalTo: billUI.zeroPresentValueButton.centerYAnchor),
            billUI.twentyPresentValueButton.trailingAnchor.constraint(equalTo: billUI.tipsValueView.trailingAnchor,
                                                                      constant: -15),
            billUI.twentyPresentValueButton.widthAnchor.constraint(equalTo: billUI.zeroPresentValueButton.widthAnchor)
        ]
        
        let tenPresentValueButtonConstraints = [
            billUI.tenPresentValueButton.centerYAnchor.constraint(equalTo: billUI.zeroPresentValueButton.centerYAnchor),
            billUI.tenPresentValueButton.leadingAnchor.constraint(equalTo: billUI.zeroPresentValueButton.trailingAnchor),
            billUI.tenPresentValueButton.trailingAnchor.constraint(equalTo: billUI.twentyPresentValueButton.leadingAnchor),
            billUI.tenPresentValueButton.heightAnchor.constraint(equalToConstant: 54)
        ]
        
        let chooseSplitLabelConstraints = [
            billUI.chooseSplitLabel.leadingAnchor.constraint(equalTo: billUI.selectTipLabel.leadingAnchor),
            billUI.chooseSplitLabel.topAnchor.constraint(equalTo: billUI.zeroPresentValueButton.bottomAnchor, constant: 22),
            billUI.chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let splitValueLabelConstraints = [
            billUI.splitValueLabel.leadingAnchor.constraint(equalTo: billUI.chooseSplitLabel.leadingAnchor, constant: 50),
            billUI.splitValueLabel.topAnchor.constraint(equalTo: billUI.chooseSplitLabel.bottomAnchor, constant: 26),
            billUI.splitValueLabel.heightAnchor.constraint(equalToConstant: 29),
            billUI.splitValueLabel.widthAnchor.constraint(equalToConstant: 93)
        ]
        
        let stepperOfSplitValueConstraints = [
            billUI.stepperOfSplitValue.centerYAnchor.constraint(equalTo: billUI.splitValueLabel.centerYAnchor),
            billUI.stepperOfSplitValue.leadingAnchor.constraint(equalTo: billUI.splitValueLabel.trailingAnchor, constant: 27)
        ]
        
        let enterBillValueLabelConstraints = [
            billUI.enterBillValueLabel.leadingAnchor.constraint(equalTo: billUI.billTotalView.leadingAnchor, constant: 50),
            billUI.enterBillValueLabel.topAnchor.constraint(equalTo: billUI.billTotalView.topAnchor, constant: 40)
        ]
        
        let billValueTextFieldConstraints = [
            billUI.billValueTextField.centerXAnchor.constraint(equalTo: billUI.billTotalView.centerXAnchor),
            billUI.billValueTextField.topAnchor.constraint(equalTo: billUI.enterBillValueLabel.bottomAnchor, constant: 20)
        ]
        
        
        NSLayoutConstraint.activate(billTotalViewConstraints)
        NSLayoutConstraint.activate(tipsValueViewConstraints)
        NSLayoutConstraint.activate(calculateButtonConstraints)
        NSLayoutConstraint.activate(selectTipLabelConstraints)
        NSLayoutConstraint.activate(zeroPresentValueButtonConstraints)
        NSLayoutConstraint.activate(twentyPresentValueButtonConstraints)
        NSLayoutConstraint.activate(tenPresentValueButtonConstraints)
        NSLayoutConstraint.activate(chooseSplitLabelConstraints)
        NSLayoutConstraint.activate(splitValueLabelConstraints)
        NSLayoutConstraint.activate(stepperOfSplitValueConstraints)
        NSLayoutConstraint.activate(enterBillValueLabelConstraints)
        NSLayoutConstraint.activate(billValueTextFieldConstraints)
    }
}
