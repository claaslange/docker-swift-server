import http

_ = http.createServer
  { req, res in
    // log request
    print("\(req.method) \(req.url)")

    // set content type to HTML
    res.writeHead(200, [ "Content-Type": "text/html" ])

    // write some HTML
    res.write("<h1>Hello Client: \(req.url)</h1>")

    res.write("<table><tbody>")
    for (key, value) in req.headers {
      res.write("<tr><td><nobr>\(key)</nobr></td><td>\(value)</td></tr>")
    }
    res.write("</tbody></table>")
    
    // finish up
    res.end()
  }
  .listen(3000) {
    print("Server listening: \($0)")
  }
