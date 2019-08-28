//
//  BlockDetailViewController.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import UIKit

class BlockDetailViewController: UIViewController {
    
    private var viewModel: BlockDetailViewModel?
    
    @IBOutlet weak var prettyView: UIView!
    @IBOutlet weak var rawView: UIView!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var transactionCountLabel: UILabel!
    @IBOutlet weak var signatureLabel: UILabel!
    @IBOutlet weak var toggleViewStateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }
    
    func setViewModel(viewModel: BlockDetailViewModel) {
        self.viewModel = viewModel
    }

    private func updateContent() {
        DispatchQueue.main.async {
            self.producerLabel.text = self.viewModel?.textForProducerLabel
            self.transactionCountLabel.text = self.viewModel?.textForTransactionsCountLabel
            self.signatureLabel.text = self.viewModel?.textForSignatureLabel
        }
    }
    
    @IBAction func didTapToggleViewStateButton(_ sender: Any) {
        
    }
    
}
