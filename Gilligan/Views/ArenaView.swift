// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit
import SwiftUI

struct ArenaView: View {
    @EnvironmentObject var appState: AppState

    @State private var viewSize = CGSize.zero

    // With eternal gratitude to
    // https://forums.developer.apple.com/forums/profile/billh04
    // Adding a nearly invisible view to make DragGesture() respond
    // https://forums.developer.apple.com/forums/thread/724082
    let glassPaneColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)

    //
    // States:
    // - 0 items selected
    // - 1 item selected
    // - >1 item selected
    //
    // -- Selected item is gremlin (can have actions)
    // -- Selected item is waypoint
    //
    // --- Selected gremlin has 0 actions
    // --- Selected gremlin has >0 actions

    // If nothing is selected, or if >1 things are selected, the higher-level
    // view will prevent us coming here.
    //
    // If 1 thing is selected
    // && it's a thing that can have fade actions
    //
    // If it has at least one fade action already, populate the view with
    // that fade action and show
    //
    // If it doesn't have a fade action (but the higher-level view has decided
    // to show us anyway, then show the "Add Fade Action" button
    //

    var body: some View {
        ZStack {
            SpriteView(scene: SKScene())
            Color(cgColor: glassPaneColor)

            HStack {
                VStack(alignment: .leading) {
                    Button("Deselect all") {
                        appState.deselectAll()
                    }.disabled(appState.selectionCountMode == .nothing)

                    Button("Select Gremlin A") {
                        appState.select(appState.gremlins[0])
                    }.disabled(appState.selectionCountMode == .single && appState.selectedGremlin === appState.gremlins[0])

                    Button("Select Gremlin B") {
                        appState.select(appState.gremlins[1])
                    }.disabled(appState.selectionCountMode == .single && appState.selectedGremlin === appState.gremlins[1])

                    Button("Select Gremlin C") {
                        appState.select(appState.gremlins[2])
                    }.disabled(appState.selectionCountMode == .single && appState.selectedGremlin === appState.gremlins[2])

                    Button("Select Gremlins A & B") {
                        appState.select(appState.gremlins[0])
                        appState.select(appState.gremlins[1], add: true)
                    }.disabled(
                        appState.selectionCountMode == .multiple &&
                        (appState.isSelected(appState.gremlins[0]) && appState.isSelected(appState.gremlins[1]))
                    )

                    Button("Select Gremlins A & C") {
                        appState.select(appState.gremlins[0])
                        appState.select(appState.gremlins[2], add: true)
                    }.disabled(
                        appState.selectionCountMode == .multiple &&
                        (appState.isSelected(appState.gremlins[0]) && appState.isSelected(appState.gremlins[2]))
                    )

                    Button("Select Gremlins B & C") {
                        appState.select(appState.gremlins[1])
                        appState.select(appState.gremlins[2], add: true)
                    }.disabled(
                        appState.selectionCountMode == .multiple &&
                        (appState.isSelected(appState.gremlins[1]) && appState.isSelected(appState.gremlins[2]))
                    )
                }
                .padding(.leading)

                Spacer()
            }
        }
        .background() {
            GeometryReader { geometry in
                Path { _ in
                    DispatchQueue.main.async {
                        if self.viewSize != geometry.size {
                            self.viewSize = geometry.size
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ArenaView()
        .environmentObject(AppState())
}
