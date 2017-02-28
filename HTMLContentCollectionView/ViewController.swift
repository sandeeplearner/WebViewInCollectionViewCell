//
//  ViewController.swift
//  HTMLContentCollectionView
//
//  Created by Sandeep Bhandari on 2/28/17.
//  Copyright © 2017 Sandeep Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var heightArray : [Int : CGSize] = [Int : CGSize]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "webViewCell", for: indexPath) as! WebViewCollectionViewCell
        cell.webView.tag = indexPath.row
        cell.webView.delegate = self
        cell.prepare()
        cell.webView.loadHTMLString("<b>ABCD EFGH</b>", baseURL: nil)
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath
        indexPath: IndexPath) -> CGSize {
        if let _ = self.heightArray[indexPath.row] {
            return CGSize(width: 178, height: self.heightArray[indexPath.row]!.height + 46)
        }
        else {
            return CGSize(width: 100, height: 100)
        }
    }
}
extension ViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let _ = self.heightArray[webView.tag]{
            return
        }
        let size = CGSize(width: webView.frame.size.width, height: CGFloat(Float(webView.stringByEvaluatingJavaScript(from: "document.body.offsetHeight;")!)!))
        self.heightArray[webView.tag] = size
        self.collectionView.reloadData()
    }
}
