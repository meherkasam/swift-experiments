#! /usr/bin/env xcrun swift

func Factorial(num: Int) -> Int
{
    var result: Int = 1
    for i in 1..<(num + 1)
    {
        result = result * i
    }
    
    return result
}

println(Factorial(5))