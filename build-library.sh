#!/bin/bash

mkdir executor
mkdir executor/library
cp COPYING executor
cp README.md executor
cp library.properties executor
cp lib/guava.COPYING executor/guava.COPYING
cp lib/guava-13.0.1.jar executor/library
cp -R src executor
cp -R examples executor
cd src
javac -source 1.6 -target 1.6 -classpath "../lib/processing-core-1.5.1.jar:../lib/guava-13.0.1.jar" executor/Executor.java
jar cvf ../executor/library/executor.jar executor/*.class
cd ..
