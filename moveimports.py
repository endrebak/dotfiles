#!/usr/bin/env python

from sys import argv


def main():

    infile = argv[0]

    with open(infile) as infile_handle:
        lines = infile_handle.readlines()

    import_lines = []
    other_lines = []
    for line in lines:
        if "import " in line and "# nomove" not in line:
            import_lines.append(line)
        else:
            other_lines.append(line)

    print("".join(import_lines) + "\n" + "".join(other_lines))


if __name__ == '__main__':

    main()
