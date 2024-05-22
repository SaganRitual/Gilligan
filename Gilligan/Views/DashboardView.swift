// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

var hackUpdate = 1

struct DashboardView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Gilligan")
                Spacer()
            }
            .padding(.bottom)

            HStack {
                Spacer()
                Text("Tools").underline()
                Spacer()
            }
            .padding(.bottom)

            if appState.selectedEntityMode == .gremlin {
                ToolsView()
            }
        }
        .monospaced()
        .frame(width: 400)
        .padding()
        .id(appState.sctDashboard)
    }
}


#Preview {
    DashboardView()
        .environmentObject(AppState())
}
