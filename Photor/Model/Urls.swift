import Foundation

public struct Urls : Model {
    var raw : String?
    var full : String?
    var regular : String?
    var small : String?
    var thumb : String?

    public init(raw : String?, full : String?, regular : String?, small : String?, thumb : String?) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
    }

}
