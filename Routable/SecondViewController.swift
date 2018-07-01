//
//  SecondViewController.swift
//  Routable
//
//  Created by Sami Ali on 4/29/18.
//  Copyright © 2018 Sami Ali. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var someVar: String = "not altered"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(someVar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
