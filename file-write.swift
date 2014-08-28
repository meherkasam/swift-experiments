#! /usr/bin/env xcrun swift

import Foundation

func Usage()
{
    println("Usage: ./file.swift filename stringval")
}

func WriteToFile(filename: String, stringval: String)
{
    stringval.writeToFile(filename, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
}

if (Process.arguments.count != 3)
{
    Usage();
}
else
{
    WriteToFile(Process.arguments[1], Process.arguments[2])
}