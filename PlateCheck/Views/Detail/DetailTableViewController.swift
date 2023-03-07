//
//  DetailTableViewController.swift
//  PlateCheck
//
//  Created by Noam Efergan on 07/03/2023.
//

import UIKit

class DetailTableViewController: UITableViewController {
    private var dvlaResponse: DVLAResponse
    private var items: [Mirror.Child]
    init(response: DVLAResponse) {
        self.dvlaResponse = response
        self.items = Array(Mirror(reflecting: dvlaResponse).children)
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = dvlaResponse.registrationNumber
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailTableViewCell
        else {
            return DetailTableViewCell()
        }
        let item = items[indexPath.row]
        if let title = item.label?.camelCaseToWords().capitalized {
            
        } else {
            tableView.removeCell
        }
        cell.setupCell(with: (item.label?.camelCaseToWords().capitalized), and: item.value as! String)
        return cell
    }
}
