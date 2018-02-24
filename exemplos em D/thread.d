import std.stdio;
import std.concurrency;
import std.string;

void spawnedFunc(Tid tid)
{
  // Receive a message from the owner thread.
  receive(
    (string i) { writeln("Received the string ", i);}
  );

  // Send a message back to the owner thread
  // indicating success.
 // send(tid, true);
  send(tid, "passou" );
}

void main()
{
  // Start spawnedFunc in a new thread.
  auto tid = spawn(&spawnedFunc, thisTid);
  // Send the String cassio to this new thread.
  send(tid, "Cassio");

  // Receive the result code.
  auto wasSuccessful = receiveOnly!(string);

  writeln(wasSuccessful);
  writeln("Successfully printed string.");
  getchar();
}
