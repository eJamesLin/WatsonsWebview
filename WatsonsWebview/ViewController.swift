//
//  ViewController.swift
//  WatsonsWebview
//
//  Created by cjlin on 2020/11/10.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let webview = WKWebView()
        webview.navigationDelegate = self
        view.addSubview(webview)
        webview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        webview.load(URLRequest(url: URL(string: "https://www.watsons.com.tw")!))
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if let url = navigationAction.request.url, url.scheme == "line" {
            decisionHandler(.cancel)
            UIApplication.shared.open(url)
            return
        }

        decisionHandler(.allow)
    }
}
