//
//  ViewController.swift
//  Swiftinject_Testing
//
//  Created by Alisher Saideshov on 06.02.2024.
//

import UIKit
import Swinject

final class ColorProvider: ColorProviding {
    var color: UIColor {
        let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow]
        return colors.randomElement() ?? .black
    }

}

final class ViewController: UIViewController {

    // MARK: - Properties
    let container: Container = {
        let container = Container()
        container.register(ColorProvider.self) { _ in
            return ColorProvider()
        }
        container.register(SecondViewController.self) { resolver in
            let vc = SecondViewController(provider: resolver.resolve(ColorProvider.self))
            return vc
        }
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Продолжить", for: .normal)
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func didTappedButton() {
        guard let vc = container.resolve(SecondViewController.self) else { return }
        present(vc, animated: true)
    }
}

