//
//  ViewController.swift
//  Ted Talk
//
//  Created by Gonzalo Perretti on 4/6/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var searchView: UISearchBar!
    
    private var pickerSelectedRow = ""
    var tedTalk: [TedTalk] = []
    private let pickerRows: [String] = ["Event", "Main Speaker", "Title", "Name", "Description", "Any"]
    var filteredTedTalk: [TedTalk] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TedTalkManager().retrieve(){
            [weak self] result in
            switch result {
            case.success(let tedTalk):
                self?.tedTalk = tedTalk
                self?.filteredTedTalk = tedTalk
            case.failure(_):
                self?.tedTalk = []
                print("there was an error")
            }
        }
    }
}
extension HomeViewController: UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerRows.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerRows[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelectedRow = pickerRows[row]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredTedTalk = []
        tedTalk.forEach({(talk) in
            if talk.isFiltered(pickerSelectedRow, input: searchText){
                filteredTedTalk.append(talk)
            }
        })
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTedTalk.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TedTalkCustomTableViewCell
        
        cell.mainSpeakerLabel.text = "Main speaker: \(filteredTedTalk[indexPath.row].main_speaker)"
        cell.descriptionLabel.text = filteredTedTalk[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailTedTalkViewController{
            destination.setTedTalk(talk: tedTalk[(tableView.indexPathForSelectedRow?.row)!])
        }
    }
}










