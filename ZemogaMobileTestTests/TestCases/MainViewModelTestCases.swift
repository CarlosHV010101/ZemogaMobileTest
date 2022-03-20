//
//  MainViewModelTestCases.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import XCTest
@testable import ZemogaMobileTest

class MainViewModelTestCases: XCTestCase {
    
    private var sut: MainViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = MainViewModel(repository: MockPostRepository())
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func testInitialValues() {
        XCTAssertTrue(sut.allPosts.isEmpty, "Should be empty")
        XCTAssertTrue(sut.favoritePosts.isEmpty, "Should be empty")
        XCTAssertEqual(sut.currentPostListSelection, .all, "Should be all")
        XCTAssertFalse(sut.isLoadingPosts, "Should be false")
        XCTAssertFalse(sut.getPostsHasError, "Should be false")
    }
    
    func testLoadPosts_WhenFinishWithSuccess() {
        //GIVEN
        let posts: [Post] = [
            Post(id: 0, userId: 0, title: "", body: "", isFavorite: true),
            Post(id: 0, userId: 0, title: "", body: "", isFavorite: false)
        ]
        
        //WHEN
        sut.didUpdatePostsWithSuccess(posts)
        
        //THEN
        XCTAssertFalse(sut.favoritePosts.isEmpty, "Should not be empty")
        XCTAssertFalse(sut.allPosts.isEmpty, "Should not be empty")
        XCTAssertFalse(sut.isLoadingPosts, "Should be false")
        XCTAssertFalse(sut.getPostsHasError, "Should be false")
    }
    
    func testLoadPosts_WhenFinishWithError() {
        //WHEN
        sut.didFailGetPosts()
        
        //THEN
        XCTAssertTrue(sut.getPostsHasError, "Should be true")
        XCTAssertFalse(sut.isLoadingPosts, "Should be true")
    }
    
    func testDeleteAllPosts() {
        //WHEN
        sut.deleteAllPosts()
        
        //THEN
        XCTAssertTrue(sut.allPosts.isEmpty, "Should be empty")
        XCTAssertTrue(sut.favoritePosts.isEmpty, "Should be empty")
    }
}
