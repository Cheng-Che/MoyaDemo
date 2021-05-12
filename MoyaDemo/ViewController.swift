//
//  ViewController.swift
//  MoyaDemo
//
//  Created by Steven.Hsieh on 2021/5/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("User info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Main Page"
    }
    
    private func layoutButton() {
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
    }
    
    @objc func buttonClicked() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "User") as UserTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }

}

