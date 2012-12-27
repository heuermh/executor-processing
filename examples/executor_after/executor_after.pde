/*

    Executor library for Processing.
    Copyright (c) 2012 held jointly by the individual authors.

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
import org.dishevelled.processing.executor.Executor;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

color c = color(20);
final color r = color(80, 0, 0);
final color g = color(0, 80, 0);
final color b = color(0, 0, 80);
final color y = color(237, 212, 0);

Executor executor;

void setup()
{
  noStroke();
  executor = new Executor(this, 4);

  // nested call, call green() method 4 seconds after red, default time unit is milliseconds
  executor.after(executor.later("red"), "green", 4000);

  // or save reference to future, call yellow() method 4 seconds after that completes
  ScheduledFuture<?> future = executor.later("blue", 8000);
  executor.after(future, "yellow", 4, TimeUnit.SECONDS);
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

void yellow()
{
  c = y;
  println("yellow");
}
