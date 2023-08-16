//
//  ViewController.swift
//  project1
//
//  Created by Phamcuong on 06/10/2022.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    let accessTokenUser:UserDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftView(strImgname: "icons8-person-30", txtField: txtEmail)
        leftView(strImgname: "icons8-lock-30", txtField: txtPassword)
        rightView(txtField: txtPassword)
        updateUI()
        
        currentUser()
    }
    
    func updateUI(){
        btnLogin.layer.cornerRadius = 15
        txtEmail.layer.cornerRadius = 10
        txtPassword.layer.cornerRadius = 10
    }
    
    @IBAction func moveForgotPassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "forgotPasswordVC") as! forgotPasswordController
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @available(iOS 13.0, *)
    @IBAction func btnLoginClick(_ sender: Any) {
        
        //Loadding View
        let loader = self.loader()
        
        let txtEmail = txtEmail.text!
        let txtPassword = txtPassword.text!
        let accessTokenUser = accessTokenUser.object(forKey: "Token")

        
        if !txtEmail.isEmpty, !txtPassword.isEmpty, txtPassword.count >= 6 {
            let RequestLoginAPI = RequestLoginAPI()
            RequestLoginAPI.postRequestAPI(endPoint: "/login/mobile", email: txtEmail, password: txtPassword)
            stopLoader(loader: loader)
            if accessTokenUser != nil {
                let RequestProfileAPI = RequestProfileAPI()
                RequestProfileAPI.getRequestAPI(endPoint: "/get-profile", accessToken: accessTokenUser as! String)
            }
            //print("----------------------\(accessTokenUser!)")
        }
        else{
            stopLoader(loader: loader)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.addAlert(txtMessage: "Đăng nhập thất bại")
            }
        }
        
    }
    
    func currentUser() {
        let accessTokenUser = accessTokenUser.object(forKey: "Token")
        if accessTokenUser != nil {
            let RequestProfileAPI = RequestProfileAPI()
            RequestProfileAPI.getRequestAPI(endPoint: "/get-profile", accessToken: accessTokenUser as! String)
            let storyboard = UIStoryboard(name: "Main", bundle:nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "navHome")
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
      
        }
    }
    
    //RightView Icon
    func leftView(strImgname: String,txtField: UITextField) {
        let imageView = UIImageView(image: UIImage(named: strImgname))
        imageView.frame = CGRect(x: 10, y: 2, width: imageView.image!.size.width , height: imageView.image!.size.height)
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 35))
        paddingView.addSubview(imageView)
        txtField.leftViewMode = .always
        txtField.leftView = paddingView
    }
    
    //LeftView Icon
    func rightView(txtField: UITextField){
        let imageView = UIButton(type: .custom)
        imageView.setImage(UIImage(named: "icons8-eye-50"), for: .normal)
        imageView.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        imageView.frame = CGRect(x: CGFloat(txtField.frame.size.width - 25), y: 5, width: CGFloat(15), height: CGFloat(25))
        imageView.addTarget(self, action: #selector(self.btnEntryPassword), for: .touchUpInside)
        txtField.rightViewMode = .always
        txtField.rightView = imageView
    }
    
    @objc func btnEntryPassword(_ sender: Any){
        if (sender as! UIButton).isSelected{
            self.txtPassword.isSecureTextEntry = true
        }else{
            self.txtPassword.isSecureTextEntry = false
        }
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
    }
}

@available(iOS 13.0, *)
extension ViewController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let alertStyle = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        alertStyle.hidesWhenStopped = true
        alertStyle.startAnimating()
        alertStyle.style = .large
        alert.view.addSubview(alertStyle)
        present(alert, animated: true)
        return alert
    }
    
    func stopLoader(loader: UIAlertController){
        DispatchQueue.main.async {
            loader.dismiss(animated: true)
        }
    }
}

extension UIViewController {
    func addAlert(txtMessage: String){
        let alert = UIAlertController(title: "", message: txtMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
