//
//  DetailViewController.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class DetailViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtView: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnHistory: UIButton!
    private var countryDetailViewModel : CountryDetailViewModel!
    var contentDetail : Response?
    var detailView : UIView!
    var pickerDate : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showProgress()
        self.addNavShareRightItems()
        self.updateDataSource()
        self.btnHistory.addTarget(self, action: #selector(setDatePicker), for: .touchUpInside)
        self.pickerDate = self.contentDetail?.day ?? ""
        self.btnHistory.setTitle("\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "past", comment: ""))", for: .normal)
    }
    
    private func updateDataSource(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        self.hideProgress()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.countryDetailViewModel =  CountryDetailViewModel(countryName: contentDetail?.country, strDay: pickerDate)
        
        self.countryDetailViewModel.bindCountryViewModelToController = { response -> Void in
            self.contentDetail = response.response.first
            self.tableView.reloadData()
            self.hideProgress()
        }
    }
    
    var toolBar = UIToolbar()
    var datePicker = UIDatePicker()
    
    @objc func setDatePicker() {
        datePicker = UIDatePicker.init()
        datePicker.datePickerMode = .date

        datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 0.0, y: screen().height - 115, width: screen().width, height: 125)
        datePicker.backgroundColor = UIColor.black
        
        self.view.addSubview(datePicker)

        toolBar = UIToolbar(frame: CGRect(x: 0, y: screen().height - 150, width: screen().width, height: 50))
        toolBar.barStyle = .black
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        toolBar.sizeToFit()
        self.view.addSubview(toolBar)
    }

    
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.pickerDate = dateFormatter.string(from: sender!.date)
    }

    @objc func onDoneButtonClick() {
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
        self.showProgress()
        self.callToViewModelForUIUpdate()
    }
    
    func addNavShareRightItems() {
        let shareButtonWidth = screen().width * 0.16354
        let shareButtonHeight = shareButtonWidth * 0.3861
        
        let shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: shareButtonWidth , height: shareButtonHeight))
        shareButton.semanticContentAttribute = .forceLeftToRight
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.setTitleColor(.black, for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        shareButton.addTarget(self, action: #selector(clickShare), for: .touchUpInside)
        shareButton.tintColor = .black
        let right = UIBarButtonItem(customView: shareButton)
        self.navigationItem.rightBarButtonItem = right
    }
    
    @objc func clickShare() {
        let items = ["\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "day", comment: "")): \(contentDetail?.day ?? ""), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continent", comment: "")): \(contentDetail?.continent ?? ""), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "country", comment: "")): \(contentDetail?.country ?? ""), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_population", comment: "")): \(contentDetail?.population ?? 0), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "new_case", comment: "")): \(contentDetail?.cases.new ?? ""), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "active_case", comment: "")):  \(contentDetail?.cases.active ?? 0), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "critical_case", comment: "")): \(contentDetail?.cases.critical ?? 0), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "recovered_case", comment: "")): \(contentDetail?.cases.recovered ?? 0), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_case", comment: "")): \(contentDetail?.cases.total ?? 0), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_test", comment: "")): \(contentDetail?.tests.total ?? 0), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "new_deaths", comment: "")): \(contentDetail?.deaths.new ?? ""), \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "total_deaths", comment: "")): \(contentDetail?.deaths.total ?? 0) "]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.contentDetail != nil{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueCell(identifier: "DetailCell", tableView: tableView) as? DetailCell
        cell?.setUI(contentDetail: self.contentDetail!)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}
