//
//  Photos.swift
//  FlickrClientApp
//
//  Created by Sueda Beyza Özcan on 20.08.2024.
//

import Foundation
struct Photos: Codable {
   let page:Int?
   let pages:Int?
   let perpage:Int?
   let total:Int?
   let photo: [Photo]?
}
