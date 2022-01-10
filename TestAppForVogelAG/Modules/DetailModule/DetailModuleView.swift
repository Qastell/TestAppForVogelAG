//
//  DetailModuleView.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 11.01.2022.
//  Copyright © 2022 AppCraft. All rights reserved.
//

import UIKit
import Kingfisher

protocol DetailModuleViewDelegate: AnyObject { }

class DetailModuleView: View {
    
    weak var delegate: DetailModuleViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let authorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorsLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.isUserInteractionEnabled = false
        stackView.setCustomSpacing(32, after: authorsLabel)
        return stackView
    }()
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.contentInset.bottom = 50
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    func setupView(with book: BookResponseModel) {
        titleLabel.text = book.volumeInfo?.title ?? ""
        descriptionLabel.text = book.volumeInfo?.description ?? ""
        authorsLabel.text = (book.volumeInfo?.authors ?? []).joined(separator: ", ")
        
        if let imageUrlString = book.volumeInfo?.imageLinks?.thumbnail,
           let url = URL(string: imageUrlString)?.withHTTPSScheme {
            
            coverImageView.kf.setImage(with: url,
                                       placeholder: Images.verticalPlaceholder,
                                       options: [.cacheOriginalImage])
        } else {
            coverImageView.image = Images.verticalPlaceholder
        }
    }
    
    override func setupView() {
        super.setupView()
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        [coverImageView, labelStackView].forEach { contentView.addSubview($0) }
        
        scrollView.constraintBounds()
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
        
        let width = SizeConstants.screenWidth * 0.4
        
        coverImageView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(width * 2)
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
}
