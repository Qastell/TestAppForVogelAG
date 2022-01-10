//
//  SearchModuleTableCell.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class SearchModuleTableCell: TableCell<SearchModuleCellModel> {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .left
        return label
    }()
    
    private let authorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorsLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let tapView = View()
    
    override func updateViews() {
        setModels()
        
        contentView.addSubview(tapView)
        tapView.addSubview(labelStackView)
        tapView.addSubview(coverImageView)
        
        tapView.constraintBounds()
        
        coverImageView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.width.equalTo(80)
            make.left.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.left.equalTo(coverImageView.snp.right).offset(10)
            make.top.equalTo(coverImageView)
            make.right.equalToSuperview().offset(-16)
        }
        
        tapView.enableTap { [weak self] _ in
            self?.cellModel?.action?()
        }
    }
    
    private func setModels() {
        guard let cellModel = cellModel else { return }
        
        titleLabel.text = cellModel.model.volumeInfo?.title ?? ""
        authorsLabel.text = (cellModel.model.volumeInfo?.authors ?? []).joined(separator: ", ")
        
        if let imageUrlString = cellModel.model.volumeInfo?.imageLinks?.smallThumbnail,
           let url = URL(string: imageUrlString)?.withHTTPSScheme {
            coverImageView.kf.setImage(with: url,
                                       placeholder: Images.verticalPlaceholder,
                                       options: [.cacheOriginalImage])
        } else {
            coverImageView.image = Images.verticalPlaceholder
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelStackView.removeFromSuperview()
        coverImageView.removeFromSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coverImageView.layer.cornerRadius = 15
    }
}
