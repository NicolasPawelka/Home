from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
import binascii

keyPair = RSA.generate(3072)

pubKey = keyPair.publickey()
pubKeyPEM = pubKey.exportKey()

privKeyPEM = keyPair.exportKey()

msg = 'A message for encryption'

encryptor = PKCS1_OAEP.new(pubKeyPEM)
decryptor = PKCS1_OAEP.new(privKeyPEM)
encrypted = encryptor.encrypt(msg)

decrypted = decryptor.decrypt(encrypted)

print(decrypted)