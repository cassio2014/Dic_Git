import std.stdio;
import std.exception;
import std.process;

class RailwayVehicle
{
    void advance(in size_t kilometers)
    {
        writefln("O veiculo avanca %s kilometors",
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
        writeln("Todos os passageiros abordo");
    }

    override void unload()
    {
        writeln("Todos os passageiros deceram");
    }
}

class FreightCar : RailwayCar
{
    override void load()
    {
        writeln("As caixas estao sendo caregadas");
    }

    override void unload()
    {
        writeln("As caixas estao sendo descaregadas");
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

        writefln("Partindo de  %s ", station);
    }

    void arriveStation(string station)
    {
        writefln("Chegando a %s ", station);

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

    train.departStation("sao paulo");
    train.advance(300);
    train.arriveStation("santos");
    writeln();
    wait(spawnShell("pause"));
}
