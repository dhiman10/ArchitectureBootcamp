//
//  ProfileView.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 22.09.25.
//
import SwiftUI
import CustomRouting

struct ProfileView: View {
    
    @Environment(\.router) private var router

    var body: some View {
        List {
            segueSection
            alertSection
            modalSection
        }
        .navigationTitle("Routing examples")
    }
    
    private var segueSection: some View {
        Section {
            Button {
                router.showScreen(.push) { _ in
                    ProfileView()
                }
            } label: {
                Text("Push")
            }
            Button {
                router.showScreen(.sheet) { _ in
                    ProfileView()
                }
            } label: {
                Text("Sheet")
            }
            Button {
                router.showScreen(.fullScreenCover) { _ in
                    ProfileView()
                }
            } label: {
                Text("Full Screen Cover")
            }
            Button {
                router.dismissScreen()
            } label: {
                Text("Dismiss")
            }
        } header: {
            Text("Segues")
        }
    }

    private var alertSection: some View {
        Section {
            Button {
                router.showAlert(.alert, title: "Alert 1", subtitle: "Alert subtitle", buttons: nil)
            } label: {
                Text("Alert")
            }
            Button {
                router.showAlert(.confirmationDialog, title: "Alert 2", subtitle: "Alert subtitle", buttons: {
                    AnyView(
                        Group {
                            Button("Alpha", action: { })
                            Button("Beta", action: { })
                            Button("Gamma", action: { })
                            Button("Delta", action: { })
                        }
                    )
                })
            } label: {
                Text("Confirmation Dialog")
            }
            Button {
                router.dismissAlert()
            } label: {
                Text("Dismiss alert")
            }
        } header: {
            Text("Alerts")
        }
    }
    
    private var modalSection: some View {
        Section {
            Button {
                router.showModal(
                    backgroundColor: Color.purple.opacity(0.5),
                    transition: .move(edge: .bottom),
                    destination: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.blue)
                        .frame(maxHeight: 350)
//                        .padding(40)
                        .onTapGesture {
                            router.dismissModal()
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                })
            } label: {
                Text("Show modal")
            }
            Button {
                router.dismissModal()
            } label: {
                Text("Dismiss modal")
            }
        } header: {
            Text("Modal")
        }
    }
}




struct SettingsView: View {
    @Environment(\.router) private var router

    var body: some View {
        VStack(spacing: 40) {
            Text("Settings")
            
            Button {
                router.showScreen(.push) { _ in
                    AccountView()
                }
            } label: {
                Text("Go forward")
            }
            Button {
                router.dismissScreen()
            } label: {
                Text("Dismiss")
            }
        }
        .navigationTitle("Settings")
    }
}

struct AccountView: View {
    @Environment(\.router) private var router

    var body: some View {
        VStack(spacing: 40) {
            Text("Account")
            
            Button {
                router.showScreen(.fullScreenCover) { _ in
                    AccountView()
                }
            } label: {
                Text("Go forward")
            }
            Button {
                router.dismissScreen()
            } label: {
                Text("Dismiss screen")
            }
        }
        .navigationTitle("Account")
    }
}

#Preview {
    RouterView() { _ in
        ProfileView()
    }
}
