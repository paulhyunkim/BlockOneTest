//
//  BlocksListViewController.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import UIKit
import EosioSwift

class BlocksListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private let blocksProvider = BlocksProvider()
    private var viewModel: BlocksListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = BlocksListViewModel(blocks: [])
        fetchMostRecentBlocks()
    }

    @IBAction func didTapRefreshButton(_ sender: Any) {
        fetchMostRecentBlocks()
    }
    
    private func fetchMostRecentBlocks() {
        activityIndicatorView.startAnimating()
        blocksProvider.fetchMostRecentBlocks(count: 20) { [weak self] blocks in
            self?.viewModel = BlocksListViewModel(blocks: blocks)
            self?.updateContent()
        }
    }
    
    private func updateContent() {
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowBlockDetail":
            guard let blockDetailViewController = segue.destination as? BlockDetailViewController,
                let sendingCell = sender as? UITableViewCell,
                let index = tableView.indexPath(for: sendingCell),
                let block = viewModel?.block(forRow: index.row) else {
                return
            }
            let viewModel = BlockDetailViewModel(block: block)
            blockDetailViewController.setViewModel(viewModel: viewModel)
        default:
            return
        }
    }
    
}


extension BlocksListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let blockCell = tableView.dequeueReusableCell(withIdentifier: "BlockCell") as? BlockCell,
            let cellViewModel = viewModel?.cellViewModel(forRow: indexPath.row) else {
            return UITableViewCell()
        }
        blockCell.setViewModel(cellViewModel)
        blockCell.updateContent()
        return blockCell
    }
    
}

extension BlocksListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "ShowBlockDetail", sender: selectedCell)
    }
    
}
