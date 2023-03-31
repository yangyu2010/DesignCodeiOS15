//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Yu Yang on 3/23/23.
//

import SwiftUI

struct AccountView: View {
    @State var isDelete = false
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundStyle(.blue)
                                .font(.system(size: 200))
                                .offset(x: -50, y: -110)
                        )
                    Text("Yu Yang")
                        .font(.title.weight(.semibold))
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.small)
                        Text("China")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                    
                Section {
                    NavigationLink(destination: ContentView()) {
                        Label("Hello, World!", systemImage: "gear")
                    }
                    NavigationLink {
                        Text("Billing")
                    } label: {
                        Label("Billing", systemImage: "creditcard")
                    }
                    NavigationLink(destination: ContentView()) {
                        Label("Help", systemImage: "questionmark")
                    }
                }
//                .accentColor(.red)
                .listRowSeparatorTint(.red)
                .listRowSeparator(.hidden)
                
                Section {
                    if !isDelete {
                        Link(destination: URL(string: "https://apple.com")!) {
                            HStack {
                                Label("Apple", systemImage: "apple.logo")
                                Spacer()
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                 isDelete = true
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                            
                            Button(action: { }) {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.yellow)
                        }
                    }
                    Link(destination: URL(string: "https://youtube.com")!) {
                        HStack {
                            Label("Youtube", systemImage: "tv")
                            Spacer()
                            Image(systemName: "link")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .accentColor(.primary)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
