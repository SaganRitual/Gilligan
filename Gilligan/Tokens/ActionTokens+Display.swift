// We are a way for the cosmos to know itself. -- C. Sagan

import CoreGraphics
import Foundation

extension Tokens {

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

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Self else { fatalError() }

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
            guard let other = other_ as? Self else { fatalError() }

            self.delta = other.delta
            self.duration = other.duration
        }
    }

    class ActionScaleByScalar: Action, ObservableObject {
        var type: ActionType = .scaleByScalar
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var scale: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionScaleByScalar) {
            self.duration = copyFrom.duration
            self.scale = copyFrom.scale
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Self else { fatalError() }

            self.duration = other.duration
            self.scale = other.scale
        }
    }

    class ActionScaleToScalar: Action, ObservableObject {
        var type: ActionType = .scaleToScalar
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var scale: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionScaleToScalar) {
            self.duration = copyFrom.duration
            self.scale = copyFrom.scale
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Self else { fatalError() }

            self.duration = other.duration
            self.scale = other.scale
        }
    }

    class ActionScaleByVector: Action, ObservableObject {
        var type: ActionType = .scaleByVector
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var scale: CGVector = CGVector(dx: 1, dy: 1)

        init() { }

        init(_ copyFrom: ActionScaleByVector) {
            self.duration = copyFrom.duration
            self.scale = copyFrom.scale
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Self else { fatalError() }

            self.duration = other.duration
            self.scale = other.scale
        }
    }

    class ActionScaleToVector: Action, ObservableObject {
        var type: ActionType = .scaleToVector
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var scale: CGVector = CGVector(dx: 1, dy: 1)

        init() { }

        init(_ copyFrom: ActionScaleToVector) {
            self.duration = copyFrom.duration
            self.scale = copyFrom.scale
        }

        func copyFrom(_ other_: Tokens.Action) {
            guard let other = other_ as? Self else { fatalError() }

            self.duration = other.duration
            self.scale = other.scale
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
            guard let other = other_ as? Self else { fatalError() }

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
            guard let other = other_ as? Self else { fatalError() }

            self.duration = other.duration
            self.colorBlendFactor = other.colorBlendFactor
        }
    }
}
