from Crypto.Protocol.KDF import scrypt
from Crypto.Random import get_random_bytes
from Crypto.Cipher import AES

data = "Data top secret".encode()

password = b'my super secret'
salt = get_random_bytes(16)
key = scrypt(password, salt, 16, N=2**14, r=8, p=1)

cipher = AES.new(key,AES.MODE_CTR)
nonce = cipher.nonce
ciphertext= cipher.encrypt(data)

cipher = AES.new(key,AES.MODE_CTR,nonce=nonce)

message = cipher.decrypt(ciphertext)
print(f"Enrypted: {ciphertext}")
print(f"Decrypted: {message}")
