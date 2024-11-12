// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation

struct TGame: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Play a small game in the terminal", version: "0.0.2")
    
    @Argument(help: "how many times you would like to play") var play: Int = 1
    @Flag(name: .short, help: "debug help for developers") var deb: Bool = false
    @Flag(name: .short, help: "check inventory, character, etc..") var home: Bool = false
    
    var enemy = true
    var attack: Double = 1.5
    var health: Double = 10.0
    var level: Int = UserDefaults.standard.integer(forKey: "level")
    var xp: Double = UserDefaults.standard.double(forKey: "xp")
    var ehealth: Double = 5.0
    var eattack: Double = 1.0
    
    var inventory: [String : Int] = UserDefaults.standard.dictionary(forKey: "inventory") as? [String : Int] ?? [:]
    
    func Space(){
        print("<----------> <—————>")
    }
    
    mutating func run() throws {
        if deb{
            Space()
            Space()
            print(inventory)
            print(inventory.values)
            print(String(enemy))
            print(String(attack))
            print(String(health))
            print(String(ehealth))
            print(String(eattack))
            
            Space()
            Space()
        }
        
        Space()
        print("welcome to 'terminal game' or TG")
        Space()
        print("you can change the default name 'TG' to something else")
        print("by going into the file 'Package' and changing the first 'name: TG and the TG in executableTarget..")
        
        Space()
        if home{
            print("<——🏠——>")
            print("welcome to home")
            print("<——🏠——>")
            
            print("——[i: open invertory]")
            print("——[c: open character]")
            print("——[L: save & quit]")
            print("[i, c, L]: ")
            
            if let input = readLine(){
                if input.lowercased() == "i"{
                    Space()
                    print(inventory)
                    Space()
                    print("see everything in inventory? [y/n]: ")
                    print("you will see graphics of each object")
                    if let input = readLine(){
                        if input.lowercased() == "y"{
                            for (key, value) in inventory {
                                if key == "flesh" {
                                    graphics().flesh()
                                }
                            }
                        }
                    }
                }
                else if input.lowercased() == "c"{
                    print("character:")
                    Space()
                    graphics().character()
                    Space()
                    print("you have \(xp) experience;")
                    print("you are level \(level)")
                }
            }
            
        }
        else{
            while play != 0 && health > 0.0{
                if enemy{
                    ehealth = 5.0
                    play -= 1
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
                                        print("the enemy missed!")
                                        Space()
                                    }
                                }
                                else{
                                    print("you killed your enemy!")
                                    if let currentValue = inventory["flesh"] {
                                        inventory["flesh"] = currentValue + 1
                                    }
                                    else{
                                        inventory["flesh"] = 1
                                    }
                                    xp += 50
                                    if xp >= 100{
                                        level += 1
                                        print("you are now level \(level)!!")
                                        Space()
                                    }
                                    UserDefaults.standard.setValue(xp, forKey: "xp")
                                    UserDefaults.standard.setValue(level, forKey: "level")
                                    UserDefaults.standard.setValue(inventory, forKey: "inventory")
                                    Space()
                                    print("**1 flesh added to inventory**")
                                    if deb{
                                        print(inventory)
                                    }
                                    Space()
                                }
                            }
                            Space()
                            if health <= 0.0{
                                print("YOU DIED!.......")
                                Space()
                            }
                            else{
                                print("you won against your enemy!")
                                Space()
                                print("you have \(health) left")
                                Space()
                                Space()
                                print("[reminder --> max healt is [10]]")
                                Space()
                            }
                        }
                        else{
                            print("you run away...")
                        }
                    }
                }
            }
        }
        
        
        Space()
        print("game ended with \(health) HP left")
        print("thank you for playing")
        print("until later 👋")
        Space()
        Space()
    }
}

TGame.main()
