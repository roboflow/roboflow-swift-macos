//
//  RoboflowTest.swift
//  
//
//  Created by Maxwell Stone on 8/2/23.
//

import XCTest
import Roboflow

@available(macOS 10.15, *)
final class RoboflowTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadModel() throws {
        let rf = RoboflowMobile(apiKey: "vf99FOKNvqSqONChPKvD")
        rf.load(model: "2023-charged-up", modelVersion: 8) { model, error, modelName, modelType in
            XCTAssert(model != nil)
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                model?.configure(threshold: 0.5, overlap: 0.5, maxObjects: 20)
            }
        }
    }

}
