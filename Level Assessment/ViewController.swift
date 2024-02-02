//
//  ViewController.swift
//  Level Assessment
//
//  Created by Jon Snow on 01/02/24.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var ImgVIew: UIView!
    
    @IBOutlet weak var StackView: UIStackView!
    
    @IBOutlet weak var HeadLabel: UILabel!
    
    @IBOutlet weak var LabelBtom: UILabel!
    
//    @IBOutlet weak var LabbelBtom: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    //    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "GoalsTVC", bundle: .main), forCellReuseIdentifier: "GoalsTVC")
        tableView.register(UINib(nibName: "ActivityTVC", bundle: .main), forCellReuseIdentifier: "ActivityTVC")
        tableView.dataSource = self
        tableView.delegate = self
    
        
        
    }
    
    @IBAction func BTNTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Reminder", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "ReminderVC") as! ReminderVC
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
                 let cell = tableView.dequeueReusableCell(withIdentifier: "GoalsTVC") as! GoalsTVC
                 return cell
             }
        else{
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTVC") as! ActivityTVC
                 return cell
             }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 240
    }
}





