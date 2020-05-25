//
//  DetailController.swift
//  SchoolList
//
//  Created by Ahn on 2020/05/24.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var studentCountLabel: UILabel!
    
    var temp: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.studentCountLabel.text = String(temp!)
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
