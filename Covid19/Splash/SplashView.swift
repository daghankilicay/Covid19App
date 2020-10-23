//
//  SplashView.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 23.10.2020.
//

import UIKit

class SplashView: UIView {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    static func show(VC:UIViewController) -> SplashView {
        let design = Bundle.main.loadNibNamed("SplashView", owner: nil, options: nil)?[0] as! UIView
        design.frame = screen()
        VC.view.addSubview(design)
        VC.view.bringSubviewToFront(design)
        return (design as! SplashView)
    }
}
