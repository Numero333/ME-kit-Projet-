//
//  DetailDocumentView.swift
//  ME-kit
//
//  Created by Apprenant 82 on 06/12/2021.
//

import SwiftUI

struct DetailDocumentView: View {
    var element : Doc
    @State private var showingSheet = false
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20).frame(width: 350, height: 500).foregroundColor(.gray)
                ZStack{
                    Button(action: {
                        self.showingSheet = true
                    }) {
                        CerclePartager()
                    }
                    .sheet(isPresented: $showingSheet,
                           content: {
                        ActivityView(activityItems: [NSURL(string: "https://KBIS.pdf")!] as [Any], applicationActivities: nil) })
                }.position(x: 300, y: 450)
            }
            Button {
                
            } label: {
                BoutonPlein(label: "Télécharger")
            }
        }.navigationTitle(element.texte)
    }
}

struct DetailDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        // DetailDocumentView(element: Doc(texte: "KBIS.pdf", dateDoc: Date()))
        CardView(element: Doc(texte: "ok", dateDoc: Date()))
    }
}


struct CardView: View {
    var element : Doc
    var body: some View {
        VStack {
           // HStack{
                Image(systemName: "doc")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.5)
                    .foregroundColor(.gray)
                    .frame(width: 70, height: 70)
                    .padding()
               // Spacer()
           // }
            HStack {
                VStack(alignment: .leading) {
                    Text(Date.now, format: .dateTime.day().month().year())
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(element.texte)
                        .font(.body).foregroundColor(Color("greenMEkit"))
                    Text("by \(entrepriseParDefaut.nomination)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                //.layoutPriority(100)
            }
        }.padding()
            .frame(width: 150, height: 200, alignment: .leading)
        //.padding()
    }
}
