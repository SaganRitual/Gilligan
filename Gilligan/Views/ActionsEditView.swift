// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

//
// - User clicks gremlin
//
//      - Gremlin has no actions
//
//          - Tabs for all action categories are available
//          - Show fadeBy action editor view with default values
//          - Show button to create and assign a new action to the gremlin with shown values
//
//          - User can tab to other action types, view will update to new default values
//
//          - User fiddles with settings then clicks the button
//              - New action is added to gremlin
//              - Save state of looking at this new action; if user clicks other gremlin then
//                  comes back to this one, we'll show this action again with its settings
//
//      - Gremlin has actions
//
//          - Tabs for all action categories are available
//          - Retrieve saved state concerning what we were showing last time we showed this gremlin
//
//          - Button to copy this action and add the copy to the gremlin's set of actions
//          - Button to update current action with currently displayed settings (gray until user fiddles with settings)
//
//          - User can tab to other action types, view will update to new default values
//
//          - User switches to different action category with tabs
//          - Retrieve saved state for that action category; if there is state, show that action
//              If no state for that action category, show a default setup similar to when the user clicks on a gremlin with no actions
//
struct ActionsEditView: View {
    @EnvironmentObject var appState: AppState

    @State private var updateScrollView = 0

    let namesMap: [Tokens.ActionType: String] = [
        .fadeBy: "fadeBy", .fadeTo: "fadeTo", .setColor: "setColor", .setColorBlendFactor: "setColorBlendFactor"
    ]

    var body: some View {
        VStack {
            TabView(selection: $appState.currentActionsTab) {
                ActionsEditDisplayAttributesView()
                    .tabItem {
                        Label("Display", systemImage: "moon.fill")
                    }
                    .tag(AppState.ActionsEditViewTabId.display)

                ActionsEditSpaceAttributesView()
                    .tabItem {
                        Label("Space", systemImage: "figure.run")
                    }
                    .tag(AppState.ActionsEditViewTabId.space)
            }
            .padding()

            Button("Create new") {
                appState.newAction()
                updateScrollView += 1
            }

            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<appState.actionsCount(), id: \.self) { ss in
                        Button(action: {
                            appState.selectAction(ss)
                            updateScrollView += 1
                        }) {
                            Text("\(ss): \(namesMap[appState.selectedGremlin.actionTokens[ss].type]!)")
                        }
                    }
                }

                // Force update of the scroller when the number of buttons changes.
                // Put here instead of on the ScrollView, because if we put it on the
                // ScrollView, we get flicker when the user creates a new action
                .id(updateScrollView)
            }
            .padding()
        }
    }
}

#Preview {
    ActionsEditView()
        .environmentObject(AppState())
}
