import Foundation

struct Urls : Model {
    let raw : String?
    let full : String?
    let regular : String?
    let small : String?
    let thumb : String?

    init(raw : String?, full : String?, regular : String?, small : String?, thumb : String?) {
        self.raw = raw
        self.full = full
        self.regular = regular
        self.small = small
        self.thumb = thumb
    }

}
