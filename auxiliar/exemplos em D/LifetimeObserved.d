import std.stdio;
import std.process;

class LifetimeObserved
{
    int[] array;           // ? Belongs to each object

    static size_t counter; // ? Shared by all objects

    this()
    {
        /*
         * We are using a relatively large array to make each
         * object consume a large amount of memory. Hopefully
         * this will make the garbage collector call object
         * destructors more frequently to open up space for
         * more objects.
         */
        array.length = 30_000;

        /*
         * Increment the counter for this object that is being
         * constructed.
         */
        ++counter;
    }

    ~this()
    {
        /*
         * Decrement the counter for this object that is being
         * destroyed.
         */
        --counter;
    }
}
void main()
{
    foreach (i; 0 .. 20) 
	{
        auto variable = new LifetimeObserved;  // ? start
		write(LifetimeObserved.counter, ' ');
    } // ? end

    writeln();
	system("pause");
}