//
//  ReminderDispVc.swift
//  Level Assessment
//
//  Created by Jon Snow on 01/02/24.
//

import UIKit
 

class ReminderDispVc: UIViewController {
    
    
    @IBOutlet weak var TitleFiels: UITextField!
    
    @IBOutlet weak var BodyTextField: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTapped))
    }
    
     @objc func saveTapped(_ sender: UIButton) {
        if let titleText = TitleFiels.text, !titleText.isEmpty,
            let bodyText = BodyTextField.text, !bodyText.isEmpty{
            
            let targetDate = datePicker.date
            completion?(titleText, bodyText, targetDate)
            
        }
    }
    
}
