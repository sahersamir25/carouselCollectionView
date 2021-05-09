//
//  ViewController.swift
//  Carousel
//
//  Created by Saher on 5/9/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        return table
        
    } ()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
    CollectionTableViewCellViewModel(
        viewModels: [
            
            TileCollectionViewCellViewModel(name: "Facebook", backgroundColor: .systemBlue),
            TileCollectionViewCellViewModel(name: "Vodafone", backgroundColor: .systemRed),
            TileCollectionViewCellViewModel(name: "Google", backgroundColor: .systemYellow),
            TileCollectionViewCellViewModel(name: "WE", backgroundColor: .systemPurple),
            TileCollectionViewCellViewModel(name: "Dell", backgroundColor: .systemGray),
            TileCollectionViewCellViewModel(name: "Nividia", backgroundColor: .systemGreen),
            TileCollectionViewCellViewModel(name: "Intel", backgroundColor: .systemTeal),

        ]
    )
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier , for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
}

extension ViewController: CollectionTableViewCellDelegate {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
          let alert = UIAlertController(title: viewModel.name, message: "You got the selected item", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
              present(alert, animated: true)
          }
}

