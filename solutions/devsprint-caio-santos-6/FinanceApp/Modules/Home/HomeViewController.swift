//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    lazy var homeView: HomeView = {
        let homeView: HomeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override func viewDidLoad() {
        presenter?.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        self.view = homeView
    }

    @objc
    func openProfile() {
        let viewController = UserProfileRouter.createModule()
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}

extension HomeViewController: HomePresenterDelegate {}
