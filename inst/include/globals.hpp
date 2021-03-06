#ifndef _globals_
#define _globals_

namespace hivModelling {

constexpr double BIT_SML = 1e-6;
constexpr double EPS = 1e-4;
constexpr double H1 = 0.02;

constexpr int    MAX_STP = 1e+4;
constexpr double TINY = 1e-30;
constexpr double VERY_LRG = 1e+10;

constexpr double SAFETY = 0.9;
constexpr double PSHRNK = -0.25;
constexpr double ERRCON = 1.89e-4;
constexpr double PGROW = -0.2;

// Cash-Karp constants
constexpr double a2 = 0.2;
constexpr double a3 = 0.3;
constexpr double a4 = 0.6;
constexpr double a5 = 1.0;
constexpr double a6 = 0.875;
constexpr double b21 = 0.2;
constexpr double b31 = 0.07499999999999999722444;
constexpr double b32 = 0.2250000000000000055511;
constexpr double b41 = 0.3;
constexpr double b42 = -0.9;
constexpr double b43 = 1.2;
constexpr double b51 = -0.2037037037037036923959;
constexpr double b52 = 2.5;
constexpr double b53 = -2.592592592592592559697;
constexpr double b54 = 1.296296296296296279849;
constexpr double b61 = 0.02949580439814814686317;
constexpr double b62 = 0.341796875;
constexpr double b63 = 0.04159432870370370627366;
constexpr double b64 = 0.4003454137731481399243;
constexpr double b65 = 0.061767578125;
constexpr double c1 = 0.09788359788359787816425;
constexpr double c3 = 0.4025764895330112835836;
constexpr double c4 = 0.2104377104377104512611;
constexpr double c6 = 0.289102202145680386991;
constexpr double dc5 = -0.01932198660714285615159;
constexpr double dc1 = -0.004293774801587310618878;
constexpr double dc3 = 0.01866858609385785294776;
constexpr double dc4 = -0.03415502683080806622939;
constexpr double dc6 = 0.03910220214568038699099;

} // hivModelling

#endif // _globals_
