//
//  TedTalkTest.swift
//  Ted TalkTests
//
//  Created by Gonzalo Romero on 23/11/2021.
//

import XCTest
@testable import Ted_Talk

class TedTalkTest: XCTestCase {
    
    let tedTalkExample = TedTalk(comments: 0, description: "sir Ken Robinson makes an entertaining and profoundly moving case for creating an education system that nurtures (rather than undermines) creativity.", duration: 0, event: "TED2006", film_date: 0, languages: 0, main_speaker: "Ken Robinson", name: "Ken Robinson: Do schools kill creativity?", num_speaker: 0, published_date: 1140825600, speaker_occupation: "", tags: ["children", "creativity", "culture", "dance", "education", "parenting", "teaching"], title: "Do schools kill creativity?", url: "https://embed.ted.com/talks/ken_robinson_says_schools_kill_creativity", views: 47227110)
    
    func testIsFilteredDescription() throws {
            
            let returnValue = tedTalkExample.isFiltered("Description", input: "sir Ken Robinson makes an entertaining and profoundly moving case for creating an education system that nurtures (rather than undermines) creativity.")
            XCTAssertTrue(returnValue)
            
        }
    
    func testIsFilteredEvent() throws {
        
        let returnValue = tedTalkExample.isFiltered("Event", input: "TED2006")
        XCTAssertTrue(returnValue)
    }
    
    func testIsFilteredMainSpeaker() throws {
        
        let returnValue = tedTalkExample.isFiltered("Main Speaker", input: "Ken Robinson")
        XCTAssertTrue(returnValue)
    }
    
    func testIsFilteredTitle() throws {
        
        let returnValue = tedTalkExample.isFiltered("Title", input: "Do schools kill creativity?")
        XCTAssertTrue(returnValue)
    }
    
    func testIsFilteredName() throws {
        
        let returnValue = tedTalkExample.isFiltered("Name", input: "Ken Robinson: Do schools kill creativity?")
        XCTAssertTrue(returnValue)
    }
    
    func testIsFilteredDefault() throws {
        
        let returnValue = tedTalkExample.isFiltered("Default", input: "DefaultValue")
        XCTAssertTrue(returnValue)
    }
    
    func testIsFilteredAny() throws {
        
        let returnValue = tedTalkExample.isFiltered("Any", input: "Ken Robinson: Do schools kill creativity?")
        XCTAssertTrue(returnValue)
    }
}

