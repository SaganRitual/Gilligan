// We are a way for the cosmos to know itself. -- C. Sagan

import Foundation

extension Tokens {

    class ActionMoveBy: Action, ObservableObject {
        var type: ActionType = .moveBy
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var translation: CGVector = .zero

        init() { }

        init(_ copyFrom: ActionMoveBy) {
            self.duration = copyFrom.duration
            self.translation = copyFrom.translation
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionMoveBy else { fatalError() }

            self.duration = other.duration
            self.translation = other.translation
        }
    }

    class ActionMoveTo: Action, ObservableObject {
        var type: ActionType = .moveTo
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var position: CGPoint = .zero

        init() { }

        init(_ copyFrom: ActionMoveTo) {
            self.duration = copyFrom.duration
            self.position = copyFrom.position
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionMoveTo else { fatalError() }

            self.duration = other.duration
            self.position = other.position
        }
    }

    class ActionResizeBy: Action, ObservableObject {
        var type: ActionType = .resizeBy
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var deltaSize: CGSize = .zero

        init() { }

        init(_ copyFrom: ActionResizeBy) {
            self.duration = copyFrom.duration
            self.deltaSize = copyFrom.deltaSize
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionResizeBy else { fatalError() }

            self.duration = other.duration
            self.deltaSize = other.deltaSize
        }
    }

    class ActionResizeTo: Action, ObservableObject {
        var type: ActionType = .resizeTo
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var size: CGSize = .zero

        init() { }

        init(_ copyFrom: ActionResizeTo) {
            self.duration = copyFrom.duration
            self.size = copyFrom.size
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionResizeTo else { fatalError() }

            self.duration = other.duration
            self.size = other.size
        }
    }

    class ActionRotateBy: Action, ObservableObject {
        var type: ActionType = .rotateBy
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var rotation: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionRotateBy) {
            self.duration = copyFrom.duration
            self.rotation = copyFrom.rotation
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionRotateBy else { fatalError() }

            self.duration = other.duration
            self.rotation = other.rotation
        }
    }

    class ActionRotateTo: Action, ObservableObject {
        var type: ActionType = .rotateTo
        let uuid = UUID()

        @Published var duration: TimeInterval = .zero
        @Published var angle: CGFloat = .zero

        init() { }

        init(_ copyFrom: ActionRotateTo) {
            self.duration = copyFrom.duration
            self.angle = copyFrom.angle
        }

        func copyFrom(_ other: Tokens.Action) {
            guard let other = other as? Tokens.ActionRotateTo else { fatalError() }

            self.duration = other.duration
            self.angle = other.angle
        }
    }

}
