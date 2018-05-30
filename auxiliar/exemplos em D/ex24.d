import std.stdio;
import std.process;

dchar[] mix(immutable dchar[] first,
            immutable dchar[] second)
{
    dchar[] result;
    int i;

    for (i = 0; (i < first.length) && (i < second.length); ++i) {
        result ~= first[i];
        result ~= second[i];
    }

    result ~= first[i..$];
    result ~= second[i..$];

    return result;
}

void main()
{
    writeln("\nA palavra HELLO World misturada e = ",mix("HELLO", "world"),"\n");

}
