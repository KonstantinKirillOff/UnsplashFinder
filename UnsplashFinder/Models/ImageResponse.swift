//
//  ImageResponse.swift
//  UnsplashFinder
//
//  Created by Konstantin Kirillov on 03.09.2022.
//

import Foundation

struct UnsplashResponse: Decodable{
    let results: [ImageData]
}

struct ImageData: Decodable {
    let description: String?
    let urls: [String : String]
}
