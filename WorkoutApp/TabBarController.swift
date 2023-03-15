//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Максим Мосалёв on 15.03.2023.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        // Set the appearance of the tab bar
        // Установка внешнего вида таббара
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        // Create view controllers for each tab
        // Создание вью контроллеров для каждой вкладки
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()
        
        // Create navigation controllers for each view controller
        // Создание навигационных контроллеров для каждого вью контроллера
        let overviewNavigation = UINavigationController(rootViewController: overviewController)
        let sessionNavigation = UINavigationController(rootViewController: sessionController)
        let progressNavigation = UINavigationController(rootViewController: progressController)
        let settingsNavigation = UINavigationController(rootViewController: settingsController)
        
        // Set the tab bar items for each view controller
        // Найстройка элементов таб бара для каждого вью контроллера
        overviewController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.overview,
                                                     image: Resources.Images.TabBar.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.session,
                                                     image: Resources.Images.TabBar.session,
                                                     tag: Tabs.session.rawValue)
        progressController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.progress,
                                                     image: Resources.Images.TabBar.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings,
                                                     image: Resources.Images.TabBar.settings,
                                                     tag: Tabs.settings.rawValue)
        
        // Set the view controllers for the tab bar controller
        // Добавляем все навигейшны таб бара в массив
        setViewControllers([
            overviewNavigation,
            sessionNavigation,
            progressNavigation,
            settingsNavigation
        ], animated: false)
    }
}
