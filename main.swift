// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation

struct TGame: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Play a small game in the terminal", version: "0.0.1")
    
    @Argument(help: "your name") var name: String = "bobby"
    //@Flag(name: .short, help: "choose to fight") var fight: Bool = false
    
    var enemy = true
    var attack: Double = 1.5
    var health: Double = 10.0
    var ehealth: Double = 5.0
    var eattack: Double = 1.0
    
    func Space(){
        print("<---------->")
    }
    
    mutating func run() throws {
        if enemy{
            print("your health is \(health),")
            Space()
            print("you encounter an enemy with \(ehealth) HP, would you like to fight [y/n]: ")
            if let input = readLine(){
                if input.lowercased() == "y"{
                    print("you choose to look the enemy in the eyes!")
                    Space()
                    while ehealth > 0.0 && health > 0.0{
                        if Bool.random() {//if succes
                            ehealth -= attack
                            print("you did \(attack) damage")
                            Space()
                            print("enemy is now \(ehealth) out of 5!")
                            Space()
                        }
                        else{
                            print("you missed!")
                        }
                        
                        if ehealth > 0.0{
                            print("the enemy strikes back")
                            if Bool.random(){
                                health -= eattack
                                Space()
                                print("enemy strikes and lowers you to \(health) out of 10")
                                Space()
                            }
                            else{
                                print("the enemy misses!")
                                Space()
                            }
                        }
                        else{
                            print("you killed your enemy!")
                        }
                    }
                    Space()
                    if health <= 0.0{
                        print("you died!.......")
                        Space()
                    }
                    else{
                        print("you won against your enemy!")
                        print("you have \(health) left")
                        print("[reminder --> max healt is [10]]")
                    }
                }
                else{
                    print("you run away...")
                }
            }
        }
    }
}

TGame.main()