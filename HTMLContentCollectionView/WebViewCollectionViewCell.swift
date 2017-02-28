//
//  WebViewCollectionViewCell.swift
//  HTMLContentCollectionView
//
//  Created by Sandeep Bhandari on 2/28/17.
//  Copyright © 2017 Sandeep Bhandari. All rights reserved.
//

import UIKit

class WebViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    func prepare() {
        self.webView.backgroundColor = UIColor.red
        self.webView.isOpaque = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
