//
//  ViewController.swift
//  Movie
//
//  Created by Beyza Arslan on 17.08.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies = [result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "CollectionViewCell_Icerik", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell_Icerik")

        collectionView.collectionViewLayout = ColumnFlowLayout(sutunSayisi: 2, minSutunAraligi: 10, minSatirAraligi: 22)

        self.getMovies()
        self.collectionView.reloadData()
    }

    
    func getMovies() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=b41ff71b6d92fe60ccdb0514d8eeb11d&language=en-US&page=1")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json; charset=utf-8;", forHTTPHeaderField: "Content-Type")

        var parameters = GetMoviesRequest()
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(parameters) {
            // save `encoded` somewhere
            urlRequest.httpBody = encoded
        }
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            print("Error = ", error)
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code = \(httpResponse.statusCode)")
            }
            if let data = data {
                let responseBody = String.init(data: data, encoding: .utf8)
                print(responseBody)
                if let decodedResponse = try? JSONDecoder().decode(GetMoviesResponse.self, from: data) {
                //    self.imageView?.image = UIImage(data: data)
                    self.movies = decodedResponse.results ?? []
                }
               }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        dataTask.resume()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_Icerik", for: indexPath) as? CollectionViewCell_Icerik
    
        if movies[indexPath.row].vote_average! >= 5 {
            cell?.viewPuan.backgroundColor = UIColor(red: 248.0/255, green: 128.0/255, blue: 2.0/255, alpha: 1.0)
        }
        else if movies[indexPath.row].vote_average! < 5 {
            cell?.viewPuan.backgroundColor = UIColor(red: 248.0/255, green: 2.0/255, blue: 2.0/255, alpha: 1.0)
        }
        
        cell?.imageIcerik.load(urlString: "https://image.tmdb.org/t/p/w500" + String(movies[indexPath.row].poster_path!))
        cell?.lblPuan.text = String(format: "%.1f/10", movies[indexPath.row].vote_average!)
        cell?.lblBaslik.text = movies[indexPath.row].original_title
        cell?.lblTarih.text = movies[indexPath.row].release_date

        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = ViewController_Detay.init(nibName: "ViewController_Detay", bundle: nil)
        controller.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}

extension UIImageView {
    
    func load(urlString : String) {
        guard let url = URL(string: urlString) else{
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
