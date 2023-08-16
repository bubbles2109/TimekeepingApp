//
//  RestAPI.swift
//  project1
//
//  Created by Phamcuong on 04/11/2022.
//

import Foundation
import Alamofire

@available(iOS 13.0, *)

class RequestLoginAPI: UIViewController {
    let arrUser:UserDefaults = UserDefaults()
    
    func postRequestAPI(endPoint: String, email: String, password: String) {
        let url = URL(string: "http://165.22.251.159:8080/api/v1/auth" + endPoint)
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "email": email,
            "password": password,
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONDecoder().decode(ReqNotify.self, from: data)
                    switch asJSON.code {
                    case 200:
                        let token = asJSON.data!.accessToken!
                        print(token)
                        self.arrUser.set(token, forKey: "Token")
                        let storyboard = UIStoryboard(name: "Main", bundle:nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "navHome")
                        UIApplication.shared.windows.first?.rootViewController = vc
                        UIApplication.shared.windows.first?.makeKeyAndVisible()
                    case 400:
                        print(asJSON.message!)
                    default:
                        print("default")
                    }
                    
                } catch {
                    print(error)
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
class RequestProfileAPI: UIViewController {
    let user:UserDefaults = UserDefaults()
    
    
    func getRequestAPI(endPoint: String, accessToken: String) {
        let url = URL(string: "http://165.22.251.159:8080/api/v1/auth" + endPoint)
        var request = URLRequest(url: url!)
        request.addValue(accessToken, forHTTPHeaderField: "Authorization")
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONDecoder().decode(User.self, from: data)
                    //print(asJSON)
                    switch asJSON.code {
                    case 200:
                        let name1: String = (asJSON.data?.name)!
                        let wokspaceId: Int = (asJSON.data?.workspaceId)!
                        let email: String = (asJSON.data?.email)!
                        let phone: String = (asJSON.data?.phone)!
                        let shiftId: Int = (asJSON.data?.shiftId)!
                        let arr = profileData(imageUrl: "nil", email: email, name: name1, phone: phone, shiftId: shiftId, workspaceId: wokspaceId)
                        self.user.set(arr, forKey: "user")
                        print(asJSON.message!)
                    case 401:
                        print(asJSON.message!)
                    default:
                        print("default")
                    }

                } catch {
                    print(error)

                }
            case .failure(let error):
                print(error)
            }
        }

    }
}
