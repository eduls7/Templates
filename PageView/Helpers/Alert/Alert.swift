import Foundation
import UIKit

// MARK: - StockExchangeAlertViewrDelegate
protocol AlertFeedbackDelegate: AnyObject {
    func dismissAlert()
}

// MARK: - Main
class AlertFeedbackView: UIView {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.alpha = 0.5

        let gestureBackView = UITapGestureRecognizer(
            target: self, action: #selector(
                tapGestureRecognizedBackView(sender:)
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
                         action: #selector(closeButtonTouched(_:)),
                         for: .touchUpInside)

        return button
    }()
    
    lazy var feedbackAlertImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "FeedbackAlert")
        imageView.image = image
        return imageView
    }()
    
    private lazy var descriptionAlertLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: AppFontName.medium, size: 20.0)
//        label.textColor = .colorPrimary
        label.text = "Tem certeza que deseja excluir a estratégia 1?"
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Excluir", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24.0
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTouched(_:)), for: .touchUpInside)
        return button
    }()
    
    
    weak var delegate: AlertFeedbackDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutViews()
    }

    func layoutViews() {
        addSubview(backView)
        addSubview(alertView)
        
        alertView.addSubview(closeButton)
        alertView.addSubview(feedbackAlertImageview)
        alertView.addSubview(descriptionAlertLabel)
        alertView.addSubview(confirmButton)
        alertView.addSubview(cancelButton)
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            alertView.leadingAnchor.constraint(equalTo: leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: trailingAnchor),
            alertView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 32),
            closeButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),
            closeButton.widthAnchor.constraint(equalToConstant: 13.56),
            closeButton.heightAnchor.constraint(equalToConstant: 13.55),
            
            feedbackAlertImageview.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 79.08),
            feedbackAlertImageview.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            feedbackAlertImageview.heightAnchor.constraint(equalToConstant: 53.83),
            feedbackAlertImageview.widthAnchor.constraint(equalToConstant: 60.07),
            
            descriptionAlertLabel.topAnchor.constraint(equalTo: feedbackAlertImageview.bottomAnchor, constant: 31.08),
            //descriptionAlertLabel.centerXAnchor.constraint(equalTo: feedbackAlertImageview.centerXAnchor),
            descriptionAlertLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 32),
            descriptionAlertLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -32),
            
            confirmButton.topAnchor.constraint(equalTo: descriptionAlertLabel.bottomAnchor, constant: 24.0),
            confirmButton.centerXAnchor.constraint(equalTo: descriptionAlertLabel.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            confirmButton.widthAnchor.constraint(equalToConstant: 155),
            
            cancelButton.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 24),
            cancelButton.centerXAnchor.constraint(equalTo: confirmButton.centerXAnchor),
//            cancelButton.heightAnchor.constraint(equalToConstant: 30),
//            cancelButton.widthAnchor.constraint(equalToConstant: 20),
            cancelButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -28)
        ])
       
    }
}

// MARK: - Actions
extension AlertFeedbackView {
    @objc
    private func closeButtonTouched(_ sender: UIButton) {
        delegate?.dismissAlert()
    }
    
    @objc
    private func tapGestureRecognizedBackView(sender: UITapGestureRecognizer) {
        delegate?.dismissAlert()
    }
}

