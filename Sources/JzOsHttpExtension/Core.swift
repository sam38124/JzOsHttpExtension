//
//  File.swift
//  
//
//  Created by Jianzhi.wang on 2020/9/14.
//

import Foundation
class HttpCore {
    public static func get(_ serverUrl:String,_ timeout:TimeInterval=5)->Data?{
        var returnString:Data? = nil
        var isend=false
        guard let url = URL(string: serverUrl) else {  return nil }
        var request: URLRequest
        request = URLRequest(url: url)
        request.timeoutInterval = timeout
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    isend=true
                    returnString=data
                    break
                default:
                    isend=true
                    break
                }
            }
        }
        let clock=jzclock()
        while(!isend){
            usleep(20*1000)
            if(clock.stop()>timeout){
                break
            }
        }
        return returnString
    }
    public static func post(_ serverUrl:String,_ timeout:TimeInterval=5,_ data:Data)->Data?{
         var returnString:Data? = nil
         var isend=false
         guard let url = URL(string: serverUrl) else {  return nil }
         var request: URLRequest
         request = URLRequest(url: url)
         request.timeoutInterval = timeout
         request.httpMethod = "POST"
         request.httpBody=data
         URLSession.shared.dataTask(with: request){
             (data, response, error) in
             if let httpResponse = response as? HTTPURLResponse {
                 switch httpResponse.statusCode {
                 case 200...299:
                     isend=true
                     returnString=data
                     break
                 default:
                     isend=true
                     break
                 }
             }
         }
          let clock=jzclock()
               while(!isend){
                   usleep(20*1000)
                   if(clock.stop()>timeout){
                       break
                   }
               }
         return returnString
     }
}
