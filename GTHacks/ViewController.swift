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
    var cells = [Model] ()
    
    @IBOutlet weak var checkSentiment: UIButton!
    @IBOutlet weak var sentiments: UILabel!
    @IBOutlet weak var tView: UITextView!
    var thisString = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var myHTML = ""
        
        let myURLString = "https://www.wane.com/top-stories/indianapolis-colts-say-several-individuals-have-tested-positive-for-the-coronavirus/"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        let initial = myURLString.indexInt(of: ".")!
        let sub1 = myURLString[(initial+1)...]
        let final = sub1.indexInt(of: ".")!
        let name = sub1[0..<final].uppercased()
        print(name)
        
        
        //var thisString = "";
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            //print("HTML : \(myHTMLString)")
            myHTML = myHTMLString
            thisString = myHTMLString
        } catch let error {
            print("Error: \(error)")
        }
        
        do{
           let html = myHTML
           let doc: Document = try SwiftSoup.parse(html)
           print(try doc.text())
        }catch Exception.Error(let type, let message)
        {
            print("")
        }catch{
            print("")
        }
    }
    
    func sentimentCheck(sent: String) -> Int {
        let model = IMDBReviewClassifier()
        //if let text = tView.text {
            do {
                let pred = try model.prediction(text: sent)
                if pred.label == "Positive" {
                    sentiments.text = "Pos"
                    return 1
                }
                else if pred.label == "Negative" {
                    sentiments.text = "Negative"
                    return -1
                }
                else {
                    sentiments.text = "Neutral"
                    return 0
                }
            } catch {
                print(error)
            }
        return 0
        //}
    }

    @IBAction func checkSentiment(_ sender: Any) {
        print("hi")
        let model = IMDBReviewClassifier()
        if let text = tView.text {
            do {
                let pred = try model.prediction(text: thisString)
                if pred.label == "Positive" {
                    sentiments.text = "Pos"
                }
                else if pred.label == "Negative" {
                    sentiments.text = "Negative"
                }
                else {
                    sentiments.text = "Neutral"
                }
            } catch {
                print(error)
            }
        }
        
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
