//
//  SearchByCityTests.swift
//  DemoWeatherAppTests
//
//  Created by Ankush Ladhane on 10/06/23
//

import XCTest
@testable import DemoWeatherApp

final class SearchByCityTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testSearchByCity() {
        let expec = expectation(description: "Search By City request")
        
        SearchByCityNetwork.getWeatherByCity(byKey: "london") { result in
            switch result {
            case .failure(let error):
                XCTFail(" Search By City failed \(error.localizedDescription)")
                expec.fulfill()
            case .success(let responseData):
                print("Search By City success \(responseData)")
                expec.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10.0) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
