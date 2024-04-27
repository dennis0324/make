# oneline Makefile

this repository is oneline Makefile that can be used to build C/C++ projects.

## Usage

```
-l  show this help text
-i  [i]nitialize folder structure
-r  [r]edownload makefile
-m  create output for each c files
-e  create one [e]xecutable in src folder
-l  create static [l]ibrary
-c  [c]lear makefile after run
-a  make command [a]lias
-n  change [n]ame of the project
-N  change [N]ame of the Author
```

## Examples

1. download the makefile that create one executeable

```bash
wget -O - raw.githubusercontent.com/dennis0324/make/main/makeOnline.sh  | bash -s -- -e
```

2. download the makefile that create executeable for each source file

```bash
wget -O - raw.githubusercontent.com/dennis0324/make/main/makeOnline.sh  | bash -s -- -m
```

3. download the makefile that create library

```bash
wget -O - raw.githubusercontent.com/dennis0324/make/main/makeOnline.sh  | bash -s -- -l
```

# Features

fill free to tell me more feature that you want to add.

TODO:

- [ ] feature ignore file or folders
