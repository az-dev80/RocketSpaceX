//
//  LaunchesDetailCell.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 22.10.21.
//

import UIKit

class LaunchesDetailCell: UICollectionViewCell {
    var myImage: UIImageView = {
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.contentMode = .scaleAspectFill
        //iv1.backgroundColor = .lightGray
        iv1.clipsToBounds = true
        iv1.layer.cornerRadius = 10
        iv1.layer.borderWidth = 1
        iv1.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        return iv1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(myImage)
       
        
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        myImage.heightAnchor.constraint(equalToConstant: 190).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: 139).isActive = true
        myImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        myImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        myImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
