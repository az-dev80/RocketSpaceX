//
//  RocketDetailsVC.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 20.09.21.
//

import UIKit

class RocketDetailsVC: UIViewController {
    static var imagesURLs: [String] = []
    let cache = NSCache<NSNumber, UIImage>()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.isUserInteractionEnabled = true
        scroll.delegate = self
        //scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let scroll = UIView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    var imgCover: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        //iv.layer.borderWidth = 1
        //iv.layer.cornerRadius = 8
        //iv.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        iv.clipsToBounds = true
        
        var aview = ImageViewGradientForMain(frame: CGRect(x: 0, y: 0, width: 414, height: 383))
        iv.addSubview(aview)
        iv.bringSubviewToFront(aview)
        
        return iv
    }()
    
    let name:UILabel = UILabel()
    
    let description_title:UILabel = UILabel()
    let description_value:UILabel = UILabel()
    
    let overview_title:UILabel = UILabel()
    let first_flight:UILabel = UILabel()
    let first_flight_value:UILabel = UILabel()
    let cost_per_launch:UILabel = UILabel()
    let cost_per_launch_value:UILabel = UILabel()
    let success_rate_pct:UILabel = UILabel()
    let success_rate_pct_value:UILabel = UILabel()
    let mass:UILabel = UILabel()
    let mass_value:UILabel = UILabel()
    let height:UILabel = UILabel()
    let height_value:UILabel = UILabel()
    let diameter:UILabel = UILabel()
    let diameter_value:UILabel = UILabel()
    
    let images_title:UILabel = UILabel()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = .init(width: 145, height: 196)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    var images:[String] = []
    
    let engines_title:UILabel = UILabel()
    let engine_type:UILabel = UILabel()
    let engine_type_value:UILabel = UILabel()
    let engine_layout:UILabel = UILabel()
    let engine_layout_value:UILabel = UILabel()
    let engine_version:UILabel = UILabel()
    let engine_version_value:UILabel = UILabel()
    let engine_amount:UILabel = UILabel()
    let engine_amount_value:UILabel = UILabel()
    let engine_propellant1:UILabel = UILabel()
    let engine_propellant1_value:UILabel = UILabel()
    let engine_propellant2:UILabel = UILabel()
    let engine_propellant2_value:UILabel = UILabel()
    
    let firstStage_title:UILabel = UILabel()
    let firstStage_reusable:UILabel = UILabel()
    let firstStage_reusable_value:UILabel = UILabel()
    let firstStage_enginesAmount:UILabel = UILabel()
    let firstStage_enginesAmount_value:UILabel = UILabel()
    let firstStage_fuelAmount:UILabel = UILabel()
    let firstStage_fuelAmount_value:UILabel = UILabel()
    let firstStage_burningTime:UILabel = UILabel()
    let firstStage_burningTime_value:UILabel = UILabel()
    let firstStage_thrustSea:UILabel = UILabel()
    let firstStage_thrustSea_value:UILabel = UILabel()
    let firstStage_thrustVacuum:UILabel = UILabel()
    let firstStage_thrustVacuum_value:UILabel = UILabel()
    
    let secondStage_title:UILabel = UILabel()
    let secondStage_reusable:UILabel = UILabel()
    let secondStage_reusable_value:UILabel = UILabel()
    let secondStage_enginesAmount:UILabel = UILabel()
    let secondStage_enginesAmount_value:UILabel = UILabel()
    let secondStage_fuelAmount:UILabel = UILabel()
    let secondStage_fuelAmount_value:UILabel = UILabel()
    let secondStage_burningTime:UILabel = UILabel()
    let secondStage_burningTime_value:UILabel = UILabel()
    let secondStage_thrust:UILabel = UILabel()
    let secondStage_thrust_value:UILabel = UILabel()
    
    let landingLegs_title:UILabel = UILabel()
    let landingLegs_amount:UILabel = UILabel()
    let landingLegs_amount_value:UILabel = UILabel()
    let landingLegs_material:UILabel = UILabel()
    let landingLegs_material_value:UILabel = UILabel()
    
    let materials_title:UILabel = UILabel()
    
    let wiki:UIButton = {
        let bt = UIButton()
        bt.setTitle("Wikipedia", for: .normal)
        bt.setTitleColor(UIColor(named: "Coral"), for: .normal)
        bt.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 17)
        bt.setImage(UIImage(named: "Vector3"), for: .normal)
        bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: -36, bottom: 0, right: 0)
        bt.imageEdgeInsets = UIEdgeInsets(top: 0, left: 91, bottom: 0, right: 0)
        bt.layer.backgroundColor = UIColor(named: "White")?.cgColor
        //bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 6, right: 0)
        bt.translatesAutoresizingMaskIntoConstraints = false
        //bt.layer.borderWidth = 1
        bt.layer.cornerRadius = 16
        //let shadowPath0 = UIBezierPath(roundedRect: bt.bounds, cornerRadius: 20)
        //bt.layer.shadowPath = shadowPath0.cgPath
        //bt.layer.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
        //bt.layer.shadowOpacity = 1
        //bt.layer.shadowRadius = 3
        //bt.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        //bt.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        
        bt.clipsToBounds = false
        bt.addTarget(self, action: #selector(wikiAction), for: .touchUpInside)
        
        var shadows = UIView()
        shadows.frame = bt.frame
        shadows.clipsToBounds = false
        bt.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 3
        layer0.shadowOffset = CGSize(width: 1.5, height: 1.5)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 20)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 3
        layer1.shadowOffset = CGSize(width: -1, height: -1)
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        shadows.layer.addSublayer(layer1)

        return bt
    }()
    
    let arrowLeft:UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "ArrowLeft"), for: .normal)
        bt.setTitleColor(UIColor(named: "Coral"), for: .highlighted)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.clipsToBounds = true
        bt.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        return bt
    }()
    
    
    let wikiURL:UILabel = UILabel()
    
    @objc func wikiAction(){
        let modalVCS = WebViewController()
        modalVCS.modalPresentationStyle = .fullScreen
        let navVC = UINavigationController(rootViewController: modalVCS)
        navVC.navigationBar.titleTextAttributes = [.font: UIFont(name: "Roboto-Bold", size: 24)!, .foregroundColor: UIColor(named: "White")!]
        
       self.present(navVC, animated: true, completion: nil)
    }
    
    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
    
    func setLabel(label: UILabel, withName: String, withColor: UIColor, andFontSize:CGFloat) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = withColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: withName, size: andFontSize)
        contentView.addSubview(label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        modalPresentationStyle = .fullScreen
        
        name.text = RocketsViewController.indItem?.name
        description_title.text = "Description"
        description_value.text = RocketsViewController.indItem?.welcomeDescription
        overview_title.text = "Overview"
        first_flight.text = "First launch"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: RocketsViewController.indItem!.firstFlight)
        dateFormatter.dateFormat = "MMMM d, yyyy"
        first_flight_value.text = dateFormatter.string(from: date!)
        
        cost_per_launch.text = "Launch cost"
        if let x = RocketsViewController.indItem?.costPerLaunch {
            cost_per_launch_value.text = "\(x)$"
        }
        
        success_rate_pct.text = "Success"
        if let x = RocketsViewController.indItem?.successRatePct {
            success_rate_pct_value.text = "\(x)%"
        }
        
        mass.text = "Mass"
        if let x = RocketsViewController.indItem?.mass?.kg {
            mass_value.text = "\(x) kg"
        }
        height.text = "Height"
        if let x = RocketsViewController.indItem?.height.meters {
            height_value.text = "\(x) meters"
        }
        
        diameter.text = "Diameter"
        if let x = RocketsViewController.indItem?.diameter.meters{
            diameter_value.text = "\(x) meters"
        }
        
        images_title.text = "Images"
        RocketDetailsVC.imagesURLs = RocketsViewController.indItem?.flickrImages ?? []
        print(RocketDetailsVC.imagesURLs)
        engines_title.text = "Engines"
        engine_type.text = "Type"
        engine_type_value.text = RocketsViewController.indItem?.engines.type  ?? "n/a"
        engine_layout.text = "Layout"
        engine_layout_value.text = RocketsViewController.indItem?.engines.layout ?? "n/a"
        engine_version.text = "Version"
        engine_version_value.text = RocketsViewController.indItem?.engines.version ?? "n/a"
        if engine_version_value.text == "" {
            engine_version_value.text = "n/a"
        }
        engine_amount.text = "Amount"
        if let x = RocketsViewController.indItem?.engines.number{
            engine_amount_value.text = "\(x)"
        }
        engine_propellant1.text = "Propellant 1"
        engine_propellant1_value.text = RocketsViewController.indItem?.engines.propellant1
        engine_propellant2.text = "Propellant 2"
        engine_propellant2_value.text = RocketsViewController.indItem?.engines.propellant2
        
        firstStage_title.text = "First stage"
        firstStage_reusable.text = "Reusable"
        if let x = RocketsViewController.indItem?.firstStage.reusable{
            if x == true {
                firstStage_reusable_value.text = "Yes"
            }
            if x == false {
                firstStage_reusable_value.text = "No"
            }
        }
        firstStage_enginesAmount.text = "Engines amount"
        if let x = RocketsViewController.indItem?.firstStage.engines{
            firstStage_enginesAmount_value.text = "\(x)"
        }
        firstStage_fuelAmount.text = "Fuel amount"
        if let x = RocketsViewController.indItem?.firstStage.fuelAmountTons{
            firstStage_fuelAmount_value.text = "\(x) tons"
        }
        firstStage_burningTime.text = "Burning time"
        if let x = RocketsViewController.indItem?.firstStage.burnTimeSEC{
            firstStage_burningTime_value.text = "\(x) seconds"
        }else {
            firstStage_burningTime_value.text = "n/a"
        }
        
        firstStage_thrustSea.text = "Thrust (sea level)"
        if let x = RocketsViewController.indItem?.firstStage.thrustSeaLevel.kN {
            firstStage_thrustSea_value.text = "\(x) kN"
        }
        
        firstStage_thrustVacuum.text = "Thrust (vacuum)"
        if let x = RocketsViewController.indItem?.firstStage.thrustVacuum.kN {
            firstStage_thrustVacuum_value.text = "\(x) kN"
        }
        
        secondStage_title.text = "Second stage"
        secondStage_reusable.text = "Reusable"
        if let x = RocketsViewController.indItem?.secondStage.reusable{
            if x == true {
                secondStage_reusable_value.text = "Yes"
            }
            if x == false {
                secondStage_reusable_value.text = "No"
            }
        }
        
        secondStage_enginesAmount.text = "Engines amount"
        if let x = RocketsViewController.indItem?.secondStage.engines{
            secondStage_enginesAmount_value.text = "\(x)"
        }
        
        secondStage_fuelAmount.text = "Fuel amount"
        if let x = RocketsViewController.indItem?.secondStage.fuelAmountTons{
            secondStage_fuelAmount_value.text = "\(x) tons"
        }
        
        secondStage_burningTime.text = "Burning time"
        if let x = RocketsViewController.indItem?.secondStage.burnTimeSEC{
            secondStage_burningTime_value.text = "\(x) seconds"
        } else {
            secondStage_burningTime_value.text = "n/a"
        }
        
        secondStage_thrust.text = "Thrust"
        if let x = RocketsViewController.indItem?.secondStage.thrust.kN {
            secondStage_thrust_value.text = "\(x) kN"
        }
        
        landingLegs_title.text = "Landing legs"
        landingLegs_amount.text = "Amount"
        if let x = RocketsViewController.indItem?.landingLegs.number {
            landingLegs_amount_value.text = "\(x)"
        }
        
        landingLegs_material.text = "Material"
        landingLegs_material_value.text = RocketsViewController.indItem?.landingLegs.material ?? "n/a"
        
        materials_title.text = "Materials"
        
        wikiURL.text = RocketsViewController.indItem?.wikipedia
        
        setupView()
        
    }
    
    func setupView(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imgCover)
        contentView.addSubview(arrowLeft)
        contentView.addSubview(collectionView)
        contentView.addSubview(wiki)
        setLabel(label: name, withName: "Roboto-Bold", withColor: UIColor(named: "White")!, andFontSize: 48)
        setLabel(label: description_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: description_value, withName: "Roboto-Medium", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: overview_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: first_flight, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: first_flight_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: cost_per_launch, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: cost_per_launch_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: success_rate_pct, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: success_rate_pct_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: mass, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: mass_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: height, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: height_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: diameter, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: diameter_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: images_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: engines_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: engine_type, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: engine_type_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: engine_layout, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: engine_layout_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: engine_version, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: engine_version_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: engine_amount, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: engine_amount_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: engine_propellant1, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: engine_propellant1_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: engine_propellant2, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: engine_propellant2_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        
        setLabel(label: firstStage_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: firstStage_reusable, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: firstStage_reusable_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: firstStage_enginesAmount, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: firstStage_enginesAmount_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: firstStage_fuelAmount, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: firstStage_fuelAmount_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: firstStage_burningTime, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: firstStage_burningTime_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: firstStage_thrustSea, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: firstStage_thrustSea_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: firstStage_thrustVacuum, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: firstStage_thrustVacuum_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        
        setLabel(label: secondStage_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: secondStage_reusable, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: secondStage_reusable_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: secondStage_enginesAmount, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: secondStage_enginesAmount_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: secondStage_fuelAmount, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: secondStage_fuelAmount_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: secondStage_burningTime, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: secondStage_burningTime_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: secondStage_thrust, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: secondStage_thrust_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        
        setLabel(label: landingLegs_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: landingLegs_amount, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: landingLegs_amount_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: landingLegs_material, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: landingLegs_material_value, withName: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        
        setLabel(label: materials_title, withName: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        
        setupconstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 2081)
    }
    
    func computeHeight(text: String, width: CGFloat) -> CGFloat {
        let label = UILabel()

        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.preferredMaxLayoutWidth = width
        label.text = text
        label.invalidateIntrinsicContentSize()

        let height = label.intrinsicContentSize.height
        return height
    }
    
    func setupconstraint(){
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 2100).isActive = true
        
        imgCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imgCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imgCover.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imgCover.heightAnchor.constraint(equalToConstant: 383).isActive = true
        
        arrowLeft.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        arrowLeft.widthAnchor.constraint(equalToConstant: 15).isActive = true
        arrowLeft.bottomAnchor.constraint(equalTo: imgCover.bottomAnchor, constant: -307).isActive = true
        arrowLeft.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        name.widthAnchor.constraint(equalToConstant: 300).isActive = true
        name.bottomAnchor.constraint(equalTo: imgCover.bottomAnchor, constant: -30).isActive = true
        name.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        description_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        description_title.widthAnchor.constraint(equalToConstant: 130).isActive = true
        description_title.topAnchor.constraint(equalTo: imgCover.bottomAnchor, constant: 40).isActive = true
        description_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let hightD = computeHeight(text: RocketsViewController.indItem!.welcomeDescription, width: view.bounds.width - 50)
        description_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        description_value.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        description_value.topAnchor.constraint(equalTo: description_title.bottomAnchor, constant: 20).isActive = true
        description_value.heightAnchor.constraint(equalToConstant: hightD).isActive = true
        
        overview_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        overview_title.widthAnchor.constraint(equalToConstant: 100).isActive = true
        overview_title.topAnchor.constraint(equalTo: description_value.bottomAnchor, constant: 30).isActive = true
        overview_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        first_flight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        first_flight.widthAnchor.constraint(equalToConstant: 100).isActive = true
        first_flight.topAnchor.constraint(equalTo: overview_title.bottomAnchor, constant: 20).isActive = true
        first_flight.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        first_flight_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        first_flight_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        first_flight_value.topAnchor.constraint(equalTo: overview_title.bottomAnchor, constant: 20).isActive = true
        first_flight_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        cost_per_launch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cost_per_launch.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cost_per_launch.topAnchor.constraint(equalTo: first_flight.bottomAnchor, constant: 15).isActive = true
        cost_per_launch.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        cost_per_launch_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        cost_per_launch_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        cost_per_launch_value.topAnchor.constraint(equalTo: first_flight.bottomAnchor, constant: 15).isActive = true
        cost_per_launch_value.heightAnchor.constraint(equalToConstant: 16).isActive = true

        success_rate_pct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        success_rate_pct.widthAnchor.constraint(equalToConstant: 100).isActive = true
        success_rate_pct.topAnchor.constraint(equalTo: cost_per_launch_value.bottomAnchor, constant: 15).isActive = true
        success_rate_pct.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        success_rate_pct_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        success_rate_pct_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        success_rate_pct_value.topAnchor.constraint(equalTo: cost_per_launch_value.bottomAnchor, constant: 15).isActive = true
        success_rate_pct_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mass.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        mass.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mass.topAnchor.constraint(equalTo: success_rate_pct_value.bottomAnchor, constant: 15).isActive = true
        mass.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        mass_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        mass_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        mass_value.topAnchor.constraint(equalTo: success_rate_pct_value.bottomAnchor, constant: 15).isActive = true
        mass_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        height.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        height.widthAnchor.constraint(equalToConstant: 100).isActive = true
        height.topAnchor.constraint(equalTo: mass_value.bottomAnchor, constant: 15).isActive = true
        height.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        height_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        height_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        height_value.topAnchor.constraint(equalTo: mass_value.bottomAnchor, constant: 15).isActive = true
        height_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        diameter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        diameter.widthAnchor.constraint(equalToConstant: 100).isActive = true
        diameter.topAnchor.constraint(equalTo: height_value.bottomAnchor, constant: 15).isActive = true
        diameter.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        diameter_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        diameter_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        diameter_value.topAnchor.constraint(equalTo: height_value.bottomAnchor, constant: 15).isActive = true
        diameter_value.heightAnchor.constraint(equalToConstant: 16).isActive = true

        images_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        images_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        images_title.topAnchor.constraint(equalTo: diameter_value.bottomAnchor, constant: 30).isActive = true
        images_title.heightAnchor.constraint(equalToConstant: 28).isActive = true

        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 374).isActive = true
        collectionView.topAnchor.constraint(equalTo: images_title.bottomAnchor, constant: 20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 196).isActive = true

        engines_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engines_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engines_title.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30).isActive = true
        engines_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        engine_type.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engine_type.widthAnchor.constraint(equalToConstant: 100).isActive = true
        engine_type.topAnchor.constraint(equalTo: engines_title.bottomAnchor, constant: 20).isActive = true
        engine_type.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_type_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        engine_type_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engine_type_value.topAnchor.constraint(equalTo: engines_title.bottomAnchor, constant: 20).isActive = true
        engine_type_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_layout.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engine_layout.widthAnchor.constraint(equalToConstant: 100).isActive = true
        engine_layout.topAnchor.constraint(equalTo: engine_type_value.bottomAnchor, constant: 15).isActive = true
        engine_layout.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_layout_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        engine_layout_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engine_layout_value.topAnchor.constraint(equalTo: engine_type_value.bottomAnchor, constant: 15).isActive = true
        engine_layout_value.heightAnchor.constraint(equalToConstant: 16).isActive = true

        engine_version.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engine_version.widthAnchor.constraint(equalToConstant: 100).isActive = true
        engine_version.topAnchor.constraint(equalTo: engine_layout_value.bottomAnchor, constant: 15).isActive = true
        engine_version.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_version_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        engine_version_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engine_version_value.topAnchor.constraint(equalTo: engine_layout_value.bottomAnchor, constant: 15).isActive = true
        engine_version_value.heightAnchor.constraint(equalToConstant: 16).isActive = true

        engine_amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engine_amount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        engine_amount.topAnchor.constraint(equalTo: engine_version_value.bottomAnchor, constant: 15).isActive = true
        engine_amount.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_amount_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        engine_amount_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engine_amount_value.topAnchor.constraint(equalTo: engine_version_value.bottomAnchor, constant: 15).isActive = true
        engine_amount_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_propellant1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engine_propellant1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        engine_propellant1.topAnchor.constraint(equalTo: engine_amount_value.bottomAnchor, constant: 15).isActive = true
        engine_propellant1.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_propellant1_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        engine_propellant1_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engine_propellant1_value.topAnchor.constraint(equalTo: engine_amount_value.bottomAnchor, constant: 15).isActive = true
        engine_propellant1_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_propellant2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        engine_propellant2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        engine_propellant2.topAnchor.constraint(equalTo: engine_propellant1_value.bottomAnchor, constant: 15).isActive = true
        engine_propellant2.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        engine_propellant2_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        engine_propellant2_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        engine_propellant2_value.topAnchor.constraint(equalTo: engine_propellant1_value.bottomAnchor, constant: 15).isActive = true
        engine_propellant2_value.heightAnchor.constraint(equalToConstant: 16).isActive = true

        firstStage_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_title.topAnchor.constraint(equalTo: engine_propellant2_value.bottomAnchor, constant: 30).isActive = true
        firstStage_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        firstStage_reusable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_reusable.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstStage_reusable.topAnchor.constraint(equalTo: firstStage_title.bottomAnchor, constant: 20).isActive = true
        firstStage_reusable.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_reusable_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        firstStage_reusable_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_reusable_value.topAnchor.constraint(equalTo: firstStage_title.bottomAnchor, constant: 20).isActive = true
        firstStage_reusable_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_enginesAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_enginesAmount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstStage_enginesAmount.topAnchor.constraint(equalTo: firstStage_reusable_value.bottomAnchor, constant: 15).isActive = true
        firstStage_enginesAmount.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_enginesAmount_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        firstStage_enginesAmount_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_enginesAmount_value.topAnchor.constraint(equalTo: firstStage_reusable_value.bottomAnchor, constant: 15).isActive = true
        firstStage_enginesAmount_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_fuelAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_fuelAmount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstStage_fuelAmount.topAnchor.constraint(equalTo: firstStage_enginesAmount_value.bottomAnchor, constant: 15).isActive = true
        firstStage_fuelAmount.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_fuelAmount_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        firstStage_fuelAmount_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_fuelAmount_value.topAnchor.constraint(equalTo: firstStage_enginesAmount_value.bottomAnchor, constant: 15).isActive = true
        firstStage_fuelAmount_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_burningTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_burningTime.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstStage_burningTime.topAnchor.constraint(equalTo: firstStage_fuelAmount_value.bottomAnchor, constant: 15).isActive = true
        firstStage_burningTime.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_burningTime_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        firstStage_burningTime_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_burningTime_value.topAnchor.constraint(equalTo: firstStage_fuelAmount_value.bottomAnchor, constant: 15).isActive = true
        firstStage_burningTime_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_thrustSea.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_thrustSea.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstStage_thrustSea.topAnchor.constraint(equalTo: firstStage_burningTime_value.bottomAnchor, constant: 15).isActive = true
        firstStage_thrustSea.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_thrustSea_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        firstStage_thrustSea_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_thrustSea_value.topAnchor.constraint(equalTo: firstStage_burningTime_value.bottomAnchor, constant: 15).isActive = true
        firstStage_thrustSea_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_thrustVacuum.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        firstStage_thrustVacuum.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstStage_thrustVacuum.topAnchor.constraint(equalTo: firstStage_thrustSea_value.bottomAnchor, constant: 15).isActive = true
        firstStage_thrustVacuum.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        firstStage_thrustVacuum_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        firstStage_thrustVacuum_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstStage_thrustVacuum_value.topAnchor.constraint(equalTo: firstStage_thrustSea_value.bottomAnchor, constant: 15).isActive = true
        firstStage_thrustVacuum_value.heightAnchor.constraint(equalToConstant: 16).isActive = true

        secondStage_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondStage_title.widthAnchor.constraint(equalToConstant: 165).isActive = true
        secondStage_title.topAnchor.constraint(equalTo: firstStage_thrustVacuum_value.bottomAnchor, constant: 30).isActive = true
        secondStage_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        secondStage_reusable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondStage_reusable.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondStage_reusable.topAnchor.constraint(equalTo: secondStage_title.bottomAnchor, constant: 20).isActive = true
        secondStage_reusable.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_reusable_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        secondStage_reusable_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondStage_reusable_value.topAnchor.constraint(equalTo: secondStage_title.bottomAnchor, constant: 20).isActive = true
        secondStage_reusable_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_enginesAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondStage_enginesAmount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondStage_enginesAmount.topAnchor.constraint(equalTo: secondStage_reusable_value.bottomAnchor, constant: 15).isActive = true
        secondStage_enginesAmount.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_enginesAmount_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        secondStage_enginesAmount_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondStage_enginesAmount_value.topAnchor.constraint(equalTo: secondStage_reusable_value.bottomAnchor, constant: 15).isActive = true
        secondStage_enginesAmount_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_fuelAmount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondStage_fuelAmount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondStage_fuelAmount.topAnchor.constraint(equalTo: secondStage_enginesAmount_value.bottomAnchor, constant: 15).isActive = true
        secondStage_fuelAmount.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_fuelAmount_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        secondStage_fuelAmount_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondStage_fuelAmount_value.topAnchor.constraint(equalTo: secondStage_enginesAmount_value.bottomAnchor, constant: 15).isActive = true
        secondStage_fuelAmount_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_burningTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondStage_burningTime.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondStage_burningTime.topAnchor.constraint(equalTo: secondStage_fuelAmount_value.bottomAnchor, constant: 15).isActive = true
        secondStage_burningTime.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_burningTime_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        secondStage_burningTime_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondStage_burningTime_value.topAnchor.constraint(equalTo: secondStage_fuelAmount_value.bottomAnchor, constant: 15).isActive = true
        secondStage_burningTime_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_thrust.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        secondStage_thrust.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondStage_thrust.topAnchor.constraint(equalTo: secondStage_burningTime_value.bottomAnchor, constant: 15).isActive = true
        secondStage_thrust.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        secondStage_thrust_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        secondStage_thrust_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondStage_thrust_value.topAnchor.constraint(equalTo: secondStage_burningTime_value.bottomAnchor, constant: 15).isActive = true
        secondStage_thrust_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        landingLegs_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        landingLegs_title.widthAnchor.constraint(equalToConstant: 155).isActive = true
        landingLegs_title.topAnchor.constraint(equalTo: secondStage_thrust_value.bottomAnchor, constant: 30).isActive = true
        landingLegs_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        landingLegs_amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        landingLegs_amount.widthAnchor.constraint(equalToConstant: 100).isActive = true
        landingLegs_amount.topAnchor.constraint(equalTo: landingLegs_title.bottomAnchor, constant: 20).isActive = true
        landingLegs_amount.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        landingLegs_amount_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        landingLegs_amount_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        landingLegs_amount_value.topAnchor.constraint(equalTo: landingLegs_title.bottomAnchor, constant: 20).isActive = true
        landingLegs_amount_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        landingLegs_material.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        landingLegs_material.widthAnchor.constraint(equalToConstant: 100).isActive = true
        landingLegs_material.topAnchor.constraint(equalTo: landingLegs_amount_value.bottomAnchor, constant: 15).isActive = true
        landingLegs_material.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        landingLegs_material_value.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 145).isActive = true
        landingLegs_material_value.widthAnchor.constraint(equalToConstant: 115).isActive = true
        landingLegs_material_value.topAnchor.constraint(equalTo: landingLegs_amount_value.bottomAnchor, constant: 15).isActive = true
        landingLegs_material_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        materials_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        materials_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        materials_title.topAnchor.constraint(equalTo: landingLegs_material_value.bottomAnchor, constant: 30).isActive = true
        materials_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        wiki.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        wiki.widthAnchor.constraint(equalToConstant: 117).isActive = true
        wiki.topAnchor.constraint(equalTo: materials_title.bottomAnchor, constant: 20).isActive = true
        wiki.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func present(_ viewControllerToPresent: UIViewController,
                            animated flag: Bool,
                            completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: flag, completion: completion)
      }

    
}

extension RocketDetailsVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RocketsViewController.indItem?.flickrImages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let url = URL(string: RocketsViewController.indItem?.flickrImages[indexPath.row] ?? "")
        DispatchQueue.global().async {
            let datta = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.myImage.image = UIImage(data: datta!)
            }
        }
        return cell
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let padding = sectionInsets.left * (itemsPerRow + 1)
    //        let availableWidth = view.frame.width - padding
    //        let widthPerItem = availableWidth / itemsPerRow
    
            return CGSize(width: 145, height: 196)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView2.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "cell2", for: indexPath) as! HeaderForCollectionView
//        header.galleryStoryData = galleryStory
//        header.catGalleryData = catGallery
//        header.imgGalleryCoverData = imgGalleryCover
//        header.buttonStory1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//
//        return header
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 699)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let imageInfo = DetailImageInfo(image: imgArray[indexPath.row], imageMode: .aspectFit)
//        let transitionInfo = DetailTransitionInfo(fromView: collectionView2)
//        let imageInDetail = DetailViewController(imageInfo: imageInfo, transitionInfo: transitionInfo)
//        imageInDetail.dismissCompletion = {
//            print("dismissed called")
//        }
//        present(imageInDetail, animated: true, completion: nil)
//    }
    
    
}


