//
//  CloudKitCrud.swift
//  Pictopia
//
//  Created by Antonio Braccolino & Dario Vigilante MUAHAHAHAHAHAHAH on 15/02/22.
//

import SwiftUI
import CloudKit


struct PhotoModel: Hashable{
    let name : String
    let imageURL : URL?
    let record : CKRecord
}


class CloudKitCrudViewModel: ObservableObject{
    
    @Published var text: String = ""
//    @Published var photos : [String] = []
    @Published var photos : [PhotoModel] = []
    @Published var imageSelected = UIImage()
    
    init(){
        fetchItems()
        
        
    }
    
    func addButtonPressed(){
        //VEDO SE ALMENO HO SCRITTO QUALCOSA
        guard !text.isEmpty else {return}
        addItem(name: text)
    }
    

    
    
    private func addItem(name: String){
//        SE FACCIO L'UPLOAD DI QUALCOSA CON CAMPI DIVERSI, IL DATABASE SE NE ACCORGE E CREA UN NUOVO RECORD TYPE
        
        let newPhoto = CKRecord(recordType: "Photo")
//        STYLE è LA CHIAVE
        newPhoto["style"] = name
        
        
        guard
//            let image = UIImage(named: "composition"),
        let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("upload"),
        let data = imageSelected.jpegData(compressionQuality: 0.5) else { return }
        
        do {
            try data.write(to: url)
            let asset = CKAsset (fileURL: url)
            newPhoto["pic"] = asset
            saveItem(record: newPhoto)
            
        } catch let error {
            print(error)
        }
        
        
        
        saveItem(record: newPhoto)
    }
    
    
    
    
    
    private func saveItem(record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record){ [weak self] returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.text = ""
                self?.fetchItems()
            }
            
        }
    }
    
    
    
    
    func fetchItems() {
//        PER PRENDERE GLI OGGETTI,DA QUALSIASI DATABASE IO VOGLIA
//        FUNZIONE PER LA RICHIESTA DEI DATI
        
//        se modifico predicate posso anche farmi tornare un solo dato,una sorta di filtro, è come se mettessi varie categorie
        let predicate = NSPredicate(value: true)
//        let predicate = NSPredicate(format: "photo = %@", argument Array: ["Luci"]
        
        let query = CKQuery(recordType: "Photo", predicate: predicate)
//        PER ORDINARE GLI STILI, SE VOGLIO ORDINARE PER DATA DI CREAZIONE DAL PIù RECENTE AL PIU VECCHIO QUI METTO FALSE E SOTTO DOVE TROVO returnedItems.append(name)  (QUI****)
        query.sortDescriptors = [NSSortDescriptor(key: "style", ascending: true)]
        let queryOperation = CKQueryOperation(query: query)
        
        
//        DO IL LIMITE DI QUANTI ELEMENTI VOGLIO FAR APPARIRE A SCHERMO DAL DATABASE, il max è 100
        queryOperation.resultsLimit = 25
        
        
//        CREO ARRAY PER TUTTI I STILI CHE HO CREATO
//        var returnedItems: [String] = []
        
//        HO CREATO LE PHOTO MODEL QUINDI QUESTO DI SPORA DIVENTA
        var returnedItems: [PhotoModel] = []
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult {
            case .success(let record):
                guard let name = record["style"] as? String else {return}
                let imageAsset = record["pic"] as? CKAsset
                let imageURL = imageAsset?.fileURL
                print(record)
//                returnedItems.append(name)
                returnedItems.append(PhotoModel(name: name, imageURL: imageURL, record: record))
                
//                QUIIIII ******
//                record.creationDate
//                PERO PER FARLO DEVO ANDARE NEL DATABASE, INDEX, PHOTO, ADD INDEX,CREATEDTIMESTAMP E METTERLO SORTABLE
                
                
            case .failure(let error):
                print("Error reccordMatchedBlock: \(error)")
            }
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("Returned queryResultBlock: \(returnedResult)")
            DispatchQueue.main.async {
                self?.photos = returnedItems
//                POSSO ORDINARE ANCHE QUI METTTENDO .SORT SOLO CHE L'ORDINAMENTO NON è SULLE QUERY,IMPLICA CHE PRIMA MI PRENDO I DATI E DOPO LI ORDINO,BISOGNA "EVITARE",DIPENDE DAI CASI
            }
          
        }
        
       addOperations(operation: queryOperation)
        
    }
    
    
    func addOperations(operation: CKDatabaseOperation){
        CKContainer.default().publicCloudDatabase.add(operation)
        
        
       
    }
    
//    per cambiare il nome quando clicco dal simulatore
    func updateItem(photo: PhotoModel){
        let record = photo.record
        record["style"] = "New Name"
        saveItem(record: record)
    }
    
    
    
        func deleteItem(indexSet: IndexSet){
            guard let index = indexSet.first else {return}
            let photo = photos[index]
            let record = photo.record
    
            CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordID, returnedError in
                DispatchQueue.main.async {
                    self?.photos.remove(at: index)
                }
    
            }
        }
    
    
    
    
}


struct CloudKitCrud: View {
    
    @StateObject private var vm = CloudKitCrudViewModel()
    @State var changeProfileImage: Bool = false
    @State var openCamera: Bool = false
    let selectedchlg: Item
//
    
    @Binding var showChallengeUpdates: Bool
    @State var showActionSheet: Bool = false
    let columns: [GridItem] = [GridItem(), GridItem(), GridItem()]
    let text13:LocalizedStringKey = "UnUploaded"
    let text14:LocalizedStringKey = "OnboardingMessage3"
    

    
    var body: some View {
//ScrollView{
            VStack(alignment: .leading) {
             
                    Text(firstChallenge.title)
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                
                if vm.imageSelected != UIImage() {
                    
                    Image(uiImage:vm.imageSelected)
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(20)
                        .padding(5)
                        .padding()
                        .scaledToFit()
                    
                    textField
                    addButton
                }
                else {
                    
                    Image(selectedchlg.image)
                        .resizable()
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding(5)
                        .padding()
                        .scaledToFit()
                    
                }


                    Text(firstChallenge.secondTitle)
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .padding(.top)


        //            Message no uploads
//                    Text(text13)
//                        .font(.title3)
//                        .fontWeight(.light)
//                        .foregroundColor(Color.gray)
//                        .multilineTextAlignment(.leading)
//                        .padding(.top, 2)

                    Spacer()

//
                List{
//                    VM photos perchè è un array
                    ForEach(vm.photos
                                .filter { $0.name.contains(selectedchlg.image)}
                            , id: \.self
//                            , vm.text == selectedchlg.name
                    ){
                        photo in
//                        Text($0)
                        HStack{
                            

                            if let url = photo.imageURL, let data = try? Data(contentsOf: url), let image = UIImage(data: data)   {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                }
                            Text(photo.name)
                            }
                        .onTapGesture {
//                                vm.updateItem(photo: photo)
                        }
                    }
                    .onDelete(perform: vm.deleteItem)
                    
                }
                .listStyle(PlainListStyle())
                 
            }
            .navigationTitle(selectedchlg.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button("\(Image(systemName: "plus"))") {
                showActionSheet.toggle()
                }
                .sheet(isPresented: $openCamera) {ImagePicker(selectedImage: $vm.imageSelected, sourceType: .photoLibrary)}
                .confirmationDialog("What to do?", isPresented: $showActionSheet, titleVisibility: .hidden, actions: {
                Button("Gallery") {
                    changeProfileImage = true
                    openCamera = true
                    vm.text = selectedchlg.image
                }

            }))

        }
//}
}

//struct CloudKitCrud_Previews: PreviewProvider {
//    static var previews: some View {
//        CloudKitCrud(showChallengeUpdates: .constant(true))
//            .preferredColorScheme(ColorScheme .dark)
//    }
//}




extension CloudKitCrud{
//    private var header: some View{
//
//        Text("CloudKit inserimento ")
//            .font(.headline)
//    }
    
    private var textField: some View {
        TextField("Add something here...", text: $vm.text)
            .frame(height: 55 )
            .padding(.leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
    }
    
    
    private var addButton: some View{
        Button{
            vm.addButtonPressed()
        } label: {
            Text("Upload image")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.7))
                .cornerRadius(20)
        }
        
    }
}




