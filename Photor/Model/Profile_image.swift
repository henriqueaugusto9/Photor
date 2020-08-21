import Foundation

public struct Profile_image : Model {
    var small : String?
    var medium : String?
    var large : String?

    public init(small : String?, medium : String?, let large : String?) {
        self.small = small
        self.medium = medium
        self.large = large
    }

}
