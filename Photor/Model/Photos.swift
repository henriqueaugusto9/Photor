import Foundation

public struct Photos : Model {
    var id : String?
    var created_at : String?
    var updated_at : String?
    var promoted_at : String?
    var width : Int?
    var height : Int?
    var color : String?
    var description : String?
    var alt_description : String?
    var urls : Urls?
    var links : Links?
    var categories : [String]?
    var likes : Int?
    var liked_by_user : Bool?
    var current_user_collections : [String]?
    var sponsorship : Sponsorship?
    var user : User?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case promoted_at = "promoted_at"
        case width = "width"
        case height = "height"
        case color = "color"
        case description = "description"
        case alt_description = "alt_description"
        case urls = "urls"
        case links = "links"
        case categories = "categories"
        case likes = "likes"
        case liked_by_user = "liked_by_user"
        case current_user_collections = "current_user_collections"
        case sponsorship = "sponsorship"
        case user = "user"
    }
    
   public init(id : String?, created_at : String?, updated_at : String?, promoted_at : String?, width : Int?, height : Int?, color : String?, description : String?, alt_description : String?, urls : Urls?, links : Links?,
    categories : [String]?, likes : Int?, liked_by_user : Bool?, current_user_collections : [String]?,
    sponsorship : Sponsorship?, user : User?) {
        self.id = id
        self.created_at = created_at
        self.updated_at = updated_at
        self.promoted_at = promoted_at
        self.width = width
        self.height = height
        self.color = color
        self.description = description
        self.alt_description = alt_description
        self.urls = urls
        self.links = links
        self.categories = categories
        self.likes = likes
        self.liked_by_user = liked_by_user
        self.current_user_collections = current_user_collections
        self.sponsorship = sponsorship
        self.user = user
    }

}
