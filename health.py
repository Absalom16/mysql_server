from http.server import BaseHTTPRequestHandler, HTTPServer

class HealthHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"MySQL is running")

if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", 80), HealthHandler)
    server.serve_forever()
