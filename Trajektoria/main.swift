//
//  main.swift
//  Trajektoria
//
//  Created by Dawid Stasiak on 09/06/2020.
//  Copyright © 2020 Dawid Stasiak. All rights reserved.
//

import Foundation

enum Direction{
    case down, up, cons
}

let amplituda: Int  = Int(CommandLine.arguments[1]) ?? -1
var length: Int = Int(CommandLine.arguments[2]) ?? -1

if (checkIfKlops()){
    print("klops")
    exit(0)
}
let space: [[Character]] = fillSpace()
printSpace(space)

func checkIfKlops() -> Bool{
    return amplituda < 1 || length < 1;
}

func fillSpace(character: Character = "*") -> [[Character]]{
    var space: [[Character]]  = Array(repeating: Array(repeating: " ", count: length), count: amplituda)
    var x: Int = 0
    var y: Int = 0
    var direction: Direction = .down

    while(0 < length){
        space[y][x] = character
        length -= 1
       
        if (1 == amplituda) {direction = .cons}
        else if (0 == y) {direction = .down}
        else if (amplituda - 1 == y) {direction = .up}
        
        switch(direction){
            case .down: 
                y += 1; x += 1 
                break
            case .up: 
                y -= 1; x += 1
                break
            case .cons: 
                x += 1 
                break
        }
    }
    return space
}

func printSpace(_ space: [[Character]]){
    for line in space{
        for char in line{
            print(char, terminator: "")
        }
        print()
    }
}
