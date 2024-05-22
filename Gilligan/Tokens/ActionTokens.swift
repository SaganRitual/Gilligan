// We are a way for the cosmos to know itself. -- C. Sagan

import CoreGraphics
import Foundation

extension Tokens {

    enum ActionType {
        case none, addActionDummyCategory

        // Display attributes
        case fadeBy, fadeTo, setColor, setColorBlendFactor

        func isDisplay() -> Bool {
            self == .fadeBy || self == .fadeTo || self == .setColor || self == .setColorBlendFactor
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

    class ActionFadeTo: Action, ObservableObject {
        var type: ActionType = .fadeTo
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var alpha: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionFadeTo) {
            self.alpha = copyFrom.alpha
            self.duration = copyFrom.duration
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionFadeTo else { fatalError() }

            self.alpha = other.alpha
            self.duration = other.duration
        }
    }

    class ActionFadeBy: Action, ObservableObject {
        var type: ActionType = .fadeBy
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var delta: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionFadeBy) {
            self.delta = copyFrom.delta
            self.duration = copyFrom.duration
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Tokens.ActionFadeBy else { fatalError() }

            self.delta = other.delta
            self.duration = other.duration
        }
    }

    class ActionSetColor: Action, ObservableObject {
        var type: ActionType = .setColor
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero

        @Published var alpha: CGFloat = .zero
        @Published var brightness: CGFloat = .zero
        @Published var colorBlendFactor: CGFloat = .zero
        @Published var hue: CGFloat = .zero
        @Published var saturation: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionSetColor) {
            self.duration = copyFrom.duration
            self.alpha = copyFrom.alpha
            self.brightness = copyFrom.brightness
            self.colorBlendFactor = copyFrom.colorBlendFactor
            self.hue = copyFrom.hue
            self.saturation = copyFrom.saturation
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Tokens.ActionSetColor else { fatalError() }

            self.duration = other.duration
            self.alpha = other.alpha
            self.brightness = other.brightness
            self.colorBlendFactor = other.colorBlendFactor
            self.hue = other.hue
            self.saturation = other.saturation
        }
    }

    class ActionSetColorBlendFactor: Action, ObservableObject {
        var type: ActionType = .setColorBlendFactor
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var colorBlendFactor: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionSetColorBlendFactor) {
            self.duration = copyFrom.duration
            self.colorBlendFactor = copyFrom.colorBlendFactor
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Tokens.ActionSetColorBlendFactor else { fatalError() }

            self.duration = other.duration
            self.colorBlendFactor = other.colorBlendFactor
        }
    }

    class SpaceAttributesAction: Action, ObservableObject {
        var type: ActionType = .followPath
        let uuid = UUID()

        init() { }

        init(_ copyFrom: SpaceAttributesAction) {
            self.type = copyFrom.type
            self.duration = copyFrom.duration

            switch copyFrom.type {
            case .moveBy: self.translation = copyFrom.translation
            case .moveTo: self.position = copyFrom.position
            case .resizeBy: self.deltaSize = copyFrom.deltaSize
            case .resizeTo: self.size = copyFrom.size
            case .rotateBy: self.rotation = copyFrom.rotation
            case .rotateTo: self.angle = copyFrom.angle

            default:
                fatalError()
            }

        }

        @Published var duration: TimeInterval = .zero

        @Published var angle: CGFloat = .zero
        @Published var deltaSize: CGSize = .zero
        @Published var path: CGPath = .init(rect: .zero, transform: nil)
        @Published var position: CGPoint = .zero
        @Published var rotation: CGFloat = .zero
        @Published var size: CGSize = .zero
        @Published var translation: CGVector = .zero
    }
}
