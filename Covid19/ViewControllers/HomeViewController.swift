//
//  HomeViewController.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class HomeViewController: BaseViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var refreshControl = UIRefreshControl()
    
    var baseResponse : BaseResponse?
    var filterData : [Response]?
    
    private var countryViewModel : CountryViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showProgress()
        self.addNavRightItems()
        self.addNavLogo()
        self.setRefreshControl()
        self.setUI()
        self.searchBar?.delegate = self
        callToViewModelForUIUpdate()
        self.reloadAction = {
            self.countryViewModel.callFuncToGetEmpData()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func callToViewModelForUIUpdate(){
        self.countryViewModel =  CountryViewModel()
        self.countryViewModel.bindCountryViewModelToController = { response -> Void in
            self.baseResponse = response
            self.filterData = response.response
            self.updateDataSource()
        }
        self.countryViewModel.bindErrorToController = { error -> Void in
            self.showAlertMessage(message: error!.localizedDescription)
            
        }
    }
    
    
    func updateDataSource(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        self.hideProgress()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.filterData != nil && self.filterData!.count > 0{
            return self.filterData!.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell(identifier: "HomeCell", tableView: tableView) as? HomeCell
        cell?.setUI(country: self.filterData?[indexPath.row])
        cell?.selectionStyle = .none
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.showProgress()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.contentDetail = self.baseResponse?.response[indexPath.row]
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "all_back", comment: ""))", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func setRefreshControl(){
        refreshControl.attributedTitle = NSAttributedString(string: "Yenilemek için aşağı kaydırın")
           refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
           tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.countryViewModel.callFuncToGetEmpData()
        self.refreshControl.endRefreshing()
    }
    
    private func setUI(){
        
        let topBarHeight = getStatusBarHeight() + (self.navigationController?.navigationBar.frame.height ?? 0.0)
        self.searchBar.frame  = CGRect(x: 0, y: topBarHeight, width: screen().width, height: self.searchBar.frame.height)
        self.tableView.frame = CGRect(x: 0, y: topBarHeight + self.searchBar.frame.height, width: screen().width, height: screen().height - (topBarHeight + self.searchBar.frame.height))
        
        if let textfield = self.searchBar!.value(forKey: "searchField") as? UITextField {
            textfield.textColor = colorFromARGB(hex: "5D6874")
            textfield.backgroundColor = colorFromARGB(hex: "041424")
            textfield.attributedPlaceholder = NSAttributedString(string: "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "search_text", comment: ""))", attributes: [NSAttributedString.Key.foregroundColor : colorFromARGB(hex: "5D6874")])
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        self.filterData = self.baseResponse?.response.filter {
              return $0.country?.range(of: searchText, options: .caseInsensitive) != nil
         }
        
        if searchText.count == 0 {
            self.filterData = baseResponse?.response
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil && searchBar.text!.count > 0 {
            searchBar.endEditing(true)
            print(searchBar.text!)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.filterData = baseResponse?.response
        self.tableView.reloadData()
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
}
