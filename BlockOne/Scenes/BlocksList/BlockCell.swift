//
//  BlockCell.swift
//  BlockOne
//
//  Created by Paul Kim on 8/28/19.
//  Copyright © 2019 Paul Kim. All rights reserved.
//

import UIKit

class BlockCell: UITableViewCell {
    
    private var viewModel: BlockCellViewModel?

    @IBOutlet weak var blockIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViewModel(_ viewModel: BlockCellViewModel) {
        self.viewModel = viewModel
    }
    
    func updateContent() {
        DispatchQueue.main.async {
            self.blockIDLabel.text = self.viewModel?.textForBlockIDLabel
        }
    }

}
