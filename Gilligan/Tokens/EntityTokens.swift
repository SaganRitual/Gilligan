// We are a way for the cosmos to know itself. -- C. Sagan

import Foundation

extension Tokens {

    protocol Entity: AnyObject {
        var actionsEditViewActiveTab: AppState.ActionsEditViewTabId { get set }
        var toolsViewActiveTab: AppState.ToolsViewTabId { get set }
    }

}
