//
//  ViewController.swift
//  UIKit-Marathon
//
//  Created by nastasya on 01.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let gradientView = UIView()
    private let gradientViewDimension = CGFloat(100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gradientView)
        setupGradientView()
    }
    
    private func setupGradientView() {
        
        setupGradientLayer()
        setupConstraints()
        setupShadow()
        
        func setupConstraints() {
            gradientView.translatesAutoresizingMaskIntoConstraints = false
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
            gradientView.widthAnchor.constraint(equalToConstant: gradientViewDimension).isActive = true
            gradientView.heightAnchor.constraint(equalToConstant: gradientViewDimension).isActive = true
        }
        
        func setupGradientLayer() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = CGRect(x: 0, y: 0, width: gradientViewDimension, height: gradientViewDimension)
            gradientLayer.colors = [
                UIColor.purple.cgColor,
                UIColor.systemPink.withAlphaComponent(0.3).cgColor
            ]
            gradientLayer.type = .axial
            gradientLayer.startPoint = CGPointMake(0.4, 0)
            gradientLayer.endPoint = CGPointMake(0.3, 1)
            gradientLayer.cornerRadius = 20
            gradientLayer.masksToBounds = true
            gradientView.layer.addSublayer(gradientLayer)
        }
        
        func setupShadow() {
            gradientView.layer.masksToBounds = false
            gradientView.layer.shadowOffset = CGSizeMake(10, 3)
            gradientView.layer.shadowOpacity = 0.7
            gradientView.layer.shadowRadius = 10
            gradientView.layer.shadowColor = UIColor.black.cgColor
        }
    }
}


