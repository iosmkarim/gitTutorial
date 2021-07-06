//
//  dataModel.swift
//  NetworkLayer(easyOne)
//
//  Created by MDREZAUL KARIM on 8/28/20.
//  Copyright © 2020 storage. All rights reserved.
//

import Foundation

struct Collectionitem: Codable {
    let title : String
    let id : Int
}

struct CollectionItemId: Codable {
    let productId : Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
    }
}

struct CollectionInfo: Codable {
    let title: String
    let productType: String
    let variants: [VariantsInfo]
    let image : ImageInfo
    
    enum CodingKeys: String, CodingKey {
        case title
        case productType = "product_type"
        case variants
        case image
    }
}

struct VariantsInfo: Codable {
    let title: String
    let inventoryQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case inventoryQuantity = "inventory_quantity"
    }
}
struct ImageInfo: Codable {
    let path: String
    enum CodingKeys: String, CodingKey {
        case path = "src"
    }
}
