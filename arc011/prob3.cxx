#include <iostream>
#include <set>
#include <map>
#include <utility>
#include <vector>
#include <queue>

using namespace std;

bool sibling(const string& w1, const string& w2) {
    int c = 0;
    for (int i = 0; i < w1.size(); ++i) {
        if (w1[i] != w2[i]) {
            c++;
            if (c > 1) return false;
        }
    }
    return c == 1;
}

int main()
{
    int N;
    string first, last;
    set<string> unused;

    cin >> first >> last >> N;

    for (int i = 0; i < N; ++i) {
        string w;
        cin >> w;
        unused.insert(w);
    }

    if (first == last) {
        cout << 0 << '\n';
        cout << first << '\n' << last << '\n';
        return 0;
    }

    queue<pair<string, vector<string> > > que;
    que.push(make_pair(first, vector<string>()));

    while (!que.empty()) {
        auto v = que.front();
        que.pop();

        string &word = v.first;

        if (sibling(word, last)) {
            cout << v.second.size() << "\n" << first << "\n";
            for (int i=0; i<v.second.size(); ++i) {
                cout << v.second[i] << "\n";
            }
            cout << last << "\n";
            return 0;
        }

        set<string>::iterator it = unused.begin(), ite = unused.end();
        while (it != ite) {
            if (sibling(word, *it)) {
                vector<string> route = v.second;
                route.push_back(*it);
                que.push(make_pair(*it, route));
                unused.erase(it++);
            } else {
                ++it;
            }
        }
    }

    cout << "-1\n";
}
