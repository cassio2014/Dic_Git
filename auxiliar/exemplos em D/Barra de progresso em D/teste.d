module teste;

import std.stdio;
import std.datetime;
import core.thread;
import std.process;

import progress;

void main(string[] args) {
  size_t iteration = 200;
  Progress p = new Progress(iteration);
  p.title = "Lendo";
  p.maxWidth = 20;
   writeln;
	writeln;
	writeln;
	int i;
  for(i = 0; i < iteration; i++) {
    p.next;
    Thread.sleep(5.msecs);
  }

	p.reset;
	p.maxWidth = 30;
	writeln;writeln;	
  for(i = 0; i < iteration; i++) {
    p.next;
    Thread.sleep(200.msecs);
  }
  	writeln;
  	writeln;
	wait(spawnShell("pause"));
  }
