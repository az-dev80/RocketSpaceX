//
//  RocketsViewController.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 13.09.21.
//

import UIKit

//struct MyData: Codable {
//    let name: String
//    let first_flight: String
//    let cost_per_launch: Int
//    let success_rate_pct: Int
//    let type: String
//    let flickr_images: [String]
//    let description: String
//    let mass: [String: Int]
//    let height: [String: Double]
//    let diameter: [String: Double]
//    //let engines: [String: Any]
//}

struct MyData: Codable {
    let height, diameter: Diameter
    let mass: Mass?
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    let payloadWeights: [PayloadWeight]
    let flickrImages: [String]
    let name, type: String
    let active: Bool?
    let stages, boosters, costPerLaunch, successRatePct: Int
    let firstFlight, country, company: String
    let wikipedia: String
    let welcomeDescription, id: String

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name, type, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia
        case welcomeDescription = "description"
        case id
    }
}

// MARK: - Diameter
struct Diameter: Codable {
    let meters, feet: Double?
}

// MARK: - Engines
struct Engines: Codable {
    let isp: ISP
    let thrustSeaLevel, thrustVacuum: Thrust
    let number: Int?
    let type, version, layout: String?
    let engineLossMax: Int?
    let propellant1, propellant2: String?
    let thrustToWeight: Double?

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - ISP
struct ISP: Codable {
    let seaLevel, vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

// MARK: - Thrust
struct Thrust: Codable {
    let kN, lbf: Int?
}

// MARK: - FirstStage
struct FirstStage: Codable {
    let thrustSeaLevel, thrustVacuum: Thrust
    let reusable: Bool?
    let engines, fuelAmountTons, burnTimeSEC: Double?

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable {
    let number: Int?
    let material: String?
}

// MARK: - Mass
struct Mass: Codable {
    let kg, lb: Int?
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id, name: String?
    let kg, lb: Int?
}

// MARK: - SecondStage
struct SecondStage: Codable {
    let thrust: Thrust
    let payloads: Payloads
    let reusable: Bool?
    let engines, fuelAmountTons, burnTimeSEC: Double?

    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Payloads
struct Payloads: Codable {
    let compositeFairing: CompositeFairing
    let option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable {
    let height, diameter: Diameter
}

class RocketsViewController: UIViewController {
    var isLoading: Bool = false
    static var res: [MyData] = []
    static var indItem: MyData?
    var sortMenu = false
    var top: NSLayoutConstraint = NSLayoutConstraint()
    let cache = NSCache<NSNumber, UIImage>()
    var cvBottomToTbConstraint: [NSLayoutConstraint] = []
    var cvBottomToViewConstraint: [NSLayoutConstraint] = []
//    fileprivate let label:UILabel = {
//        let tl = UILabel()
//        tl.translatesAutoresizingMaskIntoConstraints = false
//        tl.text = "Choose your option"
//        tl.textAlignment = .center
//        tl.textColor = UIColor(named: "Slate Grey")
//        tl.font = UIFont(name: "SF-Pro-Display-Regular", size: 13)
//
//        return tl
//    }()
//
//    let firstLaunchButton: UIButton = UIButton()
//    let launchCostButton: UIButton = UIButton()
//    let successRateButton: UIButton = UIButton()
//    let cancelButton: UIButton = UIButton()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(RocketsCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(named: "Queen Blue")
        
        return cv
    }()
    
//    func setButton(button: UIButton, withTitle: String, withColor: UIColor, withFontName:String, andTag:Int) {
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("+", for: .normal)
//        button.setTitleColor(withColor, for: .normal)
//        button.titleLabel?.font = UIFont(name: withFontName, size: 17)
//        button.tag = andTag
//        //button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 6, right: 0)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        button.backgroundColor = .white
//        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(sortButtonAction), for: .touchUpInside)
//        view.addSubview(button)
//    }
    
    @objc func sortButtonAction(sender:UIButton){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://api.spacexdata.com/v4/rockets") {
            let semaphore = DispatchSemaphore(value: 0)
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        RocketsViewController.res = try JSONDecoder().decode([MyData].self, from: data)
                        //print(RocketsViewController.res)
                        semaphore.signal()
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
            _ = semaphore.wait(timeout: .distantFuture)
        }

        view.backgroundColor = UIColor(named: "Queen Blue")
      
        let img = UIImage(named: "button-sort.png")!.withRenderingMode(.alwaysOriginal)
        let sortButton = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(sortTapped))
        
        navigationItem.title = ""
        navigationItem.rightBarButtonItem = sortButton
        
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        
        setupView()
    }
    
    func setupView(){
        view.addSubview(collectionView)
        setupconstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
        print("VC1 ok")
    }
    
    @objc func sortTapped(){
        let alertController = UIAlertController(title: nil, message: "Choose your option", preferredStyle: .actionSheet)
        alertController.setValue(NSAttributedString(string: alertController.message! as String, attributes: [.font : UIFont(name: "SFProDisplay-Regular", size: 13)!,.foregroundColor : UIColor(named: "Slate Grey")!]), forKey: "attributedMessage")
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
           
        }
        cancelAction.setValue(UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1), forKey: "titleTextColor")
        alertController.addAction(cancelAction)

        let firstLaunchAction = UIAlertAction(title: "First launch", style: .default) { (action) in
            self.cache.removeAllObjects()
            RocketsViewController.res.sort{ $0.firstFlight < $1.firstFlight }
            self.collectionView.reloadData()
        }
        firstLaunchAction.setValue(UIColor(named: "Coral"), forKey: "titleTextColor")
        alertController.addAction(firstLaunchAction)

        let launchCostAction = UIAlertAction(title: "Launch cost", style: .default) { (action) in
            self.cache.removeAllObjects()
            RocketsViewController.res.sort{ $0.costPerLaunch < $1.costPerLaunch }
            self.collectionView.reloadData()
        }
        launchCostAction.setValue(UIColor(named: "Coral"), forKey: "titleTextColor")
        alertController.addAction(launchCostAction)
        
        let successRateAction = UIAlertAction(title: "Success rate", style: .default) { (action) in
            self.cache.removeAllObjects()
            RocketsViewController.res.sort{ $0.successRatePct < $1.successRatePct }
            self.collectionView.reloadData()
        }
        successRateAction.setValue(UIColor(named: "Coral"), forKey: "titleTextColor")
        alertController.addAction(successRateAction)

        self.present(alertController, animated: true) {
            
        }
//        if sortMenu == false {
//            top.constant = 200
//            sortMenu = true
//        }else{
//            top.constant = 0
//            sortMenu = false
//        }
//        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: { self.view.layoutIfNeeded()}) { (animationComplete) in
//            print("Animation completed")
//        }
    }
    
    func setupconstraint(){
        
        cvBottomToViewConstraint = [collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)]
        top = collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
            top.isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        NSLayoutConstraint.deactivate(cvBottomToTbConstraint)
        NSLayoutConstraint.activate(cvBottomToViewConstraint)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        setupconstraint()
        collectionView.reloadData()
    }
    
}

extension RocketsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return RocketsViewController.res.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RocketsCell
        
        let itemNumber = NSNumber(value: indexPath.item)
        if let cachedImage = cache.object(forKey: itemNumber) {
            print("Using a cached image for item: \(itemNumber)")
            cell.img.image = cachedImage
        } else {
            let url = URL(string: RocketsViewController.res[indexPath.row].flickrImages.last ?? "")
            DispatchQueue.global().async {
                guard let datta = try? Data(contentsOf: url!) else { return }
                DispatchQueue.main.async {
                    cell.img.image = UIImage(data: datta)
                    self.cache.setObject(cell.img.image!, forKey: itemNumber)
                }
            }
            
        }
        cell.data = RocketsViewController.res[indexPath.row]
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 12
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.37).cgColor
        cell.layer.shadowRadius = 6.0
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 10).cgPath;

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 36, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        
        if contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height) - 60 {
            guard !self.isLoading else { return }
            self.isLoading = true
            
            tabBarController?.tabBar.isHidden = false
            tabBarController?.tabBar.isTranslucent = false
            cvBottomToTbConstraint = [collectionView.bottomAnchor.constraint(equalTo: (tabBarController?.tabBar.topAnchor)!, constant: 0)]
            NSLayoutConstraint.deactivate(cvBottomToViewConstraint)
            NSLayoutConstraint.activate(cvBottomToTbConstraint)
           self.isLoading = false
        }
        if contentOffsetY < (scrollView.contentSize.height - scrollView.bounds.height) - 20{
            guard !self.isLoading else { return }
            self.isLoading = true
            //NSLayoutConstraint.deactivate(cvBottomToTbConstraint)
            //NSLayoutConstraint.activate(cvBottomToViewConstraint)
        tabBarController?.tabBar.isHidden = true
            self.extendedLayoutIncludesOpaqueBars = true
            collectionView.clipsToBounds = false
            self.isLoading = false
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        RocketsViewController.indItem = RocketsViewController.res[indexPath.item]
        let modalVCS = RocketDetailsVC()
        modalVCS.modalPresentationStyle = .fullScreen
        let itemNumber = NSNumber(value: indexPath.item)
        if let cachedImage = cache.object(forKey: itemNumber) {
            print("Using a cached image for item: \(itemNumber)")
            modalVCS.imgCover.image = cachedImage
        }
        self.present(modalVCS, animated: true, completion: nil)
    }
}
