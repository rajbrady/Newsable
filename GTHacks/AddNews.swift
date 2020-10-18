//
//  AddNews.swift
//  GTHacks
//
//  Created by Shubhankar Baliyan on 10/17/20.
//  Copyright © 2020 Shubhankar Baliyan. All rights reserved.
//

import UIKit
import SwiftSoup

var name = ""

class AddNews: UIViewController {
    var cells = [Model] ()
    
    @IBOutlet weak var TextLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var EnterURL: UITextField!
    @IBOutlet weak var AddBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        AddBtn.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func `return`(_ sender: Any) {
        let dm = DataManager()
        dm.sortSources()
    }
    @IBAction func AddBtn(_ sender: Any) {
        let model = IMDBReviewClassifier()
        var myHTML = ""
        var thisString = "";
        
        // Gets URL
        let myURLString = EnterURL.text
        guard let myURL = URL(string: myURLString!) else {
            print("Error: \(myURLString ?? "https://") doesn't seem to be a valid URL")
            return
        }
        
        // Finds Title of News Source and hyperlink
        var hyperlink = ""
        let initial = myURLString!.indexInt(of: ".")!
        let sub1 = myURLString![(initial+1)...]
        let final = sub1.indexInt(of: ".")!
        name = sub1[0..<final].uppercased()
        
        let final2 = sub1.indexInt(of: "/")!
        hyperlink = sub1[0..<final2]
        print(hyperlink)
        
        
        // Webscraping Text From HTML
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
        }catch Exception.Error( _, _)
        {
            print("")
        }catch{
            print("")
        }
        
        // Sentiment Analysis Model
        var resultText = ""
        var currentNum = 0
        do {
            let pred = try model.prediction(text: thisString)
            if pred.label == "Positive" {
                resultText = "Positive"
                valueLbl.text = resultText
                currentNum = 1
            }
            else if pred.label == "Negative" {
                resultText = "Negative"
                valueLbl.text = resultText
                currentNum = -1
            }
            else {
                resultText = "Neutral"
                valueLbl.text = resultText
                currentNum = 0
            }
        } catch {
            print(error)
        }
        let dm = DataManager()
        dm.addNewsSource(newsSource: name, val: currentNum, address: hyperlink)
        let x:[[String]] = dm.sortSources()
        print("RIGHT BEFORE")
        print(x.count)
        
        var y = 0;
        if(x.count < 12) {
            y = x.count
        }
        else{
            y = 12
        }
        for i in 0...y {
            //print(x[i][0])
            if(x.count == 0) {
                continue
            }
            
            /*
            let label1: UILabel = {
                let label1 = UIL(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                button1.setTitle(x[i-1][0] + "        " + x[i-1][1], for: .normal)
                button1.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
                button1.translatesAutoresizingMaskIntoConstraints = false
                return button1
                //button1.font = button1.font.withSize(35)
            }()
 */
            
            let label1: UILabel = {
                let label = UILabel()
                label.text = x[i-1][0] + "        " + x[i-1][1]
                label.textAlignment = .center
                label.font = label.font.withSize(35)
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
 
            labels[i-1] = label1
        }
        
        //labels.append(label1)
        
        TextLbl.text = "This article from " + name + " has on overall " + resultText +
            " leaning bias."
        
        //let dm = DataManager()
        
        
        // Do Database Stuff Here with String name and integer currentNum
        
    }
    
    /*
    @objc func buttonClicked() {
        print("Button Clicked")
    }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
