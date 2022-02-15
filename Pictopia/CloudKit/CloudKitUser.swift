//
//  CloudKitUser.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 14/02/22.
//

import SwiftUI
import CloudKit


class CloudKitUserViewModel: ObservableObject{
    
    @Published var perimissionStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    
    init (){
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecodID()
    }
    
//    UTENTE HA BISOGNO DI ICLOUD ACCOUNT PER ACCEDERE
    private func getiCloudStatus() {
//        WEAK REFERENCES PERCHè USO CODICE ASINCRONO
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                switch returnedStatus {
                    
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                    
                case .available:
                    self?.isSignedInToiCloud = true
                    
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                    
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                    
                default:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                }
            }
        }
    }
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission() {
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.perimissionStatus = true
                }
                
//                MODIFICATO QUESTO, è UNA COSA MOLTO BRUTTA CHE HO FATTO, PERò DEVO VEDERE COME FUNZIONA
//                IN PRATICA SE NON DANNO I PERMESSI LI RICHIEDE DI NUOVO(?)
//                else{
//                    CKContainer.default().requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStatus, returnedError in
//                    DispatchQueue.main.async {
//                        if returnedStatus == .granted {
//                            self?.perimissionStatus = true
//                        }
//                    }
//                }
//            }
//                SE NON FUNZIONA CANCELLARE FINO A QUI
               
                
        }
    }
    }
    
    
    
    func fetchiCloudUserRecodID(){
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
    
    
    
    func discoveriCloudUser(id: CKRecord.ID){
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName{
                    self?.userName = name
                }
            }
        }
    }
    
}

struct CloudKitUser: View {
    
    @StateObject private var vm = CloudKitUserViewModel()
    
    var body: some View {
        
        VStack{
            
            Text("IS SIGNED IN: \(vm.isSignedInToiCloud.description.uppercased())")
            Text(vm.error)
            Text("Permission: \(vm.perimissionStatus.description.uppercased())")
            Text("NAME: \(vm.userName)")
        }
       
    }
}

struct CloudKitUser_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUser()
    }
}
