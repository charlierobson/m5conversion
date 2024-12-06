import sys

# Define the sequences with their second byte and descriptions
sequences = [
    (0x7b, "in a,(c)"),
    (0x40, "in b,(c)"),
    (0x48, "in c,(c)"),
    (0x50, "in d,(c)"),
    (0x58, "in e,(c)"),
    (0x60, "in h,(c)"),
    (0x68, "in l,(c)"),
    (0xa2, "ini"),
    (0xb2, "inir"),
    (0xaa, "ind"),
    (0xba, "indr"),
    (0xbb, "out (c),l"),
    (0x79, "out (c),a"),
    (0x41, "out (c),b"),
    (0x49, "out (c),c"),
    (0x51, "out (c),d"),
    (0x59, "out (c),e"),
    (0x61, "out (c),h"),
    (0x69, "out (c),l"),
    (0xa3, "outi"),
    (0xb3, "outir"),
    (0xab, "outd"),
    (0xbb, "outdr"),
]

def find_all_sequences(buffer, second_byte):
    """Find all instances of the sequence 0xED followed by second_byte in the buffer."""
    offsets = []
    for i in range(len(buffer) - 1):
        if buffer[i] == 0xED and buffer[i + 1] == second_byte:
            offsets.append(i)
    return offsets

def main():
    if len(sys.argv) != 2:
        print("Usage: python script.py <file_path>")
        return

    file_path = sys.argv[1]

    try:
        # Read the entire file into a buffer
        with open(file_path, "rb") as f:
            buffer = f.read()

        # Collect all matches
        all_matches = []
        for second_byte, description in sequences:
            offsets = find_all_sequences(buffer, second_byte)
            for offset in offsets:
                all_matches.append((offset, description, second_byte))

        # Sort matches by offset
        all_matches.sort()

        # Print sorted matches
        for offset, description, second_byte in all_matches:
            print(f"${offset + 0x8000:04X} {description}")

    except Exception as ex:
        print(f"An error occurred: {ex}")

if __name__ == "__main__":
    main()
