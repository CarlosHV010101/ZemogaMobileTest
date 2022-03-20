//
//  PostViewModelTestCases.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import XCTest
@testable import ZemogaMobileTest

class PostViewModelTestCases: XCTestCase {

    private var sut: PostViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = PostViewModel(
            id: 0,
            userId: 0,
            title: "",
            body: "",
            isFavorite: false
        )
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func testGoToDetails() {
        //WHEN
        sut.goToDetails()
        
        //THEN
        XCTAssertEqual(sut.route, .details, "Should be the same route")
    }
}
