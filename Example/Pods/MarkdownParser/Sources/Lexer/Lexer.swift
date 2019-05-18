//
//  Lexer.swift
//  MarkdownParser
//
//  Created by Naif Alrashed on 05/04/2019.
//  Copyright © 2019 Naif Alrashed. All rights reserved.
//

public struct Lexer {
    
    private let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func tokenize() -> [TokenContainer] {
        var tokens = [TokenContainer]()
        var parsableInput = Substring(input).unicodeScalars
        while let token = parsableInput.nextToken() {
            tokens.append(token)
        }
        return tokens
    }
}

private extension Substring.UnicodeScalarView {
    
    mutating func nextToken() -> TokenContainer? {
        return readWhiteSpaceAndNewLine() ??
            readCharacterTokens() ??
            readInteger() ??
            readText()
    }
    
    private mutating func readWhiteSpaceAndNewLine() -> TokenContainer? {
        let start = self
        guard let char = popFirst() else {
            self = start
            return nil
        }
        if CharacterSet.whitespaces.contains(char) {
            return TokenContainer(token: .whiteSpace, stringRepresentation: String(char))
        } else if CharacterSet.newlines.contains(char) {
            return TokenContainer(token: .newLine, stringRepresentation: String(char))
        } else {
            self = start
            return nil
        }
    }
    
    private mutating func readCharacterTokens() -> TokenContainer? {
        let start = self
        guard let firstChar = popFirst() else {
            self = start
            return nil
        }
        switch firstChar {
        case "*":
            return TokenContainer(token: .star, stringRepresentation: "*")
        case "_":
            return TokenContainer(token: .underScore, stringRepresentation: "_")
        case "#":
            return TokenContainer(token: .hashtag, stringRepresentation: "#")
        case "(":
            return TokenContainer(token: .openParenthesis, stringRepresentation: "(")
        case ")":
            return TokenContainer(token: .closeParenthesis, stringRepresentation: ")")
        case "[":
            return TokenContainer(token: .openBracket, stringRepresentation: "[")
        case "]":
            return TokenContainer(token: .closeBracket, stringRepresentation: "]")
        case "!":
            return TokenContainer(token: .bang, stringRepresentation: "!")
        case ">":
            return TokenContainer(token: .block, stringRepresentation: ">")
        case "-":
            return TokenContainer(token: .dash, stringRepresentation: "-")
        case "`":
            return TokenContainer(token: .graveAccent, stringRepresentation: "`")
        case ".":
            return TokenContainer(token: .dot, stringRepresentation: ".")
        default:
            self = start
            return nil
        }
    }
    
    private mutating func readInteger() -> TokenContainer? {
        var start = self
        var allIntegers = Substring.UnicodeScalarView()
        while let maybeInteger = popFirst(), CharacterSet.integers.contains(maybeInteger) {
            allIntegers.append(maybeInteger)
            start = self
        }
        self = start
        return allIntegers.isEmpty ? nil: TokenContainer(token: .int(Int(String(allIntegers))!), stringRepresentation: String(allIntegers))
    }
    
    private mutating func readText() -> TokenContainer? {
        var text = ""
        var start = self
        while let char = popFirst() {
            if CharacterSet.markDownKeyWords.inverted.contains(char) {
                text.append(String(char))
            } else {
                self = start
                return text.isEmpty ? nil: TokenContainer(token: .text(text), stringRepresentation: text)
            }
            start = self
        }
        return text.isEmpty ? nil: TokenContainer(token: .text(text), stringRepresentation: text)
    }
}

extension CharacterSet {
    static let markDownKeyWords = CharacterSet(charactersIn: ".`->!()[]_#*")
        .union(.whitespacesAndNewlines)
        .union(.integers)
    static let integers = CharacterSet(charactersIn: "0987654321")
}
