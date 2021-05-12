//
//  UserTableViewController.swift
//  MoyaDemo
//
//  Created by Steven.Hsieh on 2021/5/11.
//

import UIKit
import Moya
import RxSwift
import SVProgressHUD

class UserTableViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private let disposedBag = DisposeBag()
    private var model: UserService.Response = []

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutTableView()
        
        getUserData(completion: { [unowned self] (respose) in
            model = respose
            tableView.delegate = self
            tableView.dataSource = self
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "User Info"
    }
    
    private func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func getUserData(completion: @escaping ((UserService.Response) -> Void)) {
        SVProgressHUD.show()
        
        let provider = MoyaProvider<UserService>()
        provider.rx.request(UserService.getData)
            .map(UserService.Response.self)
            .subscribe(onSuccess: { (response) in
                SVProgressHUD.dismiss()
                completion(response)
                print(response)
            }, onError: { (error) in
                SVProgressHUD.dismiss()
                print("error == \(error)")
            })
            .disposed(by: disposedBag)
    }
}

extension UserTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.setup(model: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = UserDetailViewController(title: model[indexPath.row].name, model: model[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

