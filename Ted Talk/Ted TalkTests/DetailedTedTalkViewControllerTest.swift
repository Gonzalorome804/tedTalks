//
//  DetailedTedTalkViewControllerTest.swift
//  Ted TalkTests
//
//  Created by Gonzalo Romero on 29/11/2021.
//

import XCTest
@testable import Ted_Talk

class DetailedTedTalkViewControllerTest: XCTestCase {
    
    var detailedTedTalkViewController: DetailTedTalkViewController?
    let tedTalkExample = TedTalk(comments: 0, description: "sir Ken Robinson makes an entertaining and profoundly moving case for creating an education system that nurtures (rather than undermines) creativity.", duration: 0, event: "", film_date: 0, languages: 0, main_speaker: "", name: "Ken Robinson: Do schools kill creativity?", num_speaker: 0, published_date: 1140825600, speaker_occupation: "", tags: ["children", "creativity", "culture", "dance", "education", "parenting", "teaching"], title: "Do schools kill creativity?", url: "https://embed.ted.com/talks/ken_robinson_says_schools_kill_creativity", views: 47227110)
    var tagStringExample = "Tags: "
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        detailedTedTalkViewController = storyboard.instantiateViewController(withIdentifier: "DetailedTedTalkStoryBoard") as? DetailTedTalkViewController
        detailedTedTalkViewController?.tedTalk = tedTalkExample
        _ = detailedTedTalkViewController?.view
    }
    
    func testComponents() throws {
        XCTAssertEqual(detailedTedTalkViewController?.titleDetail.text, tedTalkExample.title)
        XCTAssertEqual(detailedTedTalkViewController?.nameDetail.text, tedTalkExample.name)
        XCTAssertEqual(detailedTedTalkViewController?.descriptionDetail.text, tedTalkExample.description)
        XCTAssertEqual(detailedTedTalkViewController?.ofviewDetail.text, "#of views: \(tedTalkExample.views)")
        tagStringExample = tagStringExample + "\(tedTalkExample.tags[0])"
        for tag in 1..<tedTalkExample.tags.count {
            tagStringExample = tagStringExample + ", \(tedTalkExample.tags[tag])"
        }
        XCTAssertEqual(detailedTedTalkViewController?.tagDetail.text,tagStringExample)
        
    }
}
