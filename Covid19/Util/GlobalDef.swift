//
//  GlobalDef.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//
import UIKit

func screen() -> CGRect {
    return UIScreen.main.bounds
}

func isIphone_4() -> Bool {
   return (fabs(Double.init(screen().size.height - 480)) < .ulpOfOne)
}

func isIphone_5() -> Bool {
    return (fabs(Double.init(screen().size.height - 568)) < .ulpOfOne)
}

func isIphone_6() -> Bool {
    return (fabs(Double.init(screen().size.height - 667)) < .ulpOfOne)
}

func isIphone_6_plus() -> Bool {
    return (fabs(Double.init(screen().size.height - 736)) < .ulpOfOne)
}

func isIphone_X() -> Bool {
    return screen().equalTo(CGRect(x: 0, y: 0, width: 375, height: 812))
}

func isIphone_Xmax() -> Bool {
    return screen().equalTo(CGRect(x: 0, y: 0, width: 414, height: 896))
}

func getStatusBarHeight() -> CGFloat{
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        return UIApplication.shared.statusBarFrame.height
    }
}

func colorFromARGB(hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor (
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
