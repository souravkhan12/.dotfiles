#include <bits/stdc++.h>
using namespace std;

// Typedefs & Macros
#define int long long
#define endl '\n'
#define all(x) (x).begin(),(x).end()
#define rall(x) (x).rbegin(),(x).rend()
#define pb push_back
#define ff first
#define ss second
#define rep(i,a,b) for(int i=a;i<b;i++)
#define rrep(i,a,b) for(int i=a;i>=b;i--)
#define FAST ios_base::sync_with_stdio(false);cin.tie(NULL);

typedef vector<int> vi;
typedef pair<int, int> pii;

// Debugging Helper
#ifdef LOCAL
#define dbg(x) cerr << #x << " = "; _print(x); cerr << endl;
#else
#define dbg(x)
#endif

void _print(int x) { cerr << x; }
void _print(string x) { cerr << '"' << x << '"'; }
void _print(char x) { cerr << '\'' << x << '\''; }
void _print(bool x) { cerr << (x ? "true" : "false"); }
template<class T> void _print(vector<T> v) { cerr << "[ "; for (T i : v) _print(i), cerr << " "; cerr << "]"; }
template<class T> void _print(set<T> v) { cerr << "{ "; for (T i : v) _print(i), cerr << " "; cerr << "}"; }
template<class T, class U> void _print(pair<T, U> p) { cerr << "{"; _print(p.ff); cerr << ", "; _print(p.ss); cerr << "}"; }
template<class T, class U> void _print(map<T, U> m) { cerr << "{ "; for (auto i : m) _print(i), cerr << " "; cerr << "}"; }

const int mod = (int)1e9 + 7;


void solve(){
}

signed main() {
    FAST

    int t;
    cin >> t;
    while (t--)solve();

    return 0;
}
