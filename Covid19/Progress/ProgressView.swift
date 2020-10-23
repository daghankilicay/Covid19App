//
//  ProgressView.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 23.10.2020.
//

import UIKit

class ProgressView: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    static func showProgress() -> ProgressView {
        
        let design = Bundle.main.loadNibNamed("ProgressView", owner: self, options: nil)?[0] as! ProgressView
        design.frame = screen()
        let window = UIApplication.shared.windows.first
        window?.addSubview(design)
        window?.bringSubviewToFront(design)
        design.indicator.startAnimating()
        
         return design
    }

}
