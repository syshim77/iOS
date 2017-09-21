//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str
//constStr = "Hello, world"

// MARK: 타입 지정
var nextYear: Int
var bodyTemp: Float
var hasPet: Bool
//var arrayOfInts: Array<Int>
var arrayOfInts: [Int]
//var dictionaryOfCapitalsByCountry: Dictionary<String, String>.Element
var dictionaryOfCapitalsByCountry: [String:String]
var winningLotteryNumbers: Set<Int>

// MARK: 리터럴과 서브스크립팅
let number = 42
let fmStation = 91.1
//let countingUp = ["one", "two"]
var countingUp = ["one", "two"]
let secondElement = countingUp[1]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

// MARK: 이니셜라이저
let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()
let defaultNumber = Int()
let defaultBool = Bool()
let meaningOfLife = String(number)
let availableRooms = Set([205, 411, 412])
let defaultFloat = Float()
let floatFromLiteral = Float(3.14)
let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

// MARK: 프로퍼티
countingUp.count
emptyString.isEmpty

// MARK: 인스턴스 메서드
countingUp.append("three")

// MARK: 옵셔널
var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalStrings: [String?]?
var reading1: Float?
var reading2: Float?
var reading3: Float?
reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7
//let avgReading = (reading1 + reading2 + reading3)/3
//let avgReading = (reading1! + reading2! + reading3!)/3
if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    let avgReading = (r1 + r2 + r3)/3
} else {
    let errorString = "Instrument reported a reading that was nil."
}

// MARK: 딕셔너리에서 서브스크립팅하기
//let space13Assignee: String? nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]
if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary!")
}

// MARK: 루프와 문자열 삽입
/*for var i = 0; i < countingUp.count; ++i {
    let string = countingUp[i]
    //'string' 사용
}
let range = 0..< countingUp.count
for i in range {
    let string = countingUp[i]
    //'string' 사용
}
for string in countingUp {
    //'string' 사용
}
for (i, string) in countingUp.enumerated() {
    //(0, "one"), (1, "two")
}*/
for (space, name) in nameByParkingSpace {
    let permit = "Space \(space): \(name)"
}

// MARK: 열거형과 Switch문
/*enum PieType {
    case Apple
    case Cherry
    case Pecan
}
let favoritePie = PieType.Apple
let name: String
switch favoritePie {
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}
let osxVersion: Int = ...
switch osxVersion {
case 0...8:
    print("A big cat")
case 9:
    print("Mavericks")
case 10:
    print("Yosemite")
default:
    print("Greetings, people of the future! What's new in 10.\(osxVersion)?")
}*/

// MARK: 열거형과 원시값
enum PieType: Int {
    case Apple = 0
    case Cherry
    case Pecan
}
let pieRawValue = PieType.Pecan.rawValue
//pieRawValue는 2를 값으로 가진 Int 타입이다
if let pieType = PieType(rawValue: pieRawValue) {
    //'pieType'!이 유효한 값을 가지면
}