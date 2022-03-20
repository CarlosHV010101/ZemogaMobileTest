//
//  PostDetailViewModelTestCases.swift
//  ZemogaMobileTestTests
//
//  Created by Carlos Hernández on 19/03/22.
//

import XCTest
@testable import ZemogaMobileTest

class PostDetailViewModelTestCases: XCTestCase {

    private var sut: PostDetailViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = PostDetailViewModel(
            post: PostViewModel(
                id: 0,
                userId: 0,
                title: "",
                body: "",
                isFavorite: false
            ),
            repository: MockPostRepository()
        )
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func testInitialValues() {
        XCTAssertNil(sut.user, "Should be nil")
        XCTAssertTrue(sut.comments.isEmpty, "Should be true")
        XCTAssertTrue(sut.isLoadingComments, "Should be false")
        XCTAssertFalse(sut.getCommentsHasError, "Should be false")
        XCTAssertTrue(sut.isLoadingUser, "Should be false")
        XCTAssertFalse(sut.getUserHasError, "Should be false")
    }
    
    func testGetComments_WhenFisnishWithSuccess() {
        //GIVEN
        let comments: [Comment] = [
            Comment(id: 0, postId: 0, body: ""),
            Comment(id: 0, postId: 0, body: "")
        ]
        
        //WHEN
        sut.didUpdateCommentsWithSuccess(comments)
        
        //THEN
        XCTAssertFalse(sut.isLoadingComments, "Should be false")
        XCTAssertFalse(sut.getCommentsHasError, "Should be false")
        XCTAssertFalse(sut.comments.isEmpty, "Should be false")
    }
    
    func testGetComments_WhenFinishWithError() {
        //WHEN
        sut.didFailGetComments()
        
        //THEN
        XCTAssertFalse(sut.isLoadingComments, "Should be false")
        XCTAssertTrue(sut.getCommentsHasError, "Should be true")
    }
    
    func testGetUser_WhenFinishWithSuccess() {
        //GIVEN
        let user = User(id: 0, name: "", email: "", phone: "", website: "")
        
        //WHEN
        sut.didUpdateUserWithSuccess(user)
        
        //THEN
        XCTAssertNotNil(sut.user, "Should not be nil")
        XCTAssertFalse(sut.isLoadingUser, "Should be false")
        XCTAssertFalse(sut.getUserHasError, "Should be false")
    }
    
    func testGetUser_WhenFinishWithError() {
        //WHEN
        sut.didFailGetUser()
        
        //THEN
        XCTAssertFalse(sut.isLoadingUser, "Should be false")
        XCTAssertTrue(sut.getUserHasError, "Should be true")
        XCTAssertNil(sut.user, "Should be nil")
    }
}
