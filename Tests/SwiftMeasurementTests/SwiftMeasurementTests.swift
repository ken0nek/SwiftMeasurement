/**
 *  SwiftMeasurement
 *
 *  Copyright (c) 2017 Ken Tominaga. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation
import XCTest
import SwiftMeasurement

class SwiftMeasurementTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(SwiftMeasurement().text, "Hello, World!")

        let a: Double = 3
        let b: Double = 4
        let c: Double = 7

        if #available(iOS 10.0, *) {
            XCTAssertEqual(a.kilometers, Measurement<UnitLength>(value: a, unit: .kilometers))
            XCTAssertEqual(b.seconds, Measurement<UnitDuration>(value: b, unit: .seconds))

            XCTAssertEqual(c.grams, a.grams + b.grams)
            XCTAssertEqual(a.acres, c.acres - b.acres)
            XCTAssertEqual(c.metersPerSecond / 7, Measurement(value: 1, unit: .metersPerSecond))
            XCTAssertEqual(c.liters * 8, Measurement(value: 56, unit: .liters))
        }
    }
}

#if os(Linux)
extension SwiftMeasurementTests {
    static var allTests : [(String, (SwiftMeasurementTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
