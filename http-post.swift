#! /usr/bin/env xcrun swift

import Foundation

func HttpPost(url: String, params: [String:String], callback: (String) -> Void) {
    
    // Standardise encoding across function
    let ENCODING = NSUTF8StringEncoding
    
    // Create POST request
    var request = NSMutableURLRequest()
    request.URL =  NSURL(string: url)
    request.HTTPMethod = "POST"
    request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    
    // Construct query string. For example, if you had parameters first_name = Meher and last_name = Kasam,
    // your query string would become first_name=Meher&last_name=Kasam
    var queryString: String = ""
    for (key, value) in params {
        queryString += "\(key)=\(value.stringByAddingPercentEscapesUsingEncoding(ENCODING))&"
    }
    
    // Convert string to type NSDATA using default encoding and populate request body with the object
    let postBody = queryString.dataUsingEncoding(ENCODING)
    request.HTTPBody = postBody

    var error: NSError?

    // Create HTTP request async task and handle error conditions
    var task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        (data, response, error) -> Void in
        if (error != nil)
        {
            callback("Error occurred: \(error)")
        }
        else
        {
            var dataString = NSString(data:data, encoding: ENCODING)
            callback(dataString)
        }
    }

    task.resume()
}

var params:[String:String] = ["fname": "your_first_name", "lname": "your_last_name"]

HttpPost("http://www.w3schools.com/tags/demo_form_method_post.asp", params) {
    (message: String) -> Void in
    println(message)
}

sleep(2)