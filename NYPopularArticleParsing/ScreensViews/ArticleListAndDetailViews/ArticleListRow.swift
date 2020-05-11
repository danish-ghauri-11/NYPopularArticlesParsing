//
//  ArticleListRow.swift
//  NYPopularArticleParsing
//
//  Created by Danish Ghauri on 11/05/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import SwiftUI
import URLImage

struct ArticleListRow: View {
    
    var article:ArticleModel?
    var body: some View {
        
        HStack{
        
            
            if article?.media != nil && article?.media?.count != 0{
                
                if article?.media![0].type == "image"{
                    self.imageView
                }
                else{
                    Image("defaultImage")
                    .resizable()
                    .scaledToFill()
                        .frame(width:60.0, height: 60.0,alignment:.center)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.gray,lineWidth: 1.0)
                    )
                }
            }
            else{
                Spacer(minLength: 60.0)
            }
            
            VStack(alignment: .leading, spacing: 12.0){
                Text((article?.title)!)
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 16.0))
                    .lineLimit(2)
                
                HStack{
                    Text((article?.byline)!)
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 13.0))
                    .lineLimit(2)
                    Spacer()
                    Text("Dated: \((article?.published_date)!)")
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 13.0))
                }
                
                    
            }
            
        }
        .padding()
        .frame(minWidth: 0.0 , maxWidth: .infinity, minHeight: 0.0, maxHeight: .infinity, alignment:.leading)
    }
    
    var imageView:some View {
        
            
            URLImage(URL(string:self.thumbURL())!,placeholder: { _ in
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
                .frame(width:60.0, height: 60.0,alignment:.center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray,lineWidth: 1.0)
            )
        
        
    }
    
    func thumbURL() ->String {
        
        let media = article?.media![0]
        
        return (media?.mediametadata![0].url)!
    }
}

struct ArticleListRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListRow()
        .previewLayout(.fixed(width: 390.0, height: 120.0))

    }
}
