//
//  AlertTermView.swift
//  AlertTermView
//
//  Created by Eduardo  on 05/10/21.
//

import UIKit

protocol AlertTermViewDelegate: AnyObject {
    func dismissAlert()
}
class AlertTermView: UIView {
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.alpha = 0.5

        let gestureBackView = UITapGestureRecognizer(
            target: self, action: #selector(
                closeButtonTouched
            )
        )
        view.addGestureRecognizer(gestureBackView)
        return view
    }()
    
    private lazy var alertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "CloseButton"), for: .normal)
        button.addTarget(self,
                         action: #selector(closeButtonTouched),
                         for: .touchUpInside)

        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Desenquadramento em Renda Variável"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private lazy var investorProfileLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Este investimento não está adequado ao\nseu perfil de investidor.\nPara continuar com a aplicação, é preciso\nestar de acordo com o termo de\ndesenquadramento. "
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var termLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Para continuar com a aplicação, é preciso estar de acordo com o termo de desenquadramento."
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    weak var delegate: AlertTermViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutViews()
    }
}

extension AlertTermView {
    
    @objc
    private func closeButtonTouched() {
        self.delegate?.dismissAlert()
    }
}
extension AlertTermView {
    func layoutViews() {
        addSubview(backView)
        addSubview(alertView)

        alertView.addSubview(closeButton)
        
        alertView.addSubview(titleLabel)
        alertView.addSubview(investorProfileLabel)
        //alertView.addSubview(termLabel)

        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            alertView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: trailingAnchor),
            alertView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            alertView.heightAnchor.constraint(equalToConstant: 375),
            
            closeButton.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 32),
            closeButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),
            closeButton.widthAnchor.constraint(equalToConstant: 13.56),
            closeButton.heightAnchor.constraint(equalToConstant: 13.55),
            
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 26),
            titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),
            
            investorProfileLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            investorProfileLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            investorProfileLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            investorProfileLabel.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -35),

        ])
       
    }
}
