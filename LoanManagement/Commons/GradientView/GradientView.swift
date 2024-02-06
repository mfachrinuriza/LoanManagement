//
//  GradientView.swift
//  LoanManagement
//
//  Created by Muhammad Fachri Nuriza on 05/02/24.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    // Define the colors for the gradient
    @IBInspectable var startColor: UIColor = Color.primary10 {
        didSet {
            updateGradient()
        }
    }
    @IBInspectable var endColor: UIColor = Color.primary30 {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            updateCornerRadius()
        }
    }
    
    // Create gradient layer
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        // Set the gradient frame
        gradientLayer.frame = rect
        
        // Set the colors
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        // Gradient is linear from left to right
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        // Add gradient layer into the button
        layer.insertSublayer(gradientLayer, at: 0)
        
        clipsToBounds = true
    }

    func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    func updateCornerRadius() {
        // Round the button corners
        layer.cornerRadius = cornerRadius
    }
}
