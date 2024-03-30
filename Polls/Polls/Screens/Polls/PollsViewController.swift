//
//  PollsViewController.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

final class PollsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    private let viewModel = PollsViewModel()
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    //MARK: - UI Helpers
    private func setupUI() {
        view.backgroundColor = UIColor(resource: .background)
        
        navigationItem.title = "Discover"
        
        setupBarButtonItems()
        setupTableView()
    }
    
    private func setupBarButtonItems() {
        let leftButton = UIBarButtonItem(image: UIImage(resource: .iconProfile), style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(image: UIImage(resource: .iconAdd), style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: PollTableCell.self)
    }
}

//MARK: - UITableViewnDataSource
extension PollsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PollTableCell.self)
        cell.configure(with: viewModel.cellVMs[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension PollsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = PollHeaderView()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 118
    }
}
