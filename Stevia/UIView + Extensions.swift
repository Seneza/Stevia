//
//  UIView + Extensions.swift
//  Stevia
//
//  Created by Gaston Seneza on 11/6/21.
//

import UIKit



extension UIView {

    /// Sets  the padding of a view.
    ///
    /// - Parameter:
    ///   - padding: Specifies the padding between the border/edge and contents of a view.
    /// - Objective:  Filling the view in superview
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        
        // MARK: - First, set translatesAutoresizingMaskIntoConstraints to false.
        ///This is to prevent the view’s auto-resizing mask to be translated
        /// into Auto Layout constraints and affecting our constraints.
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    // MARK:  — Centers along Y axis in superview
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    // MARK:  — Centers along X axis in superview
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    /// Sets  the width constant.
    ///
    /// - Parameter:
    ///   - constant: Numeric value specified by a designer
    /// --Objective: contrain Width of a view
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    /// Sets  the height constant.
    ///
    /// - Parameter:
    ///   - constant: Numeric value specified by a designer
    /// --Objective: Contrain Height of a view
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}

extension UILabel {
    convenience init(textColor: UIColor, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true // image won't be strecthed vertically or horizontally
        self.contentMode = .scaleAspectFill
    }
}
