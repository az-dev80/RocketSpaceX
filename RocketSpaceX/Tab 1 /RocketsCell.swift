//
//  RocketsCell.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 14.09.21.
//

import UIKit

class RocketsCell: UICollectionViewCell {
    
    let img: UIImageView = {
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.contentMode = .scaleAspectFill
        iv1.clipsToBounds = true
        iv1.layer.cornerRadius = 12
        iv1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return iv1
    }()
    
    let name:UILabel = UILabel()
    let first_flight:UILabel = UILabel()
    let first_flight_value:UILabel = UILabel()
    let cost_per_launch:UILabel = UILabel()
    let cost_per_launch_value:UILabel = UILabel()
    let success_rate_pct:UILabel = UILabel()
    let success_rate_pct_value:UILabel = UILabel()
    
    func setLabel(label: UILabel, withColor: UIColor, andFontSize:CGFloat) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = withColor
        label.font = UIFont(name: "Roboto-Bold", size: andFontSize)
        contentView.addSubview(label)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel(label: name, withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: first_flight, withColor: UIColor.black, andFontSize: 14)
        setLabel(label: cost_per_launch, withColor: UIColor.black, andFontSize: 14)
        setLabel(label: success_rate_pct, withColor: UIColor.black, andFontSize: 14)
        setLabel(label: first_flight_value, withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: cost_per_launch_value, withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: success_rate_pct_value, withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        
        contentView.addSubview(img)
        
        img.heightAnchor.constraint(equalToConstant: 240).isActive = true
        img.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
       
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 28).isActive = true
        name.widthAnchor.constraint(equalToConstant: 300).isActive = true
        name.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10).isActive = true
        
        first_flight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        first_flight.heightAnchor.constraint(equalToConstant: 16).isActive = true
        first_flight.widthAnchor.constraint(equalToConstant: 74).isActive = true
        first_flight.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 27).isActive = true
        
        cost_per_launch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 157).isActive = true
        cost_per_launch.heightAnchor.constraint(equalToConstant: 16).isActive = true
        cost_per_launch.widthAnchor.constraint(equalToConstant: 77).isActive = true
        cost_per_launch.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 27).isActive = true
        
        success_rate_pct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 264).isActive = true
        success_rate_pct.heightAnchor.constraint(equalToConstant: 16).isActive = true
        success_rate_pct.widthAnchor.constraint(equalToConstant: 54).isActive = true
        success_rate_pct.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 27).isActive = true
        
        first_flight_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        first_flight_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        first_flight_value.widthAnchor.constraint(equalToConstant: 127).isActive = true
        first_flight_value.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 45).isActive = true
        
        cost_per_launch_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 157).isActive = true
        cost_per_launch_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        cost_per_launch_value.widthAnchor.constraint(equalToConstant: 77).isActive = true
        cost_per_launch_value.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 45).isActive = true
        
        success_rate_pct_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 264).isActive = true
        success_rate_pct_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        success_rate_pct_value.widthAnchor.constraint(equalToConstant: 35).isActive = true
        success_rate_pct_value.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 45).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: MyData? {
        
        didSet{
            guard let data = data else { return }
            
            name.text = data.name
            first_flight.text = "First launch"
            cost_per_launch.text = "Launch cost"
            success_rate_pct.text = "Success"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: data.firstFlight)
            dateFormatter.dateFormat = "MMMM d, yyyy"
            
            first_flight_value.text = dateFormatter.string(from: date!)
            cost_per_launch_value.text = String(data.costPerLaunch) + "$"
            success_rate_pct_value.text = String(data.successRatePct) + "%"
        }
    }
}
