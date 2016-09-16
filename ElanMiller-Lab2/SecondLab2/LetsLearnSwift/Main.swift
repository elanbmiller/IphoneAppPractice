//
// CSE 438: Mobile Application Development
// Lab 2: Let's Learn Swift
//
// Overview:
// Welcome! The goal of this assignment is to jump into the Swift language and get comfortable with its syntax.
//
// Details:
// DUE: Wednesday,September 21, at 11:59pm
// GRADING: This lab is worth 50 points. Points are assigned based on the percentage of passing tests.
// SUBMISSION: Zip up the entire project folder and email it to cse438ta@gmail.com
//  Name the file: FirstNameLastName-Lab2.zip
//
//

//
// Description:
// Complete each section below and follow each set of instructions in order to get full credit. Test your code by using the provided test cases. For additional help, review slides on the class website or consult the official Swift programming guide (https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/) on Apple's website.
//
// Note: Do not change the function names or declarations, as they are needed to correctly run the test cases. Use the test cases to help debug your solutions. Simply hard-coding results based on the tests will result in no credit. Additionally, modifying the test case file in any way will result in a 0 on this lab.
//

import Foundation

//Author: Elan Miller

// MARK: - Section 1: Welcome

/// Fill in the function to return the string "Hello, world!".
func helloWorld() -> String {
    return "Hello, world!"
}


// MARK: - Section 2: Math

/// Return the average (mean) of a, b, anc c.
func average(a: Int, b: Int, c: Int) -> Double {
    return Double(a+b+c)/Double(3.0)
}

/// Return the area of a circle with the given radius. (Hint: Use M_PI for the value of pi)
func circleArea(radius: Double) -> Double {
    return (radius*radius)*M_PI
}

/// Return the distance between two points on the 2D coordinate plane.
/// The first point is (x1, y1) and the second is (x2, y2).
func distance(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
    return sqrt(pow((x1-x2), 2) + pow((y1-y2), 2))
}

/// Return the factorial of n.
func factorial(n: Int) -> Int {
    if(n<=1){
        return 1
    }
    return n * factorial(n-1)
}


// MARK: - Section 3: Strings

/// Return the input string with an exclamation point at the end.
/// Example: "hello" -> "hello!"
func emphasize(s: String) -> String {
    return s + "!"
}

/// Return true if the string is longer than 10 characters, and false if the string is less than 10 characters long.
func tooLong(s: String) -> Bool {
    if (s.characters.count > 10){
        return true
    }
    else{
        return false
    }
}

/// Return the string saying how many apples and oranges you have. If you have only 1 of either apples or oranges, use the correct plural form of the word.
/// Example: apples: 3, oranges: 5 -> "I have 3 apples and 5 oranges."
/// Example: apples: 1, oranges: 0 -> "I have 1 apple and 0 oranges."
func applesAndOranges(apples: Int, oranges: Int) -> String {
    if(Int(apples) == 1 && Int(oranges) == 1){
        return "I have \(apples) apple and \(oranges) orange."
    }
    else if(Int(apples) == 1 && Int(oranges) != 1){
        return "I have \(apples) apple and \(oranges) oranges."
    }
    else if(Int(apples) != 1 && Int(oranges) == 1){
        return "I have \(apples) apples and \(oranges) orange."
    }
    else{
        return "I have \(apples) apples and \(oranges) oranges."
    }
    
}

/// Return the input string repeated the given number of times.
/// Example: "abc" repeated 3 times should return "abcabcabc"
func duplicate(string: String, times: Int) -> String {
    var totalString: String = ""
    if(times == 0){
        return totalString
    }
    for i in 0 ..< times{
        totalString = totalString + string
    }
    return totalString
}

/// Return a string with all of the vowels (a,e,i,o,u) removed. Assume all input strings are lowercase.
/// Example: "hello world" -> "hll wrld"
func removeVowels(s: String) -> String {
    var count = 0
    var newString = ""
    for var character in s.characters{
        if(!(character == "a" || character == "e" || character == "i" || character == "o" || character == "u")){
//            newString.removeAtIndex(Index(count)) = character("")
//            count = count + 1
            newString.append(character)
        }
    }
    return newString
}


// MARK: - Section 4: Collections

/// Return the sum of all of the integers in the array.
func sumArray(array: [Int]) -> Int {
    var sum: Int = 0
    for (var i = 0; i < array.count; ++i){
        sum += array[i]
    }
    return sum
}

/// Return the difference between the maximum and minimum integers in the array.
/// Example: [1,2,3,4,5] -> 4 (because the max is 5, the min is 1, and 5 - 1 = 4)
func intRange(array: [Int]) -> Int {
    var max: Int = -10
    var min: Int = 100
    
    for (var i = 0; i < array.count; ++i){
        if(array[i] > max){
            max = array[i]
        }
        if(array[i] < min){
            min = array[i]
        }
    }
    
    return max-min
}

/// Return an array of strings which only includes strings that are less than 3 characters in length.
/// Example: ["hello", "yes", "no"] -> ["no"]
func removeLargeStrings(strings: [String]) -> [String] {

    var smallStrings = [String]()
    for item in strings {
       if (item.characters.count < 3 )
       {
        smallStrings.append(item)
       }
    }
    
    return smallStrings
}

/// Return a dictionary which contains all the key-value pairs from both of the input dictionaries.
func combineDictionaries(a: [Int:String], b: [Int:String]) -> [Int:String] {
    var newD: [Int:String] = [:]
    
    for key in a.keys{
        newD[key] = a[key]
    }
    for key in b.keys{
        newD[key] = b[key]
    }
    
    return newD
}

/// Return a set of strings which contains all the elements from the provided arrays.
func createSet(a: [String], b: [String]) -> Set<String> {
    var combinedSet = Set<String>()
    for (var i = 0; i < a.count; ++i){
        combinedSet.insert(a[i])
    }
    for (var i = 0; i < b.count; ++i){
        combinedSet.insert(b[i])
    }
    
    return combinedSet
}


// MARK: - Section 5: Optionals

/// If the integer is not nil, return it. Otherwise, return 0.
func missingInt(int: Int?) -> Int {
    var intPerhaps:Int? = int
    
    if(intPerhaps != nil){
        return intPerhaps!
    }
    else{
        return 0
    }
    
    return 0
}


// MARK: - Section 6: Enumerations

enum TypeShape {
    case Circle
    case Square
    case Triangle
}

/// Given the enum above, return a string which is the name of the given type (first letter should be capitalized).
/// Example: shape is TypeShape.Circle -> "Circle"
func nameFromShape(shape: TypeShape) -> String {
    if(shape == TypeShape.Circle){
        return "Circle"
    }
    else if(shape == TypeShape.Square){
        return "Square"
    }
    else{
        return "Triangle"
    }
    
}

enum StatusCode: Int {
    case Success = 200
    case Forbidden = 403
    case NotFound = 404
    case InternalServerError = 500
}

/// Given the enum above, return the status code integer based on the input status code. If the provided integer does not match any existing codes, return nil.
func statusFromCode(code: Int) -> StatusCode? {
    if (code == 200){
        return StatusCode.Success
    }
    else if (code == 403){
        return StatusCode.Forbidden
    }
    else if (code == 404){
        return StatusCode.NotFound
    }
    else if (code == 500){
        return StatusCode.InternalServerError
    }
    else{
    return nil
    }
}

enum Operation {
    case Add
    case Subtract
    case Multiply
    case Divide
}

/// Given the enum above, return the result of the operation on the provided values.
/// Example: a: 3, b: 2, operation: Subtract -> 1
func operate(a: Double, b: Double, operation: Operation) -> Double {
    switch operation {
    case .Add:
        return a + b
    case .Subtract:
        return a - b
    case .Multiply:
        return a * b
    case .Divide:
        return a / b
    default:
        return 0
    }
    
}


// MARK: - Section 7: Structs and Classes

struct Vector {
    var dx: Int
    var dy: Int
}

struct Point {
    var x: Int
    var y: Int
}

/// Return a Vector which describes the change from the first point to the second point.
/// Example: (0,0), (1,2) -> Vector(1,2)
func vectorize(p1: Point, p2: Point) -> Vector {
    
    return Vector(dx: (p2.x-p1.x), dy: (p2.y-p1.y))
}

/// Return the dot product of the given vectors.
/// Example: Vector(dx: 3, dy: 2) • Vector(dx: -2, dy: 4) = (3 * -2) + (2 * 4) = -6 + 8 = 2
func dotProduct(v1: Vector, v2: Vector) -> Int {
    return ((v1.dx*v2.dx)+(v1.dy*v2.dy))
}


/// Fill in the following functions for the scoreboard class, which models a simple basketball scoreboard.
class ScoreBoard {
    
    enum Team {
        case Home
        case Away
    }
    
    var homeScore: Int = 0
    var awayScore: Int = 0
    
    var homeFouls: Int = 0
    var awayFouls: Int = 0
    
    /// This should add the number of points to the correct score value, depending on the team that scored.
    func addScore(points: Int, team: Team) {
        if(team == Team.Home){
            homeScore = homeScore + points
        }
        else{
            awayScore = awayScore + points
        }
    }
    
    /// This should add a foul to the variable keeping track of the number of fouls the team has.
    func addFoul(team: Team) {
        if(team == Team.Home){
            homeFouls = homeFouls + 1
        }
        else{
            awayFouls = awayFouls + 1
        }
    }
    
    /// This should reset all of the variables in the scoreboard to 0 so it's ready to go for the next game.
    func reset() {
        homeScore = 0
        awayScore = 0
        
        homeFouls = 0
        awayFouls = 0
    }
    
}

/// Now, given a scoreboard, return the difference between the points of the home team and the away team. (If the home team is ahead of the away team, this value should be positive, otherwise it should be negative.)
func scoreDifference(scoreboard: ScoreBoard) -> Int {
    return scoreboard.homeScore - scoreboard.awayScore
}


// MARK: - Section 8: Closures

/// Given a string and a closure, use the string as an argument to the 'action' closure, and return from the function whether the closure's return value is positive or negative (treat 0 as positive).
func usingClosure(string: String, action: String -> Int) -> Bool {
    if action(string) >= 0 {
        return true
    }
    else{
        return false
    }
    
}

/// Return a closure that tests to see if the given value is greater or equal to the provided number.
/// Example: If 'number' = 3, then the returned closure should compare its input Int to 3. If it's input Int is greater or equal to 3, it should return true. Otherwise it should return false.
func returnClosure(number: Int) -> (Int -> Bool) {
    
    func action (someInt: Int) -> Bool{
    
        if someInt >= number{
            return true
        }
        else{
            return false
        }
    
    }
    
    return action
}


// MARK: - Section 9: Error Handling

enum Error: ErrorType {
    case Negative
    case AnotherError
}

func thisThrows(int: Int) throws -> Bool {
    if int < 0 {
        throw Error.Negative
    }
    return true
}

/// Using the above function 'thisThrows', return the value from the 'thisThrows' function given the 'value' as input. If the function executes successfully, return true. If it throws an error, return false.
func tryCatch(value: Int) -> Bool {
    do{
        return try thisThrows(value)
    }
    catch Error.Negative{
        return false
    }
    catch{
        return false
    }
}


// MARK: - Section 10: Extensions

/// Extensions can add functionality to existing classes. Fill in the following function to add an integer to an existing integer. This allows for statements like "7.addInt(3)".
extension Int {
    func addInt(int: Int) -> Int {
        return self + int
    }
}



