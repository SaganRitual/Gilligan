// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

/*
 enum ActionTokenCategory {
     case followPath, moveBy, moveTo, resizeBy, resizeTo, rotateBy, rotateTo
 }

 struct SpaceAttributesToken: ActionToken {
     let category: ActionTokenCategory
     let duration: TimeInterval

     let angle: CGFloat?
     let path: CGPath?
     let position: CGPoint?
     let rotation: CGFloat?
     let size: CGSize?
     let translation: CGVector?
 }

 */

struct ActionsEditSpaceAttributesView: View {
    @EnvironmentObject var appState: AppState

    @StateObject private var scratchPad = Tokens.SpaceAttributesAction()

    var body: some View {
        VStack {
            Picker(selection: $scratchPad.type, label: Text("Action:")) {
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
            .onAppear {
            }

            switch scratchPad.type {
            case .followPath:
                Button("Add Random Point To Path") {

                }

            case .moveBy:
                VStack {
                    Slider(
                        value: $scratchPad.translation.dx,
                        in: -100...100,
                        step: 10,
                        label: { Text("X") },
                        minimumValueLabel: { Text("-100") },
                        maximumValueLabel: { Text(String("+100")) }
                    )

                    Text(String(format: "%.2f", scratchPad.translation.dx))
                }

                VStack {
                    Slider(
                        value: $scratchPad.translation.dy,
                        in: -100...100,
                        step: 10,
                        label: { Text("Y") },
                        minimumValueLabel: { Text("-100") },
                        maximumValueLabel: { Text(String("+100")) }
                    )

                    Text(String(format: "%.2f", scratchPad.translation.dy))
                }

            case .moveTo:
                VStack {
                    Slider(
                        value: $scratchPad.translation.dx,
                        in: -100...100,
                        step: 10,
                        label: { Text("X") },
                        minimumValueLabel: { Text("-100") },
                        maximumValueLabel: { Text(String("+100")) }
                    )

                    Text(String(format: "%.2f", scratchPad.translation.dx))
                }

                VStack {
                    Slider(
                        value: $scratchPad.translation.dy,
                        in: -100...100,
                        step: 10,
                        label: { Text("Y") },
                        minimumValueLabel: { Text("-100") },
                        maximumValueLabel: { Text(String("+100")) }
                    )

                    Text(String(format: "%.2f", scratchPad.translation.dy))
                }

            case .resizeBy:
                VStack {
                    Slider(
                        value: $scratchPad.deltaSize.width,
                        in: -10...10,
                        step: 1,
                        label: { Text("W") },
                        minimumValueLabel: { Text("-10") },
                        maximumValueLabel: { Text(String("+10")) }
                    )

                    Text(String(format: "%.2f", scratchPad.deltaSize.width))
                }

                VStack {
                    Slider(
                        value: $scratchPad.deltaSize.height,
                        in: -10...10,
                        step: 1,
                        label: { Text("H") },
                        minimumValueLabel: { Text("-10") },
                        maximumValueLabel: { Text(String("+10")) }
                    )

                    Text(String(format: "%.2f", scratchPad.deltaSize.height))
                }

            case .resizeTo:
                VStack {
                    Slider(
                        value: $scratchPad.size.width,
                        in: 10...100,
                        step: 10,
                        label: { Text("W") },
                        minimumValueLabel: { Text("10") },
                        maximumValueLabel: { Text(String("100")) }
                    )

                    Text(String(format: "%.2f", scratchPad.size.width))
                }

                VStack {
                    Slider(
                        value: $scratchPad.size.height,
                        in: 10...100,
                        step: 10,
                        label: { Text("H") },
                        minimumValueLabel: { Text("10") },
                        maximumValueLabel: { Text(String("100")) }
                    )

                    Text(String(format: "%.2f", scratchPad.size.height))
                }

            case .rotateBy:
                VStack {
                    Slider(
                        value: $scratchPad.rotation,
                        in: (-2 * Double.pi)...(2 * Double.pi),
                        step: Double.pi / 4,
                        label: { Text("Θ") },
                        minimumValueLabel: { Text("-2π") },
                        maximumValueLabel: { Text(String("+2π")) }
                    )

                    Text(String(format: "%.2f", scratchPad.rotation))
                }

            case .rotateTo:
                VStack {
                    Slider(
                        value: $scratchPad.angle,
                        in: (-2 * Double.pi)...(2 * Double.pi),
                        step: Double.pi / 4,
                        label: { Text("Θ") },
                        minimumValueLabel: { Text("-2π") },
                        maximumValueLabel: { Text(String("+2π")) }
                    )

                    Text(String(format: "%.2f", scratchPad.angle))
                }

            default:
                fatalError()
            }

            Spacer()

            ActionsSliderViewTimeInterval(title: "Duration", range: 0.5...5, value: $scratchPad.duration)
        }
        .padding()
        
    }
}

#Preview {
    ActionsEditSpaceAttributesView()
}
