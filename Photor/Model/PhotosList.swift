import Foundation

public struct PhotosList : Model {
    var total : Int?
    var total_pages : Int?
    var results : [Photos]?

    public init(total: Int?, total_pages: Int?, results: [Photos]?) {
        self.total = total
        self.total_pages = total_pages
        self.results = results
    }
}
