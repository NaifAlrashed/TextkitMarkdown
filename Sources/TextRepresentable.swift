//
//  TextRepresentable.swift
//  TextkitMarkdown
//
//  Created by Naif Alrashed on 18/05/2019.
//

import Foundation

protocol TextRepresentable {
    var attributes: [NSAttributedStringKey: Any] { get }
}
