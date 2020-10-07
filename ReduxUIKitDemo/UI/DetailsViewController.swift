//
//  DetailsViewController.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var infoLabel: UILabel!
    
    // MARK: - Interface
    
    var selectedUser: User?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = selectedUser {
            infoLabel.text = "\(user.name) \n age: \(user.age)"
        }
    }
}
