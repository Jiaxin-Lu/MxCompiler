# this script is called when the judge is building your compiler.
# no argument will be passed in.

set -e
cd "$(dirname "$0")"
mkdir -p bin
find ./src -name *.java | javac -d bin -classpath "/ulib/java/antlr-4.8-complete.jar:./lib/commons-text-1.6.jar:./lib/commons-lang3-3.8.1.jar" @/dev/stdin