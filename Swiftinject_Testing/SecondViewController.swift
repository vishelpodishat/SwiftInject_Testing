//
//  SecondViewController.swift
//  Swiftinject_Testing
//
//  Created by Alisher Saideshov on 06.02.2024.
//

import UIKit
import Swinject


protocol ColorProviding {
    var color: UIColor { get }
}

final class SecondViewController: UIViewController { 

    private let provider: ColorProviding?

    init(provider: ColorProviding?) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = provider?.color
    }
}
