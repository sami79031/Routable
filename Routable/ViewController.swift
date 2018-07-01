//
//  ViewController.swift
//  Routable
//
//  Created by Sami Ali on 4/29/18.
//  Copyright © 2018 Sami Ali. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(_ sender: UIButton) {
        //show(storyboard: .main, identifier: "second", configure: nil)
        
        //present(storyboard: .main, identifier: "second", animated: true, modalPresentationStyle: .fullScreen, configure: nil, completion: nil)
        
        
        //push(storyboard: .main, identifier: "second", animated: true, configure: nil)
        
        showDetailViewController(storyboard: .main, identifier: "second") { (cntr) in
            if let s = cntr as? SecondViewController{
                s.someVar = "ehhhaaa"
            }
        }
        
//        let url = URL(string: "https://www.youtube.com/watch?v=q71gsQ1Q3xs")!
//        let safarVC = SFSafariViewController(url: url)
//        self.present(safarVC, animated: true, completion: nil)
    }
    
}

extension ViewController: Routable {
    
    enum StoryboardIdentifier: String {
        case profile = "Profile"
        case main = "Main"
    }
}


