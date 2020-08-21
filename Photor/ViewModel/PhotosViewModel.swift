import Foundation

class PhotosViewModel {
    
    var photosList: PhotosList?
    var photos: [Photos]?
    let service = HttpService()
    
    init() {}
        
    func getPhotos(url: URL, search: Bool, completion: @escaping (Result<Bool, HttpError>) -> Void) {
        service.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                   do {
                        if search {
                            self.photosList = try JSONDecoder().decode(PhotosList.self, from: data!)
                            self.photos = self.photosList?.results
                        } else {
                            self.photos = try JSONDecoder().decode([Photos].self, from: data!)
                        }
                        completion(.success(true))                        
                    } catch let DecodingError.typeMismatch(type, context)  {
                       print("Type '\(type)' mismatch:", context.debugDescription)
                       print("codingPath:", context.codingPath)
                    } catch(let error) {
                        completion(.failure(.noConnectivity))
                    }
                }
                
            case .failure(_ ):
                completion(.failure(.noConnectivity))
            }
        }
    }
}

