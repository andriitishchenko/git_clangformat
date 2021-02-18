# git_clangformat
Simple script for git hook configuration of codestyle

Script will backup existing pre-commit hook then download all necessary files.


## Dependencies

https://formulae.brew.sh/formula/clang-format

```bash
$ brew install clang-format
```

## Install 

Install clang-format tool

Navigate to the cloned git repo with terminal terminal

Copy-paste to the terminal command:

```bash
$ curl -fsSL https://raw.githubusercontent.com/andriitishchenko/git_clangformat/main/install.sh | bash
```

## Options

You can modify the .clang-format for your needs, check more options

https://clang.llvm.org/docs/ClangFormatStyleOptions.html


## Hint

Apply code formatting to specific files *.(h|m|cpp) in the ./test directory:

```bash
find ./test -type f \( -iname \*.h -o -iname \*.m -o -iname \*.cpp \) -exec clang-format -i -style=file {} \;
```