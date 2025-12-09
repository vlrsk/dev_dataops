from http.server import HTTPServer, BaseHTTPRequestHandler


class EchoHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length).decode("utf-8", errors="replace")

        print(f"Received message from client: {body}")

        response_text = f"Server received your message: {body}"
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(response_text.encode("utf-8"))

    def log_message(self, format, *args):
        return


def main():
    server_address = ("", 8000)
    httpd = HTTPServer(server_address, EchoHandler)
    print("Echo server listening on 0.0.0.0:8000 ...")
    httpd.serve_forever()


if __name__ == "__main__":
    main()