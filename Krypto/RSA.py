from math import gcd

def RSA(p:int, q:int):
    n = p * q
    
    t = (p - 1) * (q - 1)
    
    for i in range(2,t):
        if gcd(i,t) == 1:
            e = i
            break
        
    j = 0
    
    while True:
        if(j * e) % t == 1:
            d = j
            break
    
        j += 1
    
    return e,d,n

public_key,private_key,n = RSA(3593,97159)

print(public_key)
print(private_key)

message = 56

ct = (message ** public_key) % n

mes = (ct ** private_key) % n

print("Message: " + message)
print("Encrypted Message: " + ct)
print("Decrypted Message: " + mes)