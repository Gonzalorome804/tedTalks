//
//  ViewController.swift
//  Ted Talk
//
//  Created by Gonzalo Perretti on 4/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var searchView: UISearchBar!
    
    var pickerSelectedRow: String?
    var tedTalk: [TedTalk] = []
    var pickerRows: [String] = ["Event", "Main Speaker", "Title", "Name", "Description"]
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
extension ViewController: UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
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
        if searchBar.text?.isEmpty ?? true || searchBar.text == searchBar.placeholder {
            tableView.isHidden = true
        }
        
        filteredTedTalk = []
        tedTalk.forEach({(talk) in
            if talk.isFiltered(pickerSelectedRow!, input: searchText){
                filteredTedTalk.append(talk)
            }
        })
        tableView.isHidden = false
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTedTalk.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.mainSpeakerLabel.text = "Main speaker: \(filteredTedTalk[indexPath.row].main_speaker)"
        cell.descriptionLabel.text = filteredTedTalk[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailTedTalkViewController{
            destination.tedTalk = tedTalk[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}










