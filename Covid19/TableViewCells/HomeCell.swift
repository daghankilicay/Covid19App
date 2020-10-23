//
//  HomeCell.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lbltotalTestTitle: UILabel!
    @IBOutlet weak var lblTest: UILabel!
    
    @IBOutlet weak var lblDdailyCaseTitle: UILabel!
    @IBOutlet weak var lblDailyCase: UILabel!
    
    @IBOutlet weak var lblDailyDeathTitle: UILabel!
    @IBOutlet weak var lblDailyDeath: UILabel!
    
    @IBOutlet weak var statisticView: UIView!
    @IBOutlet weak var fullView: UIView!
    //    @IBOutlet weak var lblCase: UILabel!
//    @IBOutlet weak var lblDeath: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.statisticView.layer.cornerRadius = 10
        self.statisticView.layer.masksToBounds = true
        self.fullView.layer.cornerRadius = 10
        self.fullView.layer.masksToBounds = true
    }
    
    func setUI(country : Response?){
        self.lblCountryName.text = "\(country?.country ?? "")"
        self.lbltotalTestTitle.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_tests", comment: ""))"
        self.lblTest.text = "\(country?.tests.total ?? 0)"
        self.lblDdailyCaseTitle.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "daily_case", comment: ""))"
        self.lblDailyCase.text = "\(country?.cases.new ?? "")"
        self.lblDailyDeathTitle.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "daily_death", comment: ""))"
        self.lblDailyDeath.text  = "\(country?.deaths.new ?? "0")"
    }
    
}
