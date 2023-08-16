//
//  settingController.swift
//  project1
//
//  Created by Phamcuong on 07/10/2022.
//

import UIKit
import SideMenu

class settingController: UIViewController {

    @IBOutlet weak var tbViewSetting: UITableView!
    @IBOutlet weak var tbViewProfile: UITableView!
    
    let Work = ["Scan QR Code",
                "My History",
                "Help",
                "Log out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbViewSetting.dataSource = self
        tbViewSetting.delegate = self
        
        tbViewProfile.delegate = self
        tbViewProfile.dataSource = self
        
        self.tbViewProfile.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "CellProfile")
        
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: settingController())
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController

    }
    
    @IBAction func goEditProfile(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "profileVC") as! profileController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
@available(iOS 13.0, *)
extension settingController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView.tag == 1 {
//            return Work.count
//        } else{
            return 1
        //}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView.tag == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = Work[indexPath.row]
//            return cell
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellProfile", for: indexPath) as! ProfileTableViewCell
        cell.lbUserName.text = "hello"
        cell.lbWorkSpace.text = "hi"
            return cell
        //}
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            let vc = storyboard?.instantiateViewController(withIdentifier: "homeVC") as! homePageController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if (indexPath.row == 3) {
            let alert = UIAlertController(title: "", message: "Bạn có chắc là muốn đăng xuất?", preferredStyle: .actionSheet)
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in print("Cancel")}
            alert.addAction(cancelButton)
            let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! ViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
