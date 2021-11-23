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
    
    var tedTalk: TedTalk? = nil
    var tagString: String = "Tags: "
    
    func setTedTalk(talk: TedTalk){
        self.tedTalk = talk
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let displayTedTalk = tedTalk{
            
            titleDetail.text = displayTedTalk.title
            tedTalkWeb.load(URLRequest(url: URL(string: displayTedTalk.url)!))
            tagString = tagString + (displayTedTalk.tags[0])
            
            for tag in 1..<tedTalk!.tags.count {
                tagString = tagString + ", \(displayTedTalk.tags[tag])"
            }
            
            tagDetail.text = tagString
            let viewString = displayTedTalk.views as NSNumber
            ofviewDetail.text = "#of views: \(viewString.stringValue)"
            nameDetail.text = displayTedTalk.name
            descriptionDetail.text = displayTedTalk.description
        }
    }
}
