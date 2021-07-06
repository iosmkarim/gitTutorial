//
//  Router.swift
//  NetworkLayer(easyOne)
//
//  Created by MDREZAUL KARIM on 8/28/20.
//  Copyright © 2020 storage. All rights reserved.
//

import Foundation

enum Router {
    case getSources
    case getProductIds
    case getProductInfo
    
    var scheme: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return "https"
        }
    }
    var host: String {
        switch self {
        case .getProductIds, .getProductInfo, .getSources:
            return "shopicruit.myshopify.com"
        }
    }
    var path: String {
        switch self {
        case .getSources:
            return "/admin/custom_collections.json"
        case .getProductIds:
            return "/admin/collects.json"
        case .getProductInfo:
            return "/admin/products.json"
        }
    }
    
//    all sources: all information of the collections.
//    https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6
//    all product ID's: product id of each product in a collection.
//    https://shopicruit.myshopify.com/admin/collects.json?page=1&collection_id=68424466488&access_token=c32313df0d0ef512ca64d5b336a0d7c6
//    all products info: product info for each product in the collection.
//    https://shopicruit.myshopify.com/admin/products.json?ids=2759162243,2759143811&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6
    var parameters: [URLQueryItem] {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        switch self {
        case .getSources:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        case .getProductIds:
            return [URLQueryItem(name: "page", value: "1" ),
                    URLQueryItem(name: "collection_id", value: "68424466488"),
                    URLQueryItem(name: "access_token", value: accessToken )]
        case .getProductInfo:
           return [URLQueryItem(name: "ids", value: "2759162243,2759143811" ),
                        URLQueryItem(name: "page", value: "1"),
                        URLQueryItem(name: "access_token", value: accessToken )]
            
        }
    }
    
    var method: String {
        switch self {
        case .getSources, .getProductInfo, .getProductIds:
            return "GET"
        }
    }
}
