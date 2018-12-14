//
//  MyRequestController.swift
//  TestBBVA
//
//  Created by Gerardo on 12/13/18.
//  Copyright © 2018 Gerardo. All rights reserved.
//
import Foundation
class MyRequestController {
    var user = [String]()
    func sendRequestGET(url:String){

        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: url) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
              
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: AnyObject]
                    if let response = json["response"] as? [String:Any] {
                        let creationDate = response["creationDate"]
                        let serverDate = response["serverDate"]
                        let securityInstrument = response["securityInstrument"]
                        let securityInstrumentState = response["securityInstrumentState"]
                        let state = response["state"]
                        let profile = response["profile"]
                        let mobilePhoneCompany = response["mobilePhoneCompany"]
                        let alertIndicator = response["alertIndicator"]
                        let creationDate1 = creationDate ?? String()
                        let serverDate1 = serverDate ?? String()
                        let securityInstrument1 = securityInstrument ?? String()
                        let securityInstrumentState1 = securityInstrumentState ?? String()
                        let state1 = state ?? String()
                        let profile1 = profile ?? String()
                        let mobilePhoneCompany1 = mobilePhoneCompany ?? String()
                        let alertIndicator1 = alertIndicator ?? String()
                        
                        if creationDate1 is NSNull{
                            self.user.append("creationDate = Null")
                        }else{
                            self.user.append("creationDate  = \(creationDate as! String)")
                        }
                        if serverDate1 is NSNull{
                            self.user.append("serverDate = Null")
                        }else{
                            self.user.append("ServerDate  = \(serverDate as! String)")
                        }
                        if securityInstrument1 is NSNull{
                            self.user.append("securityInstrument = Null")
                        }else{
                            self.user.append("securityInstrument  = \(securityInstrument as! String)")
                        }
                        if securityInstrumentState1 is NSNull{
                            self.user.append("securityInstrumentState = Null")
                        }else{
                            self.user.append("securityInstrumentState  = \(securityInstrumentState as! String)")
                        }
                        if state1 is NSNull{
                            self.user.append("state = Null")
                        }else{
                            self.user.append("state  = \(state as! String)")
                        }
                        if profile1 is NSNull{
                            self.user.append("profile = Null")
                        }else{
                            self.user.append("profile = \(profile as! String)")
                        }
                        if mobilePhoneCompany1 is NSNull{
                            self.user.append("cmobilePhoneCompany = Null")
                        }else{
                            self.user.append("mobilePhoneCompany  = \(mobilePhoneCompany as! String)")
                        }
                        if alertIndicator1 is NSNull{
                            self.user.append("alertIndicator = Null")
                        }else{
                            self.user.append("alertIndicator  = \(alertIndicator as! String)")
                        }
                       
                    }
                    UserDefaults.standard.set(self.user, forKey: "User")
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
              //  UserDefaults.standard.set(, forKey: <#T##String#>)
              
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        
        task.resume()
        session.finishTasksAndInvalidate()
       
    }
    
    
    func sendRequestPOST() {

        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard var URL = URL(string: "https://www.bancomermovil.net:11443/dembmv_mx_web/mbmv_mult_web_mbmv_01/services/digitalAccount/V05/consultaCURP") else {return}
        let URLParams = [
            "aMaterno": "\"\"",
            "nombres": "\"\"",
            "indRENAPO": "CURP",
            "sexo": "H",
            "curp": "ROSD940510MJCSLN00",
            "aPaterno": "\"\"",
            "cveEntidadNac": "\"\"",
            "fechNac": "\"\"",
            ]
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"

        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}


protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
    
}



