# oneline Makefile

this repository is oneline Makefile that can be used to build C/C++ projects.

## Usage

```
  -l  show this help text
  -i  initialize folder structure
  -r  redownload makefile
  -m  create output for each c files
  -e  create one executable in src folder
  -l  create static library
  -c  remove makefile after run"
```

```bash
# download the makefile that create one executeable
wget -O - raw.githubusercontent.com/dennis0324/make/main/makeOnline.sh  | bash -s -- -e
```

```bash
# download the makefile that create executeable for each source file
wget -O - raw.githubusercontent.com/dennis0324/make/main/makeOnline.sh  | bash -s -- -m
```

```bash
# download the makefile that create library
wget -O - raw.githubusercontent.com/dennis0324/make/main/makeOnline.sh  | bash -s -- -l
```

# Features

fill free to tell me more feature that you want to add.
TODO:

- [] feature ignore file or folders
