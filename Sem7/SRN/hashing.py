import bcrypt

def hash_password(password: str) -> str:
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password.encode(), salt)
    return hashed.decode()

def check_password(stored_hash: str, password: str) -> bool:
    return bcrypt.checkpw(password.encode(), stored_hash.encode())

hashed_pw = hash_password("meinGeheimesPasswort")
print("Gespeichertes Passwort-Hash:", hashed_pw)

is_correct = check_password(hashed_pw, "meinGeheimesPasswort")
print("Passwort korrekt?", is_correct)

