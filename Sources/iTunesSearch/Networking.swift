//
//  File.swift
//  
//
//  Created by Chris on 11/12/2020.
//

import Foundation

public typealias DataFetcher = (URLRequest, @escaping (Result<Data, Error>) -> Void) -> Void

public protocol DataFetching {
    func fetch(from: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

extension URLSession: DataFetching {
    public func fetch(from request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        dataTask(with: request) { (data, response, error) in
            switch (data, response, error) {
            case (let data?, _, _):
                completion(.success(data))
            case (_, _, let error?):
                completion(.failure(error))
            case (.none, _, .none):
                completion(.failure(Networking.Error.unknown))
            }
        }
        .resume()
    }
}

public enum Networking {
    public enum Error: Swift.Error {
        case unknown
    }
    public static func dataFetcher(using fetch: @escaping DataFetcher = URLSession.shared.fetch(from:completion:)) -> DataFetcher {
        return { request, completion in
            fetch(request, completion)
        }
    }
}

