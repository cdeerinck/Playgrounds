//Find the longest string of zeroes in a 32-bit integer
import Foundation

var num:uint = 1234567890
var str = ""
let hi = uint(pow(2.0,31))
var maxBitStart = 0
var maxBitLen = 0
var curBitLen = 0
print("For \(num) or ", terminator:"")
for bit in (0...31) {
    str = "\(num&1)" + str
    switch num & 3 {
    case 1,3: //01 and 11 means we are on a 1, so reset the counter
        curBitLen = 0
    case 2: //10 means we ended a streak, add one, and check for max
        curBitLen+=1
        if curBitLen > maxBitLen {
            maxBitLen = curBitLen
            maxBitStart = bit
        }
    default: //00 so +1 and keep counting
        curBitLen+=1
    }
    num=num>>1 | hi
    //print(" \(x) ",terminator:"")
}
print("\(str), the max is \(maxBitLen) bits at position \(maxBitStart)")



