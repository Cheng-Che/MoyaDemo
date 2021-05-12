//
//  UserTableViewCell.swift
//  MoyaDemo
//
//  Created by Steven.Hsieh on 2021/5/12.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    private var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var mailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutViews() {
        addSubview(idLabel)
        idLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(5)
            $0.width.equalTo(idLabel.snp.height)
        }
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(idLabel.snp.trailing).offset(5)
            $0.top.equalTo(idLabel.snp.top)
            
        }
        
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(nameLabel.snp.bottom)
        }
        
        addSubview(mailLabel)
        mailLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(phoneLabel.snp.bottom)
        }
    }
    
    func setup(model: UserService.UserModel) {
        idLabel.text = String(model.id)
        nameLabel.text = model.name
        phoneLabel.text = "Phone: " + model.phone
        mailLabel.text = "Email: " + model.email
    }
    
    

}
