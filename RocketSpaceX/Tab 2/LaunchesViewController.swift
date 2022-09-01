//
//  LaunchesViewController.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 13.09.21.
//

import UIKit
import Foundation

// MARK: - WelcomeElement
struct LuanchesStruct: Codable {
    let fairings: Fairings?
    let links: Links
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let net: Bool
    let window: Int?
    let rocket: Rocket
    let success: Bool?
    let failures: [Failure]
    let details: String?
    let crew: [Crew]
    let ships, capsules, payloads: [String]?
    let launchpad: Launchpad
    let flightNumber: Int
    let name, dateUTC: String
    let dateUnix: Int
    let dateLocal: String?
    let datePrecision: DatePrecision
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }
}

// MARK: - Core
struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: LandingType?
    let landpad: Landpad?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}

enum Landpad: String, Codable {
    case the5E9E3032383Ecb267A34E7C7 = "5e9e3032383ecb267a34e7c7"
    case the5E9E3032383Ecb554034E7C9 = "5e9e3032383ecb554034e7c9"
    case the5E9E3032383Ecb6Bb234E7CA = "5e9e3032383ecb6bb234e7ca"
    case the5E9E3032383Ecb761634E7Cb = "5e9e3032383ecb761634e7cb"
    case the5E9E3032383Ecb90A834E7C8 = "5e9e3032383ecb90a834e7c8"
    case the5E9E3033383Ecb075134E7CD = "5e9e3033383ecb075134e7cd"
    case the5E9E3033383Ecbb9E534E7Cc = "5e9e3033383ecbb9e534e7cc"
}

// MARK: - Crew
struct Crew: Codable {
    let crew, role: String
}

enum DatePrecision: String, Codable {
    case day = "day"
    case hour = "hour"
    case month = "month"
    case quarter = "quarter"
}

// MARK: - Failure
struct Failure: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}

// MARK: - Fairings
struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [Ship]?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ships
    }
}

enum Ship: String, Codable {
    case the5Ea6Ed2E080Df4000697C907 = "5ea6ed2e080df4000697c907"
    case the5Ea6Ed2E080Df4000697C908 = "5ea6ed2e080df4000697c908"
    case the5Ea6Ed2E080Df4000697C909 = "5ea6ed2e080df4000697c909"
    case the5Ea6Ed2F080Df4000697C90B = "5ea6ed2f080df4000697c90b"
    case the5Ea6Ed2F080Df4000697C90C = "5ea6ed2f080df4000697c90c"
    case the5Ea6Ed2F080Df4000697C90D = "5ea6ed2f080df4000697c90d"
    case the6059166413F40E27E8Af34B6 = "6059166413f40e27e8af34b6"
    case the60C8C7A45D4819007Ea69871 = "60c8c7a45d4819007ea69871"
    case the618fad7e563d69573ed8caa9 = "618fad7e563d69573ed8caa9"
    case the5ea6ed30080df4000697c912 = "5ea6ed30080df4000697c912"
    case the614251b711a64135defb3654 = "614251b711a64135defb3654"
}

enum Launchpad: String, Codable {
    case the5E9E4501F509094Ba4566F84 = "5e9e4501f509094ba4566f84"
    case the5E9E4502F509092B78566F87 = "5e9e4502f509092b78566f87"
    case the5E9E4502F509094188566F88 = "5e9e4502f509094188566f88"
    case the5E9E4502F5090995De566F86 = "5e9e4502f5090995de566f86"
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String?
    let youtubeID: String?
    let article: String?
    let wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
    }
}

// MARK: - Flickr
struct Flickr: Codable {
    let small: [String]
    let original: [String]
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    let campaign: String?
    let launch: String?
    let media, recovery: String?
}

enum Rocket: String, Codable {
    case the5E9D0D95Eda69955F709D1Eb = "5e9d0d95eda69955f709d1eb"
    case the5E9D0D95Eda69973A809D1Ec = "5e9d0d95eda69973a809d1ec"
    case the5E9D0D95Eda69974Db09D1Ed = "5e9d0d95eda69974db09d1ed"
}



class LaunchesViewController: UIViewController {

    var isLoading: Bool = false
    static var launches: [LuanchesStruct] = []
    var filteredArray: [LuanchesStruct] = []
    static var launch: LuanchesStruct?
    var sortMenu = false
    var top: NSLayoutConstraint = NSLayoutConstraint()
    let cache = NSCache<NSNumber, UIImage>()
    var cvBottomToTbConstraint: [NSLayoutConstraint] = []
    var cvBottomToViewConstraint: [NSLayoutConstraint] = []
    let buttonView: UIView = UIView(frame: CGRect(x: 0,y: 0,width: 174,height: 32))
    let button1 = UIButton(type: .custom)
    let button2 = UIButton(type: .custom)
    let button3 = UIButton(type: .custom)
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(LaunchesCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(named: "Queen Blue")
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://api.spacexdata.com/v5/launches") {
            let semaphore = DispatchSemaphore(value: 0)
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        LaunchesViewController.launches = try JSONDecoder().decode([LuanchesStruct].self, from: data)
                        self.filteredArray = LaunchesViewController.launches
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
        
        
        buttonView.backgroundColor = UIColor(red: 0.435, green: 0.541, blue: 0.718, alpha: 1)
        buttonView.layer.cornerRadius = 8.91
        
        button1.frame = CGRect(x: 0, y: 2, width: 58, height: 28)
        button1.setTitle("All", for: .normal)
        button1.setTitleColor(UIColor(red: 0.078, green: 0.078, blue: 0.075, alpha: 1), for: .normal)
        button1.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        button1.tag = 0
        button1.addTarget(self, action: #selector(filterButton), for: .touchUpInside)
        
        
        button2.frame = CGRect(x: 58, y: 2, width: 58, height: 28)
        button2.setTitle("Past", for: .normal)
        button2.setTitleColor(UIColor(red: 0.078, green: 0.078, blue: 0.075, alpha: 1), for: .normal)
        button2.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        button2.tag = 1
        button2.addTarget(self, action: #selector(filterButton), for: .touchUpInside)
        
        button3.frame = CGRect(x: 116, y: 2, width: 58, height: 28)
        button3.setTitle("Future", for: .normal)
        button3.setTitleColor(UIColor(red: 0.078, green: 0.078, blue: 0.075, alpha: 1), for: .normal)
        button3.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        button3.tag = 2
        button3.addTarget(self, action: #selector(filterButton), for: .touchUpInside)
        
        buttonView.addSubview(button1)
        buttonView.addSubview(button2)
        buttonView.addSubview(button3)
        
        self.navigationItem.titleView = buttonView
        setFilterButton(button: button1)
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        
        setupView()
    }
    
    @objc func filterButton(sender:UIButton){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let date1 = dateFormatter.string(from: Date())
        
        if sender.tag == 0 {
            clearFilterButton(button: button2)
            clearFilterButton(button: button3)
            setFilterButton(button: button1)
            self.cache.removeAllObjects()
            filteredArray = LaunchesViewController.launches
            collectionView.reloadData()
        }
        else if sender.tag == 1 {
            clearFilterButton(button: button1)
            clearFilterButton(button: button3)
            setFilterButton(button: button2)
            self.cache.removeAllObjects()
            filteredArray = LaunchesViewController.launches.filter { $0.dateUTC <= date1 }
            collectionView.reloadData()
        }
        else {
            clearFilterButton(button: button1)
            clearFilterButton(button: button2)
            setFilterButton(button: button3)
            self.cache.removeAllObjects()
            filteredArray = LaunchesViewController.launches.filter { $0.dateUTC > date1 }
            collectionView.reloadData()
        }
    }
    
    func setFilterButton(button: UIButton){
        if button.layer.sublayers!.count > 2 {
            button.layer.sublayers?.removeLast(2)}
        let shadowPath0 = UIBezierPath(roundedRect: button.bounds, cornerRadius: 6.93)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 1
        layer0.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: button.bounds, cornerRadius: 6.93)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 8
        layer1.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.addSublayer(layer1)
        
        button.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        button.layer.cornerRadius = 6.93
    }
    
    func clearFilterButton(button: UIButton){
        button.backgroundColor = .clear
        if button.layer.sublayers!.count > 2 {
            button.layer.sublayers?.removeLast(2)}
    }
    
    func setupView(){
        view.addSubview(collectionView)
        setupconstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    @objc func sortTapped(){
        let alertController = UIAlertController(title: nil, message: "Choose your option", preferredStyle: .actionSheet)
        alertController.setValue(NSAttributedString(string: alertController.message! as String, attributes: [.font : UIFont(name: "SFProDisplay-Regular", size: 13)!,.foregroundColor : UIColor(named: "Slate Grey")!]), forKey: "attributedMessage")
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
           
        }
        cancelAction.setValue(UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1), forKey: "titleTextColor")
        alertController.addAction(cancelAction)

        let firstLaunchAction = UIAlertAction(title: "Launch date", style: .default) { (action) in
            self.cache.removeAllObjects()
            LaunchesViewController.launches.sort{ $0.dateUTC < $1.dateUTC }
            self.filteredArray = LaunchesViewController.launches
            self.collectionView.reloadData()
        }
        firstLaunchAction.setValue(UIColor(named: "Coral"), forKey: "titleTextColor")
        alertController.addAction(firstLaunchAction)

        let launchCostAction = UIAlertAction(title: "Title", style: .default) { (action) in
            self.cache.removeAllObjects()
            LaunchesViewController.launches.sort{ $0.name < $1.name }
            self.filteredArray = LaunchesViewController.launches
            self.collectionView.reloadData()
        }
        launchCostAction.setValue(UIColor(named: "Coral"), forKey: "titleTextColor")
        alertController.addAction(launchCostAction)
        
        let successRateAction = UIAlertAction(title: "Date", style: .default) { (action) in
            self.cache.removeAllObjects()
            LaunchesViewController.launches.sort{ $0.dateUTC < $1.dateUTC }
            self.filteredArray = LaunchesViewController.launches
            self.collectionView.reloadData()
        }
        successRateAction.setValue(UIColor(named: "Coral"), forKey: "titleTextColor")
        alertController.addAction(successRateAction)

        self.present(alertController, animated: true) {}
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
        self.cache.removeAllObjects()
        collectionView.reloadData()
    }
    
}

extension LaunchesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LaunchesCell
        
        let itemNumber = NSNumber(value: indexPath.item)
        if let cachedImage = cache.object(forKey: itemNumber) {
            print("Using a cached image for item: \(itemNumber)")
            cell.img.image = cachedImage
        } else {
            let url = URL(string: filteredArray[indexPath.row].links.patch.small ?? "https://images2.imgbox.com/53/22/dh0XSLXO_o.png")
            DispatchQueue.global().async {
                guard let datta = try? Data(contentsOf: url!) else { return }
                DispatchQueue.main.async {
                    cell.img.image = UIImage(data: datta)
                    self.cache.setObject(cell.img.image!, forKey: itemNumber)
                }
            }
            
        }
        
        cell.data = filteredArray[indexPath.row]
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
        
        return CGSize(width: collectionView.bounds.size.width - 36, height: 145)
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
        LaunchesViewController.launch = filteredArray[indexPath.item]
        let modalVCS = LaunchesDetailVC()
        //modalVCS.modalPresentationStyle = .fullScreen
        let itemNumber = NSNumber(value: indexPath.item)
        if let cachedImage = cache.object(forKey: itemNumber) {
            print("Using a cached image for item: \(itemNumber)")
            modalVCS.img.image = cachedImage
        }
        
        navigationController?.pushViewController(modalVCS, animated: true)
        //self.present(modalVCS, animated: true, completion: nil)
    }
}
