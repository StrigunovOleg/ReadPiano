//
//  Response.swift
//  ReadPiano
//
//  Created by Олег Стригунов on 02.08.2022.
//

import Foundation

enum Response: String {
    case `do`, re, mi, fa, sol, ly, si
    
    var description: String {
        switch self {
        case .`do`: return "DO"
        case .re: return "RE"
        case .mi: return "MI"
        case .fa: return "FA"
        case .sol: return "SOL"
        case .ly: return "LY"
        case .si: return "SI"
        }
    }
    
    var needsBlackButton: Bool {
        switch self {
        case .`do`: return false
        case .re: return true
        case .mi: return true
        case .fa: return false
        case .sol: return true
        case .ly: return true
        case .si: return true
        }
    }
    
    
}
