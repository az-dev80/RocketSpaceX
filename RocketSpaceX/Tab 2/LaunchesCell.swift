//
//  LaunchesCell.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 22.10.21.
//

import UIKit

class LaunchesCell: UICollectionViewCell {
    let img: UIImageView = {
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.contentMode = .scaleAspectFill
        iv1.clipsToBounds = true
        //iv1.layer.cornerRadius = 12
        //iv1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return iv1
    }()
    
    let successIcon: UIImageView = {
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.contentMode = .scaleAspectFill
        iv1.clipsToBounds = true
        //iv1.layer.cornerRadius = 12
        //iv1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return iv1
    }()
    
    let name:UILabel = UILabel()
    let date:UILabel = UILabel()
    let flight_number:UILabel = UILabel()
    
    func setLabel(label: UILabel, name: String, withColor: UIColor, andFontSize:CGFloat) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = withColor
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: name, size: andFontSize)
        contentView.addSubview(label)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel(label: name, name: "Roboto-Bold", withColor: .black, andFontSize: 24)
        setLabel(label: date, name: "Roboto-Medium", withColor: .black, andFontSize: 17)
        setLabel(label: flight_number, name: "Roboto-Medium", withColor: UIColor(named: "Cyan Process")!, andFontSize: 17)
        
        contentView.addSubview(img)
        contentView.addSubview(successIcon)
        
        img.widthAnchor.constraint(equalToConstant: 91).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33).isActive = true
        img.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
       
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 28).isActive = true
        name.widthAnchor.constraint(equalToConstant: 250).isActive = true
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        
        date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        date.heightAnchor.constraint(equalToConstant: 22).isActive = true
        date.widthAnchor.constraint(equalToConstant: 200).isActive = true
        date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5).isActive = true
        
        successIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        successIcon.heightAnchor.constraint(equalToConstant: 26).isActive = true
        successIcon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        successIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        flight_number.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 72).isActive = true
        flight_number.heightAnchor.constraint(equalToConstant: 22).isActive = true
        flight_number.widthAnchor.constraint(equalToConstant: 40).isActive = true
        flight_number.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: LuanchesStruct? {
        
        didSet{
            guard let data = data else { return }
            
            name.text = data.name
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            let date1 = dateFormatter.date(from: data.dateUTC) ?? Date()
            dateFormatter.dateFormat = "MMMM d, yyyy"
            dateFormatter.timeZone = .current
            self.date.text = dateFormatter.string(from: date1)
            flight_number.text = "#" + String(data.flightNumber)
            
            if date1 > Date() {
                successIcon.image = UIImage(named: "clock")
            } else {
                successIcon.image = UIImage(named: "check")
            }
        }
    }
}
