import Foundation

class PhotosViewModel {
    
    var photosList: PhotosList?
    let service = HttpService()
    
    init() {}
    
    func getPhotos(url: URL, completion: @escaping (Result<PhotosList?, HttpError>) -> Void) {
        service.get(url: url) { result in
            switch result {
            case .success(let data):
                if data != nil {
                    do {
                        self.photosList = data?.toModel()
                        print(self.photosList?.photos)
                        completion(.success(self.photosList))
                    }
                } else {
                    completion(.failure(.noConnectivity))
                }
            case .failure(_ ):
                completion(.failure(.noConnectivity))
            }
        }
    }
}

