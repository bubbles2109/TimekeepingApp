//
//  ManualClockingController.swift
//  project1
//
//  Created by Phamcuong on 28/10/2022.
//

import UIKit
import DropDown

class ManualClockingController: UIViewController {
    
    @IBOutlet weak var txtClockin: UITextField!
    @IBOutlet weak var txtDescribe: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    let dropDown = DropDown()
    let menu = ["Clock in", "Clock out"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIManualClocking()
        
        setPaddingLeft(txtField: txtClockin)
        rightView(txtField: txtClockin)
        
        dropDown.anchorView = txtClockin
        dropDown.dataSource = menu
        
        //Set Action
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        txtClockin.addGestureRecognizer(tapGR)
        txtClockin.isUserInteractionEnabled = true
        
        //Dropdown location
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        
        //Input textfield
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.txtClockin.text = menu[index]
        }
        
    }
    
    func updateUIManualClocking(){
        txtClockin.layer.cornerRadius = 8
        txtClockin.layer.borderColor = UIColor.black.cgColor
        txtClockin.layer.borderWidth = 1.0
        
        txtDescribe.layer.cornerRadius = 8
        txtDescribe.layer.borderColor = UIColor.black.cgColor
        txtDescribe.layer.borderWidth = 1.0
        txtDescribe.layer.backgroundColor = UIColor.clear.cgColor
        
        btnSubmit.layer.cornerRadius = 8
        btnSubmit.layer.borderWidth = 1.0
    }
    
    func setPaddingLeft(txtField: UITextField){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        txtField.leftView = paddingView
        txtField.leftViewMode = .always
    }
    
    func rightView(txtField: UITextField){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "expand_more_24px"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(txtField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        txtField.rightView = button
        txtField.rightViewMode = .always
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            dropDown.show()
        }
    }
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
