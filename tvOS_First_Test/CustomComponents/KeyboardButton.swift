//
//  KeyboardButton.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 05/05/21.
//

import UIKit

class KeyboardButton: UIButton {

    override func awakeFromNib() {
        backgroundColor = .clear
        setTitleColor(.white, for: .normal)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            setTitleColor(.orange, for: .normal)
        } else {
            setTitleColor(.white, for: .normal)
        }
    }

}
