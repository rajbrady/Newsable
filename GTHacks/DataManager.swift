//
//  DataManager.swift
//  HackathonProj
//
//  Created by Raj Janardhan on 10/17/20.
//

import Foundation
import Firebase
import FirebaseDatabase

extension NSAttributedString{
    
    static func makeHyperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedRange = NSMutableAttributedString(string: string)
        attributedRange.addAttribute(.link, value: path,  range: substringRange)
        return attributedRange
    }
}


final class DataManager {
   // FirebaseApp.configure()
    let database = Database.database().reference()
    
    //public func setUpString
    
    
    func bubbleSort(intarr: [Double], strarr: [String]) -> [[String]] {
        print(intarr.count)
        print("Please please please work")
        var ans: [[String]] = []
        guard intarr.count > 1 else { return ans }
        var sortedArray = intarr
        var temparr: [String] = []
        
        var sortedstrarr = strarr
        for i in 0..<sortedArray.count{
            for j in 0..<sortedArray.count-i-1 {
                if sortedArray[j] > sortedArray[j + 1] {
                    sortedArray.swapAt(j+1, j)
                    sortedstrarr.swapAt(j+1, j)
                }
            }
        }
        print("finished sort")
        print("does that work")
        print(sortedArray[0])
        
        for i in 0..<intarr.count{
            ans.append([sortedstrarr[i], String(sortedArray[i])])
            //ans[i][0] = sortedstrarr[i]
            //ans[i][1] = String(sortedArray[i])
            print(ans[i][0])
            print(ans[i][1])
        }
        
        var x: [[String]] = ans
        var y = 0;
        if(x.count < 12) {
            y = x.count
        }
        else{
            y = 12
        }
        topLink = "https://www." + x[0][0].lowercased() + ".com"
        print(topLink)
        if x.count != 0 {
            for i in 0...y-1 {
                //print(x[i][0])
                if(x.count == 0) {
                    continue
                }
                /*
                let button1: UIButton = {
                    
                    let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
                    var spaceStr = ""
                    let tempSize = x[i][0].count
                    for _ in 0...(10-tempSize+2) {
                        spaceStr += "   "
                    }
                    let n1 = Double(x[i][1])! * 100
                    let n2 = Int(n1)
                    let n3 = Double(n2)
                    let newNum = n3 / 100
                    button1.setTitle(x[i][0] + spaceStr + String(newNum) + " ", for: .normal)
                    button1.setTitleColor(UIColor.red, for: .normal)
                    print("Chicken WIngooo")
                    print(button1.title)
                    button1.isEnabled = true
                    button1.layer.borderWidth = 5;
                    //button1.font = UIFont(name: "San Francisco", size: 20)!
                    button1.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)

                    //button1.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)
                    
                    
                    button1.translatesAutoresizingMaskIntoConstraints = false
                    return button1
                    //button1.font = button1.font.withSize(35)
                }()
 */
                let label1: UILabel = {
                    print("I like popcorn")
                    print(x[i][0])
                    let label = UILabel()
                    var spaceStr = ""
                    let tempSize = x[i][0].count
                    for _ in 0...(10-tempSize+2) {
                        spaceStr += "   "
                    }
                    let n1 = Double(x[i][1])! * 100
                    let n2 = Int(n1)
                    let n3 = Double(n2)
                    let newNum = n3 / 100
                    /*
                    let plainAttributedString = NSMutableAttributedString(string: x[i][0], attributes: nil)
                    let string = x[i][0]
                    let attributedLinkString = NSMutableAttributedString(string: string, attributes:[NSAttributedString.Key.link: URL(string: x[i][0] + ".com")!])
                    let fullAttributedString = NSMutableAttributedString()
                    fullAttributedString.append(plainAttributedString)
                    fullAttributedString.append(attributedLinkString)
                    label.isUserInteractionEnabled = true
                    label.attributedText = fullAttributedString
                    label.isUserInteractionEnabled = true
                    //label.isEditable = false
                    label.attributedText = fullAttributedString
                    print("Hopefully this doesnt work")
                    print(attributedLinkString)
                    */
                    
                    
                    let path = x[i][0] + ".com"
                    
                    
                    label.text = x[i][0] + spaceStr + String(newNum) + " "
                    label.textAlignment = .center
                    label.font = label.font.withSize(35)
                    label.translatesAutoresizingMaskIntoConstraints = false
                    let attributedString = NSAttributedString.makeHyperLink(for: path, in: label.text!, as: "here")
                    print("INTERESTING")
                    print(attributedString)
                    label.attributedText = attributedString
                    
                    
                    label.layer.borderColor = UIColor.darkGray.cgColor
                    label.layer.borderWidth = 3.0

                    
                    label.layer.shadowColor = UIColor.black.cgColor
                    label.layer.shadowRadius = 3.0
                    label.layer.shadowOpacity = 0.25
                    label.layer.shadowOffset = CGSize(width: 4, height: 4)
                    label.layer.masksToBounds = false
                    return label
 
                }()
                
                labels[i] = label1
            }
        }
        print(ans.count)
        return ans;
    }
    /*
    public func hyperLink(a: String) -> String {
        
    }
    */
    public func sortSources() -> [[String]] {
        print("calls")
        var sources: [[String:Double]] = [[:]];
        var strArray: [String] = []
        var intArray: [Double] = []
        var ans: [[String]] = []
        self.database.child("newsSources").observeSingleEvent(of: .value, with: { snapshot in
            print("hi")
            if var collection = snapshot.value as? [[String: String]] {
                print("essssss")
                for i in collection {
                    //var esto = (Double) i["ave"]
                    print("wassup")
                    strArray.append(i["name"]!)
                    intArray.append(abs(Double(i["ave"]!)!))
                    sources.append([i["name"]!: Double(i["ave"]!)!])
                }
                ans = self.bubbleSort(intarr: intArray, strarr: strArray)
                return
            }
            else {
                return
            }
        })
        for i in ans {
            print(i[0])
            
            print(i[1])
        }
       
        
        
        return ans
    }
    
    /*
    @objc func buttonClicked(_ sender: UIButton!) {
        print("Button Clicked")
    }
 */
    
    public func addNewsSource(newsSource: String, val: Int, address: String) {
        print("Entered")
        var x = true;
        let convID = "news_\(newsSource)"
        let newsData: [String: Any] = [
            "name": newsSource,
            "ave": val,
            "count": 1,
            "address": address
        ]
        
        let value: [String: Any] = [
            "newsSource": newsData
        ]
        /*
        database.child("/news").observe(.value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
            if(value["name"] is String && value["name"] as! String == convID) {
                x = false;
                
            }
            
        })
        */
        var str = ""
        if(val == 1) {
            str = "Positive"
        }
        else if(val == -1) {
            str = "Negative"
        }
        var addingAve = "";
        var addingCount = "";
        print("going to method")
        print(newsSource)
        if(x) {
            print("ASdf")
            self.database.child("newsSources").observeSingleEvent(of: .value, with: { snapshot in
                print("entered first part")
                if var collection = snapshot.value as? [[String: String]] {
                    let newElement = [
                        "name": newsSource,
                        "ave": String(val),
                        "count": String(abs(val)),
                        "address": address
                    ]
                    //collection.append(newElement)
                    print(newsSource)
                    var count = 0;
                    var esto = true;
                    for i in collection {
                        print(newsSource)
                        if(i["name"] == newsSource) {
                            print("WOOOO")
                            var temp = i["ave"]
                            var temp2 = i["count"]
                            var myAve = Double(i["ave"]!) ?? 2
                            var myCount = Double(i["count"]!) ?? -1
                            if(myAve != 2 && myCount != -1) {
                                var c = Double(myCount)
                                var total = myAve*c
                                total += Double(val)
                                print(c)
                                c += 1.0
                                print(c)
                                myAve = total/c
                                esto = false;
                                addingAve = String(myAve)
                                addingCount = String(c)
                            }
                            collection.remove(at: count)
                            
                        }
                        count += 1;
                    }
                    if(!esto) {
                        let elem = [
                            "name": newsSource,
                            "ave": addingAve,
                            "count": addingCount,
                            "address": address
                        ]
                        collection.append(elem)
                        self.database.child("newsSources").setValue(collection, withCompletionBlock: { error, _ in
                            guard error == nil else {
                                return
                            }
                        })
                    }
                    else {
                        collection.append(newElement)
                        self.database.child("newsSources").setValue(collection, withCompletionBlock: { error, _ in
                            guard error == nil else{
                                return
                            }
                            
                        })
                    }
                    
                }
                else {
                    print("entered second part")
                    let newCollection = [[
                        "name": newsSource,
                        "ave": String(val),
                        "count": String(abs(val)),
                        "address": address
                    ]]
                    
                    self.database.child("newsSources").setValue(newCollection, withCompletionBlock: { error, _ in
                        guard error == nil else {
                            return
                        }
                    })
                }
            })
            /*
            let newsID = "news_\(newsSource)"
            database.child("\(newsID)").setValue(value, withCompletionBlock: { error, _ in
                guard error == nil else {
                    //completion(false)
                    print("Failed to set the child")
                    return
                }
                //completion(true)
            })
 */
        }
    }
    /*
    public func addAuthor(author: String, val: Int) {
        var x = true;
        
        let newsData: [String: Any] = [
            "name": author,
            "ave": val,
            "count": 1
        ]
        
        database.child("author").observe(.value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return ;
            }
            if(value["name"] is String && value["name"] as! String == author) {
                x = false;
            }
        })
        
        if(x) {
            let newsID = "author_\(author)"
            database.child("\(author)").setValue(newsData, withCompletionBlock: { error, _ in
                guard error == nil else {
                    return
                }
            })
        }
    }
   */
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}


