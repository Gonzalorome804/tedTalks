//
//  HomeViewControllerTest.swift
//  Ted TalkTests
//
//  Created by Gonzalo Romero on 29/11/2021.
//

import XCTest
@testable import Ted_Talk

class HomeViewControllerTest: XCTestCase {
    
    var homeViewController: HomeViewController?
    
    let tedTalkExample = TedTalk(comments: 0, description: "sir Ken Robinson makes an entertaining and profoundly moving case for creating an education system that nurtures (rather than undermines) creativity.", duration: 0, event: "", film_date: 0, languages: 0, main_speaker: "", name: "Ken Robinson: Do schools kill creativity?", num_speaker: 0, published_date: 1140825600, speaker_occupation: "", tags: ["children", "creativity", "culture", "dance", "education", "parenting", "teaching"], title: "Do schools kill creativity?", url: "https://embed.ted.com/talks/ken_robinson_says_schools_kill_creativity", views: 47227110)
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        homeViewController = navigationController?.viewControllers.first as? HomeViewController
        _ = homeViewController?.view
    }
    
    override func tearDownWithError() throws {
    }
    
    func testTableView() throws {
        
        XCTAssertNotNil(homeViewController?.tableView)
        homeViewController?.filteredTedTalk = [tedTalkExample]
        homeViewController?.tableView.reloadData()
        XCTAssertEqual(homeViewController?.tableView.numberOfRows(inSection: 0), 1)
        
        let cell = homeViewController?.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TedTalkCustomTableViewCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.mainSpeakerLabel.text, "Main speaker: \(homeViewController?.filteredTedTalk[0].main_speaker ?? "")")
        XCTAssertEqual(cell?.descriptionLabel.text, homeViewController?.tedTalk[0].description)
    }
    
    func testSearchBar() throws {
        XCTAssertNotNil(homeViewController?.searchBar)
        
        homeViewController?.tedTalk = [tedTalkExample]
        homeViewController?.pickerView(homeViewController?.pickerView ?? UIPickerView(), didSelectRow: 5, inComponent: 1)
        homeViewController?.searchBar(homeViewController?.searchView ?? UISearchBar(), textDidChange: "sir Ken Robinson makes")
        XCTAssertEqual(homeViewController?.filteredTedTalk.count, 1)
        XCTAssertEqual(homeViewController?.filteredTedTalk[0].title, "Do schools kill creativity?")
    }
}






