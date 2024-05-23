// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

class AppState: ObservableObject {
    @Published var currentToolsTab: ToolsViewTabId = .actions
    @Published var currentActionsTab: ActionsEditViewTabId = .display
    @Published var currentActionsEditMode: Tokens.ActionType = .fadeBy

    var gremlins = [Tokens.Gremlin]()
    var selectedEntities = [Tokens.Entity]()

    // MARK: State change trackers
    @Published var sctDashboard = 0
    @Published var sctActionEdit = 0

    @Published var actionFadeBy = Tokens.ActionFadeBy()
    @Published var actionFadeTo = Tokens.ActionFadeTo()
    @Published var actionMoveBy = Tokens.ActionMoveBy()
    @Published var actionMoveTo = Tokens.ActionMoveTo()
    @Published var actionResizeBy = Tokens.ActionResizeBy()
    @Published var actionResizeTo = Tokens.ActionResizeTo()
    @Published var actionRotateBy = Tokens.ActionRotateBy()
    @Published var actionRotateTo = Tokens.ActionRotateTo()
    @Published var actionScaleByScalar = Tokens.ActionScaleByScalar()
    @Published var actionScaleToScalar = Tokens.ActionScaleToScalar()
    @Published var actionScaleByVector = Tokens.ActionScaleByVector()
    @Published var actionScaleToVector = Tokens.ActionScaleToVector()
    @Published var actionSetColor = Tokens.ActionSetColor()
    @Published var actionSetColorBlendFactor = Tokens.ActionSetColorBlendFactor()

    init() {
        gremlins.append(contentsOf: (0..<3).map { _ in Tokens.Gremlin() })
    }

    func deselect(_ entity: Tokens.Entity) {
        let c = selectedEntities.filter { $0 === entity }
        selectedEntities.removeAll { $0 === entity }

        if !c.isEmpty { sctDashboard += 1 }
    }

    func deselectAll() {
        let c = selectedEntities.count
        selectedEntities.removeAll()

        if c > 0 { sctDashboard += 1 }
    }

    func isSelected(_ gremlin: Tokens.Gremlin) -> Bool {
        selectedEntities.contains { $0 === gremlin }
    }

    func selectAction(_ ss: Int) {
        let action = getAction(ss)

        switch action.type {
        case .fadeBy:
            actionFadeBy.copyFrom(action)

        case .fadeTo:
            actionFadeTo.copyFrom(action)

        case .moveBy:
            actionMoveBy.copyFrom(action)

        case .moveTo:
            actionMoveTo.copyFrom(action)

        case .resizeBy:
            actionResizeBy.copyFrom(action)

        case .resizeTo:
            actionResizeTo.copyFrom(action)

        case .rotateBy:
            actionRotateBy.copyFrom(action)

        case .rotateTo:
            actionRotateTo.copyFrom(action)

        case .scaleByScalar:
            actionScaleByScalar.copyFrom(action)

        case .scaleToScalar:
            actionScaleToScalar.copyFrom(action)

        case .scaleByVector:
            actionScaleByVector.copyFrom(action)

        case .scaleToVector:
            actionScaleToVector.copyFrom(action)

        case .setColor:
            actionSetColor.copyFrom(action)

        case .setColorBlendFactor:
            actionSetColorBlendFactor.copyFrom(action)

        default:
            fatalError()
        }

        selectedGremlin.selectedActionSS = ss
        sctActionEdit += 1
        currentActionsEditMode = action.type
    }

    func select(_ entity: Tokens.Entity, add: Bool = false) {
        if !add { deselectAll() }

        precondition(!selectedEntities.contains { $0 === entity })
        selectedEntities.append(entity)
        sctDashboard += 1

        if selectedGremlin.selectedActionSS > -1 {
            currentActionsEditMode = selectedGremlin.selectedAction.type
        } else {
            currentActionsEditMode = .fadeBy
        }

        sctActionEdit += 1
    }
}


extension AppState {

    enum SelectionCountMode {
        case multiple, nothing, single
    }

    enum SelectedEntityMode {
        case nothing
        case gremlin, waypoint
    }

    var selectedAction: Tokens.Action {
        if selectionCountMode == .single && selectedEntityMode == .gremlin && !selectedGremlin.actionTokens.isEmpty {
            return selectedGremlin.selectedAction
        } else {
            switch selectedGremlin.selectedAction.type {
            case .fadeBy:
                return actionFadeBy
            case .fadeTo:
                return actionFadeTo
            case .moveBy:
                return actionMoveBy
            case .moveTo:
                return actionMoveTo
            case .resizeBy:
                return actionResizeBy
            case .resizeTo:
                return actionResizeTo
            case .rotateBy:
                return actionRotateBy
            case .rotateTo:
                return actionRotateTo
            case .scaleByScalar:
                return actionScaleByScalar
            case .scaleToScalar:
                return actionScaleToScalar
            case .scaleByVector:
                return actionScaleByVector
            case .scaleToVector:
                return actionScaleToVector
            default:
                fatalError()
            }
        }
    }

    var selectionCountMode: SelectionCountMode {
        if selectedEntities.count == 1 { return .single }
        if selectedEntities.count > 1 { return .multiple }
        return .nothing
    }

    var selectedEntityMode: SelectedEntityMode {
        if selectionCountMode != .single { return .nothing }

        if selectedEntities.first! is Tokens.Gremlin {
            return .gremlin
        } else {
            return .waypoint
        }
    }

    enum ActionsEditViewTabId {
        case nothing
        case display, scale, space
    }

    enum ToolsViewTabId {
        case nothing
        case actions, physics, properties
    }

    var selectedGremlin: Tokens.Gremlin {
        guard let sg = selectedEntities.first as? Tokens.Gremlin else {
            preconditionFailure("We should never be here except when selected entities is setup for it")
        }

        return sg
    }

    func actionsCount() -> Int {
        selectedGremlin.actionTokens.count
    }

    func getAction(_ ss: Int) -> Tokens.Action {
        selectedGremlin.actionTokens[ss]
    }

    func newAction() {
        switch currentActionsTab {
        case .nothing:
            break
        case .display:
            let newToken: Tokens.Action

            switch currentActionsEditMode {
            case .fadeBy:
                newToken = Tokens.ActionFadeBy(actionFadeBy)
            case .fadeTo:
                newToken = Tokens.ActionFadeTo(actionFadeTo)
            case .scaleByScalar:
                newToken = Tokens.ActionScaleByScalar(actionScaleByScalar)
            case .scaleToScalar:
                newToken = Tokens.ActionScaleToScalar(actionScaleToScalar)
            case .scaleByVector:
                newToken = Tokens.ActionScaleByVector(actionScaleByVector)
            case .scaleToVector:
                newToken = Tokens.ActionScaleToVector(actionScaleToVector)
            case .setColor:
                newToken = Tokens.ActionSetColor(actionSetColor)
            case .setColorBlendFactor:
                newToken = Tokens.ActionSetColorBlendFactor(actionSetColorBlendFactor)

            default:
                fatalError()
            }

            selectedGremlin.selectedActionSS = selectedGremlin.actionTokens.count
            selectedGremlin.actionTokens.append(newToken)

        case .scale:
            break

        case .space:
            let newToken: Tokens.Action

            switch currentActionsEditMode {
            case .moveBy:
                newToken = Tokens.ActionMoveBy(actionMoveBy)
            case .moveTo:
                newToken = Tokens.ActionMoveTo(actionMoveTo)
            case .resizeBy:
                newToken = Tokens.ActionResizeBy(actionResizeBy)
            case .resizeTo:
                newToken = Tokens.ActionResizeTo(actionResizeTo)
            case .rotateBy:
                newToken = Tokens.ActionRotateBy(actionRotateBy)
            case .rotateTo:
                newToken = Tokens.ActionRotateTo(actionRotateTo)
            default:
                fatalError()
            }

            selectedGremlin.selectedActionSS = selectedGremlin.actionTokens.count
            selectedGremlin.actionTokens.append(newToken)
        }
    }
}

@main
struct GilliganApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppState())
        }
    }
}
