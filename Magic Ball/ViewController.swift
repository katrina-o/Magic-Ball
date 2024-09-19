//
//  ViewController.swift
//  Magic Ball
//
//  Created by Катя on 10.06.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Ask me anything"
        label.textColor = .blue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35)
        
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ball1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Ask", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.addTarget (self, action: #selector(askButtonPress), for: .touchUpInside)
        return button
    }()
    
    @objc func askButtonPress(_ sender: UIButton) {
        let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
        image.image = ballArray [Int.random(in: 0...4)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize () {
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(image)
        view.addSubview(button)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(label).inset(50)
            make.trailing.leading.equalToSuperview().inset(35)
            make.bottom.equalToSuperview().inset(200)
        }
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.trailing.leading.equalToSuperview().inset(120)
            make.height.equalTo(40)
            make.width.equalTo(60)
            
        }
    }
    
}

