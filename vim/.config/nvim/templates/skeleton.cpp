#include <bits/stdc++.h>
using namespace std;

#define int int64_t

#define ISO()	ios_base::sync_with_stdio(false),cin.tie(nullptr);
#define all(x) (x).begin(),(x).end()
#define uniq(v) (v).erase(unique(all(v)),(v).end())
#define SZ(x) (int)(x.size())
#define FOR(i,a,b) for(int i = a; i < b; ++i)
#define F0R(i,a) for(int i = 0 ; i < a ; ++i)
#define yes cout << "YES" << '\n'
#define no  cout << "NO" << '\n'
#define tcT template<typename T
void usaco(string s) { freopen((s + ".in").c_str(), "r", stdin); freopen((s + ".out").c_str(), "w", stdout); }

tcT> istream& operator>>(istream& in,vector<T> &v){FOR(i,0,SZ(v)){ in >> v[i];} return in;}
tcT> ostream& operator<<(ostream& out,vector<T> v){FOR(i,0,SZ(v)){ out << v[i] << " ";} return out;}
tcT,typename T2> istream& operator>>(istream& in, pair<T,T2> &a){in >>a.first >> a.second; return in;}
tcT,typename T2> ostream& operator<<(ostream& out, pair<T,T2> a){out<<a.first << " "<< a.second; return out;}
tcT,typename T2> istream& operator>>(istream& in, vector<pair<T,T2>> &v){FOR(i,0,SZ(v)){in>>v[i].first >> v[i].second;} return in;}
tcT,typename T2> ostream& operator<<(ostream& out, vector<pair<T,T2>> v){FOR(i,0,SZ(v)){out << v[i].first << " " << v[i].second << endl;} return out;}

int gcd(int a, int b) { if (b == 0) { return a; } return gcd(b, a % b); }
int lcm(int a, int b) { return (a / gcd(a, b)) * b; }

const int INF = 1e18; 
const int  mod = 1000000007;

void solve() {

}

signed main() {
	ISO(); 
	int t = 1;
	//cin >> t;
	while (t--) { solve(); }
	return 0;
}
