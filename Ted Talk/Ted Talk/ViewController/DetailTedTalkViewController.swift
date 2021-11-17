//
//  detailTedTalkViewController.swift
//  Ted Talk
//
//  Created by Gonzalo Romero on 15/11/2021.
//

import UIKit
import WebKit

class DetailTedTalkViewController: UIViewController {

    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var ofviewDetail: UILabel!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UILabel!
    @IBOutlet weak var tagDetail: UILabel!
    @IBOutlet weak var tedTalkWeb: WKWebView!
    
    var tedTalk: TedTalk?
    var tagString: String = "Tags: "
    
    override func viewDidLoad() {
        
        titleDetail.text = tedTalk?.title
        tedTalkWeb.load(URLRequest(url: URL(string: tedTalk!.url)!))
        tagString = tagString + (tedTalk?.tags[0])!
        
        for tag in 1..<tedTalk!.tags.count {
            tagString = tagString + ", \(tedTalk!.tags[tag])"
        }
        
        tagDetail.text = tagString
        let viewString = tedTalk!.views as NSNumber
        ofviewDetail.text = "#of views: \(viewString.stringValue)"
        nameDetail.text = tedTalk?.name
        descriptionDetail.text = tedTalk?.description
    }
}
