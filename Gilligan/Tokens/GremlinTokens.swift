// We are a way for the cosmos to know itself. -- C. Sagan

import Foundation

extension Tokens {

    class Gremlin: Entity {
        var actionsEditViewActiveTab: AppState.ActionsEditViewTabId = .nothing
        var actionTokens = [Tokens.Action]()
        var selectedActionSS = -1
        var toolsViewActiveTab: AppState.ToolsViewTabId = .nothing

        var selectedAction: Tokens.Action {
            actionTokens[selectedActionSS]
        }
    }

}
