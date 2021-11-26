#include <bits/stdc++.h>
using namespace::std;

#define int long long

#define rep(i,a,n) for(int i = a ; i < n; ++i)
#define per(i,a,n) for(int i = n-1 ; i >= a; --i)
#define all(x) (x).begin(),(x).end()
#define SZ(x) ((int)(x).size())
#define trav(a,x) for (auto& a : x)
#define TC int t; cin >> t; while (t--)

const int inf = 1e9;
const char ef = '\n'; 

//storing state use map

void solve(){
}

signed main(){
	ios_base::sync_with_stdio(false),cin.tie(nullptr);

	solve();
	return 0;
}

// C[0] = 1  and c[n+1] = SUM{i = 0 to n }(C[i]*c[n-i]);
// if a and b are coprime (or gcd = 1) 
// then ax + by = 1 { x = modular multiplicative inverse of (a % b) and y = -----(b % a) }
