import Foundation
import UIKit
import UnsplashPhotoPicker

class MainViewController: UIViewController {
    
    var viewModel = PhotosViewModel()
    let activityView = UIActivityIndicatorView(style: .large)
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var photosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()                
        if let url = URL(string: "\(Constants.API_URL_BASE)") {
            getPhotos(url: url, search: false)
        } else {
            self.showAlert(title: "Erro", message: "Ocorreu um erro, tente mais tarde novamente!")
        }
    }
    
    func getPhotos(url: URL, search: Bool) {
        self.viewModel.getPhotos(url: url, search: search) { [weak self] results in
            self!.showLoading(show: true)
            DispatchQueue.main.async {
                self?.photosTableView.reloadData()
                self!.showLoading(show: false)
            }
        }
    }
    
    func showLoading(show: Bool) {
        if show {
            self.activityView.center = self.view.center
            self.activityView.startAnimating()
            self.view.addSubview(activityView)
        } else {
            self.activityView.stopAnimating()
            self.activityView.removeFromSuperview()
        }
    }
        
}

extension MainViewController: UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {}
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty {
            if let url = URL(string: "https://api.unsplash.com/search/photos?page=1&query=\(searchBar.text!)&client_id=EGtTvOh6MlWtTDYKfxwR02BWWuFRd2b2AsDvbFCXqxI") {
                self.getPhotos(url: url, search: true)
            }
        }
    }
}
