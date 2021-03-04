//
//  PictureCell.swift
//  PryanikiParser
//
//  Created by Арсений Токарев on 04.03.2021.
//

import UIKit

//MARK: - PICTURE CELL
class PictureCell: MainCell {
    static let cellIdentifier = "picture"
    private let pictureImageView = UIImageView()
    private let insideTextLabel = UILabel()
    
    override func setViewModel(_ viewModel: ViewData) {
        super.setViewModel(viewModel)
        guard
            let url = viewModel.data.url,
            let image = getImage(from: url)
        else { return }
        pictureImageView.image = image
        insideTextLabel.text = viewModel.data.text
    }
    
    func getImage(from url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) else { return nil}
        return UIImage(data: data)
    }
    
    func configureTextLabel() {
        contentView.addSubview(insideTextLabel)
        insideTextLabel.styleLabel(font: .systemFont(ofSize: 18),
                                   textColor: .systemGray2)
        insideTextLabel.snp.makeConstraints { insideTextLabelPosition in
            insideTextLabelPosition.top.equalTo(nameLabel.snp.bottom).offset(5)
            insideTextLabelPosition.right.equalTo(nameLabel.snp.right)
            insideTextLabelPosition.left.equalTo(nameLabel.snp.left)
            insideTextLabelPosition.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configurePictureImageView() {
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints { imageViewPosition in
            imageViewPosition.right.equalToSuperview().offset(-10)
            imageViewPosition.top.equalToSuperview().offset(10)
            imageViewPosition.height.width.equalTo(80)
            imageViewPosition.bottom.equalToSuperview().offset(-10)
        }
        nameLabel.snp.remakeConstraints { nameLabelPosition in
            nameLabelPosition.top.equalTo(pictureImageView)
            nameLabelPosition.left.equalToSuperview().offset(20)
            nameLabelPosition.right.equalTo(pictureImageView.snp.left).inset(-10)
        }
    }
    
    @objc func didTapCell() {
        let name = nameLabel.text ?? ""
        let pictureName = insideTextLabel.text ?? ""
        delegate?.didTapCell(with: name, description: "In the image you can see '\(pictureName)'")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTextLabel()
        configurePictureImageView()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCell))
        addGestureRecognizer(gestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
