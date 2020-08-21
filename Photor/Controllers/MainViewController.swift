import Foundation
import UIKit
import UnsplashPhotoPicker

class MainViewController: UIViewController {
    
    var viewModel = PhotosViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var photosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let url = URL(string: "\(Constants.API_URL_BASE)") {
            getPhotos(url: url)
        }
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
        if !searchBar.text!.isEmpty {
            //https://api.unsplash.com/search/photos?page=1&query=office&client_id=EGtTvOh6MlWtTDYKfxwR02BWWuFRd2b2AsDvbFCXqxI
            //let urlTemp = "https://api.unsplash.com/search/photos?page=1&query=office&client_id=EGtTvOh6MlWtTDYKfxwR02BWWuFRd2b2AsDvbFCXqxI"
            if let url = URL(string: "https://api.unsplash.com/search/photos?page=1&query=\(searchBar.text!)&client_id=EGtTvOh6MlWtTDYKfxwR02BWWuFRd2b2AsDvbFCXqxI") {
                self.getPhotos(url: url)
            }
        }
        
        /*self.pokemonArrayFiltered.removeAll()
        if !searchBar.text!.isEmpty {
            self.searchActive = true
            self.isFinalToLoad = true
            if let poke = self.pokemonsViewModel.pokemons?.results {
                for item in poke {
                    let name = item.name!.lowercased()
                    if ((name.contains(searchBar.text!.lowercased()))) {
                        self.pokemonArrayFiltered.append(item)
                    }
                    print(name)
                    print(searchBar.text!.lowercased())
                }
            }
            if (searchBar.text!.isEmpty) {
                self.searchActive = false
                self.collectionView.reloadData()
            }
        } else {
            self.searchActive = false
            self.isFinalToLoad = false
        }
        self.collectionView.reloadData()*/
    }
}
