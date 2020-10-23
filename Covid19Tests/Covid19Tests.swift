//
//  Covid19Tests.swift
//  Covid19Tests
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import XCTest
@testable import Covid19

class Covid19Tests: XCTestCase {
    
    var homeViewController : HomeViewController!
    var detailViewController : DetailViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.homeViewController = (storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController)
        _ = self.homeViewController.view
        
        self.detailViewController = (storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController)
        _ = detailViewController.view
        
    }

    func testInitTableViews() throws {
        
        XCTAssertNotNil(self.homeViewController.tableView)
        XCTAssertNotNil(detailViewController.tableView)
    }
    
    func testCallToViewModelForUIUpdate(){
//        homeViewController.callToViewModelForUIUpdate()
//        XCTAssertNotNil(homeViewController.baseResponse)
    }

}
