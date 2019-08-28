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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setViewModel(viewModel: BlockDetailViewModel) {
        self.viewModel = viewModel
    }

    
}
