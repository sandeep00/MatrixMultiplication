import Foundation

/// Performs matrix multiplication by reading text from .txt files.
/// comma is used as a seperator for column.
/// any new line is treated as a new row.
/// "1,2,3" is treated as single row matrix with three columns.
let matrixOperation = MatrixOperations()

print("Enter :q to quit.")

while true {
    do {
        var firstMatrix = [[Int]]()
        
        while firstMatrix.count == 0 {
            
            print("Enter First file name")
            
            if let firstFileName = readLine() {
                
                if firstFileName == ":q" {
                    exit(0)
                }
                
                firstMatrix = try matrixOperation.convertTextFileToMatrix(file: firstFileName)
            }
        }
        
        var secondMatrix = [[Int]]()
        
        while secondMatrix.count == 0 {
            
            print("Enter Second file name")
            
            if let secondFileName = readLine() {
                
                if secondFileName == ":q" {
                    exit(0)
                }
                
                secondMatrix = try matrixOperation.convertTextFileToMatrix(file: secondFileName)
            }
        }
        
        
        print("****** Result of Matrix multiplication *****")
        print(try matrixOperation.multiply(matrix1: firstMatrix, matrix2: secondMatrix))
        print("\n\n")
    }
    catch {
        print("error: \(error).")
        
        print("****************************\n") }
}
