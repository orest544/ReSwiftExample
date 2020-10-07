//
//  UIViewControllerExtensions.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

enum Storyboard: String {
    case main
    
    var name: String {
        return rawValue.capitalized
    }
}

extension UIViewController {
    static func make<T: UIViewController>(from storyboard: Storyboard = .main) -> T {
        return
            UIStoryboard(name: storyboard.name, bundle: nil)
            .instantiateViewController(withIdentifier: String(describing: Self.self))
            as! T
    }
}
