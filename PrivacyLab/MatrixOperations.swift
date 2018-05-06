import Foundation
import Darwin

enum IntParsingError: Error {
    case invalidInput(String)
}

enum InvalidArgumentError: Error {
    case invalidRowsOrColumns(String)
}

class MatrixOperations {
    
    
    /// Converts Textfile data to Int matrix
    ///
    /// - Parameter file: FileName
    /// - Returns: 2d Int Array.
    func convertTextFileToMatrix(file: String) throws -> [[Int]] {
        
        var inputMatrix = [[Int]]()
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file + ".txt")
            
            let text = try String(contentsOf: fileURL, encoding: .utf8)
            
            inputMatrix = try convertTextToIntMatrix(text: text)
        }
        
        return inputMatrix
    }
    
    
    /// Converts comma seperted string to 2d Int Array.
    ///
    /// - Parameter text: string representation of Int array
    /// - Returns: 2d Int array.
    /// - Throws: IntParsingError, InvalidArgumentError
    func convertTextToIntMatrix(text: String) throws -> [[Int]] {
        
        var inputMatrix = [[Int]]()
        
        var intArray = [Int]()
        
        let stringRows = text.components(separatedBy: .newlines)
        
        for stringRow in stringRows {
            
            intArray = [Int]()
            
            for string in stringRow.split(separator: ",") {
                
                let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if let intValue = Int(trimmedString) {
                    
                    intArray.append(intValue)
                }
                else {
                    throw IntParsingError.invalidInput(trimmedString)
                }
            }
            
            if inputMatrix.count > 0 && inputMatrix[0].count != intArray.count{
                
                throw InvalidArgumentError.invalidRowsOrColumns("Columns in each row are not equal")
            }
            
            inputMatrix.append(intArray)
        }
        
        return inputMatrix
    }
    
    
    /// Performs matrix multiplication of 2d Int arrays.
    ///
    /// - Parameters:
    ///   - matrix1: 2d Int Matrix
    ///   - matrix2: 2d Int Matrix
    /// - Returns: 2d Array which is product of two 2d Int Arrays.
    /// - Throws: InvalidArgumentError if the First matrix columns are not equal to second matrix rows.
    func multiply(matrix1: [[Int]], matrix2: [[Int]]) throws -> [[Int]] {
        
        var result = [[Int]]()
        
        if matrix1[0].count != matrix2.count {
            throw InvalidArgumentError.invalidRowsOrColumns("First matrix columns should be equal to Second matrix rows.")
        }
        
        for i in 0...matrix1.count-1 {
            
            var tempResult = [Int]()
            
            for j in 0...matrix2[0].count-1 {
                
                var value = 0
                
                for k in 0...matrix1[0].count-1 {
                    value = value + matrix1[i][k]*matrix2[k][j]
                }
                
                tempResult.append(value)
            }
            
            result.append(tempResult)
        }
        
        return result
    }
}
