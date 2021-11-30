//
//  ColumnFlowLayout.swift
//  Movie
//
//  Created by Beyza Arslan on 18.08.2021.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {

    let sutunSayisi : Int
    var yukseklikOrani : CGFloat = 1.3
    
    init(sutunSayisi : Int, minSutunAraligi : CGFloat = 0, minSatirAraligi : CGFloat = 0, solAralik : CGFloat = 0, sagAralik : CGFloat = 0)
    {
        self.sutunSayisi = sutunSayisi
        super.init()
        
        self.minimumInteritemSpacing = minSutunAraligi
        self.minimumLineSpacing = minSatirAraligi
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return  }
        let araliklar = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(sutunSayisi-1)
        
        let elemanGenisligi = (collectionView.bounds.size.width-araliklar) / CGFloat(sutunSayisi).rounded(.down)
        
        let elemanYuksekligi = elemanGenisligi * yukseklikOrani
        
        itemSize = CGSize(width: elemanGenisligi, height: elemanYuksekligi)
        
    }
}
