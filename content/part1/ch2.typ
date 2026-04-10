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
  $
其中 $i epsilon$ 将提供传播子中的 $- i epsilon$ 因子,而归一化因子 $cal(N)^2$,由真空涨落振幅  $ 
      braket(0, 0) = 
       cal(N)^2 integral cal(D) phi exp[i( integral dd(x,4)
    cal(L) + i epsilon)]\ 
  $
消去.
    
  
  
  
  
  

   






== Feynman规则与Feynman图
== 振幅极点与LSZ定理
== 重整化
== 顶点函数

== Källén-Lehmann谱表示