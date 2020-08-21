import Foundation
import UIKit
import Kingfisher

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.photosList != nil {
            return self.viewModel.photosList?.photos?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoCell
        if let image = self.viewModel.photosList?.photos?[indexPath.row].urls?.full {
            if let url = URL(string: image) {
                cell.photoImage.kf.setImage(with: url)
            }
        }
        return cell
    }
    
}
