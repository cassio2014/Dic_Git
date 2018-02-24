import std.conv:to;
import std.process;

string[] cStringArrayToDStringArray(char* arr,uint len) {
   	string[] result;
	uint pos;
   	foreach (uint i;0 .. len) {
		string word = to!string(arr+pos);
		result~=word;
		pos+=word.length+1;
	}
	return result;
}
	import std.stdio;

void main()	 {
	char[] test = ['h','e','l','l','o','\0','w','o','r','l','d','\0'];
	string[] darr = cStringArrayToDStringArray(test.ptr,2);
	writeln(darr[0]," ",darr[1],"\n\n");
	wait(spawnShell("pause"));
}
