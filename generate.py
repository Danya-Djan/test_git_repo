import random
import string
import hashlib

def generate_random_string(length=10):
    letters = string.ascii_lowercase + string.digits
    return ''.join(random.choice(letters) for i in range(length))

def generate_random_hash():
    random_string = generate_random_string()
    return hashlib.sha256(random_string.encode()).hexdigest()

def generate_random_id():
    return random.randint(1000, 9999)

def create_file(filename='output.txt', num_lines=1000):
    with open(filename, 'w') as file:
        for _ in range(num_lines):
            random_hash = generate_random_hash()
            random_id = generate_random_id()
            file.write(f"{random_hash}: {random_id}\n")

if __name__ == "__main__":
    create_file()