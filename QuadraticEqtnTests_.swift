import XCTest
import SwiftUI
import Numerics
import ComplexModule

// Test class for validating the functionality of the quadratic equation calculations.
// This class uses XCTest framework to ensure correct behavior of the methods.
final class QuadraticEqtnTests: XCTestCase {

    // Setup method that is called before the invocation of each test method in the class.
    override func setUpWithError() throws {

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrecision() throws {
        // This test case function is designed to explore how error increses as substractive cancellation decreases. Then it compares error to the machine precision of 1e-14
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
                let quadraticTest = quadraticEquation()
                var n: Double = 0.0
                quadraticTest.a = 1.0
                quadraticTest.b = 1.0
                quadraticTest.c = pow(10,-n)
        
                quadraticTest.calculateQuadraticSolutions()
                quadraticTest.calculateQuadraticSolutionsPrime()
        
                XCTAssertEqual(quadraticTest.solOneR, quadraticTest.solOnePrime.real, accuracy: 1e-14)
        }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
