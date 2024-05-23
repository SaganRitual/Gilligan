// We are a way for the cosmos to know itself. -- C. Sagan

import Foundation

extension Tokens {
    
    enum ActionType {
        case none, addActionDummyCategory

        // Display attributes
        case fadeBy, fadeTo, scaleByScalar, scaleByVector, scaleToScalar, scaleToVector, setColor, setColorBlendFactor

        func isDisplay() -> Bool {
            self == .fadeBy || self == .fadeTo ||
            self == .scaleByScalar || self == .scaleToScalar ||
            self == .scaleByVector || self == .scaleToVector ||
            self == .setColor || self == .setColorBlendFactor
        }

        // Space attributes
        case followPath, moveBy, moveTo, resizeBy, resizeTo, rotateBy, rotateTo

        func isSpace() -> Bool {
            self == .followPath || self == .moveBy || self == .moveTo ||
            self == .resizeBy || self == .resizeTo || self == .rotateBy || self == .rotateTo
        }
    }

    protocol Action: AnyObject {
        var type: ActionType { get }
        var uuid: UUID { get }
    }

}
