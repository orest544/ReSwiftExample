//
//  DetailsViewController.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    
    var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = selectedUser {
            infoLabel.text = "\(user.name) \n age: \(user.age)"
        }
    }
}
