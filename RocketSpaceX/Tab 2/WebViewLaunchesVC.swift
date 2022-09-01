//
//  WebViewLaunchesVC.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 23.10.21.
//

import UIKit
import WebKit

class WebViewLaunchesVC: UIViewController,WKNavigationDelegate {
    
    var webView: WKWebView!
    var url: URL?
    var name: String?
    //init(){}
    convenience init?(url: URL, name: String) {
        self.init()
        self.url = url
        self.name = name
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let presenter = presentingViewController as? LaunchesDetailVC {
//            url = presenter.urlToPass
//            name = presenter.nameToPass
//        }
        print(url)
        self.title = name
        //modalPresentationStyle = .fullScreen
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 22)
        button.setImage(UIImage(named: "Icon"), for: .normal)
        button.setAttributedTitle(NSAttributedString(string: "Back", attributes: [.font: UIFont(name: "Roboto-Medium", size: 17)!]), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.tintColor = UIColor(named: "Coral")!
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        let updButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshAction))
        updButton.tintColor = UIColor(named: "Coral")!
        navigationItem.rightBarButtonItem = updButton
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        self.navigationController?.isToolbarHidden = false
        
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(image: UIImage(named: "ArrowLeft"), style: .plain, target: self, action: #selector(backWebviewAction))
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(image: UIImage(named: "ArrowRight"), style: .plain, target: self, action: #selector(forwardWebviewAction))
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(shareAction))
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(image: UIImage(named: "safari"), style: .plain, target: self, action: #selector(safariAction))
        )
        toolbarItems = items
        self.navigationController?.toolbar.barTintColor = UIColor(named: "Queen Blue")
        self.navigationController?.toolbar.tintColor = UIColor(named: "Coral")
        
        //url = URL(string: RocketsViewController.indItem!.wikipedia)!
        webView.load(URLRequest(url: (url ?? URL(string:"https://www.wikipedia.org"))!))

    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func refreshAction(){
        webView.reload()
    }
    
    @objc func backWebviewAction(){
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func forwardWebviewAction(){
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func shareAction(sender:UIView){
        let activityVC = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    @objc func safariAction(){
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard case .linkActivated = navigationAction.navigationType,
              let url1 = navigationAction.request.url
        else {
            decisionHandler(.allow)
            return
        }
        decisionHandler(.allow)
        url = url1
    }
}
