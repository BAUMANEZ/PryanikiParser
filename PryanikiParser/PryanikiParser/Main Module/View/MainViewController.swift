//
//  ViewController.swift
//  PryanikiParser
//
//  Created by Арсений Токарев on 04.03.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let label = UILabel()
    private let tableView = PryanikiTableView()
    
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        view.addSubview(label)
        label.text = "TESTTEST"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60)
        label.snp.makeConstraints { labelPosition in
            labelPosition.edges.equalToSuperview()
        }
        tableView.snp.makeConstraints { tableViewPosition in
            tableViewPosition.edges.equalToSuperview()
        }
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        PryanikiRequest.shared.parseData { result in
            switch result {
            case .success(let parsedData):
                return
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
        view.backgroundColor = .white
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

