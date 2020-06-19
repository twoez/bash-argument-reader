# Bash Argument Reader
Reads arguments of the command line.

## Usage
./script.sh package install --package "name with space" --build --archive

Arguments get read into environment variables like so:
${ARG_0} = package
${ARG_1} = install
${ARG_PACKAGE} = "name with space"
${ARG_BUILD} = 1
${ARG_ARCHIVE} = 1
