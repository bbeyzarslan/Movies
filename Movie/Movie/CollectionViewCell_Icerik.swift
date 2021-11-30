//
//  CollectionViewCell_Icerik.swift
//  Movie
//
//  Created by Beyza Arslan on 18.08.2021.
//

import UIKit



class CollectionViewCell_Icerik: UICollectionViewCell {

    @IBOutlet weak var imageIcerik: UIImageView!
    @IBOutlet weak var lblBaslik: UILabel!
    @IBOutlet weak var lblTarih: UILabel!
    @IBOutlet weak var viewPuan: UIView!
    @IBOutlet weak var lblPuan: UILabel!
    
    var movies = [result]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        self.viewPuan.layer.borderWidth = 1
        self.viewPuan.layer.cornerRadius = 5
        self.viewPuan.layer.borderColor = UIColor.white.cgColor
        
        
    }

}
