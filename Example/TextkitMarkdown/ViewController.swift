//
//  ViewController.swift
//  TextkitMarkdown
//
//  Created by NaifAlrashed on 05/18/2019.
//  Copyright (c) 2019 NaifAlrashed. All rights reserved.
//

import UIKit
import TextkitMarkdown

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let markdownTextStorage = MarkdownTextStorage()
        let layoutManager = NSLayoutManager()
        markdownTextStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer()
        layoutManager.addTextContainer(textContainer)
        let textView = UITextView(frame: .zero, textContainer: textContainer)
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                textView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            ])
        }
        textView.isEditable = true
        view.backgroundColor = .white
    }
}
