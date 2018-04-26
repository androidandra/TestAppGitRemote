//
//  CollectionViewController.swift
//  TestApp
//
//  Created by Arjun Andra on 18/04/18.
//  Copyright © 2018 Arjun Andra. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    
    let imageArray: [String] = ["1","2","3","4","5","6"]
    var numberOfBoxes = 10
    
    func randomColorGenerator() -> UIColor {
        
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        collectionView?.setCollectionViewLayout(CustomFlowLayout(), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addItemPressed(_ sender: Any) {
        
        numberOfBoxes += 1
        collectionView?.performBatchUpdates({
            self.collectionView?
                .insertItems(at: [IndexPath(item: numberOfBoxes - 1, section: 0)])
        }, completion: nil)
    
    }
    
    // Flashing Animation
    
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cell.alpha = 0
//        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
//        UIView.animate(withDuration: 0.4) {
//            cell.alpha = 1
//            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
//        }
//    }
    
}

extension CollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfBoxes
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! CustomCell
        cell.backgroundColor = randomColorGenerator()
        
        return cell
        
    }
    
}

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    //This part of the code is not working
    
    var insertingIndexPaths = [IndexPath]()
    
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        insertingIndexPaths.removeAll()
        
        for update in updateItems {
            if let indexPath = update.indexPathAfterUpdate,
                update.updateAction == .insert {
                insertingIndexPaths.append(indexPath)
            }
    }
    }
    
    override func finalizeCollectionViewUpdates() {
        super.finalizeCollectionViewUpdates()
        
        insertingIndexPaths.removeAll()
    }
    
    override func initialLayoutAttributesForAppearingItem(
        at itemIndexPath: IndexPath
        ) -> UICollectionViewLayoutAttributes? {
        let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        
        if insertingIndexPaths.contains(itemIndexPath) {
            attributes?.alpha = 0.0
            attributes?.transform = CGAffineTransform(
                translationX: 0,
                y: 500.0
            )
        }
        
        return attributes
    }
    
}
