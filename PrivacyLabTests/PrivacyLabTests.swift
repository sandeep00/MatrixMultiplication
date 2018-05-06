//
//  PrivacyLabTests.swift
//  PrivacyLabTests
//
//  Created by Bindu on 5/5/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import XCTest
@testable import PrivacyLab

class PrivacyLabTests: XCTestCase {
   
    let m = MatrixOperations()
    
     func testMatrixMultiplication() {
        
        let matrix1 = [[1, 2, 3],[4, 5, 6]]
        
        let matrix2 = [[7, 8], [9, 10], [11, 12]]
        
        let expectedResult = [[58, 64], [139, 154]]
        
        let actualResult = try? m.multiply(matrix1: matrix1, matrix2: matrix2)
        
        XCTAssertEqual(expectedResult[0], actualResult![0])
        
        XCTAssertEqual(expectedResult[1], actualResult![1])
    }
    
    // Tests if MatrixMultiplication throws error
    // If First matrix columns are not equal to Second matrix rows.
    func testMAtrixMultiplicationThrowsError() {
        
        let matrix1 = [[1, 2, 3],[4, 5, 6]]
        
        let matrix2 = [[7, 8], [9, 10]]
        
        XCTAssertThrowsError(try m.multiply(matrix1: matrix1, matrix2: matrix2))
    }
    
    
    /// Tests if a text contianing valid seperators can be converted to 2d Int Array.
    func testIfTextIsConvertedToIntArray() {
        
        let expectedResult = [[1, 3, 5],[2, 4, 7], [1,2,4]]
        
        let actualResult = try? m.convertTextToIntMatrix(text: "1,3, 5 \n2,4, 7\n1,2,4")
        
        XCTAssertEqual(expectedResult[0], actualResult![0])
        
        XCTAssertEqual(expectedResult[1], actualResult![1])
        
        XCTAssertEqual(expectedResult[2], actualResult![2])
    }
    
    
    /// Tests if an error is thrown if the text does not contain equal number of
    /// rows or column in the matrix.
    func testIfTextIsConvertedThrowsErroronInvalisInput() {
        // Only two  entries for the first row.
        // Other entries after seperator contain three entries.
        XCTAssertThrowsError(try m.convertTextToIntMatrix(text: "1, 5 \n2,4, 7\n1,2,4"))
    }
}
