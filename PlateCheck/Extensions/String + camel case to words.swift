//
//  String + camel case to words.swift
//  PlateCheck
//
//  Created by Noam Efergan on 07/03/2023.
//

import Foundation
extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.dropFirst().reduce(String(prefix(1))) {
            return CharacterSet.uppercaseLetters.contains($1)
                ? $0 + " " + String($1)
                : $0 + String($1)
        }
    }
}
