#import "../../lib.typ":*

= 相互作用场论


== 散射矩阵与S-算符
我们曾经给出散射矩阵 @eq:def_S_mat 的定义，为了进一步讨论散射矩阵的性质.我们首先给出散射态的一些基本性质，首先引入Moller算符：
  $ 
    Omega(t) = e^(i H t) e^(-i H_0 t) 
  $
由于散射态满足@eq:rel_sac_free,则有  $ 
    ket(psi_alpha (t))^plus.minus = Omega(minus.plus ) ket(Phi_alpha)
  $<eq:psi_Moller>
注意到Moller算符的幺正性  $ 
    Omega^dagger (t) Omega(t) equiv 1 
  $
于是散射态是正交的：
  $ 
     braket(psi_beta^(plus.minus ), psi_alpha^(plus.minus)) = braket(Phi_beta, Phi_alpha) = 
     delta_(beta alpha)
  $
进一步，我们可以给出散射矩阵的幺正性,首先注意到  $ 
    integral dd(beta) S_(beta gamma)^* S_(beta alpha) 
    = integral dd(beta ) braket(psi_gamma^+,psi_beta^-) braket(psi_beta^-,psi_alpha^+)  
    =braket(psi_gamma^+,psi_alpha^+) = delta_(gamma alpha)
  $
类似的  $ 
    integral dd(beta) S_(gamma beta) S_(alpha beta)^* = integral dd(beta) 
    braket(psi_gamma^-,psi_beta^+) braket(psi_beta^+,psi_alpha^-) 
    = braket(psi_gamma^-,psi_alpha^-) = delta_(gamma alpha)
  $
由此我们得到 $S S^dagger = S^dagger S=1$.

下面我们考虑 $S-$ 算符：
  $ 
    braket(Phi_beta,S,Phi_alpha) := S_(beta alpha) 
  $
我们引入时间演化算符：
  $ 
    U(t,t_0) = Omega^dagger (t) Omega(t_0) = 
    e^(i H_0 t) e^(-i H (t-t_0)) e^(-i H_0 t_0)
  $<eq:time_evolution_op>
由此利用@eq:psi_Moller, 我们得到  $ 
    S = Omega^dagger (+infinity) Omega(-infinity) = U(+infinity, -infinity) 
  $
为了看到时间演化算符@eq:time_evolution_op 的一些性质，我们假设哈密顿量可以分解为  $ 
    H = H_0 + V 
  $
其中 $H_0$ 是自由哈密顿量，$V$ 是相互作用项.由此对@eq:time_evolution_op 关于 $t$ 微分得到：
  $ 
    i dv(U, t) = V_I (t) U(t,t_0)  
  $
其中  $ 
    V_I (t) = e^(i H_0 t) V e^(-i H_0 t)
  $
考虑到初始条件 $U(t_0,t_0)=1$, 我们给出 $U(t,t_0)$ 的积分解为  $ 
    U(t,t_0) = 1 - i integral_(t_0)^t dd(t') V_I (t') U(t',t_0)     
  $
我们可以不断迭代这个结果，得到  $ 
    U(t,t_0) &= 1 - i integral_(t_0)^t dd(t') V_I (t')  \ 
    &+(-i)^2 integral_(t_0)^t dd(t') integral_(t_0)^(t') dd(t'') V_I (t') V_I (t'') \ 
    &+ dots.c
  $
引入时序算符，我们可以将上式写作  $ 
    U(t,t_0) &= 
      1 - i integral_(t_0)^t dd(t') V_I (t') +(-i)^2/2! integral_(t_0)^t dd(t') integral_(t_0)^t dd(t'') T{V_I (t') V_I (t'')} + dots.c \
      &=bf(T) exp[-i integral_(t_0)^t dd(t') V_I (t')]
  $
于此，我们得到散射算符的积分表示  $ 
    S = U(+infinity,-infinity) = bf(T) exp[-i integral_(-infinity)^(+infinity) dd(t') V_I (t')] 
  $
下面我们假设相互作用 $V_I (t)$ 可以写作  $ 
    V_I (t) = integral dd(x,3) cal(H)_I (vb(x),t)  
  $
由此，上式进一步可以写作  $ 
     S =bf(T) exp[-i integral dd(x,4) cal(H)_I (vb(x),t)  ] &= 
     sum_(n=0)^(+infinity) (-i)^n/n! integral dd(x_1,4) ... integral dd(x_n,4)\ 
     & times  T{cal(H)_I (vb(x_1),t_1) ... cal(H)_I (vb(x_n),t_n)}
  $<eq:S_op_int>
我们曾经要求相互作用满足Lorentz协变性  $ 
    U(Lambda,a)  cal(H)_I (x) U^(-1) (Lambda,a) = cal(H)_I (Lambda x+a)
  $
另一方面，当 $x_1,x_2$ 类空时，为了保证Lorentz不变性，我们要求 $cal(H)_I (t_1),cal(H)_I (t_2)$是对易的，这也正是我们上一章给出的_微观因果性_：
  $ 
    [cal(H) (x), cal(H) (y)] = 0, (x-y)^2 >=0 
  $
至此，我们给出@eq:S_op_int 在微扰意义下是幺正的.
    
值得注意，我们如此构造的散射振幅由相互作用表象算符 $cal(H)_I$ 构成，下面我们给出其与Heisenberg表象的_关联函数_的联系. 为此，我们假设相互作用 $V$ 除了依赖粒子之间相互作用，还依赖外场 $j_a (x)$,于是在相互作用表象，我们有  $ 
    V_J (t) =  V_I (t) + sum_a integral dd(x,3) j_a (x) psi_a (x) 
  $
其中我们用 $psi_a (x)$ 表示相互作用表象算符，而 $Psi_a (x) $ 表示Heisenberg表象算符.

由此构造的散射矩阵 $S[J]$ 满足  $ 
    [pdv(S_(beta alpha)[J], j_a (x),j_b (x),dots.c,d:delta,total:r)  ]_(J=0) 
    = braket(Psi_beta^-,bf(T)[-i Psi_a (x), -i Psi_b (y),dots.c],Psi_alpha^+) 
  $<eq:def_S_J>
我们将在下一节利用路径积分证明该结果.
   
    
== 散射矩阵的路径积分
为了将单粒子路径积分@eq:single_time_ordered_path_integral 推广到一般的散射矩阵，我们注意到此时本征态 $ket(q\,t)$ 现在属于场算符 $phi$#footnote()[本节我们暂时以标量场为例讨论散射矩阵],则有  $ 
    braket(q'_m'\,t',bf(T)[O_A (t_A),O_B (t_B), dots.c],q_m\, t) 
    = integral_(q_m (vb(x),t)=q_m (vb(x))\ 
    q_m (vb(x),t')=q'_m' (vb(x))) cal(D) phi \
    O_A (t_A) O_B (t_B) dots.c exp[i integral_(t)^(t') dd(tau) integral dd(x,3) cal(L) ]
  $
为了构建其与散射矩阵的联系，我们取 $t-> -infinity, t-> +infinity$,随后对 $q_m (vb(x))$作积分， 且约束条件为  $ 
    q_m (vb(x),+infinity) = q'_m' (vb(x)), q_m (vb(x),-infinity) = q_m (vb(x)) 
  $
于是我们得到  $ 
    braket(beta,bf(T)[O_A (t_A),O_B (t_B), dots.c],alpha) &= 
     integral cal(D) phi
    O_A (t_A) O_B (t_B) dots.c exp[i integral dd(x,4)  cal(L) ]\ 
    &=braket(beta,q(+infinity)) braket(q(-infinity),alpha)
  $<eq:scattering_path_integral>
由此，上一节引入的 $S_(beta alpha)[J]$ 可以写作  $ 
    braket(beta,alpha)_J &= 
    integral cal(D) phi  exp[i integral dd(x,4)  cal(L) + i sum_a integral dd(x,4) J_a (x) phi_a (x)] \
     & times  braket(beta,q(+infinity)) braket(q(-infinity),alpha)
  $
注意上式都是Heisenberg表象的算符.而等式左边在 $J=0$ 时关于 $J_a$ 的泛函导数恰是@eq:def_S_J 的左边，而对上式右边取泛函导数后令 $J=0$，利用@eq:scattering_path_integral 我们就得到@eq:def_S_J 的右边. 

下面我们考虑给出@eq:scattering_path_integral 右边最后的两个因子，首先注意到对于自由标量场，我们有  $ 
    phi(x) &= 
    integral tilde(dd(p,3)) [a_vb(p) e^(i p x) + a_(vb(p))^dagger  e^(-i p x)]\ 
    pi(x) &= 
    integral tilde(dd(p,3)) (-i) [a_vb(p) e^(i p x) - a_(vb(p))^dagger (p) e^(-i p x)] 
  $
由此，我们可以反解得到  $ 
    a_vb(p) = integral dd(x,3) e^(-i p x) 
    [i partial_t phi(x) + E_vb(p) phi(x)]  
  $
在相互作用体系，我们一般没有该结果，但是当 $t arrow.r minus.plus  infinity$,我们可以认为体系相互作用几乎消失，即有  $ 
    a_"in/out" (vb(p)) = lim_(t -> minus.plus oo) 
      integral dd(x,3) e^(-i p x) 
    [i pi(x) + E_vb(p) phi(x)]  
  $
再注意到  $ 
   a_"in/out" (vb(p)) ket(0\, "in/out") = 0
  $
另一方面，由于 $phi,pi$ 互为共轭变量，在 $ket(Phi(x))$ 基下， $pi(x)$ _相当于_泛函导数 $-i pdv(, phi) $,于是真空条件等价于  $ 
      integral dd(x,3) e^(-i vb(p) dot.c vb(x)) 
    [pdv(, phi) (x) + E_vb(p) phi(x)]   
    braket(phi(t arrow.r minus.plus  oo),0\, "in/out") = 0
  $
其中我们丢去了 $e^(i E t)$ 因子. 该方程的解为  $ 
     braket(phi(t arrow.r minus.plus  oo),0\, "in/out") =cal(N) 
      exp[-1/2 integral dd(x,3) dd(y,3)
      cal(E) (vb(x-y)) phi(vb(x)) phi(vb(y))]
  $
其中  $ 
  cal(E) (vb(x-y)) = 1/(2pi)^3 integral dd(p,3) E_vb(p) e^(i vb(p) dot.c (vb(x-y)))
  $
对于真空-真空散射，我们有
  $ 
    &braket("VAC,out",phi(+infinity)) braket(phi(-infinity),"VAC,in") = 
    abs(cal(N))^2 exp[-1/2 integral dd(x,3) dd(y,3) cal(E) (vb(x-y))\ 
    & times 
    [
      phi(vb(x),+infinity) phi(vb(y),+infinity) + phi(vb(x),-infinity) phi(vb(y),-infinity)
    ]
    ]\
    &= abs(cal(N))^2 exp[-epsilon/2 integral dd(x,3) dd(y,3) cal(E) (vb(x-y)) 
  integral dd(tau)   phi(vb(x),tau) phi(vb(y),tau) e^(-epsilon abs(tau))
  $
最后一步我们利用了  $ 
    f(+infinity) + f(-infinity) =lim_(epsilon -> 0^+) epsilon integral dd(tau) f(tau) e^(-epsilon abs(tau)) 
  $
由此我们得到了真空散射振幅  $ 
    braket(0,bf(T)[O_A (t_A),O_B (t_B),dots.c], 0) &= cal(N)^2
    integral cal(D) phi  O_A (t_A) O_B (t_B) dots.c exp[i {integral dd(x,4)
    cal(L) \ 
    &+ i epsilon/2 integral dd(x,3) dd(y,3) cal(E) (vb(x-y)) integral dd(tau)   phi(vb(x),tau) phi(vb(y),tau) e^(-epsilon abs(tau))}]\ 
    &= integral cal(D) phi  O_A (t_A) O_B (t_B) dots.c exp[i( integral dd(x,4)
    cal(L) + i epsilon)]\ 
  $<eq:vacuum_scattering1>
其中 $i epsilon$ 将提供传播子中的 $- i epsilon$ 因子,而归一化因子 $cal(N)^2$,由_真空涨落振幅_  $ 
      braket(0, 0) = 
       cal(N)^2 integral cal(D) phi exp[i( integral dd(x,4)
    cal(L) + i epsilon)]\ 
  $
贡献，在具体散射过程中，我们不考虑真空涨落的贡献，因此我们可以将 $cal(N)^2$ 吸收掉.于是我们常常将@eq:vacuum_scattering1 写作  $ 
    braket(0,bf(T)[O_A (t_A),O_B (t_B),dots.c], 0) = 
    integral cal(D) phi  O_A (t_A) O_B (t_B) dots.c exp[i( integral dd(x,4)
    cal(L) + i epsilon)]
  $<eq:vacuum_scattering2>

== Feynman规则与Feynman图
本节我们给出计算@eq:vacuum_scattering2 的微扰方法，首先对于生成泛函  $ 
    Z[J] = 
    integral cal(D) phi exp[i( integral dd(x,4) cal(L)+integral dd(x,4)  J(x) phi(x))]
  $
于是利用泛函导数就能得到  $ 
      braket(0,bf(T)[Psi_A (x),Psi_B (y),dots.c], 0) =
      (1/i)^n evaluated(pdv(, J(x), J(y),dots.c,d:delta,total:n) Z[J] )_(J=0)
  $
由此我们只要计算 $Z[J]$ 的微扰展开.本节我们以 $phi^3$ 理论为例具体计算：
  $ 
    cal(L) = -1/2 partial_mu phi partial^mu phi - 1/2 m^2 phi^2 + g/3! phi^3
  $
利用@eq:interaction_functional，我们有  $ 
    Z[J] = exp[i cal(L)_I (1/i dv(, J(x),d:delta))]  Z_0 [J]
  $
其中  $ 
    cal(L)_I (1/i dv(, J(x),d:delta)) &= g/3! integral dd(x,4) (1/i dv(, J(x),d:delta))^3\ 

    Z_0 [J] &= 
    exp[i/2
    integral dd(y,4) dd(z,4) J(y) Delta_F (y-z) J(z)] 
  $
此外我们默认了归一化条件为 $Z[J=0]=1$.

现在，我们发现 $Z[J]$ 由两个 $exp$ 泛函构成，为此我们有  $ 
    Z[J] &= sum_(V=0)^infinity 1/V! [(i g)/6
     integral dd(x,4) (1/i dv(, J(x),d:delta))^3
    ]^V \ 
    &=sum_(P=0)^infinity 1/P!
    [
      i/2 integral dd(y,4) dd(z,4) J(y) Delta_F (y-z) J(z)
    ]^P
  $<eq:Z_expansion_phi3>
对于@eq:Z_expansion_phi3 幂级数展开的每一项，其包含外源 $J(x)$ 的数量为 $E=2P-3V$,该项的相位因子是 $i^V (-i)^(3V)i^P=
i^(V+E-P)
$ .其中我们将 $E$ 称为_外源_, $P$ 称为_传播子_, $V$ 称为_顶点_. 此外， $3V$ 个顶点作用到 $2 P$ 个外源的组合数为  $ 
    (3V)! times  C_(2 P)^(3 V) = (2P)!/(2P-3V)! 
  $
    
下面我们引入_Feynman图_来表示@eq:Z_expansion_phi3 的每一项:
- 每一条线表示一个传播子，记作 $-i Delta_F (x-y)$;
- 不同线段的交点表示顶点，记作 $i g integral dd(x,4) $;
- 每个用实心圆 $circle.filled.small $ 表示的传播子的某个端点表示外源 $i integral dd(x,4) J(x)$. 
- @eq:Z_expansion_phi3 中的每一项都可以用一个Feynman图来表示, 但是每张图必须除去该图的对称性因子 $S$. 

#remark()[
  @eq:Z_expansion_phi3 式中存在 $4$ 个形如 $1\/i!$ 的幂级数展开因子，事实上由于Feynman图的对称性它们中的大部分可以被消去：
  - 重排每张图的顶点从而消去因子 $1\/V!$;
  - 重排作用于某个顶点的三个泛函导数从而消去因子 $1\/(3!)$;
  - 重排每张图的传播子从而消去因子 $1\/P!$;
  - 重排某个传播子作用于的两个外源从而消去因子 $1\/(2!)$.
但是有些重排会导致图不变，因此我们需要除去该图的对称性因子 $S$ 来消去这些冗余的重排.
] 

#remark()[
  @eq:Z_expansion_phi3 包含三类特殊的图，其并不直接对散射振幅做出贡献：
  1. 真空涨落图: $E=0$对应的Feynman图,其由归一化条件 $Z[J=0]=1$ 吸收;
  2. 蝌蚪图：在Feynman图中间断某条传播子后，剩余部分不包含外源的图, 在适当的重整化条件下可由 counterterm 消去;
  3. 不连通图：由集团分解原理我们知道不连通图可以写作连通图的乘积.
] 
下面我们考察几张典型的连通图.
#figure(caption: [ $E=2$ ])[
  #image("../../fig/phi3-page-1.pdf")
]

#figure(caption: [ $E=2$ ])[
  #image("../../fig/phi3-page-2.pdf")
]

#figure(caption: [ $E=3$ ])[
  #image("../../fig/phi3-page-3.pdf")
]

#figure(caption: [ $E=4$ ])[
  #image("../../fig/phi3-page-4.pdf")
]

#figure(caption: [ $E=4$ ])[
  #image("../../fig/phi3-page-5.pdf")
]

下面利用 $Z[J]$ 的展开，我们计算关联函数 $braket(0,bf(T)[phi(x_1) phi(x_2) dots.c ], 0)$, 利用泛函导数，我们有  $ 
     braket(0,bf(T)[phi(x_1) phi(x_2) dots.c ], 0) = 
     (1/i)^n evaluated(pdv(, J(x_1), J(x_2),dots.c,d:delta,total:n) Z[J] )_(J=0)
  $
为了保证关联函数也满足连通性，我们只考虑 $Z[J]$ 中包含 $n$ 个外源的连通图，具体地，对于 $E=4$,精确到 $g^2$ 阶，我们有  $ 
     braket(0,bf(T)[phi(x_1) phi(x_2) phi(x_1') phi(x_2') ], 0)  &= 
    (i g)^2 (1/i)^5 integral dd(y,4) dd(z,4)  Delta_F(y-z)\ 
    &times [
      Delta_F (x_1-y) Delta_F (x_2-y) Delta_F (x_1'-z) Delta_F (x_2'-z) \ 
      &+ Delta_F (x_1-y) Delta_F (x_1'-y)Delta_F (x_2-z) Delta_F (x_2'-z)  \
      &+ Delta_F (x_1-y) Delta_F (x_2'-y) Delta_F (x_2-z) Delta_F (x_1'-z)]
  $
注意由于对于 $Z[J]$ 的泛函导数共有 $4!$ 种重排方式，于是最后剩余的项数为 $3$. 它们进一步可以标记为如下所示：    
#figure(caption: [ $phi^3$理论四点关联函数的最低阶 ])[
  #image("../../fig/phi3_tree_01.pdf",width: 80%)
]<fig:phi3_tree_01>
== 关联函数的对称性
本节开始，我们将给出关联函数的一般性质，它们是不依赖于微扰展开的.首先我们考察关联函数的对称性.

=== 时空平移对称性 
对于标量理论，场的动量可以由 $phi,pi$ 构造得到：
  $ 
    P_mu  = - integral dd(x,3) pi(x) partial_mu phi(x)  
  $
由此利用场算符的对易关系 $[phi(t,vb(x)),pi(t,vb(y))]= i delta^3 (vb(x-y))$, 由此我们得到  $ 
    [P_mu, O(x)] = i partial_mu O(x) 
  $
其中 $O(x)$ 是任意由场算符 $phi,pi$ 构成的算符. 将其代入关联函数，我们得到  $ 
    (p_(beta mu)-p_(alpha mu)) 
    braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha) &=  
    braket(beta,[P_mu,bf(T)[O_a (x_1) O_b (x_2) dots.c]],alpha) \
    &=i(partial_mu^(x_1) + partial_mu^(x_2) + dots.c) 
    braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha)
  $<eq:translation_invariance_GX0>
该方程的解为  $ 
    braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha) = 
    e^(i (p_alpha-p_beta) dot.c x) 
    F_(a b dots.c) (x_1-x_2,dots.c)
  $<eq:translation_invariance_GX>
其中  $ 
    x =c_1 x_1+ c_2 x_2 +dots.c
  $
而 $F_(a b dots.c)$ 仅依赖坐标差.更特别地，真空期待值仅依赖于坐标差.为此，我们再取Fourier变换，则有  $ 
    integral dd(x_1,4) dd(x_2,4) ... &e^(-i k_1 x_1 - i k_2 x_2 - dots.c) 
    braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha) \ &= 
    delta^4 (p_alpha-p_beta-k_1-k_2-dots.c) 
    F_(a b dots.c) (k_1,k_2,dots.c)
  $
其中我们将 $p_alpha,p_beta$ 各自看作散射初态和末态的动量，而 $k_1,k_2,dots$ 来自关联函数中的算符在坐标 $x_1,x_2,dots.c$ 
对应的动量(on-shell/off-shell),于是上式给出了关联函数的动量守恒，其对应的Feynman图之和也是动量守恒的.

类似的，对于任意Lorentz变换，我们也可以得到类似的守恒律.


===  $U(1)$ 对称性 
对于存在 $U(1)$ 守恒的体系，比如电荷守恒，则存在电荷算符 $Q$,任意由场算符构成的算符将满足  $ 
    [Q,O_a (x)] = -q_a  O_a (x) 
  $
代入关联函数得到  $ 
    (q_beta-q_alpha)     braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha)
    &= braket(beta,[Q,bf(T)[O_a (x_1) O_b (x_2) dots.c]], alpha)\ 
  &= - (q_a + q_b +dots.c) braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha)
  $
因此，既然体系是电荷守恒的，我们要求  $ 
    q_beta  = q_alpha-q_a-dots.c  
  $
这要求每个关联函数对应的Feynman图之和是电荷守恒的，我们将看到每张图都满足电荷守恒.

下面考虑一个具体的例子，对于Dirac场，我们注意到它的电荷共轭满足  $ 
    C (overline(psi) gamma^mu psi) C^(-1) = - overline(psi) gamma^mu psi 
  $
于是对于Dirac场和光子场 $A^mu (x)$ 相耦合的体系，若要求电荷守恒，我们必须有   $ 
    C A^mu (x) C^(-1) = - A^(mu) (x) 
  $
因此对于由奇数个光子场构成的关联函数，其值为 $0$,或者说只要奇数个光子作为外线的Feynman图只和为 $0$，该结果也称为_Furry定理_.  

== 振幅极点与LSZ定理<sec:feyn_pole>
本节我们将关注动量空间振幅  $ 
    G(q_1,dots.c,q_n) = 
    integral dd(x_1,4) ... dd(x_n,4) e^(-i q_1 x_1 ) e^(-i q_2 x_2) dots.c
    braket(0,bf(T)[A_1 (x_1) A_2 (x_2) dots.c], 0) 
  $
其中 $A_i (x_i)$ 是出现在拉氏量中的任意场. 注意到 $G(q_1,dots.c,q_n)$ 满足动量守恒，引起我们引入  $ 
    q = q_1+dots.c+q_r = -q_(r+1) -dots.c-q_n 
  $
我们将证明：
#prop(label: <prop:pole_G>)[
  $G(q_1,dots.c,q_n)$ 在 $q^2=-m^2$ 处具有极点,其中 $m$ 是某个粒子的单粒子态质量，且该极点的留数为  $ 
      G & arrow.r ((-2i)(sqrt(vb(q)^2+m^2)))/(q^2+m^2- i epsilon) 
      (2pi)^4 delta^4 (q_1+dots.c+q_n)\ 
      & times sum_sigma M_(0bar.v(vb(p),sigma)) (q_2,dots.c,q_r) 
      M_((vb(q),sigma)bar.v\0) (q_(r+1),dots.c,q_n)
    $<eq:G_pole_structure>
    其中  $ 
        integral dd(x_1,4) dots.c dd(x_r,4) e^(-i q_1 x_1 ) dots.c e^(-i q_r x_r) 
        braket(0,bf(T)[A_1 (x_1) dots.c A_r (x_r)], Psi_(vb(p),sigma)) 
        \ 
        =(2pi)^4 delta^4 (q_1+dots.c+q_r-p) M_(0bar.v(vb(p),sigma)) (q_2,dots.c,q_r)
      $
      $ 
        integral dd(x_(r+1),4) dots.c dd(x_n,4) e^(-i q_(r+1) x_(r+1) ) dots.c e^(-i q_n x_n) 
        braket(Psi_(vb(p),sigma),bf(T)[A_(r+1) (x_(r+1)) dots.c A_n (x_n)], 0) \ 
        =(2pi)^4 delta^4 (q_(r+1)+dots.c+q_n+p) M_((vb(p),sigma)bar.v\0) (q_(r+2),dots.c,q_n) 
      $
    其中 $p^0 = sqrt(vb(p)^2+m^2).$ 
] 
下面我们假设关联函数的某个算符趋于on-shell条件，于是对于  $ 
    G_l (q_1 q_2 dots.c) = 
    integral dd(x_1,4) ... dd(x_l,4) e^(-i q_1 x_1 ) e^(-i q_2 x_2) 
    braket(0,bf(T)[A_l (x_1) A_2 (x_2) dots.c], 0) 
  $
存在质量维 $m$ 的单粒子态 $ket(vb(q)\,sigma)$, 其使得 $G_l$ 在 $q_1^2=-m^2$ 存在极点，且  $ 
    G_l & arrow.r ((-2i)(sqrt(vb(q)^2+m^2)))/(q_1^2+m^2- i epsilon) 
    sum_sigma braket(0,A_l (0),vb(q_1)\, sigma) \ 
    & times  integral dd(x_2,4) dots.c e^(-i q_2 x_2) dots.c 
    braket(vb(q_1)\, sigma,bf(T)[A_2 (x_2) dots.c], 0) 
  $
利用Lorentz对称性，我们有  $ 
      braket(0,A_l (0),vb(q_1)\, sigma) = N (2pi)^3 (2E_vb(p)) u_l (vb(q_1),sigma)
  $
其中 $N$ 是额外的常数. 此外我们定义  $ 
      integral dd(x_2,4) dots.c e^(-i q_2 x_2) dots.c 
    braket(vb(q_1)\, sigma,bf(T)[A_2 (x_2) dots.c], 0)  = 
    1/N 1/((2pi)^3 (2E_vb(p))) sum_l u_l^* (vb(q_1),sigma) M_l (q_2,dots.c)
  $
这里我们称 $M_l$ 为截腿函数.由此，当 $q_1^2 arrow.r -m^2$ ,我们得到  $ 
    G_l & arrow.r ((-2i)(sqrt(vb(q)^2+m^2)))/(q_1^2+m^2- i epsilon) 
    sum_(sigma,l') u_l (vb(q_1),sigma) u_(l')^* (vb(q_1),sigma) M_(l') (q_2,dots.c)
    \ 
    &=  sum_l' 
    (-i Delta_(l l') (q_1)) M_(l') (q_2,dots.c)
  $
最后一步利用了@eq:free_propagator1. 对于满足上述 on-shell 条件的算符 $A_l$，我们将其在关联函数中对应的那条传播子称为_外线_.  
即看作该外线传播子与其余部分的截腿函数 $M_l'$ 的收缩.  
换言之，$M_l'$ 表示将该外线的传播子部分剥离之后，剩余所有连通图之和；它只保留一个与外线相联系的未收缩指标 $l'$.  
于是，当我们把这条腿解释为一个真实的外部单粒子态时，外线所贡献的便不再是完整传播子，而是相应的单粒子态对应的叠加系数，在本例中其相当于 $u_l^* (vb(q_1\,sigma))$.

下面我们便可以给出所有_外线_的Feynman规则：
1. 正粒子入射：用 $u_l (vb(p),sigma)$  替换入射外线的传播子;
2. 正粒子出射：用 $u_l^* (vb(p),sigma)$ 替换出射外线的传播子;
3. 反粒子入射：用 $v_l^* (vb(p),sigma)$ 替换入射外线的传播子;
4. 反粒子出射：用 $v_l (vb(p),sigma)$ 替换出射外线的传播子.

具体的，我们考虑 $phi^3$ 理论的树图散射@fig:phi3_tree_01, 利用传播子的Feynman规则和外线规则，我们可以将_散射振幅_写作  $ 
    i cal(M) = (i g)^2 
    [(-i)/((p_1+p_2)^2+m^2- i epsilon)
    +(-i)/((p_1-p_1')^2+m^2- i epsilon)
    + (-i)/((p_1-p_2')^2+m^2- i epsilon)
    ] 
  $
   

== 重整化
对于单粒子态，我们要求其满足如下的归一化条件  $ 
    braket(vb(p)\,sigma,vb(p')\, sigma') = (2pi)^3 (2E_vb(p)) delta^3 (vb(p-p')) delta_(sigma sigma')
  $
于是自由场的归一化满足  $ 
    braket(0,psi_"free" (0),vb(p)\, sigma) = (2pi)^3 (2E_vb(p)) u(vb(p),sigma) 
  $
我们需要相互作用场也满足这一条件，因此我们要求相互作用场论满足_重整化条件_：  $ 
    braket(0,psi (0),vb(p)\, sigma) = (2pi)^3 (2E_vb(p)) u(vb(p),sigma) 
  $<eq:field_renormalization_condition>
我们将场算符 $psi_l (x)$ 满足 @eq:field_renormalization_condition 称为_重整化场_,而该场激发的单粒子态质量为 $m$,我们将该质量称为_重整化质量_. 

另一个重要的重整化条件是我们要求真空满足：
  $ 
    braket(0,Psi(x),0) equiv 0 
  $
为了看到这一点，我们考察 $phi^3$ 理论中的那些蝌蚪图,如下所示.
#figure(caption: [ $phi^3$理论中的蝌蚪图 ])[
  #image("../../fig/phi3-page-7.svg")
] 
由于它们只有一个外源，我们得到  $ 
    braket(0,phi(x),0) = 1/i pdv(, J(x),d:delta) Z[J] )_(J=0) =
    (i g)/2 integral dd(y,4) 1/i Delta_F(x-y) 1/i Delta_F (y-y) + O(g^3)
  $
显然该式不为 $0$,为了消去该项，我们需要在拉氏量中添加一个counterterm  $ 
    cal(L) arrow.r  cal(L) + Y phi
  $ 
其中 $Y phi$ 将给出顶点 $i Y integral dd(y,4) $,由此我们就有  $ 
     braket(0,phi(x),0) = 
     (i Y+ (i g)/2 1/i Delta_F (0)) integral dd(y,4) 1/i Delta_F(x-y) + O(g^3) 
  $
于是我们可以通过选择 $Y=O(1)$ 来消去所以蝌蚪图的贡献.
#remark()[
  我们已经看到，在最低阶， $Y #sym.prop Delta_F (0)$ 也是一个无穷大量. 
]  
    


=== 场强重整化与质量重整化
我们将用类似对于 $phi^3$ 理论重整化真空的方法，来重整化单粒子态的质量和场强. 首先我们将未经重整化的场称为_裸场_,记为  $ 
    cal(L) = 
    -1/2 partial_mu phi_0 partial^mu phi_0 - 1/2 m_0^2 phi_0^2 + V_B (phi_0)
  $
我们将重整化场和重整化质量记为  $ 
    phi = Z^(-1\/2) phi_0\ 
    m^2 = m_0^2 + delta m^2 
  $
其中 $Z^(-1\/2), delta m^2$ 都将用来修正单粒子态的质量和场强. 现在我们可以将原始的拉氏量写作如下形式  $ 
    cal(L) &= 
    -1/2 partial_mu phi partial^mu phi - 1/2 m^2 phi^2 \ 
 &+(-1/2) (Z-1) [partial_mu phi partial^mu phi + m^2 phi^2 ] 
 + 1/2 Z delta m^2 phi^2 + V(phi)
  $<eq:renormalized_Lagrangian>
其中 $V(phi) = V_B (sqrt(Z) phi).$ @eq:renormalized_Lagrangian 中的第二行我们一般称为_抵消项_. 
  
下面我们考虑由@eq:renormalized_Lagrangian 第一行给出的_严格传播子_在单圈修正下的结果：
  $ 
    1/i Delta' (q) &= 
    1/i Delta_F (q) + 1/i Delta_F (q) (i Pi^* (q^2)) 1/i Delta_F (q) \ 
    &+[1/i Delta_F (q) (i Pi^* (q^2)) 1/i Delta_F (q)] (i Pi^* (q^2)) 1/i Delta_F (q)\ 
    & + dots.c \ 
    &=1/i 1/(q^2+m^2-Pi^* (q^2)- i epsilon)
  $
#figure(caption: [传播子的单圈修正])[
  #image("../../fig/_1Pis.svg")
]
其中 $i Pi^* (q^2)$ 由@eq:renormalized_Lagrangian 中的抵消项和一圈图给出：
  $ 
    i Pi^* (q^2) = (-i)(Z-1) (q^2+m^2) + i Z delta m^2 
    + i Pi^*_("1-loop") (q^2) 
  $
#figure(caption: [ $phi^3$ 传播子的单圈1Pi图 ])[
  #image("../../fig/phi3_1pi.svg")
]  

现在，重整化条件要求  $ 
    Pi^* (-m^2) &= 0 ,\ 
    evaluated(dv(Pi^*(q^2), q^2))_(q^2=-m^2) &= 0 
  $
等价地，  $ 
    Z delta m^2 &= -  Pi^*_("1-loop") (-m^2),\ 
    Z &= 1+ evaluated(dv(Pi^*_("1-loop") (q^2), q^2))_(q^2=-m^2) 
  $
  
  
=== 耦合常数重整化
下面我们仍以 $phi^3$ 理论为例，考察相互作用项目，首先注意到  $ 
    V_B (phi_0) = +g_0/3! phi_0^3 = +Z^(3\/2) g_0/3! phi^3  
  $
我们取  $ 
     Z^(3\/2) g_0 = g + delta g
  $
于是  $ 
    V(phi) = +g/3!  phi^3 + delta g/3! phi^3
  $
由此完整的拉氏量可以写作  $ 
    cal(L) &= 
    -1/2 partial_mu phi partial^mu phi +  1/2 m^2 phi^2 - g/3! phi^3 \ 
    & + (-1/2) (Z-1) [partial_mu phi partial^mu phi + m^2 phi^2 ]\
    & + 1/2 Z delta m^2 phi^2 + delta g/3! phi^3\ 
    & + (delta g)/3! phi^3 
  $
下面我们可以定义 $3-$ 顶点为  $ 
     i Gamma^((3)) (p_1,p_2,p_3) &= 
     (i g) + (i delta g) + i Gamma^((3))_("1-loop") (p_1,p_2,p_3) \
     &+i Z_g g +  i Gamma^((3))_("1-loop") (p_1,p_2,p_3)
  $
取值 $Gamma^((3))$ 都是1Pi的.

一般地，我们将耦合常数重整化条件取为  $ 
    i  Gamma^((3)) (p_1,p_2,p_3) |_(p_i^2=-m_i^2) = i g^*
  $
其中 $g^*$ 是我们想要的重整化耦合常数. 由此我们可以解出 $delta g$ 和 $Z_g$ 的值.
  
  
  
   

== Källén-Lehmann谱表示

== 散射截面与衰变率

== 散射算符的幺正性

== 习题
#prob()[证明@eq:translation_invariance_GX.] 
#sol()[
  我们取  $ 
      G(x_1,x_2,dots.c) = braket(beta,bf(T)[O_a (x_1) O_b (x_2) dots.c], alpha)
    $
  进一步引入坐标  $ 
      X= c_1 x_1+ c_2 x_2 +dots.c, \
      xi_2 = x_1-x_2,\
      xi_3 = x_1-x_3,\
      dots.c
    $
  注意相对坐标 $xi_i$ 具有平移不变性，因子我们由  $ 
      sum_i partial_mu^(x_i) = partial_mu^X 
    $
  因此@eq:translation_invariance_GX0 等价于  $ 
        (p_(beta mu)-p_(alpha mu))  G(X,xi_2,xi_3,dots.c) = i partial_mu^X G(X,xi_2,xi_3,dots.c)
    $
  显然该方程的解是  $ 
      G(X,xi_2,xi_3,dots.c) = e^(i (p_alpha-p_beta) dot.c X) F(xi_2,xi_3,dots.c)
    $
  从而得到@eq:translation_invariance_GX.
] 

#prob()[证明@prop:pole_G.] 
#sol()[
  为了证明该结构，首先将@eq:G_pole_structure 写作如下形式  $ 
    G &arrow.r sum_sigma integral dd(k,4) \ 
    & times  [(2pi)^4 delta^4 (q_1+dots.c+q_r-k) M_(0bar.v(k,sigma)) (q_2,dots.c,q_r) \]  \ 
    & times  [(-i)/(2pi)^4 1/(k^2+m^2- i epsilon)] \
    & times [(2pi)^4 delta^4 (q_(r+1)+dots.c+q_n+k) M_((k,sigma)bar.v\0) (q_(r+2),dots.c,q_n)]
  $


] 