import Foundation
import UIKit
import Kingfisher

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.photos != nil {
            return self.viewModel.photos?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoCell
        if let image = self.viewModel.photos?[indexPath.row].urls?.full {
            if let url = URL(string: image) {
                cell.photoImage.kf.setImage(with: url)
            }
        }
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height * 25/100
    }
    
    /*func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }*/
    
}
