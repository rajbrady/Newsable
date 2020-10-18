//
//  ViewController.swift
//  GTHacks
//
//  Created by Shubhankar Baliyan on 10/16/20.
//  Copyright © 2020 Shubhankar Baliyan. All rights reserved.
//

import UIKit
import SwiftSoup

struct Model {
    var text: String
    var color: UIColor
    var sentiment: String
    
    init(text: String, color: UIColor, sentiment: String) {
        self.text = text
        self.color = color
        self.sentiment = sentiment
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var NewsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dm = DataManager()
        let x: [[String]] = dm.sortSources()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "newsback")!)
        
        NewsBtn.layer.cornerRadius = 10
        //let dm = DataManager()
        //dm.addNewsSource(newsSource: "hi", val: -1, address: "nfl.com")
    }
}

public extension String {
  func indexInt(of char: Character) -> Int? {
    return firstIndex(of: char)?.utf16Offset(in: self)
  }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
