import std.stdio;
import std.array;
import std.conv;
import std.math;

int[] read_split()
{
    string[] ss = split(readln());
    int[] ints;
    foreach (s; ss) {
        ints ~= to!int(s);
    }
    return ints;
}

double shortest(int start, int goal, int[][] cource)
{
    immutable int L = cast(int)cource.length;
    double max_left_tilt, min_right_tilt;
    int max_left=L, min_right=L;
    max_left_tilt = min_right_tilt = (goal-start)/cast(double)L;

    for (int y=0; y<L; ++y) {
        int yy=y+1;
        int left = cource[y][0];
        int right = cource[y][1];

        double tilt = (left-start) / cast(double)yy;
        if (tilt > max_left_tilt) {
            max_left_tilt = tilt;
            max_left = yy;
        }

        tilt = (right-start) / cast(double)yy;
        if (tilt < min_right_tilt) {
            min_right_tilt = tilt;
            min_right = yy;
        }
        //if ((yy+1)*min_right_tilt+start < 0) break;
        //if ((yy+1)*max_left_tilt +start > R) break;
    }

    if (max_left < L) {
        int middle = cource[max_left-1][0];
        return (shortest(start, middle, cource[0..max_left]) +
                shortest(middle, goal, cource[max_left..$]));
    }
    else if (min_right < L) {
        int middle = cource[min_right-1][1];
        return (shortest(start, middle, cource[0..min_right]) +
                shortest(middle, goal, cource[min_right..$]));
    }
    else {
        return hypot(goal-start, L);
    }
}

double zigzag_shortest(int start, int goal, int[][] cource)
{
    double way=0;
    int max_left, min_right;
    int prev, pos, leftpos, rightpos;
    int turn;

    max_left = min_right = -1;

    for (pos=0; pos<cource.length; ++pos) {
        int l = cource[pos][0];
        int r = cource[pos][1];
        if (l > start) {
            max_left = start;
            leftpos = pos;
            turn = 0;
            break;
        }
        if (r < start) {
            min_right = r;
            rightpos = pos;
            turn = 1;
            break;
        }
    }

    for (++pos; pos<cource.length; ++pos) {
        int l = cource[pos][0];
        int r = cource[pos][1];

        if (turn==0) { //left
            if (r < max_left) {
                //writeln("turn left: ", prev, ' ', leftpos);
                way += shortest(start, cource[leftpos][0], cource[prev..leftpos+1]);
                start = max_left;
                prev = leftpos+1;
                turn = 1;
                min_right = r;
                rightpos = pos;
            }
            else if (l > max_left) {
                max_left = l;
                leftpos = pos;
            }
        }
        else { //right
            if (l > min_right) {
                //writeln("turn right: ", prev, ' ', rightpos);
                way += shortest(start, cource[rightpos][1], cource[prev..rightpos+1]);
                start = min_right;
                prev = rightpos+1;
                turn = 0;
                max_left = l;
                leftpos = pos;
            }
            else if (min_right < r) {
                min_right = r;
                rightpos = pos;
            }
        }
    }

    return way + shortest(start, goal, cource[prev..$]);
}

void main()
{
    int[] a;
    a = read_split();
    int length = a[0];

    a = read_split();
    auto start = a[0];
    auto goal = a[1];

    read_split();

    int[][] cource;
    for (int i=0; i<length; ++i) {
        cource ~= read_split();
    }

    //double dist = shortest(start, goal, cource);
    double dist = zigzag_shortest(start, goal, cource);
    writefln("%.10f", dist);
}
