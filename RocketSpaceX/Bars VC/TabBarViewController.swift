//
//  TabBarViewController.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 13.09.21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let separator = UIView(frame: CGRect(x: 135, y: 70, width: 135, height: 5))
//        separator.layer.backgroundColor = UIColor.black.cgColor
//        tabBar.addSubview(separator)
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tabBar.frame.size.height = 83
        tabBar.frame.origin.y = view.frame.height - 83
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
