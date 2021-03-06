//
//  AsuhaTests.swift
//  AsuhaTests
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import XCTest
@testable import Asuha

class AsuhaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testClassName() {
        let hoge = UIView().asuha.then {
            $0.isHidden = true
        }
    }

    func testQueryItem() {
        let url = URL(string: "https://example.com?q=query&page=1")!
        XCTAssertEqual(url.queryItem["q"], "query")
        XCTAssertEqual(url.queryItem["page"], "1")
    }

    func testDownload() {

    }

    func testForEach_vs_for() {
        measure {
            let a = [1,4,1,4,6]
            a.forEach { i in
                print(i)
            }
        }

        measure {
            let a = [1,4,1,4,6]
            for i in a {
                print(i)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
