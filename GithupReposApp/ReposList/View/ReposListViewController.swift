//
//  ReposListViewController.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import UIKit

protocol ReposListView: UIViewController {
    var preseneter: ReposListPresenterProtocol? { get set }
    func reloadListTableView()
    func showLoading()
    func stopLoading()
    func showError(withMessage message: String)
}

class ReposListViewController: UIViewController {

    @IBOutlet private weak var listTableView: UITableView!
    
    internal var preseneter: ReposListPresenterProtocol?
    private var loadingView: UIView?
    private var errorView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupListTableView()
        preseneter?.fetchReposList()
    }
    
    private func setupListTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.tableFooterView = UIView()
    }
    
    
}

extension ReposListViewController: ReposListView {
    func reloadListTableView() {
        DispatchQueue.main.async {
            self.listTableView.reloadData()
        }
    }
    
    func showLoading() {
        guard loadingView == nil else {
            return
        }
        self.loadingView = UIView(frame: self.view.frame)
        DispatchQueue.main.async {
            self.loadingView?.translatesAutoresizingMaskIntoConstraints = false
            self.loadingView?.backgroundColor = self.view.backgroundColor
            self.view.addSubview(self.loadingView!)
            let loadingIndicator = UIActivityIndicatorView()
            loadingIndicator.style = .large
            loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
            self.loadingView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.loadingView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            self.loadingView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.loadingView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            self.loadingView?.addSubview(loadingIndicator)
            loadingIndicator.widthAnchor.constraint(equalToConstant: 200).isActive = true
            loadingIndicator.heightAnchor.constraint(equalToConstant: 200).isActive = true
            loadingIndicator.centerXAnchor.constraint(equalTo: self.loadingView!.centerXAnchor).isActive = true
            loadingIndicator.centerYAnchor.constraint(equalTo: self.loadingView!.centerYAnchor).isActive = true
            loadingIndicator.startAnimating()
            self.view.bringSubviewToFront(self.loadingView!)
        }
        
    }
    
    func stopLoading() {
        guard loadingView != nil else {
            return
        }
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
        }
    }
    
    func showError(withMessage message: String) {
        
    }
}

extension ReposListViewController: StoryboardaLoadableProtocol {}
