//
//  editProfileController.swift
//  project1
//
//  Created by Phamcuong on 11/10/2022.
//

import UIKit

class editProfileController: UIViewController {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var roleView: UIView!
    @IBOutlet weak var workSpaceView: UIView!
    @IBOutlet weak var shiftView: UIView!
    @IBOutlet weak var mobilePhoneView: UIView!
    @IBOutlet weak var btnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRadius(view: nameView)
        addRadius(view: roleView)
        addRadius(view: workSpaceView)
        addRadius(view: mobilePhoneView)
        addRadius(view: shiftView)
        
        btnSave.layer.cornerRadius = 25
        
    }
    
    func addRadius(view: UIView){
        view.layer.cornerRadius = 15
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
