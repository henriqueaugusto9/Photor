import Foundation

struct Photos : Model {
    let id : String?
    let urls : Urls?
    
    init(id: String?, urls: Urls?) throws {
        self.id = id
        self.urls = urls
    }
}
