//
//  NewsPage.swift
//  Pods
//
//  Created by Shubhankar Baliyan on 10/17/20.
//

import UIKit

let labelIntro: UILabel = {
    let label = UILabel()
    label.text = "Source Title\t\t\t\tRating"
    label.textAlignment = .center
    label.font = label.font.withSize(35)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()


var labels = [labelIntro]
//import SwiftUI
class NewsPage: UIViewController {

    var height = 0
    @IBOutlet weak var ScrollView1: UIScrollView!
    @IBOutlet weak var View1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for label in labels {
            View1.addSubview(label)
            label.topAnchor.constraint(equalTo: View1.topAnchor, constant: CGFloat(height)).isActive = true
            height += 200
            View1.frame = CGRect(x: 0, y: 0, width: View1.frame.width, height: View1.frame.height + 200)

        }
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
