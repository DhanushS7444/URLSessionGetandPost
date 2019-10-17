//
//  ViewController.swift
//  URLSessiononJSON
//
//  Created by Dhanush S on 17/10/19.
//  Copyright © 2019 Dhanush S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onGetTapped(sender : Any)
    {
        // taking some url from jsonplaceholder
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        //creating a session
        let session = URLSession.shared
        session.dataTask(with: url) {(data, response , error) in
            //getting a response 200 to 299 good and above 400 is error
            if let response = response{
                print(response)
            }
            if let data = data{
                print(data)
                do{
                    //converting a data into json serialization
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
            
        }.resume()
  
    }
    
    @IBAction func onPostTapped(sender : Any){
        //the posting parameters declared in the dicttionary
        let parameter = ["UserName" : "Dhanush S" , "Password":"There is no Password bro"]
        
        //url connection
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
         // creating a request to the url
        var request = URLRequest(url: url)
        // http method type is post
        request.httpMethod = "POST"
        // mentioning the type of content which we are going to post
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //mentioning the wrting object
        guard  let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        //to write on the body of the http page
        request.httpBody = httpBody
        
        
        //starting the session from herer
        let session = URLSession.shared
        //after creating a session always end with .resume()
        session.dataTask(with: request){(data, response, error )in
            if let response = response{
                print(response)
            }
            // here data can throw error so use do try bloack
            if let data = data{
                print(data)
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
            
        }.resume()
        
    }
    
}



