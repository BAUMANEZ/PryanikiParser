//
//  ViewController.swift
//  PryanikiParser
//
//  Created by Арсений Токарев on 04.03.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var pryanikiViewModel: PryanikiViewModel?
    private let tableView = PryanikiTableView()
    
    override func loadView() {
        super.loadView()
        configureTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        assignViewModel()
    }
    
    func assignViewModel() {
        pryanikiViewModel = PryanikiViewModel()
        pryanikiViewModel?.bindViewModelToView = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

//MARK: - UI Configurations
extension MainViewController {
    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { tableViewPosition in
            tableViewPosition.left.top.equalToSuperview().offset(5)
            tableViewPosition.right.bottom.equalToSuperview().offset(-5)
        }
    }
}

//MARK: - CELL TAP DELEGATE
extension MainViewController: CellTapDelegate {
    func didTapCell(with name: String,
                    description: String) {
        let alert = UIAlertController(title: "My name is \(name)!",
                                      message: description,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay",
                                      style: .cancel,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - Table View Delegate and Data Source
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return pryanikiViewModel?.pryanikiResponse?.view.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = pryanikiViewModel?.pryanikiResponse else { return UITableViewCell() }
        let cellType = model.view[indexPath.row] 
        guard
            let cellViewModel = model.data.first(where: { $0.name == cellType }),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType) as? MainCell
        else {
            return UITableViewCell()
        }
        cell.setViewModel(cellViewModel)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
    }
}

