//
//  TableViewCell.swift
//  PageView
//
//  Created by Eduardo Lima on 12/05/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.scrollView.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 3.0
        view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        //scroll.backgroundColor = .blue
        scroll.isPagingEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        //pageControl.layer.cornerRadius = 10
        pageControl.numberOfPages = 2
        pageControl.backgroundColor = .white
        //pageControl.backgroundStyle = .automatic
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        return pageControl
    }()
    
    lazy var contentScrollView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .red
        return view
    }()
    
    lazy var incomeView: IncomeView = {
        let view = IncomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .cyan
        return view
    }()
    
    lazy var fundView: FundView = {
        let view = FundView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
// MARK: - Custom Methods
extension TableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(view)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.addSubview(fundView)
        scrollView.addSubview(incomeView)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //scrollView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),

            fundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            fundView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            fundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            //contentScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            fundView.topAnchor.constraint(equalTo: scrollView.topAnchor ),
            //contentScrollView.heightAnchor.constraint(equalToConstant: 150),
            fundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            //fundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),

            incomeView.leadingAnchor.constraint(equalTo: fundView.trailingAnchor),
            incomeView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            incomeView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            incomeView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            incomeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            incomeView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            pageControl.heightAnchor.constraint(equalToConstant: 6),
            //pageControl.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
        ])
    }
    
    func setupAdditionalConfiguration() {
        //contentView.backgroundColor = .black
        //contentView.layer.cornerRadius = 10
    }

    
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        self.scrollView.setContentOffset(CGPoint(x: CGFloat(current) * self.contentScrollView.frame.size.width, y: 0), animated: true)
    }
}

extension TableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x)/Float(scrollView.frame.size.width)))
    }
}
