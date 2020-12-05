//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Rudy Matos on 12/3/20.
//

import UIKit

struct Cell{
    var name: String
    var size: CGSize
    var color: UIColor
}

@available(iOS 10.0, *)
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var cells : [Cell] = {
        let cells = [
            Cell(name: "Cell1", size: CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3), color: .systemOrange),
            Cell(name: "Cell2", size: CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3), color: .systemPurple),
            Cell(name: "Cell3", size: CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3), color: .systemPink)]
        return cells
        
    }()
    
    private let layout : UICollectionViewFlowLayout = {
       var layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.minimumLineSpacing = 5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    @IBAction func reloadCollectionView(_ sender: UIBarButtonItem) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func configureUI(){
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        cells[indexPath.item].size.height = CGFloat(Int.random(in: Int(collectionView.frame.height / 3)...Int(collectionView.frame.height)))
        UIView.animate(withDuration: 0.5) {
            self.collectionView.layoutIfNeeded()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath) as! TopicCell
        cell.configure(cells[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = cells[indexPath.item]
        return cell.size
    }
    

}

