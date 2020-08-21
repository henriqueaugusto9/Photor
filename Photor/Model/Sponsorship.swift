import Foundation

public struct Sponsorship : Model {
    var impression_urls : [String]?
    var tagline : String?
    var tagline_url : String?
    var sponsor : Sponsor?

    public init(impression_urls : [String]?, let tagline : String?, let tagline_url : String?, let sponsor : Sponsor?) {
        self.impression_urls = impression_urls
        self.tagline = tagline
        self.tagline_url = tagline_url
        self.sponsor = sponsor
    }

}
