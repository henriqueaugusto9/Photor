import Foundation

class PhotosViewModel {
    
    var photosList: PhotosList?
    var photos: [Photos]?
    let service = HttpService()
    
    init() {}
    
    func getPhotos(url: URL, completion: @escaping (Result<[Photos]?, HttpError>) -> Void) {
        service.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                   do {
                        self.photos = try JSONDecoder().decode([Photos].self, from: data!)
                        print(self.photos)
                        completion(.success(self.photos))
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

