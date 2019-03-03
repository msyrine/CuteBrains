//
//  MyClassExtensions.swift
//  CuteBrains
//
//  Created by methlouthi syrine on 3/3/19.
//  Copyright © 2019 fahmi. All rights reserved.
//

import UIKit

extension MyClassViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myClassTable.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.myClassCollection.dequeueReusableCell(withReuseIdentifier: "MyClassCell", for: indexPath) as? MyClassCollectionViewCell
        
        cell?.nameClass.text = self.myClassTable[indexPath.row].namec
        
        return cell ?? MyClassCollectionViewCell()
    }
    
    
}



