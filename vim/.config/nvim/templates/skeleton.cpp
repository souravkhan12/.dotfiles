#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using ld = long double; 
#define tcU template<class T
#define tcUU template<typename T1, typename T2>
tcU> using V = vector<T>; 
#define FOR(i,a,b) for(int i=a;i<b;++i)
#define ROF(i,a,b) for(int i=b;i>=a;i--)
#define sz(a) (int)(a.size())
#define all(a) a.begin(),a.end()
#define GC(i) cout << "Case #" << i << ": ";
#define precision(n) cout << fixed << setprecision(n)
void setIO(string s) { freopen((s + ".in").c_str(), "r", stdin); freopen((s + ".out").c_str(), "w", stdout); }
const int mod = (int)1e9 + 7;

tcU> T max(T &a,T b) {
    return a > b ? a : b;
}
tcU> T min(T &a, T b) {
    return a > b ? b : a;
}
tcU>istream &operator>>(istream &istream, vector<T> &v) { 
    for (auto &it : v) { 
        cin >> it; 
    } 
    return istream; 
}
tcU>ostream &operator<<(ostream &ostream, const vector<T> &c) { 
    for (auto &it : c) { 
        cout << it << " "; 
    } 
    return ostream; 
}
tcUU istream &operator>>(istream &istream, pair<T1, T2> &p) { 
    return (istream >> p.first >> p.second); 
}
tcUU ostream &operator<<(ostream &ostream, const pair<T1, T2> &p) { 
    return (ostream << p.first << " " << p.second); 
}

void solve();

signed main() {
	ios_base::sync_with_stdio(false),cin.tie(nullptr);

	int T = 1;
	cin >> T;
	FOR(i,1,T+1){
        /* GC(i); */
        solve();
    }
	return 0;
}


void solve() {
}
