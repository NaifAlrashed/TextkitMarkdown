//
//  MarkdownTextStorage.swift
//  TextkitMarkdown
//
//  Created by Naif Alrashed on 18/05/2019.
//

import Foundation

public final class MarkdownTextStorage: NSTextStorage {
    
    let content = NSMutableAttributedString()
    
    override public var string: String {
        return content.string
    }
    
    override public func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedStringKey : Any] {
        return content.attributes(at: location, effectiveRange: range)
    }
    
    override public func replaceCharacters(in range: NSRange, with str: String) {
        beginEditing()
        content.replaceCharacters(in: range, with: str)
        edited(.editedCharacters, range: range, changeInLength: (str as NSString).length - range.length)
        endEditing()
    }
    
    override public func setAttributes(_ attrs: [NSAttributedStringKey : Any]?, range: NSRange) {
        beginEditing()
        content.setAttributes(attrs, range: range)
        edited(.editedAttributes, range: range, changeInLength: 0)
        endEditing()
    }
}
