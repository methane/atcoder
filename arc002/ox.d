#!/usr/bin/rdmd
import std.stdio;
import std.string;
import std.conv;

void main()
{
    int L = to!int(split(readln())[0]);
    char[][] ban;
    for (int i=0; i<L; ++i) {
        ban ~= chomp(readln()).dup;
    }
    int W = cast(int)ban[0].length;
    for (int i=0; i<L; ++i) {
        //writeln(ban[i]);
    }

    int min_o_goal = 9999;
    int min_x_goal = 9999;
    for (int y = 0; y<L; ++y) {
        for (int x = 0; x<W; ++x) {
            if (ban[y][x] == 'x') {
                if (min_x_goal > x) min_x_goal = x;
                x = W; break;
            }
            if (ban[y][x] == 'o') {
                x = W; break;
            }
        }

        for (int x=W-1; x>=0; --x) {
            if (ban[y][x] == 'o') {
                int d = W-1-x;
                if (d < min_o_goal) min_o_goal = d;
                x = -1; break;
            }
            if (ban[y][x] == 'x') {
                x = -1; break;
            }
        }
    }

    if (min_o_goal < 9999 || min_x_goal < 9999) {
        if (min_o_goal <= min_x_goal) {
            //writeln(__LINE__);
            writeln('o');
        } else {
            //writeln(__LINE__);
            writeln('x');
        }
        return;
    }

    int miai = 0;
    for (int y=0; y<L; ++y) {
        int last_o = -1;
        for (int x=0; x<W; ++x) {
            if (ban[y][x] == 'o') last_o = x;
            if (ban[y][x] == 'x' && last_o >= 0) miai += (x - last_o -2);
        }
    }

    while (true) {
        bool ok = false;
        for (int y=0; y<L; ++y) {
            for (int x=W-2; x>=0; --x) {
                if (ban[y][x] == 'o' && ban[y][x+1] == '.' && ban[y][x+2] != 'x') {
                    for (int xx=x+2; xx<W; ++xx) {
                        if (ban[y][xx] == 'x') {
                            ban[y][x] = '.';
                            ban[y][x+1] = 'o';
                            y=L; x=-1;
                            ok = true;
                            break;
                        }
                        if (ban[y][xx] == 'o') break;
                    }
                }
            }
        }
        if (!ok) {
            for (int y=0; y<L; ++y) {
                for (int x=W-2; x>=0; --x) {
                    if (ban[y][x] == 'o' && ban[y][x+1] == '.' && ban[y][x+2] != 'x') {
                        ban[y][x] = '.';
                        ban[y][x+1] = 'o';
                        y=L; x=-1;
                        ok = true;
                        break;
                    }
                }
            }
        }
        if (!ok) {
            //writeln(__LINE__);
            writeln('x');
            return;
        }
        //writeln("-o-");
        //for (int y=0; y<L; ++y) writeln(ban[y]);
        ok = false;
        for (int y=0; y<L; ++y) {
            for (int x=W-1; x>=0; --x) {
                if (ban[y][x] == 'x' && ban[y][x-1] == '.' && ban[y][x-2] == '.') {
                    for (int xx=x-2; xx>=0; --xx) {
                        if (ban[y][xx] == 'o') {
                            ban[y][x] = '.';
                            ban[y][x-1] = 'x';
                            y=L; x=-1;
                            ok = true;
                            break;
                        }
                        if (ban[y][xx] == 'x') {
                            break;
                        }
                    }
                }
            }
        }
        if (!ok) {
            for (int y=0; y<L; ++y) {
                for (int x=W-1; x>=0; --x) {
                    if (ban[y][x] == 'x' && ban[y][x-1] == '.' && ban[y][x-2] == '.') {
                        ban[y][x] = '.';
                        ban[y][x-1] = 'x';
                        y=L;
                        ok = true;
                        break;
                    }
                }
            }
        }
        if (!ok) {
            //writeln(__LINE__);
            //for (int y=0; y<L; ++y) writeln(ban[y]);
            writeln('o');
            return;
        }
        //writeln("-x-");
        //for (int y=0; y<L; ++y) writeln(ban[y]);
    }
}
