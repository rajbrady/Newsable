//
//  ShowLink.swift
//  GTHacks
//
//  Created by Raj Janardhan on 10/18/20.
//  Copyright © 2020 Shubhankar Baliyan. All rights reserved.
//

import UIKit
import WebKit

class ShowLink: UIViewController  {

    @IBOutlet weak var WebPage: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        WebPage.load(URLRequest(url: URL(string: topLink)!))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
