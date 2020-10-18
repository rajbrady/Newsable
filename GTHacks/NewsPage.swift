//
//  NewsPage.swift
//  Pods
//
//  Created by Shubhankar Baliyan on 10/17/20.
//

import UIKit

var topLink = ""

let labelIntro: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textAlignment = .center
    label.font = label.font.withSize(35)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

/*
let buttonIntro: UIButton = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    button.setTitle("Button", for: .normal)
    //button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()
 */

//var buttons = [UIButton](repeating: buttonIntro, count: 12)
var labels = [UILabel](repeating: labelIntro, count: 12)
//import SwiftUI
class NewsPage: UIViewController {

    @IBOutlet weak var AddBtn: UIButton!
    var height = 0
    @IBOutlet weak var ScrollView1: UIScrollView!
    @IBOutlet weak var View1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dm = DataManager()
        
        AddBtn.layer.cornerRadius = 10
        
        for label in labels {
            
            View1.addSubview(label)
            label.topAnchor.constraint(equalTo: View1.topAnchor, constant: CGFloat(height)).isActive = true
            height += 47
            View1.frame = CGRect(x: 0, y: 0, width: View1.frame.width, height: View1.frame.height + 40)

        }
        
        /*
        for label in labels {
            
            View1.addSubview(label)
            
            label.topAnchor.constraint(equalTo: View1.topAnchor, constant: CGFloat(height)).isActive = true
            height += 47
            View1.frame = CGRect(x: 0, y: 0, width: View1.frame.width, height: View1.frame.height + 40)

        }
 */
        //ScrollView1.addSubview(label1)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

     @IBOutlet weak var ScrollViewAction1: UIScrollView!
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
