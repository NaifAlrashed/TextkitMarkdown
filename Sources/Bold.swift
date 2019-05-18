//
//  Bold.swift
//  TextkitMarkdown
//
//  Created by Naif Alrashed on 18/05/2019.
//

import UIKit
import MarkdownParser

struct Bold: TextRepresentable {
    
    let attributes: [NSAttributedStringKey: Any] = [
        NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 12)
    ]
}
