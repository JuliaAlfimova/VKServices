//
//  MainViewController.swift
//  VKServices
//
//  Created by juliemoorled on 13.07.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var vkServices: [Service] = []
    let headerLabel = UILabel()
    let tableView = UITableView()
    
    struct Cells {
        static let mainCell = "MainCell"
    }
    
    override func loadView() {
         super.loadView()
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHeaderLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureTableView()
    }
    
    func configureHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        headerLabel.text = "Сервисы VK"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.backgroundColor = .black
        tableView.register(MainCell.self, forCellReuseIdentifier: Cells.mainCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if vkServices.count != 0 {
            return vkServices.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.mainCell) as! MainCell
        if vkServices.count != 0 {
            let vkService = vkServices[indexPath.row]
            cell.setData(service: vkService)
        }
        return cell
    }

    
    
}

