// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct ActionsEditDisplayAttributesView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack {
            Picker(selection: $appState.currentActionsEditMode, label: Text("Action:")) {
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
                switch appState.currentActionsEditMode {
                case .fadeBy:
                    AVFadeBy()

                case .fadeTo:
                    AVFadeTo()

                case .setColor:
                    AVSetColor()

                case .setColorBlendFactor:
                    AVSetColorBlendFactor()

                default:
                    fatalError()
                }
            }
            .padding()
        }
        .id(appState.sctActionEdit)
    }
}

#Preview {
    ActionsEditDisplayAttributesView()
}
