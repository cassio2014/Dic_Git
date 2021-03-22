module progress;

import std.stdio;
import std.range;
import std.format;
import std.datetime;

import dic.dic;

pragma(lib, "dic");

class Progress
{
  private:

    immutable static uint default_width = 80;
    uint max_width = 40;
    uint width = default_width;

    ulong start_time;
    string caption = "Progress";
    uint iterations;
    uint counter;


    uint getTerminalWidth() {
      uint column;
      if(column == 0) column = default_width;

      return column;
    }


    void clear() {

      write("\r");
      for(auto i = 0; i < width; i++) write("");
      write("\r");
    }


    int calc_eta() {
      immutable auto ratio = cast(double)counter / iterations;

      auto current_time = Clock.currTime.toUnixTime();

      auto  duration = (current_time - start_time);
      double elapsed = (current_time - start_time);
      int eta_sec = cast(int)((elapsed / ratio) - elapsed);
      return eta_sec;
    }


    string progressbarText(string header_text, string footer_text) {
      immutable auto ratio = cast(double)counter / iterations;
      string result = "";

      double bar_length = width - header_text.length - footer_text.length;
      if(bar_length > max_width && max_width > 0) {
        bar_length = max_width;
      }
      uint i = 0;
      for(; i < ratio * bar_length; i++) result ~= "▒";
      for(; i < bar_length; i++) result ~= " ";

      return header_text ~ result ~ footer_text;
    }


    void print() {
      immutable auto ratio = cast(double)counter / iterations;
      auto header = appender!string();
      auto footer = appender!string();

      header.formattedWrite("%s %3d%% |", caption, cast(int)(ratio * 100));

      if(counter <= 1 || ratio == 0.0) {
        footer.formattedWrite("| ETA --:--:--:");
      } else {
        int h, m, s;
        dur!"seconds"(calc_eta())
          .split!("hours", "minutes", "seconds")(h, m, s);
        footer.formattedWrite("| ETA %02d:%02d:%02d ", h, m, s);
      }

      dwrite(progressbarText(header.data, footer.data));
    }


    void update() {
      width = getTerminalWidth();
 
      clear();

      print();
      stdout.flush();
    }


  public:

    this(size_t iterations) {
      if(iterations <= 0) iterations = 1;

      counter = 0;
      this.iterations = iterations;
      start_time = Clock.currTime.toUnixTime;
    }

    @property {
      string title() { return caption; }
      string title(string text) { return caption = text; }
    }

    @property {
      size_t count() { return counter; }
      size_t count(size_t val) {
        if(val > iterations) val = iterations;
        return counter = val;
      }
    }

    @property {
      size_t maxWidth() { return max_width; }
      size_t maxWidth(size_t w) {
        return max_width = w;
      }
    }

    void reset() {
      counter = 0;
      start_time = Clock.currTime.toUnixTime;
    }

    void next() {
      counter++;
      if(counter > iterations) counter = iterations;

      update();
    }


}

