//
//  ViewController.swift
//  FlickrClientApp
//
//  Created by Sueda Beyza Özcan on 20.08.2024.
//

import UIKit

class RecentPhotosTableViewController: UITableViewController, UISearchResultsUpdating {
    private var response: PhotosResponse? {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        fetchRecentPhotos()
     
    }
    private func setupSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
    }
    private func fetchRecentPhotos() {
        
        guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=644a6027809e4d9e163298bb8cb3fa90&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url") else {return}
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error {
              debugPrint(error)
                return
            }
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data) as? [String : Any]{
                print(json)
            }
        }.resume()
    }
    private func searchPhotos(with text: String) {
        
        guard let url = URL(string: "jjhttps://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=644a6027809e4d9e163298bb8cb3fa90&format=json&nojsoncallback=1&auth_token=72157720926658682-a4a211ca84a11b60&api_sig=c6627df0a8d0ab65a2006402eeada914&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url") else {return}
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error {
              debugPrint(error)
                return
            }
            if let data = data, let response = try? JSONDecoder().decode(PhotosResponse.self, from: data){
                self.response = response
            }
        }.resume()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.photos?.photo?.count ?? .zero
    }
    // MARK: - UITableDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoTableViewCell
        cell.ownerImageView.backgroundColor = .darkGray
        cell.ownerNameLabel.text = "Owner Name"
        cell.PhotoImage.backgroundColor = .gray
        cell.titleLabel.text = "Title Label"
        return cell
    }
    // cell'e tıklandığında açılacak pencere
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //segue bağlanıyor
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? PhotoDetailViewController {
            // TODO: seçilen fotoğraf detayını ekrana gönder
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        if text.count > 2{
            searchPhotos(with: text)
        }
    }
}
