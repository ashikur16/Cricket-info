//
//  SharedClass.swift
//  Cricket_Info
//
//  Created by bjit on 13/2/23.
//

import Foundation

class SharedClass {
    static let shared = SharedClass()
    private init() {}
    
    func cutString(startIndex: Int, offset: Int, originalString: String) -> String {
        let startIndex = originalString.index(originalString.startIndex, offsetBy: startIndex)
        let endIndex = originalString.index(startIndex, offsetBy: offset)
        let firstSubstring = originalString[startIndex..<endIndex]
        return String(firstSubstring)
    }
}
