//
//  LaunchesDetailVC.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 22.10.21.
//

import UIKit

class LaunchesDetailVC: UIViewController {
    static var imagesURL: [String] = []
    let cache = NSCache<NSNumber, UIImage>()
    var urlToPass: URL?
    var nameToPass: String!
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
    
    
    let description_title:UILabel = UILabel()
    let description_value:UILabel = UILabel()
    
    let overview_title:UILabel = UILabel()
    let first_flight:UILabel = UILabel()
    let first_flight_value:UILabel = UILabel()
    let cost_per_launch:UILabel = UILabel()
    let cost_per_launch_value:UILabel = UILabel()
    let success_rate_pct:UILabel = UILabel()
    let success_rate_pct_value:UILabel = UILabel()
    let images_title:UILabel = UILabel()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = .init(width: 145, height: 196)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(named: "White")
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(LaunchesDetailCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    var images:[String] = []
    
    let rocket_title:UILabel = UILabel()
    let rocket_stack_view: UIView = UIView()
    let rocket_img: UIImageView = {
        let iv1 = UIImageView()
        iv1.translatesAutoresizingMaskIntoConstraints = false
        iv1.contentMode = .scaleAspectFill
        iv1.clipsToBounds = true
        iv1.layer.cornerRadius = 12
        iv1.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return iv1
    }()
    
    let rocket_name:UILabel = UILabel()
    let rocket_first_flight:UILabel = UILabel()
    let rocket_first_flight_value:UILabel = UILabel()
    let rocket_cost_per_launch:UILabel = UILabel()
    let rocket_cost_per_launch_value:UILabel = UILabel()
    let rocket_success_rate_pct:UILabel = UILabel()
    let rocket_success_rate_pct_value:UILabel = UILabel()
    
    let materials_title:UILabel = UILabel()
    let reddit:UILabel = UILabel()
    let wiki:UIButton = UIButton()
    let youtube:UIButton = UIButton()
    
    let recovery:UIButton = UIButton()
    let media:UIButton = UIButton()
    let campaign:UIButton = UIButton()
    let launch:UIButton = UIButton()
    
    @objc func wikiAction(sender: UIButton){
        
        nameToPass = LaunchesViewController.launch?.name
        if sender.tag == 0 {
            urlToPass = URL(string: LaunchesViewController.launch?.links.wikipedia ?? "https://www.wikipedia.org")
            
        }
        else if sender.tag == 1 {
            urlToPass = URL(string: LaunchesViewController.launch?.links.webcast ?? "https://www.youtube.com")
        }
        else if sender.tag == 2 {
            urlToPass = URL(string: LaunchesViewController.launch?.links.reddit.recovery ?? "https://www.reddit.com")
        }
        else if sender.tag == 3 {
            urlToPass = URL(string: LaunchesViewController.launch?.links.reddit.media ?? "https://www.reddit.com")
        }
        else if sender.tag == 4 {
            urlToPass = URL(string: LaunchesViewController.launch?.links.reddit.campaign ?? "https://www.reddit.com")
        }
        else {
            urlToPass = URL(string: LaunchesViewController.launch?.links.reddit.launch ?? "https://www.reddit.com")
        }
        
        let modalVCS = WebViewLaunchesVC(url: urlToPass!, name: nameToPass)
        modalVCS?.modalPresentationStyle = .fullScreen
        
        let navVC = UINavigationController(rootViewController: modalVCS!)
        navVC.navigationBar.titleTextAttributes = [.font: UIFont(name: "Roboto-Bold", size: 24)!, .foregroundColor: UIColor(named: "White")!]
        
       self.present(navVC, animated: true, completion: nil)
    }
    
    func setLabel(label: UILabel, name: String, withColor: UIColor, andFontSize:CGFloat) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = withColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: name, size: andFontSize)
        contentView.addSubview(label)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = LaunchesViewController.launch?.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let date1 = dateFormatter.date(from: LaunchesViewController.launch?.dateUTC ?? "") ?? Date()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateFormatter.timeZone = .current
        self.date.text = dateFormatter.string(from: date1)
        flight_number.text = "#" + String(LaunchesViewController.launch!.flightNumber)
        
        if date1 > Date() {
            successIcon.image = UIImage(named: "clock")
        } else {
            successIcon.image = UIImage(named: "check")
        }
        
        description_title.text = "Description"
        description_value.text = LaunchesViewController.launch!.details
        
        overview_title.text = "Overview"
        first_flight.text = "Static fire date"
        if let x = LaunchesViewController.launch!.staticFireDateUTC {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            let date1 = dateFormatter.date(from: x) ?? Date()
            dateFormatter.dateFormat = "MMMM d, yyyy"
            dateFormatter.timeZone = .current
            first_flight_value.text = dateFormatter.string(from: date1)
        }
        cost_per_launch.text = "Launch date"
        if let x = LaunchesViewController.launch?.dateUTC {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            let date1 = dateFormatter.date(from: x) ?? Date()
            dateFormatter.dateFormat = "MMMM d, yyyy"
            dateFormatter.timeZone = .current
            cost_per_launch_value.text = dateFormatter.string(from: date1)
        }
        
        success_rate_pct.text = "Success"
        if let x = LaunchesViewController.launch!.success {
            if x == true {
                success_rate_pct_value.text = "Yes"
            }  else if x == false {
                success_rate_pct_value.text = "Yes"
            } else {
                success_rate_pct_value.text = "n/a"
            }
        }
        
        images_title.text = "Images"
        LaunchesDetailVC.imagesURL = LaunchesViewController.launch?.links.flickr.original ?? []
        rocket_title.text = "Rocket"
        rocket_first_flight.text = "First launch"
        rocket_cost_per_launch.text = "Launch cost"
        rocket_success_rate_pct.text = "Success"
        let id = LaunchesViewController.launch?.rocket.rawValue
        for i in RocketsViewController.res {
            if i.id == id {
                rocket_name.text = i.name
                
                let url = URL(string: i.flickrImages.last ?? "")
                DispatchQueue.global().async {
                    guard let datta = try? Data(contentsOf: url!) else { return }
                    DispatchQueue.main.async {
                        self.rocket_img.image = UIImage(data: datta)
                    }
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: i.firstFlight)
                dateFormatter.dateFormat = "MMMM d, yyyy"
                
                rocket_first_flight_value.text = dateFormatter.string(from: date!)
                rocket_cost_per_launch_value.text = String(i.costPerLaunch) + "$"
                rocket_success_rate_pct_value.text = String(i.successRatePct) + "%"
            }
        }
        
        materials_title.text = "Materials"
        reddit.text = "Reddit"
        //wikiURL.text = RocketsViewController.indItem?.wikipedia
        
        
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        setLabel(label: name, name: "Roboto-Bold", withColor: .black, andFontSize: 24)
        setLabel(label: date, name: "Roboto-Medium", withColor: .black, andFontSize: 17)
        setLabel(label: flight_number, name: "Roboto-Medium", withColor: UIColor(named: "Cyan Process")!, andFontSize: 17)
        
        contentView.addSubview(img)
        contentView.addSubview(successIcon)
        
        setLabel(label: description_title, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: description_value, name: "Roboto-Medium", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: overview_title, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: first_flight, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: first_flight_value, name: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: cost_per_launch, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: cost_per_launch_value, name: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: success_rate_pct, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 14)
        setLabel(label: success_rate_pct_value, name: "Roboto-Bold", withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: images_title, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        contentView.addSubview(collectionView)
        
        setLabel(label: rocket_title, name: "Roboto-Bold", withColor: .black, andFontSize: 24)
        
        contentView.addSubview(rocket_stack_view)
        rocket_stack_view.translatesAutoresizingMaskIntoConstraints = false
        
        setLabel(label: rocket_name, name: "Roboto-Bold",withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setLabel(label: rocket_first_flight, name: "Roboto-Bold",withColor: UIColor.black, andFontSize: 14)
        setLabel(label: rocket_cost_per_launch, name: "Roboto-Bold",withColor: UIColor.black, andFontSize: 14)
        setLabel(label: rocket_success_rate_pct, name: "Roboto-Bold",withColor: UIColor.black, andFontSize: 14)
        setLabel(label: rocket_first_flight_value, name: "Roboto-Bold",withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: rocket_cost_per_launch_value, name: "Roboto-Bold",withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        setLabel(label: rocket_success_rate_pct_value, name: "Roboto-Bold",withColor: UIColor(named: "Slate Grey")!, andFontSize: 14)
        
        contentView.addSubview(rocket_img)
        
        setLabel(label: materials_title, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setButtons(bt: wiki, title: "Wikipedia", tag:0)
        setButtons(bt: youtube, title: "Youtube", tag:1)
        
        setLabel(label: reddit, name: "Roboto-Bold", withColor: UIColor(named: "Smoky Black")!, andFontSize: 24)
        setButtons(bt: recovery, title: "Recovery", tag:2)
        setButtons(bt: media, title: "Media", tag:3)
        setButtons(bt: campaign, title: "Campaign", tag:4)
        setButtons(bt: launch, title: "Launch", tag:5)
        
        setupconstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1573)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        rocket_stack_view.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        addShadow(bt: rocket_stack_view)
        addShadowButton(bt: wiki)
        addShadowButton(bt: youtube)
        addShadowButton(bt: recovery)
        addShadowButton(bt: media)
        addShadowButton(bt: campaign)
        addShadowButton(bt: launch)
    }
    
    func setButtons(bt:UIButton, title:String, tag: Int){
        bt.setTitle(title, for: .normal)
        bt.setTitleColor(UIColor(named: "Coral"), for: .normal)
        bt.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 17)
        bt.setImage(UIImage(named: "Vector3"), for: .normal)
        bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: -36, bottom: 0, right: 0)
        bt.imageEdgeInsets = UIEdgeInsets(top: 0, left: 91, bottom: 0, right: 0)
        bt.backgroundColor = UIColor(named: "White")
        //bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 6, right: 0)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.layer.cornerRadius = 16
        bt.clipsToBounds = false
        bt.addTarget(self, action: #selector(wikiAction), for: .touchUpInside)
        bt.tag = tag
        contentView.addSubview(bt)
    }
    
    func addShadow(bt:UIView){
        bt.layer.cornerRadius = 20
        let shadowPath0 = UIBezierPath(roundedRect: bt.bounds, cornerRadius: 20)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.3).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 1
        layer0.shadowOffset = CGSize(width: 1.5, height: 1.5)
        bt.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: bt.bounds, cornerRadius: 20)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 1
        layer1.shadowOffset = CGSize(width: -1.5, height: -1.5)
        bt.layer.addSublayer(layer1)
    }
    
    func addShadowButton(bt:UIButton){
        let shadowPath0 = UIBezierPath(roundedRect: bt.bounds, cornerRadius: 16)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.3).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 1
        layer0.shadowOffset = CGSize(width: 1.5, height: 1.5)
        bt.layer.insertSublayer(layer0, at: 0)
        let shadowPath1 = UIBezierPath(roundedRect: bt.bounds, cornerRadius: 16)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 1
        layer1.shadowOffset = CGSize(width: -1.5, height: -1.5)
        bt.layer.insertSublayer(layer1, at: 1)
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
        contentView.heightAnchor.constraint(equalToConstant: 1573).isActive = true
        
        img.widthAnchor.constraint(equalToConstant: 91).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45).isActive = true
        img.heightAnchor.constraint(equalToConstant: 80).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
       
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 28).isActive = true
        name.widthAnchor.constraint(equalToConstant: 250).isActive = true
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        
        date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        date.heightAnchor.constraint(equalToConstant: 22).isActive = true
        date.widthAnchor.constraint(equalToConstant: 200).isActive = true
        date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15).isActive = true
        
        successIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23).isActive = true
        successIcon.heightAnchor.constraint(equalToConstant: 26).isActive = true
        successIcon.widthAnchor.constraint(equalToConstant: 26).isActive = true
        successIcon.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 22).isActive = true
        
        flight_number.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 72).isActive = true
        flight_number.heightAnchor.constraint(equalToConstant: 22).isActive = true
        flight_number.widthAnchor.constraint(equalToConstant: 40).isActive = true
        flight_number.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 24).isActive = true
        
        description_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        description_title.widthAnchor.constraint(equalToConstant: 130).isActive = true
        description_title.topAnchor.constraint(equalTo: flight_number.bottomAnchor, constant: 45).isActive = true
        description_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        let hightD = computeHeight(text: LaunchesViewController.launch?.details ?? "", width: view.bounds.width - 50)
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

        images_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        images_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        images_title.topAnchor.constraint(equalTo: success_rate_pct_value.bottomAnchor, constant: 30).isActive = true
        images_title.heightAnchor.constraint(equalToConstant: 28).isActive = true

        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 374).isActive = true
        collectionView.topAnchor.constraint(equalTo: images_title.bottomAnchor, constant: 20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 196).isActive = true

        
        rocket_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        rocket_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        rocket_title.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30).isActive = true
        rocket_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        rocket_stack_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        rocket_stack_view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        rocket_stack_view.topAnchor.constraint(equalTo: rocket_title.bottomAnchor, constant: 20).isActive = true
        rocket_stack_view.heightAnchor.constraint(equalToConstant: 360).isActive = true
        
        rocket_img.heightAnchor.constraint(equalToConstant: 240).isActive = true
        rocket_img.widthAnchor.constraint(equalTo: rocket_stack_view.widthAnchor).isActive = true
        rocket_img.topAnchor.constraint(equalTo: rocket_stack_view.topAnchor, constant: 0).isActive = true
        rocket_img.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 0).isActive = true
        rocket_img.trailingAnchor.constraint(equalTo: rocket_stack_view.trailingAnchor, constant: 0).isActive = true
       
        rocket_name.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 20).isActive = true
        rocket_name.heightAnchor.constraint(equalToConstant: 28).isActive = true
        rocket_name.widthAnchor.constraint(equalToConstant: 300).isActive = true
        rocket_name.topAnchor.constraint(equalTo: rocket_img.bottomAnchor, constant: 10).isActive = true
        
        rocket_first_flight.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 20).isActive = true
        rocket_first_flight.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rocket_first_flight.widthAnchor.constraint(equalToConstant: 74).isActive = true
        rocket_first_flight.topAnchor.constraint(equalTo: rocket_name.bottomAnchor, constant: 27).isActive = true
        
        rocket_cost_per_launch.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 157).isActive = true
        rocket_cost_per_launch.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rocket_cost_per_launch.widthAnchor.constraint(equalToConstant: 77).isActive = true
        rocket_cost_per_launch.topAnchor.constraint(equalTo: rocket_name.bottomAnchor, constant: 27).isActive = true
        
        rocket_success_rate_pct.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 264).isActive = true
        rocket_success_rate_pct.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rocket_success_rate_pct.widthAnchor.constraint(equalToConstant: 54).isActive = true
        rocket_success_rate_pct.topAnchor.constraint(equalTo: rocket_name.bottomAnchor, constant: 27).isActive = true
        
        rocket_first_flight_value.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 20).isActive = true
        rocket_first_flight_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rocket_first_flight_value.widthAnchor.constraint(equalToConstant: 127).isActive = true
        rocket_first_flight_value.topAnchor.constraint(equalTo: rocket_name.bottomAnchor, constant: 45).isActive = true
        
        rocket_cost_per_launch_value.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 157).isActive = true
        rocket_cost_per_launch_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rocket_cost_per_launch_value.widthAnchor.constraint(equalToConstant: 77).isActive = true
        rocket_cost_per_launch_value.topAnchor.constraint(equalTo: rocket_name.bottomAnchor, constant: 45).isActive = true
        
        rocket_success_rate_pct_value.leadingAnchor.constraint(equalTo: rocket_stack_view.leadingAnchor, constant: 264).isActive = true
        rocket_success_rate_pct_value.heightAnchor.constraint(equalToConstant: 16).isActive = true
        rocket_success_rate_pct_value.widthAnchor.constraint(equalToConstant: 35).isActive = true
        rocket_success_rate_pct_value.topAnchor.constraint(equalTo: rocket_name.bottomAnchor, constant: 45).isActive = true
        
        
        materials_title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        materials_title.widthAnchor.constraint(equalToConstant: 115).isActive = true
        materials_title.topAnchor.constraint(equalTo: rocket_stack_view.bottomAnchor, constant: 30).isActive = true
        materials_title.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        wiki.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        wiki.widthAnchor.constraint(equalToConstant: 117).isActive = true
        wiki.topAnchor.constraint(equalTo: materials_title.bottomAnchor, constant: 20).isActive = true
        wiki.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        youtube.leadingAnchor.constraint(equalTo: wiki.trailingAnchor, constant: 15).isActive = true
        youtube.widthAnchor.constraint(equalToConstant: 117).isActive = true
        youtube.topAnchor.constraint(equalTo: materials_title.bottomAnchor, constant: 20).isActive = true
        youtube.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        reddit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        reddit.widthAnchor.constraint(equalToConstant: 115).isActive = true
        reddit.topAnchor.constraint(equalTo: wiki.bottomAnchor, constant: 30).isActive = true
        reddit.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        recovery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        recovery.widthAnchor.constraint(equalToConstant: 117).isActive = true
        recovery.topAnchor.constraint(equalTo: reddit.bottomAnchor, constant: 20).isActive = true
        recovery.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        media.leadingAnchor.constraint(equalTo: recovery.trailingAnchor, constant: 15).isActive = true
        media.widthAnchor.constraint(equalToConstant: 117).isActive = true
        media.topAnchor.constraint(equalTo: reddit.bottomAnchor, constant: 20).isActive = true
        media.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        campaign.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        campaign.widthAnchor.constraint(equalToConstant: 117).isActive = true
        campaign.topAnchor.constraint(equalTo: recovery.bottomAnchor, constant: 20).isActive = true
        campaign.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        launch.leadingAnchor.constraint(equalTo: campaign.trailingAnchor, constant: 15).isActive = true
        launch.widthAnchor.constraint(equalToConstant: 117).isActive = true
        launch.topAnchor.constraint(equalTo: recovery.bottomAnchor, constant: 20).isActive = true
        launch.heightAnchor.constraint(equalToConstant: 32).isActive = true
//        launch.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
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

extension LaunchesDetailVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LaunchesViewController.launch?.links.flickr.original.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LaunchesDetailCell
        
        let url = URL(string: LaunchesViewController.launch?.links.flickr.original[indexPath.row] ?? "")
        DispatchQueue.global().async {
            guard let datta = try? Data(contentsOf: url!) else { return }
            DispatchQueue.main.async {
                cell.myImage.image = UIImage(data: datta)
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
    
}
