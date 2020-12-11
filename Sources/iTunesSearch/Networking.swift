//
//  File.swift
//  
//
//  Created by Chris on 11/12/2020.
//

import Foundation

public typealias DataFetcher = (URLRequest, @escaping (Result<Data, Error>) -> Void) -> Void

public enum Networking {
    public static func fetchData(from request: URLRequest,
                                 using session: URLSession = URLSession.shared,
                                 completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        let task = session.dataTask(with: request) { (data, response, error) in

        }
        task.resume()
    }

    public static func fetchData(from request: URLRequest,
                                 completion: @escaping (Result<Data, Error>) -> Void) -> Void {
        Self.fetchData(from: request, using: URLSession.shared, completion: completion)
    }
}

