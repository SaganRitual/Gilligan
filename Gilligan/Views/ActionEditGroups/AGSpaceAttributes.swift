// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AGSpaceAttributes: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Picker(selection: $appState.currentSpaceActionsEditMode, label: Text("Action:")) {
                Text("Follow Path")
                    .tag(Tokens.ActionType.followPath)

                Text("Move By")
                    .tag(Tokens.ActionType.moveBy)

                Text("Move To")
                    .tag(Tokens.ActionType.moveTo)

                Text("Resize By")
                    .tag(Tokens.ActionType.resizeBy)

                Text("Resize To")
                    .tag(Tokens.ActionType.resizeTo)

                Text("Rotate By")
                    .tag(Tokens.ActionType.rotateBy)

                Text("Rotate To")
                    .tag(Tokens.ActionType.rotateTo)
            }
            .pickerStyle(RadioGroupPickerStyle())
            .padding()

            switch appState.currentSpaceActionsEditMode {
            case .followPath:
                fatalError("Haven't figured out how to approach this yet")

            case .nothing:
                AVMoveBy()

            case .moveBy:
                AVMoveBy()

            case .moveTo:
                AVMoveTo()

            case .resizeBy:
                AVResizeBy()

            case .resizeTo:
                AVResizeTo()

            case .rotateBy:
                AVRotateBy()

            case .rotateTo:
                AVRotateTo()

            default:
                fatalError("currentSpaceActionsEditMode should not be \(appState.currentSpaceActionsEditMode)")
            }
        }
        .padding()
        
    }
}

#Preview {
    AGSpaceAttributes()
}
