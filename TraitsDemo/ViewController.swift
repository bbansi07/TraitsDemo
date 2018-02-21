//
//  ViewController.swift
//  TraitsDemo
//
//  Created by Bansi Bhatt on 01/02/18.
//  Copyright © 2018 Bansi Bhatt. All rights reserved.
//

import UIKit
extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
}

class ViewController: UIViewController,UITextViewDelegate {
    
    @IBOutlet weak var textview : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.text = "Write text here..."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        textview.translatesAutoresizingMaskIntoConstraints = true
        //textview.sizeToFit()
        textview.isScrollEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "Write text here..."){
            textView.text = ""
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
}

