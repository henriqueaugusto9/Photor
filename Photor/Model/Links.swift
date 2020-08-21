import Foundation

public struct Links : Model {
    var selfLink : String?
    var html : String?
    var photos : String?
    var likes : String?
    var portfolio : String?
    var following : String?
    var followers : String?

    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
    }
    
    public init(selfLink : String?, html : String?, photos : String?, likes : String?, portfolio : String?, following : String?, followers : String?) throws {
        self.selfLink = selfLink
        self.html = html
        self.photos = photos
        self.likes = likes
        self.portfolio = portfolio
        self.following = following
        self.followers = followers        
    }

}
