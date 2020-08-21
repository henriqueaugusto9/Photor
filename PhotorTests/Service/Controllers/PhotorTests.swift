import XCTest
@testable import Photor

class PhotorTests: XCTestCase {

    var mainViewController: MainViewController?
    
    func test_mainViewController_Inicialization() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        mainViewController = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController
        mainViewController?.loadView()
    }
        
    override func tearDownWithError() throws {
        mainViewController = nil
    }

}
