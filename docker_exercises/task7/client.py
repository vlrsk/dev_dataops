import urllib.request

URL = "http://demo_server:8000"
message = "Hello from client container"

data = message.encode("utf-8")
req = urllib.request.Request(
    URL,
    data=data,
    method="POST",
    headers={"Content-Type": "text/plain; charset=utf-8"},
)

print(f"Sending message to {URL}: {message!r}")

with urllib.request.urlopen(req) as resp:
    print("Status:", resp.status)
    body = resp.read().decode("utf-8", errors="replace")
    print("Response body from server:")
    print(body)