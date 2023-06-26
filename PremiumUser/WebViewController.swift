//
//  WebViewController.swift
//  PremiumUser
//
//  Created by oleg on 25.06.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    let webView: WKWebView = .init(frame: .zero, configuration: WKWebViewConfiguration())
    let urlForWebView: URL

    init(urlForWebView: URL) {
        self.urlForWebView = urlForWebView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


    func setup() {
        view = webView
        let myRequest = URLRequest(url: urlForWebView)
        webView.load(myRequest)
    }




    }


