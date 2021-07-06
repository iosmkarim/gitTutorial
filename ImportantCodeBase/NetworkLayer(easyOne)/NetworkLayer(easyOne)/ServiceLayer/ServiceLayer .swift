//
//  ServiceLayer .swift
//  NetworkLayer(easyOne)
//
//  Created by MDREZAUL KARIM on 8/28/20.
//  Copyright © 2020 storage. All rights reserved.
//

import Foundation

class ServiceLayer {
    //1
    class func request<T: Codable>(router: Router, completion: @escaping (Result<[String: [T]], Error>) -> ()) {
        //2
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        //3
        guard let url = components.url else {return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        //4
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            //5
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil , let data = data else {
                return
            }
            //6
            let resposneDict = try! JSONDecoder().decode([String: [T]].self, from: data)
            //7
            DispatchQueue.main.async {
                //8
                completion(.success(resposneDict))
            }
        }
        dataTask.resume()
    }
}
