//
//  ViewController.swift
//  ChatPage
//
//  Created by Юлия Караневская on 3.07.21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let firstFriend = "Steve"
    
    let friendsListTableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "friendsListCell")
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(friendsListTableView)
        title = "Friends"
        friendsListTableView.delegate = self
        friendsListTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        friendsListTableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsListCell", for: indexPath)
        cell.textLabel?.text = firstFriend
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ChatViewController()
        navigationController?.present(vc, animated: true, completion: nil)
    }


}

