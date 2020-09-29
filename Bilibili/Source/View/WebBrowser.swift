//
//  WebBrowser.swift
//  Alamofire
//
//  Created by admin on 2020/9/29.
//

import SwiftUI
import WebKit

public class SUIWebBrowserObject: WKWebView, WKNavigationDelegate, ObservableObject {
    private var observers: [NSKeyValueObservation?] = []
    
    private func subscriber<Value>(for keyPath: KeyPath<SUIWebBrowserObject, Value>) -> NSKeyValueObservation {
        observe(keyPath, options: [.prior]) { object, change in
            if change.isPrior {
                self.objectWillChange.send()
            }
        }
    }
    
    private func setupObservers() {
        observers = [
            subscriber(for: \.title),
            subscriber(for: \.url),
            subscriber(for: \.isLoading),
            subscriber(for: \.estimatedProgress),
            subscriber(for: \.hasOnlySecureContent),
            subscriber(for: \.serverTrust),
            subscriber(for: \.canGoBack),
            subscriber(for: \.canGoForward)
        ]
    }
    
    public override init(frame: CGRect = .zero, configuration: WKWebViewConfiguration = WKWebViewConfiguration()) {
        super.init(frame: frame, configuration: configuration)
        navigationDelegate = self
        setupObservers()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationDelegate = self
        setupObservers()
    }
}

public struct SUIWebBrowserView: UIViewRepresentable {
    public typealias UIViewType = UIView
    
    private var browserObject: SUIWebBrowserObject
    
    public init(browserObject: SUIWebBrowserObject) {
        self.browserObject = browserObject
    }
    
    public func makeUIView(context: Self.Context) -> Self.UIViewType {
        browserObject
    }
    
    public func updateUIView(_ uiView: Self.UIViewType, context: Self.Context) {
        //
    }
}

public struct WebBrowser: View {
    @ObservedObject var browser = SUIWebBrowserObject()
    
    init(address: String) {
        guard let a = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let u = URL(string: a) else { return }
        browser.load(URLRequest(url: u))
    }
    
    func ItemImage(systemName: String) -> some View {
        Image(systemName: systemName)
            .imageScale(.large).aspectRatio(contentMode: .fit)
            .frame(width: 32, height: 32)
    }
    
    var Title: Text {
        Text(verbatim: browser.url?.absoluteString.removingPercentEncoding ?? "")
    }
    
    var LItems: some View {
        HStack {
            Button(action: {
                self.browser.goBack()
            }) {
                ItemImage(systemName: "chevron.left")
            }.disabled(!browser.canGoBack)
        }
    }
    
    var TItems: some View {
        HStack {
            Button(action: {
                if self.browser.isLoading {
                    self.browser.stopLoading()
                } else {
                    self.browser.reload()
                }
            }) {
                ItemImage(systemName: browser.isLoading
                            ? "xmark"
                            : "arrow.clockwise"
                )
            }
        }
    }
    
    public var body: some View {
//        NavigationView {
            SUIWebBrowserView(browserObject: browser)
                .navigationBarTitle(Title, displayMode: .inline)
//                .navigationBarItems(leading: LItems, trailing: TItems)
//        }
    }
}


struct UGWKWebView_Previews: PreviewProvider {
    static var previews: some View {
        WebBrowser(address: "https://www.bilibili.com/bangumi/play/ss34544")
    }
}
