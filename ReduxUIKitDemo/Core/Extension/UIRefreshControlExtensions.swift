//
//  UIRefreshControlExtensions.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

extension UIRefreshControl {
    func beginRefreshingAutomatically() {
        guard let scrollView = superview as? UIScrollView else {
            return
        }
        beginRefreshing()
        let offsetPoint = CGPoint.init(x: 0, y: -frame.size.height)
        scrollView.setContentOffset(offsetPoint, animated: true)
    }
}
