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

    @IBOutlet weak var webView: WKWebView!
    var pageName: String? {
        didSet {
            guard let name = pageName, !name.isEmpty,
            let filePath = Bundle.main.path(forResource: "H5/" + name, ofType: "html") else {
                assert(false)
                return
            }
            let url = URL(fileURLWithPath: filePath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
}

extension ViewController: WKUIDelegate {
    
}

extension ViewController: WKNavigationDelegate {
    
}
