//
//  Protocols.swift
//  Routable
//
//  Created by Sami Ali on 4/29/18.
//  Copyright © 2018 Sami Ali. All rights reserved.
//

import UIKit

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

public protocol Routable {
    associatedtype StoryboardIdentifier: RawRepresentable
    
    func present<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String?, animated: Bool, modalPresentationStyle: UIModalPresentationStyle?, configure: ((T) -> Void)?, completion: ((T) -> Void)?)
    func show<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String?, configure: ((T) -> Void)?)
    func showDetailViewController<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String?, configure: ((T) -> Void)?)
    
    func push<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String?, animated: Bool, configure: ((T) -> Void)?)
}

public extension Routable where Self: UIViewController, StoryboardIdentifier.RawValue == String {
    
    /**
     Presents the intial view controller of the specified storyboard modally.
     
     - parameter storyboard: Storyboard name.
     - parameter identifier: View controller name.
     - parameter configure: Configure the view controller before it is loaded.
     - parameter completion: Completion the view controller after it is loaded.
     */
    func present<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String? = nil, animated: Bool = true, modalPresentationStyle: UIModalPresentationStyle? = nil, configure: ((T) -> Void)? = nil, completion: ((T) -> Void)? = nil) {
        let storyboard = UIStoryboard(name: storyboard.rawValue)
        
        guard let controller = (identifier != nil
            ? storyboard.instantiateViewController(withIdentifier: identifier!)
            : storyboard.instantiateInitialViewController()) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        if let modalPresentationStyle = modalPresentationStyle {
            controller.modalPresentationStyle = modalPresentationStyle
        }
        
        configure?(controller)
        
        present(controller, animated: animated) {
            completion?(controller)
        }
    }
    
    /**
     Present the intial view controller of the specified storyboard in the primary context.
     Set the initial view controller in the target storyboard or specify the identifier.
     
     - parameter storyboard: Storyboard name.
     - parameter identifier: View controller name.
     - parameter configure: Configure the view controller before it is loaded.
     */
    func show<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String? = nil, configure: ((T) -> Void)? = nil) {
        let storyboard = UIStoryboard(name: storyboard.rawValue)
        
        guard let controller = (identifier != nil
            ? storyboard.instantiateViewController(withIdentifier: identifier!)
            : storyboard.instantiateInitialViewController()) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        configure?(controller)
        
        show(controller, sender: self)
    }
    
    /**
     Present the intial view controller of the specified storyboard in the secondary (or detail) context.
     Set the initial view controller in the target storyboard or specify the identifier.
     
     - parameter storyboard: Storyboard name.
     - parameter identifier: View controller name.
     - parameter configure: Configure the view controller before it is loaded.
     */
    func showDetailViewController<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String? = nil, configure: ((T) -> Void)? = nil) {
        let storyboard = UIStoryboard(name: storyboard.rawValue)
        
        guard let controller = (identifier != nil
            ? storyboard.instantiateViewController(withIdentifier: identifier!)
            : storyboard.instantiateInitialViewController()) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        configure?(controller)
        
        showDetailViewController(controller, sender: self)
    }
    
    /**
     Present the intial view controller of the specified storyboard in the secondary (or detail) context.
     Set the initial view controller in the target storyboard or specify the identifier.
     
     - parameter storyboard: Storyboard name.
     - parameter identifier: View controller name.
     - parameter animated: animate transition
     - parameter configure: Configure the view controller before it is loaded.
     */
    
    func push<T: UIViewController>(storyboard: StoryboardIdentifier, identifier: String? = nil, animated: Bool = true, configure: ((T) -> Void)? = nil){
        
        let storyboard = UIStoryboard(name: storyboard.rawValue)
        guard let controller = (identifier != nil
            ? storyboard.instantiateViewController(withIdentifier: identifier!)
            : storyboard.instantiateInitialViewController()) as? T
            else { return assertionFailure("Invalid controller for storyboard \(storyboard).") }
        
        configure?(controller)
        
        navigationController?.pushViewController(controller, animated: animated)
    }
}

public extension UIStoryboard {
    
    /**
     Creates and returns a storyboard object for the specified storyboard resource file in the main bundle of the current application.
     
     - parameter name: The name of the storyboard resource file without the filename extension.
     
     - returns: A storyboard object for the specified file. If no storyboard resource file matching name exists, an exception is thrown.
     */
    convenience init(name: String) {
        self.init(name: name, bundle: nil)
    }
}
