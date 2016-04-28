#!/bin/bash

mkdir executor
mkdir executor/library
cp COPYING executor
cp README executor
cp library.properties executor
cp lib/guava.COPYING executor/guava.COPYING
cp lib/guava-19.0.jar executor/library
cp -R src executor
cp -R examples executor
cd src
javac -source 1.6 -target 1.6 -classpath "../lib/processing-core-2.2.1.jar:../lib/guava-19.0.jar" org/dishevelled/processing/executor/*.java
jar cvf ../executor/library/executor.jar org/dishevelled/processing/executor/*.class
cd ..
