//
//  BaseViewController.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

class BaseViewController: UIViewController {
    private var buttonLanguage : UIButton!
    var clickedLogo:(()->Void)?
    var progress : ProgressView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addNavRightItems() {
        let buttonLanguageWidth = screen().width * 0.16354
        let buttonLanguageHeight = buttonLanguageWidth * 0.3861
        
        self.buttonLanguage = UIButton(frame: CGRect(x: 0, y: 0, width: buttonLanguageWidth , height: buttonLanguageHeight))
        self.buttonLanguage.semanticContentAttribute = .forceLeftToRight
        self.buttonLanguage.setTitle("\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "current_language", comment: ""))", for: .normal)
        self.buttonLanguage.setTitleColor(.black, for: .normal)
        self.buttonLanguage.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.buttonLanguage.addTarget(self, action: #selector(changeLanguage), for: .touchUpInside)
        
        self.buttonLanguage.layer.borderWidth = 1
        self.buttonLanguage.layer.borderColor = UIColor.black.cgColor
        self.buttonLanguage.layer.cornerRadius = buttonLanguageHeight / 2
        
        let right = UIBarButtonItem(customView: self.buttonLanguage)
        self.navigationItem.rightBarButtonItem = right
    }
    
    @objc func changeLanguage() {
        
        if LocalizationSystem.sharedInstance.getLanguage() == "tr" {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        } else {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "tr")
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let nav = UINavigationController.init(rootViewController: vc)
        nav.navigationBar.barTintColor = UIColor.white
        
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = nav
        
    }
    
    func addNavLogo() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        let image = UIImage(named: "covid19")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.autoresizesSubviews = false
        view.addSubview(imageView)
        let left = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = left
    }
    
    func dequeueCell(identifier:String, tableView:UITableView) -> UITableViewCell {
       var cell = tableView.dequeueReusableCell(withIdentifier:identifier)
       if cell == nil {
           tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
           cell = tableView.dequeueReusableCell(withIdentifier: identifier)
       }
       return cell!
   }
    
    func showAlertMessage(message:String) {

        let alertController = UIAlertController(title: "Covid-19", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "TAMAM", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    var reloadAction : (() -> ())?
    
     func showReloadAlert (message:String?){
        let message = "Sunucu üzerinden hata alındı.Hata Kodu : \(message ?? "")"
        let alertController = UIAlertController(title: "Covid-19", message: message , preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Çıkış", style: .cancel) {
            UIAlertAction in
            self.alertExit()
        }
        let reLoadAction = UIAlertAction(title: "Yeniden Dene", style: .default) {
            UIAlertAction in
            if self.reloadAction != nil{
                self.reloadAction!()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(reLoadAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertExit (){
        exit(0)
    }
    
    func showProgress(){
        self.progress = ProgressView.showProgress()
    }
    
    func hideProgress() {
        self.progress?.removeFromSuperview()
    }
    
    

}
