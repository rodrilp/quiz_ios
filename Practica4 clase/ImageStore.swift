//
//  ImageStore.swift
//  Practica4 clase
//
//  Created by Rodrigo Lopez on 14/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

var ImageCache = [URL:UIImage]()

func image(url: URL) -> UIImage {
    if let img = ImageCache[url]{
        return img
    }
    
    if let data = try? Data(contentsOf: url){
        if let img = UIImage(data: data){
            ImageCache[url] = img
            return img
        }
    }
    return UIImage(named: "none")!
}

/*

 
 
 
 
             if let img = ImageCache[url]{
                 return img
             }
             
             if let data = try? Data(contentsOf: url){
                 let img = UIImage(data: data){
                     ImageCache[url] = img
                     return img
                 }
             }
             return UIImage(named: "none")!
 */
