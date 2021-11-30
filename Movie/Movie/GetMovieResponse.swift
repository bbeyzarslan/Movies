//
//  GetMovieResponse.swift
//  Movie
//
//  Created by Beyza Arslan on 17.08.2021.
//

import UIKit

struct GetMoviesResponse: Codable {

    var success: Bool?
    var errorMessage: String?
    var event: String?
    var validationResult: String?
    var errorCode: Int?
    var page: Int? 
    var results: [result]?
}

struct result: Codable {

    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}

struct GetMoviesRequest: Codable {
    
}
