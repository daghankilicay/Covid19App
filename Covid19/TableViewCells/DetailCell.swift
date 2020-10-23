//
//  DetailCell.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblContinent: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    
    @IBOutlet weak var lblCasesTitle: UILabel!
    @IBOutlet weak var lblNewCases: UILabel!
    @IBOutlet weak var lblActiveCases: UILabel!
    @IBOutlet weak var lblCriticalCases: UILabel!
    @IBOutlet weak var lblRecoveredCases: UILabel!
    @IBOutlet weak var lblTotalCases: UILabel!
    
    
    @IBOutlet weak var lblTestTitle: UILabel!
    @IBOutlet weak var lblTotalTest: UILabel!
    
    @IBOutlet weak var lblDeathTitle: UILabel!
    @IBOutlet weak var lblNewDeath: UILabel!
    @IBOutlet weak var lblTotalDeath: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.backgroundColor = UIColor.clear
        
    }
    
    func setUI(contentDetail : Response){
        self.lblDay.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "day", comment: "")): \(contentDetail.day ?? "")"
        self.lblContinent.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continent", comment: "")): \(contentDetail.continent ?? "")"
        self.lblCountry.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "country", comment: "")): \(contentDetail.country ?? "")"
        self.lblPopulation.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_population", comment: "")): \(contentDetail.population ?? 0)"
        self.lblCasesTitle.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "cases", comment: ""))"
        self.lblNewCases.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "new_case", comment: "")): \(contentDetail.cases.new ?? "")"
        self.lblActiveCases.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "active_case", comment: "")):  \(contentDetail.cases.active ?? 0)"
        self.lblCriticalCases.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "critical_case", comment: "")): \(contentDetail.cases.critical ?? 0)"
        self.lblRecoveredCases.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "recovered_case", comment: "")): \(contentDetail.cases.recovered ?? 0)"
        self.lblTotalCases.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_case", comment: "")): \(contentDetail.cases.total ?? 0)"
        self.lblTestTitle.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "tests", comment: ""))"
        self.lblTotalTest.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_test", comment: "")): \(contentDetail.tests.total ?? 0)"
        self.lblDeathTitle.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "deaths", comment: ""))"
        self.lblNewDeath.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "new_deaths", comment: "")): \(contentDetail.deaths.new ?? "")"
        self.lblTotalDeath.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_deaths", comment: "")): \(contentDetail.deaths.total ?? 0)"
    }
    
}
