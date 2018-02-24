import std.stdio;
import std.process;

enum totalLines = 20;
enum totalColumns = 60;

/*
 * The 'alias' in the next line makes 'Line' an alias of
 * dchar[totalColumns]. Every 'Line' that is used in the rest
 * of the program will mean dchar[totalColumns] from this
 * point on.
 *
 * Also note that 'Line' is a fixed-length array.
 */
alias Line = dchar[totalColumns];

/*
 * A dynamic array of Lines is being aliased as 'Canvas'.
 */
alias Canvas = Line[];

/*
 * Prints the canvas line by line.
 */
void print(Canvas canvas)
{
    foreach (line; canvas) {
        writeln(line);
    }
}

/*
 * Places a dot at the specified location on the canvas. In a
 * sense, "paints" the canvas.
 */
void putDot(Canvas canvas, int line, int column)
{
    canvas[line][column] = '#';
}

/*
 * Draws a vertical line of the specified length from the
 * specified position.
 */
void drawVerticalLine(Canvas canvas,
                      int line,
                      int column,
                      int length)
{
    foreach (lineToPaint; line .. line + length) {
        putDot(canvas, lineToPaint, column);
    }
}

void main()
{
    Line emptyLine = '.';

    /* An empty canvas */
    Canvas canvas;

    /* Constructing the canvas by adding empty lines */
    foreach (i; 0 .. totalLines) {
        canvas ~= emptyLine;
    }

    /* Using the canvas */
    putDot(canvas, 7, 30);
    drawVerticalLine(canvas, 5, 10, 4);
    print(canvas);
	writeln(" ");
	//system("pause");
}
