//
//  UserDetailViewController.swift
//  MoyaDemo
//
//  Created by Steven.Hsieh on 2021/5/12.
//

import UIKit
import RxSwift
import RxCocoa

class UserDetailViewController: UIViewController {

    private var navigationTitle = ""
    
    init(title: String, model: UserService.UserModel) {
        super.init(nibName: nil, bundle: nil)
        navigationTitle = title
        print(model.address.city)
        print(model.address.street)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = navigationTitle
    }
    
}
