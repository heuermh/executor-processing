#!/bin/bash

mkdir executor
mkdir executor/library
cp COPYING executor
cp README executor
cp library.properties executor
cp lib/failureaccess.COPYING executor/failureaccess.COPYING
cp lib/failureaccess-1.0.1.jar executor/library
cp lib/guava.COPYING executor/guava.COPYING
cp lib/guava-28.1-jre.jar executor/library
cp -R src executor
cp -R examples executor
cd src
javac -source 1.8 -target 1.8 -classpath "../lib/processing-core-3.5.3.jar:../lib/guava-28.1-jre.jar" org/dishevelled/processing/executor/*.java
jar cvf ../executor/library/executor.jar org/dishevelled/processing/executor/*.class
cd ..
