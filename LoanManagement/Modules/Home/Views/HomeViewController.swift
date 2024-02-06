//
//  HomeViewController.swift
//  LoanManagement
//
//  Created by Muhammad Fachri Nuriza on 05/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tabs: Tabs!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupTabs() {
        // Rounded Tabs
        let items = [TabItem(id: 1, name: "Semua"), TabItem(id: 2, name: "Invesment")]
        tabs.items = items
        tabs.onChange = { [unowned self] selected in
//            tabs.selected = selected - 1
            
        }
    }

}
