//
//  ShareApp-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI
import UniformTypeIdentifiers

struct ShareApp_View: View {
    
    // MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = ViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack {
                Image("FocusIconSVG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125)
                    .cornerRadius(CGFloat(125).getAppIconCornerRadious())
                    .padding(.vertical, 40)
                Text("Focus")
                    .font(.title2)
                    .fontWeight(.semibold)
                Form {
                    Section {
                        HStack {
                            Text(viewModel.applink)
                                .lineLimit(1)
                            Spacer()
                            Button {
                                Feedback().impactOccured()
                                UIPasteboard.general.setValue(viewModel.applink, forPasteboardType: UTType.plainText.identifier)
                                
                                Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                    viewModel.setIsCopied(false)
                                }
                                viewModel.setIsCopied(true)
                            } label: {
                                if viewModel.isCopied {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Color.green)
                                } else {
                                    Image(systemName: "doc.on.doc")
                                }
                            }
                            .disabled(viewModel.isCopied ? true : false)
                        }
                    } header: {
                        Text("App Link")
                    }
                    .listRowBackground(colorScheme == .light ? .white : Color(uiColor: .systemGray5))
                }
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
                .padding(.horizontal, 0)
                Spacer()
                
                BottomActionButton({
                    viewModel.toggleShowActivityVC()
                }, buttonText: "Share the App", 
                                   buttonColor: Color.accentColor)
            }
            .navigationTitle("Share")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: viewModel.showActivityVC) {
                ActivityViewController(activityItems: [viewModel.applink])
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    ShareApp_View()
}
