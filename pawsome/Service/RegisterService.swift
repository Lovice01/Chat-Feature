//
//  RegisterService.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import Foundation
import Alamofire

class RegisterService {
    
    func register(fullName:String, phone: String, email: String, password: String, user_Id: Int, completion: @escaping (_ success: Bool, _ message: String, _ data:Owner?) -> ()) {
        let url = Configuration.conf.baseURL + "users/register"
        let params = [
            "fullName": fullName,
//            "dogName": dogName,
            "phone": phone,
            "email": email,
            "password": password,
            "user_type_id": user_Id
        ] as [String: Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {
                completion(false, "Something went wrong", nil)
                return
            }
            
            do {
                let data = try JSONDecoder().decode(ApiResponse<Owner>.self, from: data)
                
                // save the token in the database... here..
                
                
//                completion(data.isSuccess,data.message, data.data)
            } catch {
                print("error", error)
                completion(false, "Soemthing is wrong",nil)
            }
            
        }
    }
}