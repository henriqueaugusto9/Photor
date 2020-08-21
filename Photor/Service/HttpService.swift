import Foundation
import Alamofire

public class HttpService {
    
    private let session : Session
    
    public init(session: Session = .default) {
        self.session = session
    }
    
    public func get(url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        session.request(url, method: .post, encoding: JSONEncoding.default).responseData { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else { return
                completion(.failure(.noConnectivity)) }
            switch dataResponse.result {
                case .failure: completion(.failure(.noConnectivity))
                case .success(let data):
                    switch statusCode {
                    case 204:
                        completion(.success(nil))
                    case 200...299:
                        completion(.success(data))
                    case 401:
                        completion(.failure(.unauthorized))
                    case 403:
                        completion(.failure(.forbidden))
                    case 400...499:
                        completion(.failure(.badRequest))
                    case 500...599:
                        completion(.failure(.serverError))
                    default:
                        completion(.failure(.noConnectivity))
                    }
            }
        }
    }
            
    /*func get(url: String, completion: @escaping (Result<Data?, HttpError>) -> ()) {
        session.request(url, method: .get).responseJSON { response in
            if let status = response.response?.statusCode {
                switch(status){
                    case 204:
                        completion(.success(nil))
                    case 200...299:
                        completion(.success(response.data))
                    case 401:
                        completion(.failure(.unauthorized))
                    case 403:
                        completion(.failure(.forbidden))
                    case 400...499:
                        completion(.failure(.badRequest))
                    case 500...599:
                        completion(.failure(.serverError))
                    default:
                        completion(.failure(.noConnectivity))
                }
            }
        }
    }*/
}

