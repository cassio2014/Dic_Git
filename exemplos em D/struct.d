import std.stdio;
import std.process;

struct Point
{
    size_t id;    // Object id
    int line;
    int column;

    // The id to be used for the next object
    static size_t nextId;

    this (int line, int column)
    {
        this.line = line;
        this.column = column;
        this.id = makeNewId();
    }

    static size_t makeNewId()
    {
        immutable newId = nextId;
        ++nextId;
        return newId;
    }
}

void main()
{
    auto top = Point(7, 0);
    auto middle = Point(8, 0);
    auto bottom =  Point(9, 0);

    writeln(top.id);
    writeln(middle.id);
    writeln(bottom.id);
    wait(spawnShell("pause"));
}
