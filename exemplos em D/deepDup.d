import std.stdio, std.traits, std.range, std.algorithm;

auto deepDup(A)(A arr) if (isArray!A)
{
	static if (isArray!(ElementType!A)) {
		return arr.map!(a => a.deepDup).array;
		
	} else {
		return arr.dup;
	}
}

void main() {

	auto s = "Bar".deepDup;
	s[0] = 'T';


	writeln(s);
}
