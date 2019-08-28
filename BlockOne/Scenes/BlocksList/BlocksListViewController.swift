//
//  BlocksListViewController.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import UIKit

class BlocksListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refreshButton: UIButton!
    
    private let blocksProvider = BlocksProvider(apiClient: APIClient(urlSession: URLSession.shared))
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
        blocksProvider.fetchMostRecentBlocks(count: 20) { [weak self] blocks in
            self?.viewModel = BlocksListViewModel(blocks: blocks)
            self?.updateContent()
        }
    }
    
    private func updateContent() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
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

