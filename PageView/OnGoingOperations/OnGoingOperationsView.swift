//
//  OnGoingOperationsView.swift
//  PageView
//
//  Created by Eduardo  on 19/07/21.
//

import UIKit

protocol OngoingOperationAlertViewDelegate: AnyObject {
    func didTapCancelButton(alertType: AlertType)
}

class OnGoingOperationsView: UIView {
    // MARK: - Properties
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var firstView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var firstItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Nome do ativo"
        return label
    }()
    
    lazy var labelValue1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .right
        label.text = "value1"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        //label.textColor = UIColor(hex: "#505152")
        return label
    }()
    
    lazy var secondView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Tipo"
        return label
    }()
    
    lazy var labelValue2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "value2"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //label.textColor = UIColor(hex: "#424242")
        return label
    }()
    
    lazy var thirdView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var thirdItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Data de execução"
        return label
    }()
    
    lazy var labelValue3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "value3"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //label.textColor = UIColor(hex: "#424242")
        return label
    }()
    
    lazy var fourthView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fourthItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Valor investido"
        
        return label
    }()
    
    lazy var labelValue4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "value4"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //label.textColor = UIColor(hex: "#424242")
        label.textAlignment = .right
        return label
    }()
    
    lazy var fifthView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fifthItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Preço"
        return label
    }()
    
    lazy var labelValue5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "value5"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //label.textColor = UIColor(hex: "#424242")
        label.textAlignment = .right
        return label
    }()
    
    lazy var sixthView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sixthItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Quantidade"
        return label
    }()
    
    lazy var labelValue6: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "value6"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //label.textColor = UIColor(hex: "#424242")
        label.textAlignment = .right
        return label
    }()
    
    lazy var seventhView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var seventhItemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        //label.textColor = UIColor(hex: "#424242")
        label.text = "Status"
        return label
    }()
    
    lazy var labelValue7: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "value7"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        //label.textColor = UIColor(hex: "#424242")
        label.textAlignment = .right
        return label
    }()
    
    lazy var separatorLineView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    lazy var buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cancelButton: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "CancelButton")
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(tapCancelButton))
        imageView.addGestureRecognizer(gestureRecognizer)
        return imageView
    }()
    
    
    var cancelButtonAnchor = NSLayoutConstraint()
    var statusLabelAnchor = NSLayoutConstraint()
    weak var delegate: OngoingOperationAlertViewDelegate?
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Custom Methods
extension OnGoingOperationsView {
    
    @objc func tapCancelButton(sender: UITapGestureRecognizer) {
        delegate?.didTapCancelButton(alertType: .exclusion)
    }
    
    private func setupView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(separatorLineView)
        
        firstView.addSubview(firstItemTitleLabel)
        firstView.addSubview(labelValue1)
        stackView.addArrangedSubview(firstView)
        
        secondView.addSubview(secondItemTitleLabel)
        secondView.addSubview(labelValue2)
        stackView.addArrangedSubview(secondView)
        
        thirdView.addSubview(thirdItemTitleLabel)
        thirdView.addSubview(labelValue3)
        stackView.addArrangedSubview(thirdView)
        
        fourthView.addSubview(fourthItemTitleLabel)
        fourthView.addSubview(labelValue4)
        stackView.addArrangedSubview(fourthView)
        
        fifthView.addSubview(fifthItemTitleLabel)
        fifthView.addSubview(labelValue5)
        stackView.addArrangedSubview(fifthView)
        
        sixthView.addSubview(sixthItemTitleLabel)
        sixthView.addSubview(labelValue6)
        stackView.addArrangedSubview(sixthView)
        
        seventhView.addSubview(seventhItemTitleLabel)
        seventhView.addSubview(labelValue7)
        stackView.addArrangedSubview(seventhView)
        
        buttonView.addSubview(cancelButton)
        stackView.addArrangedSubview(buttonView)
        
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            firstItemTitleLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 16),
            firstItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue1.leadingAnchor),
            firstItemTitleLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 0),
            firstItemTitleLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 0),
            
            labelValue1.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -23),
            labelValue1.topAnchor.constraint(equalTo: firstItemTitleLabel.topAnchor),
            labelValue1.widthAnchor.constraint(equalTo: firstItemTitleLabel.widthAnchor),
            
            secondItemTitleLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 16),
            secondItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue2.leadingAnchor),
            secondItemTitleLabel.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 0),
            secondItemTitleLabel.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 0),
            
            labelValue2.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -20),
            labelValue2.topAnchor.constraint(equalTo: secondItemTitleLabel.topAnchor),
            labelValue2.widthAnchor.constraint(equalTo: secondItemTitleLabel.widthAnchor),
            
            thirdItemTitleLabel.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 16),
            thirdItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue3.leadingAnchor),
            thirdItemTitleLabel.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 0),
            thirdItemTitleLabel.bottomAnchor.constraint(equalTo: thirdView.bottomAnchor, constant: 0),
            
            labelValue3.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -20),
            labelValue3.topAnchor.constraint(equalTo: thirdItemTitleLabel.topAnchor),
            labelValue3.widthAnchor.constraint(equalTo: thirdItemTitleLabel.widthAnchor),
            
            fourthItemTitleLabel.leadingAnchor.constraint(equalTo: fourthView.leadingAnchor, constant: 16),
            fourthItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue4.leadingAnchor),
            fourthItemTitleLabel.topAnchor.constraint(equalTo: fourthView.topAnchor, constant: 0),
            fourthItemTitleLabel.bottomAnchor.constraint(equalTo: fourthView.bottomAnchor, constant: 0),
            
            labelValue4.trailingAnchor.constraint(equalTo: fourthView.trailingAnchor, constant: -20),
            labelValue4.topAnchor.constraint(equalTo: fourthItemTitleLabel.topAnchor),
            labelValue4.widthAnchor.constraint(equalTo: fourthItemTitleLabel.widthAnchor),
            
            fifthItemTitleLabel.leadingAnchor.constraint(equalTo: fifthView.leadingAnchor, constant: 16),
            fifthItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue5.leadingAnchor),
            fifthItemTitleLabel.topAnchor.constraint(equalTo: fifthView.topAnchor, constant: 0),
            fifthItemTitleLabel.bottomAnchor.constraint(equalTo: fifthView.bottomAnchor, constant: 0),
            
            labelValue5.trailingAnchor.constraint(equalTo: fifthView.trailingAnchor, constant: -20),
            labelValue5.topAnchor.constraint(equalTo: fifthItemTitleLabel.topAnchor),
            labelValue5.widthAnchor.constraint(equalTo: fifthItemTitleLabel.widthAnchor),
            
            sixthItemTitleLabel.leadingAnchor.constraint(equalTo: sixthView.leadingAnchor, constant: 16),
            sixthItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue6.leadingAnchor),
            sixthItemTitleLabel.topAnchor.constraint(equalTo: sixthView.topAnchor, constant: 0),
            sixthItemTitleLabel.bottomAnchor.constraint(equalTo: sixthView.bottomAnchor, constant: 0),
            
            labelValue6.trailingAnchor.constraint(equalTo: sixthView.trailingAnchor, constant: -20),
            labelValue6.topAnchor.constraint(equalTo: sixthItemTitleLabel.topAnchor),
            labelValue6.widthAnchor.constraint(equalTo: sixthItemTitleLabel.widthAnchor),
            
            seventhItemTitleLabel.leadingAnchor.constraint(equalTo: seventhView.leadingAnchor, constant: 16),
            seventhItemTitleLabel.trailingAnchor.constraint(equalTo: labelValue7.leadingAnchor),
            seventhItemTitleLabel.topAnchor.constraint(equalTo: seventhView.topAnchor, constant: 0),
            //seventhItemTitleLabel.bottomAnchor.constraint(equalTo: seventhView.bottomAnchor, constant: -24),
            
            labelValue7.trailingAnchor.constraint(equalTo: seventhView.trailingAnchor, constant: -20),
            labelValue7.topAnchor.constraint(equalTo: seventhItemTitleLabel.topAnchor),
            labelValue7.widthAnchor.constraint(equalTo: seventhItemTitleLabel.widthAnchor),
            
            cancelButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: -16),
            cancelButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0),
            cancelButton.widthAnchor.constraint(equalToConstant: 190),
            cancelButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        cancelButtonAnchor = seventhItemTitleLabel.bottomAnchor.constraint(equalTo: seventhView.bottomAnchor, constant: 0)
        statusLabelAnchor = seventhItemTitleLabel.bottomAnchor.constraint(equalTo: seventhView.bottomAnchor, constant: -24)

    }
}
