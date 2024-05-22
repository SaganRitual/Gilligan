// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct ToolsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView {
            ActionsEditView()
                .tabItem {
                    Label("Actions", systemImage: "figure.run")
                }

            Rectangle()
                .tabItem {
                    Label("Physics", systemImage: "moon.fill")
                }

            Rectangle()
                .tabItem {
                    Label("Properties", systemImage: "dial.medium.fill")
                }
        }
        .padding()
    }
}

#Preview {
    ToolsView()
        .environmentObject(AppState())
}
