#import "../lib.typ": *

= Review of Thermodynamics

== Thermodynamic Systems and laws
我们假设一个_热力学系统_由 $N$ 个粒子构成，且其不与外部相互作用. 我们称该系统处于_平衡态_，若其宏观性质(诸如系统的内能 $E$, 压强 $P$,体积为 $V$ 之类的物理量)不随时间变化. 

我们称两个子系统 $A, B$ 达到平衡态，即存在约束  $ 
    f_(A B) (A_1, dots.c, B_1, dots.c) = 0
  $ 
其中 $A_i, B_i$ 是描述系统状态的物理量. 很容易发现子系统之间的平衡关系是自反的，且对称的.而热力学第零定律将给出平衡关系的传递性：
#prop()[
 若系统 $A$ 与系统 $C$ 达到平衡态，系统 $B$ 与系统 $C$ 达到平衡态，则系统 $A$ 与系统 $B$ 也达到平衡态.
] 

为了看出热力学第零定律的结果，我们用 $vb(x)_A,vb(x)_B,vb(x)_C$ 分别表示系统 $A, B, C$ 的状态. 于是 $A C,B C$ 处于热平衡将给出约束  $ 
    f_(A C) (vb(x)_A, vb(x)_C) = 0\
     f_(B C) (vb(x)_B, vb(x)_C) = 0
   $<eq:f_help1>
另一方面，热力学第零定律将给出约束  $ 
    f_(A B) (vb(x)_A, vb(x)_B) = 0
   $<eq:f_help2>
注意到@eq:f_help1 可以写作  $ 
    x_(C_i) = 
    g_(A C)(vb(x)_A, tilde(vb(x))_(C_i)) =
    g_(B C)(vb(x)_B, tilde(vb(x))_(C_i))
  $ 
其中 $tilde(vb(x))_(C_i)$ 表示 $x_(C_i)$ 不出现.而@eq:f_help2 给出的约束不依赖 $vb(x)_C$ 这要求 $g_(A C), g_(B C)$ 给出的约束实际也不依赖 $vb(x)_C $,即其等价于  $ 
  theta_A (vb(x)_A) = theta_B (vb(x)_B)
  $ 
即存在一个描述系统热力学量 $theta$, 当系统 $A, B$ 处于热平衡时，$theta$ 的值相等. 这就是热力学第零定律的结果. 我们将热力学量 $theta$ 称为系统的_温度_.

以上定义的温度一般称作_经验温度_,其定义依赖于具体的热力学系统.热力学第一定律将引入绝对温度 $T$:
#prop()[
 对于给定热力学系统，其内能 $E$, 温度 $T$,广义位移 $q_i$ 和粒子数 $N$,其满足微分关系：
   $ 
     dd(E) = T dd(S) + sum_i F_i dd(q_i) + mu dd(N)   
   $ 
       
 ]
热力学第一定律将系统内能的改变分别以传热和广义功的形式给出.特别地，系统传热定义为  $ 
    delta Q = T dd(S)  
  $<eq:heat_def>
其中 $S$ 被称为系统的_熵_.热力学第二定律将给出熵的实际内涵： 

热力学第二定律给出：
#prop()[
 对于任意热力学循环过程，总有  $ 
    integral.cont (delta Q)/T <=0
   $ 
  当且仅当过程为可逆过程时，等号成立.
] 

下面我们考虑系统从可逆路径 $gamma_1$ 由 $a$ 演化到 $b$, 和另一个可逆路径 $gamma_2$ 由 $a$ 演化到 $b$.则利用热力学第二定律，我们有  $ 
    integral_(gamma_1) (delta Q)/T - integral_(gamma_2) (delta Q)/T = 0
   $   
即  $ 
     integral_(gamma_1) (delta Q)/T= integral_(gamma_2) (delta Q)/T
  $ 
代入@eq:heat_def,这将给出  $ 
    S= integral_(gamma) dd(S) + S_0  
  $ 
是系统的状态函数，不依赖可逆路径 $gamma$. 

进一步我们考虑系统从不可逆路径 $gamma'$ 从 $a$ 演化到 $b$,再沿可逆路径 $-gamma$ 从 $b$ 演化到 $a$.则热力学第二定律给出  $ 
    integral_(gamma') (delta Q)/T + integral_(-gamma) (delta Q)/T <0
   $    
我们取  $ 
    integral_gamma (delta Q)/T = S(b) - S(a) 
  $ 
则有  $ 
     Delta S >= integral_(gamma') (delta Q)/T
  $ 
当且仅当过程为可逆过程时，等号成立.进一步，对于微分过程，我们有
$ 
    dd(S) >= (delta Q)/T  
  $ 
对于孤立系统，$delta Q=0$,因此 $dd(S) >= 0$, 即孤立系统的熵总是朝极大值演化.

下面我们讨论绝对温度和经验温度的关系.我们考虑孤立系统由子系统 $A,B$ 构成，两子系统之间只能发生传热.因此我们有  $ 
    dd(E)_A + dd(E)_B = 0\ 
    dd(S)_A = T_A dd(E)_A\
    dd(S)_B = T_B dd(E)_B   
  $ 
当系统达到平衡态时  $ 
    delta S &= 
    delta S_A + delta S_B 
    = pdv(S_A, E_A) delta E_A + pdv(S_B, E_B) delta E_B\ 
    &= (T_A - T_B) delta E_A = 0
  $ 
因此子系统处于热平衡要求 $T_A = T_B$.而热力学第零定律要求 $theta_A = theta_B$.因此我们有  $ 
    T = T(theta) 
  $ 
即绝对温度仅依赖 $theta$ 的取值，不再依赖具体系统. 

最后我们给出热力学第三定律：
#prop()[
  当热力学系统温度趋近于绝对零度时，系统的熵趋近于一个常数 $0$,即  $ 
     lim_(T -> 0) S(T,vb(x)) = 0
    $ 
  ]
该结果也称为_Nernst定理_.

下面我们假设我们将系统不断通过等温过程和绝热过程来降低系统的温度.我们考虑某个状态 $S(T_1,vb(x_1)) !=0$,再经历一次绝热过程使得  $ 
     S(T_1,vb(x_1)) = S(0,vb(x_2))
  $ 
然而热力学第三定律要求等式右边为 $0$,显然违背我们的假设.因此，我们说不能通过有限(可数)步骤达到绝对零度. 

== Ideal Gas and Carnot Engine
本节我们讨论一个理想热力学系统，其由 $N$ 个无相互作用粒子构成，于是_状态方程_为  $ 
    P V = N k_B T
  $ 
下面我们考虑导出理想气体的能量.假设每个粒子的能量为  $ 
    E_i = 1/2 m v_i^2 
  $ 
不妨假设其只在  $x$ 方向运动，于是其平均作用在 $x$ 方向某一侧的作用力  $ 
    F_x = (Delta p)/(Delta t) 
    = (2 m v)/((2L \/ v)) = (m v^2)/L 
  $ 
因此系统的压强  $ 
    P = sum_i F_i/L^2 = 1/3 (m v^2)/L^3 
  $ 
即有  $ 
    P V = 2/3 E 
  $ 
或者  $ 
    E = 3/2 N k T 
  $ 
下面我们考虑系统的热容  $ 
    C_x = evaluated(pdv(Q, T,d:delta))_(x)
  $ 
我们注意到热力学微分关系为  $ 
    dd(E) = T dd(S) - P dd(V)  
  $ 
因此等体热容为  $ 
    C_V = evaluated(pdv(Q, T,d:delta))_(V) 
    = evaluated(pdv(E, T))_(V) = 3/2 N k_B
  $ 
由此，我们可以将热力学关系写作  $ 
    delta Q = C_V dd(T) + P dd(V)   
  $ 
我们将热力学变量从 $T,V$ 换做 $T,P$ 则要求  $ 
    dd(V) = pdv(V, T) dd(T) + pdv(V, P) dd(P)   
  $
于是  $ 
    delta Q = 
     C_V dd(T) + P [ pdv(V, T) dd(T) + pdv(V, P) dd(P)   ]
  $ 
下面考虑等压热容是方便的：
  $ 
    C_P =  evaluated(pdv(Q, T,d:delta))_(P) 
    = C_V + P pdv(V, T)_(P)= C_V + N k_B = 5/2 N k_B 
  $ 
由此，体系的热容比为  $ 
    gamma = C_P/C_V = 5/3
  $
下面我们考虑绝热过程：
  $ 
    dd(E) + P dd(V) = C_V dd(T) + P dd(V) = 0  
  $ 
而理想气体状态方程给出  $ 
    P dd(V)+ V dd(P) = N k_B dd(T)   
  $ 
两式联立给出  $ 
    P V^gamma = C  
  $ 
其正是理想气体的绝热曲线.再利用理想气体状态方程，我们可以将绝热曲线写作  $ 
    T V^(gamma-1) = C' 
  $

下面我们考虑理想气体的卡诺循环：
1. 等温膨胀：系统与热库 $T_H$ 接触，系统由状态 $a$ 演化到状态 $b$.
2. 绝热膨胀：系统与热库断开，系统由状态 $b$ 演化到状态 $c$.
3. 等温压缩：系统与热库 $T_L$ 接触，系统由状态 $c$ 演化到状态 $d$.
4. 绝热压缩：系统与热库断开，系统由状态 $d$ 演化到状态 $a$.

首先对于 $1$ 过程，系统内能变化为 $0$.因此吸热  $ 
    Q_H =integral_a^b P dd(V) = 
    N k T_H integral_a^b dd(V)/V = N k T_H ln(V_b/V_a)  
  $ 
对于 $2$ 过程，系统与热库断开，因此吸热为 $0$.体积关系满足  $ 
    T_b V_b^(gamma-1) = T_c  V_c^(gamma-1)
  $ 
类似的，对于 $3$ 过程，系统放热  $ 
    Q_L = N k T_L ln(V_c/V_d)  
  $ 
最后对于 $4-$ 过程，系统与热库断开，因此吸热为 $0$.体积关系满足  $ 
    T_d V_d^(gamma-1) = T_a  V_a^(gamma-1)
  $
该循环内能 $Delta E=0$,因此净对外做功  $ 
    W = Q_H - Q_L =  N k T_H ln(V_b/V_a) 
     - N k T_L ln(V_c/V_d)
  $ 
而循环效率为  $ 
    eta:= (W)/Q_H = 
    1-Q_L/Q_H = 
    1- T_L/T_H ln(V_b\/V_a)/ln(V_c\/V_d)
  $ 
注意到  $ 
    (T_b V_b^(gamma-1))/(T_a  V_a^(gamma-1))
    = (T_c  V_c^(gamma-1))/(T_d  V_d^(gamma-1))
  $ 
因此我们有  $ 
    V_b/V_a equiv V_c/V_d 
  $ 
则  $ 
    eta=1-(T_L)/T_H 
  $ 
该结果也给出我们不可能制造一个效率为 $100 %$ 的热机.



== Thermodynamic Relationships
   




   
== Legendre Transform 


  
== Thermodynamic Stability

  