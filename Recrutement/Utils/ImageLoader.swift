//
//  ImageLoader.swift
//  Recrutement
//
//  Created by Kevin Do Vale on 20.11.20.
//

import Alamofire
import AlamofireImage

class ImageLoader : ObservableObject {
    @Published var image:UIImage?

    init(url:String) {
        Alamofire.request(url).responseImage { response in
            if response.result.value != nil {
                self.image = UIImage(data: response.data!, scale: 2.0)
            }
        }
    }
}
