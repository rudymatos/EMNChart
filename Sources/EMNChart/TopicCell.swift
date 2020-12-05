//
//  TopicCell.swift
//  CollectionViewExample
//
//  Created by Rudy Matos on 12/3/20.
//

import UIKit

class TopicCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var label: UILabel!
    
    private var cell : Cell?
    
    let colors : [UIColor] = [.red, .black, .orange, .gray, .green]
    
    func configure(_ cell : Cell){
        mainView.backgroundColor = cell.color
        label.text = "\(cell.name) - CGSize: \(cell.size)"
    }

}
