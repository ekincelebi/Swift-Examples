//
//  ViewController.swift
//  TableView
//
//  Created by Ekin Celebi on 24.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var result: Result?
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(CustomCell.self, forCellReuseIdentifier: "TableCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJSON()
        self.view.addSubview(tableView)
        let safeViewMargins = self.view.safeAreaLayoutGuide
        tableView.anchor(top: safeViewMargins.topAnchor, left: safeViewMargins.leftAnchor, bottom: safeViewMargins.bottomAnchor, right: safeViewMargins.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, width: 0, height: 0)


        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func str2date(date_string:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let date = dateFormatter.date(from: date_string) else {
            print("Error in date conversion")
            return nil
        }
        return date
    }
    
    private func date2str(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let date_string = formatter.string(from: date)
        return date_string
    }
        
    private func parseJSON(){
        guard let url = URL(string: "https://apis.is/earthquake/is") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
        }catch {
            print("Error: \(error)")
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath as IndexPath) as! CustomCell
        cell.depth.text = "Depth: \(result?.results[indexPath.row].depth ?? 0)"
        cell.latitude.text = "Latitude: \(result?.results[indexPath.row].latitude ?? 0)"
        cell.longitude.text = "Longtitude: \(result?.results[indexPath.row].longitude ?? 0)"
        cell.size.text = "Size: \(result?.results[indexPath.row].size ?? 0)"
        cell.quality.text = "Quality: \(result?.results[indexPath.row].quality ?? 0)"
        cell.timestamp.text = "Quality: \(result?.results[indexPath.row].timestamp ?? "")"
        if let date = str2date(date_string: result?.results[indexPath.row].timestamp ?? "") {
            cell.timestamp.text = "Timestamp: " + date2str(date: date)
        }
        cell.humanReadableLocation.text = "Location: \(result?.results[indexPath.row].humanReadableLocation ?? "")"
        return cell
    }

}

