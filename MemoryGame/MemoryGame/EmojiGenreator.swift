//
//  EmojiGenreator.swift
//  MemoryGame
//
//  Created by Ali Can Arslan on 22.10.22.
//
import SwiftUI
import Foundation

func isEmoji(_ value: Int) -> Bool {
    switch value {
    case 0x1F600...0x1F64F, // Emoticons
    0x1F300...0x1F5FF, // Misc Symbols and Pictographs
    0x1F680...0x1F6FF, // Transport and Map
    0x1F1E6...0x1F1FF, // Regional country flags
    0x2600...0x26FF,   // Misc symbols 9728 - 9983
    0x2700...0x27BF,   // Dingbats
    0xFE00...0xFE0F,   // Variation Selectors
    0x1F900...0x1F9FF,  // Supplemental Symbols and Pictographs 129280 - 129535
    0x1F018...0x1F270, // Various asian characters           127000...127600
    65024...65039, // Variation selector
    9100...9300, // Misc items
    8400...8447: // Combining Diacritical Marks for Symbols
        return true
       
    default: return false
    }
}

extension Character {
    private static let refUnicodeSize: CGFloat = 8
    private static let refUnicodePng =
        Character("\u{1fff}").png(ofSize: Character.refUnicodeSize)
   
    func png(ofSize fontSize: CGFloat) -> Data? {
        let attributes = [NSAttributedString.Key.font:
            UIFont.systemFont(ofSize: fontSize)]
        let charStr = "\(self)" as NSString
        let size = charStr.size(withAttributes: attributes)
       
        UIGraphicsBeginImageContext(size)
        charStr.draw(at: CGPoint(x: 0,y :0), withAttributes: attributes)
       
        var png:Data? = nil
        if let charImage = UIGraphicsGetImageFromCurrentImageContext() {
            png = charImage.pngData()
        }
       
        UIGraphicsEndImageContext()
        return png
    }
   
    func unicodeAvailable() -> Bool {
        if let refUnicodePng = Character.refUnicodePng,
            let myPng = self.png(ofSize: Character.refUnicodeSize) {
            return refUnicodePng != myPng
        }
        return false
    }
}
