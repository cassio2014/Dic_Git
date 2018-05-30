import std.stdio;
import std.process;

interface SoundEmitter
{
    string emitSound();
}

/* This class needs to implement only emitSound(). */
class Bell : SoundEmitter
{
    string emitSound()
    {
        return "ding";
    }
}

interface MusicalInstrument : SoundEmitter
{
    void adjustTuning();
}

/* This class needs to implement both emitSound() and
 * adjustTuning(). */
class Violin : MusicalInstrument
{
    string emitSound()
    {
        return "K";
    }

    void adjustTuning()
    {
        // ... tuning of the violin ...
    }
}

interface CommunicationDevice
{
    void talk(string message);
    string listen();
}

/* This class needs to implement emitSound(), talk(), and
 * listen(). */
class Phone : SoundEmitter, CommunicationDevice
{
    string emitSound()
    {
        return "rrring";
    }

    void talk(string message)
    {
        // ... put the message on the line ...
    }

    string listen()
    {
        string soundOnTheLine;
        // ... get the message from the line ...
        return soundOnTheLine;
    }
}

class Clock
{
    // ... the implementation of Clock ...
}

/* This class needs to implement only emitSound(). */
class AlarmClock : Clock, SoundEmitter
{
    string emitSound()
    {
        return "beep";
    }

    // ... the implementation of AlarmClock ...
}

void main()
{
    SoundEmitter[] devices;

    devices ~= new Bell;
    devices ~= new Violin;
    devices ~= new Phone;
    devices ~= new AlarmClock;

    foreach (device; devices) {
        writeln(device.emitSound());
    }
	writeln(" ");
	system("pause");
}