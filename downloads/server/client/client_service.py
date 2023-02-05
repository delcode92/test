# client - server connection via socket programming

import socket
from time import sleep


class Client:
    
    s = None
    
    def __init__(self, host, port) -> None:
        self.connect_client(host, port)

    def connect_client(self, h, p):
        # connect_stat = False
        
        while True:
            try:
                self.s.sendall( bytes(f"client({h}) connected", 'utf-8') )
            except:
                print("can't connect to server")

                try:
                    self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    self.s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                    self.s.connect((h, int(p)))

                    self.s.sendall( bytes(f"client({h}) connected", 'utf-8') )
                    print("success connect to server")

                except Exception as e:
                    print("can't connect to server")
                    print(str(e))

            # if(connect_stat == False):
            #     try:
            #         self.s.sendall( bytes("client-server connected", 'utf-8') )
            #         self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            #         self.s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            #         self.s.connect((h, p))

            #         self.s.sendall( bytes("client-server connected", 'utf-8') )
            #         print("success connect to server")

            #         connect_stat = True
            #     except:
            #         print("can't connect to server")                        

                
            # elif(connect_stat == True):
                # try:
                #     self.s.sendall( bytes("client-server connected", 'utf-8') )
                # except:
                #     try:
                #         self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                #         self.s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                #         self.s.connect((h, p))
                #         self.s.sendall( bytes("client-server connected", 'utf-8') )
                #         print("success connect to server")
                #     except:
                #         print("can't connect to server 123")

            sleep(1)

    
    def get_data(self, data):

        # send rfid value to server socket
        self.s.sendall( bytes(data, 'utf-8') )
        res = self.s.recv(1024)

        return res
    
    
    def send_img(self, data):

        # send rfid value to server socket
        # self.s.sendall( bytes(data, 'utf-8') )
        self.s.sendall( data )
        res = self.s.recv(1024)

        return res


    