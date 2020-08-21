import Foundation

public struct PhotosList: Model {
    var photos: [Photos]?
    
    public init(photos: [Photos]?) {
        self.photos = photos
    }
    
}
