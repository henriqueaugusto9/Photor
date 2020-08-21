import Foundation
import UIKit
import UnsplashPhotoPicker

class MainViewController: UIViewController {
    
    var viewModel = PhotosViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var photosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*if let url = URL(string: "\(Constants.API_URL_BASE)") {
            getPhotos(url: url)
        }*/
    }
    
    func getPhotos(url: URL) {
        self.viewModel.getPhotos(url: url) { [weak self] results in
            DispatchQueue.main.async {
                self?.photosTableView.reloadData()
            }
        }
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {}
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        
        
    }
}
