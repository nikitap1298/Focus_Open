//
//  Calendar-View.swift
//  Focus
//
//  Created by Nikita Pishchugin on 08.01.24.
//

import SwiftUI

struct Calendar_View: View {
    
    // MARK: - Properties
    @EnvironmentObject private var coreDataModel: CoreDataModel
    @StateObject private var viewModel = ViewModel()
    
    @State private var date = Date()
    
    @Binding var path: NavigationPath
    
    init(_ path: Binding<NavigationPath>) {
        _path = path
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
            VStack {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    in: (coreDataModel.tasks.first?.createdAt ?? .distantPast)...Date(),
                    displayedComponents: [.date]
                )
                .disabled(coreDataModel.tasks.isEmpty)
                .datePickerStyle(.graphical)
                .background(CustomColors.whiteAndSystemGray5)
                .accentColor(CustomColors.blue)
                .onChange(of: date) { _ in                    viewModel.calculateStats(coreDataModel, date)
                }
                
                VStack(spacing: 50) {
                    HStack {
                        Text(date, style: .date)
                            .font(.title3)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    HStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(viewModel.numberOfFinishedTasks)")
                                    .font(.title)
                                    .fontWeight(.medium)
                                Text("Task Finished")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(viewModel.numberOfFailedTasks)")
                                    .font(.title)
                                    .fontWeight(.medium)
                                Text("Task Failed")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                        }
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(viewModel.meditationMinutes)")
                                .font(.title)
                                .fontWeight(.medium)
                            Text("Meditation Minutes")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal, 50)
                .padding(.top)
                
                Spacer()
            }
        }
        .navigationTitle("Calendar")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.calculateStats(coreDataModel, date)
        }
    }
}

//#Preview {
//    Calendar_View()
//}
