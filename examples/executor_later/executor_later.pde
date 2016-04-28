/*

    Executor library for Processing.
    Copyright (c) 2012-2016 held jointly by the individual authors.

    This file is part of Executor library for Processing.

    Executor library for Processing is free software: you can redistribute it and/or
    modify it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Executor library for Processing is distributed in the hope that it will be
    useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Executor library for Processing.  If not, see
    <http://www.gnu.org/licenses/>.

*/
import java.util.concurrent.TimeUnit;

import org.dishevelled.processing.executor.Executor;

color c = color(20);
final color r = color(80, 0, 0);
final color g = color(0, 80, 0);
final color b = color(0, 0, 80);

Executor executor;

void setup()
{
  executor = new Executor(this, 4);

  // call red() method later
  executor.later("red");

  // call green() method after 4 seconds, default time unit is milliseconds
  executor.later("green", 4000);

  // call blue() method after 8 seconds
  executor.later("blue", 8, TimeUnit.SECONDS);
}

void draw()
{
  fill(c);
  rect(0, 0, width, height);
}

void red()
{
  c = r;
  println("red");
}

void green()
{
  c = g;
  println("green");
}

void blue()
{
  c = b;
  println("blue");
}
