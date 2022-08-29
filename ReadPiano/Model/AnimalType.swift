//
//  AnimalType.swift
//  ReadPiano
//
//  Created by Олег Стригунов on 02.08.2022.
//

import Foundation


enum AnimalType: String {
    case dog = "dog", cat = "cat", rabbit = "rabbit"
    
    var definition: String {
        
        switch self {
            case .dog:
                return "you dog"
            case .cat:
                return "you cat"
            case .rabbit:
                return "you rabbit"
        }
        
    }

}
