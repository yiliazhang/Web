//
//  ViewController.swift
//  Web
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView!
    var pageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if webView == nil {
            webView = WKWebView(frame: view.bounds)
            webView.uiDelegate = self
            webView.navigationDelegate = self
            guard let name = pageName, !name.isEmpty,
                let filePath = Bundle.main.path(forResource: "H5/" + name, ofType: "html") else {
                    assert(false)
                    return
            }
            let url = URL(fileURLWithPath: filePath)
            let request = URLRequest(url: url)
            webView.load(request)
            view.addSubview(webView)
        }
    }
}

extension ViewController: WKUIDelegate {
    
}

extension ViewController: WKNavigationDelegate {
    
}
