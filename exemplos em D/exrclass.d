import std.stdio;
import std.exception;
import std.process;

class RailwayVehicle
{
    void advance(in size_t kilometers)
    {
        writefln("The vehicle is advancing %s kilometers",
                 kilometers);

        foreach (i; 0 .. kilometers / 100) {
            writefln("  %s", makeSound());
        }
    }

    abstract string makeSound();
}

class Locomotive : RailwayVehicle
{
    override string makeSound()
    {
        return "choo choo";
    }
}

class RailwayCar : RailwayVehicle
{
    abstract void load();
    abstract void unload();

    override string makeSound()
    {
        return "clack clack";
    }
}

class PassengerCar : RailwayCar
{
    override void load()
    {
        writeln("The passengers are getting on");
    }

    override void unload()
    {
        writeln("The passengers are getting off");
    }
}

class FreightCar : RailwayCar
{
    override void load()
    {
        writeln("The crates are being loaded");
    }

    override void unload()
    {
        writeln("The crates are being unloaded");
    }
}

class Train : RailwayVehicle
{
    Locomotive locomotive;
    RailwayCar[] cars;

    this(Locomotive locomotive)
    {
        enforce(locomotive !is null,
                "Locomotive cannot be null");
        this.locomotive = locomotive;
    }

    void addCar(RailwayCar[] cars...)
    {
        this.cars ~= cars;
    }

    override string makeSound()
    {
        string result = locomotive.makeSound();

        foreach (car; cars) {
            result ~= ", " ~ car.makeSound();
        }

        return result;
    }

    void departStation(string station)
    {
        foreach (car; cars) {
            car.load();
        }

        writefln("Departing from the %s station", station);
    }

    void arriveStation(string station)
    {
        writefln("Arriving at the %s station", station);

        foreach (car; cars) {
            car.unload();
        }
    }
}

void main()
{
    auto locomotive = new Locomotive;
    auto train = new Train(locomotive);

    train.addCar(new PassengerCar, new FreightCar);

    train.departStation("Ankara");
    train.advance(500);
    train.arriveStation("Haydarpasa");
	writefln(" ");
	system("pause");





}