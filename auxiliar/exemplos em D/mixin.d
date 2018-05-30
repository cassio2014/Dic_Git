import std.stdio;

void main() {
  int j;
  mixin("
    int x = 3;
    for (int i = 0; i < 3; i++)
      writeln(x + i, ++j);
    ");    // ok

  const char[] s = "int y=5;writeln(\"\nY = \",y);";
  mixin(s);  // ok
  y = 4;     // ok, mixin declared y
  const char[] t = "y += 3;writeln(y);";
  mixin(t);
  mixin("y -=" ~ "4;writeln(y);");  // ok
  getchar();
}
