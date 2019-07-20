//
//  ViewController.swift
//  UIContextMenu
//
//  Created by Toomas Vahter on 20.07.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContextMenus()
    }
    
    private func setupContextMenus() {
        let interaction = UIContextMenuInteraction(delegate: self)
        imageView.addInteraction(interaction)
        imageView.isUserInteractionEnabled = true
    }
}

extension ViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let actionProvider: ([UIMenuElement]) -> UIMenu? = { _ in
            func actionHandler(_ action: UIAction) {
                print("Handled ", action)
            }
            
            let titleAction = UIAction(title: "Title",
                                       image: nil,
                                       identifier: nil,
                                       discoverabilityTitle: nil,
                                       attributes: [],
                                       state: .off,
                                       handler: actionHandler)

            let imageAction = UIAction(title: "Title (image)",
                                       image: UIImage(systemName: "arkit"),
                                       identifier: nil,
                                       discoverabilityTitle: nil,
                                       attributes: [],
                                       state: .off,
                                       handler: actionHandler)
            
            let onDiscoverabilityTitleAction = UIAction(title: "Title (on)",
                                                        image: nil,
                                                        identifier: nil,
                                                        discoverabilityTitle: "DiscoverabilityTitle",
                                                        attributes: [],
                                                        state: .on,
                                                        handler: actionHandler)
            
            let destructiveAction = UIAction(title: "Title (destructive)",
                                             image: nil,
                                             identifier: nil,
                                             discoverabilityTitle: nil,
                                             attributes: .destructive,
                                             state: .off,
                                             handler: actionHandler)
            
            let disabledAction = UIAction(title: "Title (disabled)",
                                          image: nil,
                                          identifier: nil,
                                          discoverabilityTitle: nil,
                                          attributes: .disabled,
                                          state: .off,
                                          handler: actionHandler)
            
            let submenu = UIMenu(title: "Submenu",
                                 image: nil,
                                 identifier: nil,
                                 options: [],
                                 children: [destructiveAction, disabledAction])
            
            return UIMenu(title: "Optional Menu Title",
                          image: nil,
                          identifier: nil,
                          options: [],
                          children: [titleAction, imageAction, onDiscoverabilityTitleAction, submenu])
        }
        return UIContextMenuConfiguration(identifier: "my identifier" as NSCopying,
                                          previewProvider: nil,
                                          actionProvider: actionProvider)
    }
}
