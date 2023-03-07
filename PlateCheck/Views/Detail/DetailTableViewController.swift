//
//  DetailTableViewController.swift
//  PlateCheck
//
//  Created by Noam Efergan on 07/03/2023.
//

import UIKit

class DetailTableViewController: UITableViewController {
    typealias DisplayableData = (title: String, subtitle: String)
    private var dvlaResponse: DVLAResponse
    private var displayableItems: [DisplayableData]
    init(response: DVLAResponse) {
        dvlaResponse = response
        let items = Array(Mirror(reflecting: dvlaResponse).children)
        displayableItems = []
        super.init(style: .insetGrouped)
        displayableItems = items.compactMap { getDisplayableData(from: $0) }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = dvlaResponse.registrationNumber
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = AppColours.background
        navigationController?.navigationBar.barTintColor = AppColours.background
        navigationController?.navigationBar.tintColor = AppColours.secondaryColor
    }

    func getDisplayableData(from item: Mirror.Child) -> DisplayableData? {
        guard let title = item.label?.camelCaseToWords().capitalized, let subtitle = item.value as? String
        else {
            return nil
        }
        return (title: title, subtitle: subtitle)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        displayableItems.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailTableViewCell
        else {
            return DetailTableViewCell()
        }
        let item = displayableItems[indexPath.section]
        cell.setupCell(with: item.title, and: item.subtitle)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
