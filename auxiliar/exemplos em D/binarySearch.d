import std.array;
import std.stdio;

bool binarySearch(T)(T[] input, T value) {
    while (!input.empty) {
        auto i = input.length / 2;
        auto mid = input[i];
        if (mid > value) input = input[0 .. i];
        else if (mid < value) input = input[i + 1 .. $];
        else return true;
    }
    return false;
}

void main(){
writeln(binarySearch([ "um","dois","tres","quatro" ], "tres"));
writeln(binarySearch([ 1, 3, 6, 7, 9, 15 ], 6));
writeln(binarySearch(['a','b','c','d','e' ],'i'));
writeln(binarySearch([ "um","dois","tres","quatro" ], "tres"));
readln();

}

