//
//  ArticleDetailView.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 10/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import SwiftUI
import URLImage

struct ArticleDetailView: View {
    
    var article:ArticleModel?
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true){
           
            VStack(alignment: .leading, spacing: 10.0){
                Text((article?.title)!)
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 16.0, weight: .bold))
                HStack{
                    Text((article?.byline)!)
                        .foregroundColor(Color.gray)
                        .font(Font.system(size: 13.0, weight: .regular))
                    Spacer()
                    Text("Dated: \((article?.published_date)!)")
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 13.0, weight: .regular))
                }
                
                Text((article?.abstract)!)
                
                if article?.media != nil && article?.media?.count != 0{
                    self.images
                }
            }
            .frame(minWidth: 0.0 , maxWidth: .infinity, minHeight: 0.0 , maxHeight: .infinity, alignment: .leading)

        }
        .padding()
                
    }
    
    var images:some View {
        
        VStack{
            
            ForEach((self.article?.media)!, id: \.self) { media in
                
                
                URLImage(URL(string:media.mediametadata![1].url ?? media.mediametadata![0].url!)!,placeholder: { _ in
                    Image("defaultImage")
                        .resizable()
                    .scaledToFill()
                        .frame(width:60.0, height: 60.0,alignment:.center)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.gray,lineWidth: 1.0)
                    )
                    
                }) { proxy in
                proxy.image
                    .resizable()                     // Make image resizable
                    //.aspectRatio(contentMode: .fill) // Fill the frame
                }
                .scaledToFill()
                .frame(minWidth: 0.0, idealWidth:media.mediametadata![1].width ?? media.mediametadata![0].width , maxWidth: .infinity, minHeight: 0.0, idealHeight: media.mediametadata![1].height ?? media.mediametadata![0].height , maxHeight: .infinity, alignment: .center)
                .clipped()

            }
        }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView()
    }
}
