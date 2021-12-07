//
//  OnGoingOperationsViewCell.swift
//  PageView
//
//  Created by Eduardo  on 19/07/21.
//

import UIKit

//protocol OngoingOperationAlertViewDelegate: AnyObject {
//    func didTapCloseButton()
//}

class OnGoingOperationsViewCell: UITableViewCell {
    //MARK: - Properties
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 10.0
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var cardView: OnGoingOperationsView = {
        let view = OnGoingOperationsView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        let gestureRecognizer = UITapGestureRecognizer()
//        gestureRecognizer.addTarget(self, action: #selector(tapButton))
//        view.cancelButton.addGestureRecognizer(gestureRecognizer)
        return view
    }()
    
    lazy var accountView: OnGoingOperationsAccountView = {
        let view = OnGoingOperationsAccountView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var statusOperation = false
    //weak var delegate: OngoingOperationAlertViewDelegate?

    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnGoingOperationsViewCell {
    
    @objc func tapButton(sender: UITapGestureRecognizer) {
        //delegate?.didTapCloseButton()
    }
    
    func setupCell(model: model) {
        if model.isTrue {
            self.cardView.statusLabelAnchor.isActive = false
            self.cardView.cancelButtonAnchor.isActive = true
            self.cardView.buttonView.isHidden = false
            return
        }
        
        self.cardView.cancelButtonAnchor.isActive = false
        self.cardView.statusLabelAnchor.isActive = true
        self.cardView.buttonView.isHidden = true
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .white
        self.contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(accountView)
        stackView.addArrangedSubview(cardView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
        ])
    }
}
