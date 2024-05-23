// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AGDisplayAttributes: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Picker(selection: $appState.currentDisplayActionsEditMode, label: Text("Action:")) {
                Text("Fade By")
                    .tag(Tokens.ActionType.fadeBy)

                Text("Fade To")
                    .tag(Tokens.ActionType.fadeTo)

                Text("Set Color")
                    .tag(Tokens.ActionType.setColor)

                Text("Set Color Blend Factor")
                    .tag(Tokens.ActionType.setColorBlendFactor)
            }
            .pickerStyle(RadioGroupPickerStyle())
            .padding()

            ZStack {
                switch appState.currentDisplayActionsEditMode {
                case .nothing:
                    AVFadeBy()

                case .fadeBy:
                    AVFadeBy()

                case .fadeTo:
                    AVFadeTo()

                case .setColor:
                    AVSetColor()

                case .setColorBlendFactor:
                    AVSetColorBlendFactor()

                default:
                    fatalError("currentDisplayActionsEditMode should not be \(appState.currentDisplayActionsEditMode)")
                }
            }
            .padding()
        }
        .id(appState.sctActionEdit)
    }
}

#Preview {
    AGDisplayAttributes()
}
