//
//  ViewController_Detay.swift
//  Movie
//
//  Created by Beyza Arslan on 19.08.2021.
//

import UIKit

class ViewController_Detay: UIViewController{

    @IBOutlet weak var imageIcerik: UIImageView!
    @IBOutlet weak var lblBaslik: UILabel!
    @IBOutlet weak var lblTarih: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
   
    var movie :result?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.lblBaslik.text = movie?.original_title
        self.lblTarih.text = movie?.release_date
        self.lblOverview.text = "\(movie?.overview)\n\(movie?.overview)\n\(movie?.overview) \n\(movie?.overview)\n\(movie?.overview)\n\(movie?.overview)\n\(movie?.overview) \n\(movie?.overview)\n\(movie?.overview)"
        self.imageIcerik.load(urlString: "https://image.tmdb.org/t/p/w500" + String((movie?.poster_path)!))
        
        
    }

 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
