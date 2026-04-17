#import "../../lib.typ":*

= 自由量子场
上一章我们通过构造 Poincaré 群在态空间上的幺正表示，部分解决了量子力学与狭义相对论在单粒子层面的兼容性问题。然而，这一框架仍然存在两个根本不足。第一，相对论下高能过程普遍伴随着粒子产生与湮灭，固定粒子数的量子力学描述因而不再充分；第二，单粒子波函数理论难以自然表述局域可观测量及其微观因果性。为同时实现 Poincaré 协变性、局域性以及变粒子数过程，我们必须引入定义在时空上的量子场    

在量子场论中，局域场 $psi(x)$ 作为作用于 Fock 空间的算符，可以在不同粒子数扇区之间跃迁，因此自然包含产生与湮灭算符。相互作用的 Lorentz 对称性要求相互相互作用， $cal(H)_"I" (x)$ 
为 Lorentz 标量；而微观因果性则要求类空间隔处分离的局域可观测量彼此对易。在相互作用绘景中，一个常用的充分条件是
  $ 
    U(Lambda,a) cal(H)_"I" (x) U(Lambda,a)^(-1) 
    = cal(H)_"I" (Lambda x + a)
  $
以及 $ 
    [cal(H)_"I" (x), cal(H)_"I" (y)] = 0, (x-y)^2 > 0
  $
基于以上原则，本章将给出自由量子场的构造方法，并以此为基础讨论 CPT 定理等重要结果.

== 自由场的构造
一般地，我们将场算符 $psi(x)$ 写作
  $ 
    psi_l (x) = sum_sigma integral dd(p,3)/((2pi)^3 2 E_vb(p)) 
   [ u_l (vb(p),sigma)  
    a_(vb(p),sigma) e^(i p x)
    + v_l (vb(p),sigma)   
    b^dagger_(vb(p),sigma) e^(-i p x)]
  $ 
其中 $vb(p),sigma$ 是动量指标和自旋指标， $dd(p,3)/((2pi)^3 2 E_vb(p)) $ 是Lorentz不变微元. $a_(vb(p),sigma),b^dagger_(vb(p),sigma)$ 是两类产生湮灭算符，我们将在后文给出定义两类产生湮灭算符的原因. $e^(plus.minus i p x)$ 给出场的平移对称性，而 $u_l,v_l$ 则给出场算符在Lorentz变换下的变换规则.

具体而言，我们希望 $psi_l (x)$ 满足  $ 
    U(Lambda) psi_l (x) U^(-1) (Lambda) 
    = sum_(l') D_(l l') (Lambda^(-1))
    psi_l' (Lambda x)
  $<eq:field_Lorentz_covariance>
其中 $D(Lambda)$ 是Lorentz群的某个有限维表示.

为了看出我们将 $psi_l$ 看成Lorentz群某个表示空间的元素确实给出了相互作用的Lorentz不变性，我们用 $psi_l^+,psi_l^-$ 分别表示 $psi_l (x)$ 的正能部分和负能部分. 那么我们总能将 $cal(H) $ 写作如下形式
  $ 
    cal(H) (x) 
    sum_(N,M')
    = sum_(l_1,...,l_N\ l_1',...,l_M') 
     g_(l_1,...,l_N;l_1',...,l_M')
    psi^-_(l_1) (x) ... psi^-(l_N) (x)
    psi^+_(l_1') (x) ... psi^+(l_M') (x)    
  $ 
其中我们已经利用了正规序的排列方式.现在，我们只要假设 $g_(l_1,...,l_N;l_1',...,l_M')$ 是Lorentz不变的张量，那么 $cal(H) (x)$ 就是一个Lorentz标量.



=== 叠加系数的表示

下面我们给出 $u_l,v_l$ 的Lorentz变换规则. 首先注意到  $ 
    U(Lambda) ket(vb(p)\,sigma) 
    =  sum_(sigma' sigma) 
    D^(j) _(sigma', sigma)(W(Lambda,p)) 
    ket(vb(Lambda p)\,sigma')
  $
其中 $D^(j) (R)$ 是自旋 $j$ 的旋转表示， 
注意等式左边等价为 $U(Lambda) a^dagger_(vb(p),sigma) U^(-1) (Lambda) ket(0)$,于是我们有
  $ 
    U(Lambda) a^dagger_(vb(p),sigma) U^(-1) (Lambda) &=  sum_(sigma' ) 
    D^(j) _(sigma', sigma)(W(Lambda,p)) 
    a^dagger_(vb(Lambda p)\,sigma') \ 
    & = 
     sum_(sigma' ) 
    D^(j*) _(sigma sigma')(W^(-1)(Lambda,p)) 
    a^dagger_(vb(Lambda p)\,sigma')
  $ 
最后一步利用了 $D^(j) (R)$ 的幺正性. 等式两边取共轭，我们有  $ 
       U(Lambda) a_(vb(p),sigma) U^(-1) (Lambda) &=  sum_(sigma' ) 
    D^(j) _(sigma sigma')(W^(-1)(Lambda,p)) 
    a_(vb(Lambda p)\,sigma') \
  $ 
  

将其带入@eq:field_Lorentz_covariance 的左边：
  $ 
    U(Lambda) psi^+_l (x) U^(-1) (Lambda) 
    = sum_(sigma,sigma') 
    integral tilde(dd(Lambda p,3)) 
    u_l (vb(p),sigma) 
    D^(j) _(sigma sigma')(W^(-1)(Lambda,p))
    a_(vb(Lambda p)\,sigma') e^(i p x)\ 
    U(Lambda) psi^-_l (x) U^(-1) (Lambda)
    = sum_(sigma,sigma')
    integral tilde(dd(Lambda p,3))
    v_l (vb(p),sigma)
    D^(j*) _(sigma sigma')(W^(-1)(Lambda,p))
    b^dagger_(vb(Lambda p)\,sigma') e^(-i p x)
  $ 
将其与@eq:field_Lorentz_covariance 的右边比较，我们得到了 $u_l,v_l$ 的Lorentz变换规则：
  $ 
    sum_(l') D_(l l') (Lambda^(-1)) 
    u_l' (Lambda vb(p), sigma') 
    = sum_(sigma) 
    D^(j) _(sigma sigma')(W^(-1)(Lambda,p))
    u_l (vb(p),sigma)\ 
    sum_(l') D_(l l') (Lambda^(-1))
    v_l' (Lambda vb(p), sigma')
    = sum_(sigma)
    D^(j*) _(sigma sigma')(W^(-1)(Lambda,p))
    v_l (vb(p),sigma)
  $ 
或者写作  $ 
    sum_(sigma') u_l (Lambda vb(p), sigma')
     D^j_(sigma' sigma) (W(Lambda,p))
    &= sum_(l') D_(l l') (Lambda)
    u_l' (vb(p), sigma)\ 
    sum_(sigma') v_l (Lambda vb(p), sigma')
     D^(j*) _(sigma' sigma)  (W(Lambda,p))
    &= sum_(l') D_(l l') (Lambda)
    v_l' (vb(p), sigma)
  $<eq:ulvl_Lorentz_transformation>

我们考虑粒子从零动量Boost到 $vb(p) $ 动量态，此时  $ 
    W(Lambda,vb(p)) = 
    L^(-1)(Lambda vb(p)) Lambda L(vb(p)) 
    =L^(-1)(vb(p) ) L(vb(p)) =1 
  $ 
则有  $ 
    u_l (vb(p),sigma) = 
    sum_(l') D_(l l') (L(vb(p))) u_l' (0,sigma) \
    v_l (vb(p),sigma) = 
    sum_(l') D_(l l') (L(vb(p))) v_l' (0,sigma) 
  $ 
即对于叠加系数 $u_l,v_l$ 我们只要知道其在零动量态的值就可以了. 下面我们考虑纯空间转动，从而确定它们在零动量态取值的关系：
  $ 
     sum_(sigma') u_l (0, sigma')
     D^j_(sigma' sigma) (R)
    &= sum_(l') D_(l l') (R)
    u_l' (vb(0), sigma)\ 
    sum_(sigma') v_l (0, sigma')
     D^(j*) _(sigma' sigma)  (R)
    &= sum_(l') D_(l l') (R)
    v_l' (vb(0), sigma)
  $ 
进一步我们用 $vb(J)^(j) $ 表示 $D^j (R)$ 的无穷小生成元，而 $scr(J)$ 表示 $D(R)$ 的无穷小生成元，则上式等价于  $ 
     sum_(sigma') u_l (0, sigma')
     vb(J)^(j) _(sigma' sigma)
    &= sum_(l') scr(J)_(l l')
    u_l' (vb(0), sigma)\ 
    sum_(sigma') v_l (0, sigma')
     vb(J)^(j*) _(sigma' sigma)
    &=- sum_(l') scr(J)_(l l')
    v_l' (vb(0), sigma)
  $<eq:ulvl_rotation_transformation>

=== 量子场的一般性质
本小节我们考虑自由场 $psi(x)$ 的一般性质，首先不难发现其满足Klein-Gordon方程  $ 
    (partial^2 - m^2) psi(x) = 0
  $ 
此外，我们引入自由场 $psi_l$ 的共轭场  $ 
    psi^dagger_l (x) = 
    integral dd(p,3)/((2pi)^3 2 E_vb(p))
    [
      u_l^* (vb(p),sigma) 
    a^dagger_(vb(p),sigma) e^(-i p x)
    + v_l^* (vb(p),sigma)
    b_(vb(p),sigma) e^(i p x)
    ] 
  $ 
如果场 $psi,psi^dagger$ 描述的粒子具有某种 $U(1)$ 对称性，则存在一个守恒荷 $Q$.其满足  $ 
    Q ket(vb(p)\,sigma ) = q ket(vb(p)\,sigma )\
    Q ket(vb(p)\,sigma\,c ) = q^c ket(vb(p)\,sigma ) 
  $ 
其中 $ket(vb(p)\,sigma )$ 由 $a_(vb(p),sigma)$
产生，而 $ket(vb(p)\,sigma\,c )$ 由 $b^dagger_(vb(p),sigma)$ 产生. 于是我们立刻注意到  $ 
    [Q,psi_l] = -q psi^+_l + q^c psi^-_l\ 
  $ 
为了保证 $psi_l$ 存在一个确定的 $U(1)$ 荷，我们需要取 $q^c+q=0$.则有  $ 
    [Q,psi_l] = q^c psi_l\ 
    [Q,psi^dagger_l] = q psi^dagger_l\
  $ 

于是当 $psi psi^dagger$ 以乘积和形式出现在相互作用哈密顿量中时，因为 $q^c + q = 0$，我们有 $[Q,H]equiv 0.$ 即 $a^dagger,b^dagger$ 实际产生性质几乎一致，但是 $U(1)$ 守恒荷相反的粒子，我们分别称为粒子和反粒子. 这就是我们在构造场算符时引入两类产生湮灭算符的原因.  
   
最后，我们考虑场算符的微观因果性.于是  $ 
    [psi_l (x),psi_m^dagger (y)]_(minus.plus) &=
    sum_(sigma sigma') 
    integral tilde(dd(p,3)) tilde(dd(q,3)) 
    u_l (vb(p),sigma) u_m^* (vb(q),sigma')
    e^(i p x - i q y) [a_(vb(p),sigma), a^dagger_(vb(q),sigma')]  minus.plus dots.c\ 
    &= sum_(sigma sigma') 
    integral tilde(dd(p,3)) tilde(dd(q,3)) 
    u_l (vb(p),sigma) u_m^* (vb(q),sigma')
    e^(i p x - i q y)(2pi)^3 2 E_vb(p) delta^3 (p-q) delta_(sigma sigma') minus.plus dots.c\
    &= sum_(sigma) 
    integral tilde(dd(p,3))
    [
      u_l (vb(p),sigma) u_m^* (vb(p),sigma)
    e^(i p (x-y)) minus.plus
      v_l (vb(p),sigma) v_m^* (vb(p),sigma)
    e^(-i p (x-y))
    ]
  $ 
可以证明  $ 
  sum_(sigma) u_l (vb(p),sigma) u_m^* (vb(p),sigma) &= P_(l m) (vb(p),E_vb(p))\ 
  sum_(sigma) v_l (vb(p),sigma) v_m^* (vb(p),sigma) &= (-1)^(2j) P_(l m) (-vb(p),-E_vb(p))
  $<eq:spin_sum_Plm>
下面引入函数  $ 
    Delta_(+) (x-y) = 
    integral tilde(dd(p,3)) 
    e^(i p (x-y)) 
  $
则  $ 
     [psi_l (x),psi_m^dagger (y)]_(minus.plus) 
     &=   integral tilde(dd(p,3)) [
      P_(l m) (vb(p),E_vb(p)) e^(i p (x-y)) -
      P_(l m) (-vb(p),-E_vb(p)) e^(-i p (x-y))
     ]\ 
     &=P_(l m) (-i partial_x) Delta_"PJ" (x-y)
  $
其中 $Delta_"PJ"(x-y) = Delta_(+) (x-y) - Delta_(+) (y-x)$ 称为Pauli-Jordan函数. 对于类空间隔 $abs(x-y)>0$,不妨取 $x^0=y^0,r=abs(vb(x-y))$,则
  $ 
    Delta_"PJ" (r) &= 
    integral dd(vb(p),3)/((2pi)^3 2 E_vb(p)) 
    [
      e^(i vb(p) dot.c vb(r)  ) -
        e^(-i (vb(p) dot.c vb(r)  ))
      ]  \
  &= integral dd(vb(p),3)/((2pi)^3 2 E_vb(p)) 
    [
      e^(i vb(p) dot.c vb(r)  ) -
        e^(i (vb(p) dot.c vb(r)  ))
      ]  =0
  $ 
其中我们利用了 $vb(p)-> -vb(p) $. 由此我们验证了自由场的微观因果性.
   
额外地，对于 $x^0=0$，我们可以具体得到 $Delta_+ (r)$ 的表达式：
  $ 
    Delta_+ (r) &= integral dd(vb(p),3)/((2pi)^3 2 E_vb(p)) e^(i vb(p) dot.c vb(r)  ) \ 
    &=1/(8 pi^2 ) integral_0^pi sin theta dd(theta) 
    integral_0^oo p^2 dd(p) / E_vb(p) e^(i p r cos theta) \   
    &=1/(4 pi^2 r) integral_0^oo dd(p) p/ E_vb(p) sin (p r) \
    &=m/(4 pi^2 r) K_1 (m r)
  $
其中 $K_1$ 是修正的Bessel函数. 
  




== Lorentz群的有限维表示
本节我们将探讨Lorentz群有限维表示的基本性质.首先我们引入旋量指标 $a,b$,则@eq:field_Lorentz_covariance 可以写作  $ 
    U(Lambda) psi_a (x) U^(-1) (Lambda) 
    =  tensor(D(Lambda),-a,+b) 
    psi_b (Lambda x)
  $
其中 $D(Lambda)$ 满足  $ 
      tensor(D(Lambda),-a,+b) tensor(D(Lambda'),-b,+c)
    = tensor(D(Lambda Lambda'),-a,+c)
  $
我们将表示 $D(Lambda)$ 的无穷小生成元记作 $cal(S)^(mu nu)$,不难验证其和无穷维表示的生成元 $M^(mu nu)$ 满足类似的Lie代数关系@eq:Lie_algebra_Lorentz  $ 
     i [cal(S)^(mu nu), cal(S)^(rho sigma)] = 
     (g^(nu rho) cal(S)^(mu sigma) - g^(mu rho) cal(S)^(nu sigma)   -
       g^( sigma mu) cal(S)^(rho nu ) + g^(sigma nu)
        cal(S)^(rho mu ))
  $<eq:Fin_Lie_algebra_Lorentz>
进一步，我们引入  $ 
    J_i &= 1/2 epsilon_(i j k) cal(S)^(j k), \
    K_i &= cal(S)^(0i) = cal(S)_(i 0)
  $
则上述Lie代数可以化简为  $ 
    [J_i,J_j] &= i epsilon_(i j k) J_k\
    [K_i,K_j] &= - i epsilon_(i j k) K_k\ 
    [J_i,K_j] &=  i epsilon_(i j k) J_k\
  $
值得注意，由于Lorentz群是非紧致的，因此其有限维表示除了平凡表示外，一般是非幺正的. 事实上，上述Lie代数关系立刻看出 $vb(J)$ 是厄米的，而 $vb(K)$ 是反厄米的.
#remark()[
  尽管Lorentz群幺正表示也满足上述Lie代数关系，但它们是无穷维的，于是它们的(反)厄米性并不能如此直接看出.
]  

下面我们考虑该表示的_复化_形式，取  $ 
    A_i = J_i + i K_i\ 
    B_i = J_i - i K_i 
  $
则我们可以证明  $ 
    [A_i, A_j] &= i epsilon_(i j k) A_k\
    [B_i, B_j] &= i epsilon_(i j k) B_k\
    [A_i, B_j] &= 0 
  $
由此我们发现Lorentz群的Lie代数 $frak(s o) (1,3)$ 可以分解为两个 $frak(s u) (2)$ Lie代数的直和:
  $ 
     frak(s o) (1,3) tilde.equiv 
      frak(s u) (2) plus.o 
       frak(s u) (2)
  $
我们知道 $frak(s u) (2)$ 的有限维不可约表示由一个非负半整数 $j$ 标记，维数为 $2j+1$.因此，Lorentz群的有限维不可约表示由一对非负半整数 $(a,b)$ 标记，维数为 $(2a+1)(2b+1)$. 其中我们将 $a,b$ 称为自旋量子数.


  
=== 一般性质
我们首先讨论 $(a, b)$ 表示的一般性质.首先注意到
  $ 
    vb(J) &= vb(A) + vb(B),\
     vb(K) &= -i (vb(A) - vb(B)) 
  $
于是该表示满足  $ 
    D(Lambda) &= 
    exp[i (
      vb(J) dot.c vb(theta) + vb(K) dot.c vb(eta)
    )] \ 
    &=
    exp[i (
      vb(A) dot.c (vb(theta) - i vb(eta)) + vb(B) dot.c (vb(theta) + i vb(eta))
    )]\ 
  $
下面我们考虑该表示的复共轭:
  $ 
    D^* (Lambda) &= 
    exp[-i 
    (
      vb(A)^* dot.c (vb(theta) + i vb(eta)) + vb(B)^* dot.c (vb(theta) - i vb(eta))
    )
    ] \ 
    &=exp[i
    (- vb(B)^* dot.c (vb(theta) - i vb(eta)) + (-vb(A)^*) dot.c (vb(theta) + i vb(eta))
    )
    ]
  $
于是我们注意到表示 $D^* (Lambda) $ 的生成元为 $-vb(J)^*,-vb(K)^*$. 
另一方面， $(b,a)$ 表示的生成元可以记作  $ 
    vb(J) = tilde(vb(A)) + tilde(vb(B)),\
    vb(K) = -i (tilde(vb(A)) - tilde(vb(B)))
  $
即  $ 
    tilde(D) (Lambda) 
    = exp[i (
      vb(tilde(A)) dot.c (vb(theta) - i vb(eta)) + 
      vb(tilde(B)) dot.c (vb(theta) + i vb(eta))
    )]\  
  $
因此 $(a,b)$ 表示和 $(b,a)$ 表示之间存在简单的关系：
  $ 
    tilde(vb(A)) tilde.equiv - vb(B)^*,\
    tilde(vb(B)) tilde.equiv - vb(A)^*
  $
具体地，我们考虑矩阵 $S_a,S_b$ 其使得
  $ 
    S_a  tilde(vb(A)) S_a^(-1) = - vb(B)^*,\
    S_b  tilde(vb(B)) S_b^(-1) = - vb(A)^*
  $
上述论述我们只在自旋量子数为 $a,b$ 对应的子空间进行的.下面我们进入 $(a,b)$ 对应的表示框架，于是定义  $ 
    tilde(vb(A))_(a b) arrow.r tilde(vb(A))_(a) times.o 
    1_(b),\
    tilde(vb(B))_(a b) arrow.r 1_(a) times.o tilde(vb(B))_(b) 
  $
以及  $ 
    U_(a b):= tau (S_a times.o S_b) 
  $
其中 $tau$ 可以交换旋量指标,即  $ 
    tau  (S_a times.o S_b)  tau^(-1) = S_b times.o S_a
  $
因此我们得到  $ 
    U  tilde(vb(A))_(a b) U^(-1) = - tilde(vb(B))_(a b)^*,\
    U  tilde(vb(B))_(a b) U^(-1) = - tilde(vb(A))_(a b)^*
  $
进一步，得到  $ 
    U tilde(D) (Lambda) U^(-1) = 
     tilde(D)^* (Lambda)
  $
因此我们说 $(b,a)$ 是 $(a,b)$ 的复共轭表示.

特别地，对于 $(a,a)$ 表示，我们有  $ 
     U tilde(D) (Lambda) U^(-1) = 
     tilde(D)^* (Lambda)
  $
这里 $U=tau (S_a times.o S_a)$.于是我们有  $ 
    U U^* = S_a S_a^* times.o 
     S_a S_a^*
  $
此时无论 $vb(A)_a$ 是实表示还是赝实表示，当 $S_a$ 分别满足 $S_a S_a^* = plus.minus 1$时，我们都有  $ 
    U U^* = plus.minus 1
  $  
因此我们说 $(a, a)$ 是实表示.

我们可以发现 $(a,b)$ 实际对应自旋 $a$ 的粒子和自旋 $b$ 的粒子的张量积. 表示 $(a,b)$ 的关于_空间旋转_的生成元 $vb(J)$ 是 $frak(s u)(2)$ Lie代数的表示 $a$ 和 $b$ 的直积.于是我们有  $ 
    evaluated(a times.o b  )_(frak(s o)(3))
    = plus.o.big_(j=abs(a-b))^(a+b) j
  $
我们不难验证在维度上这一结果是成立的：
  $ 
    dim (a,b) = 
    (2a+1)(2b+1) = 
    sum_(j=abs(a-b))^(a+b) (2j+1) 
  $
运用类似的思想我们可以得到张量积表示的直和分解：  $ 
    (a_1,b_1) times.o (a_2,b_2) 
    = sum_(a=abs(a_1-a_2))^(a_1+a_2) 
    sum_(b=abs(b_1-b_2))^(b_1+b_2) (a,b)
  $
例如  $ 
    (1/2,0) times.o (0,1/2) = 
    (1/2,1/2) 
  $
其中 $(1/2,0)$ 和 $(0,1/2)$ 分别对应左手Weyl表示和右手Weyl表示，而 $(1/2,1/2)$ 则对应矢量表示.

类似地，  $ 
     (1/2,1/2) times.o (1/2,1/2)
      = (0,0) plus.o (1,0) plus.o (0,1) plus.o (1,1)
  $
其中 $(0,0)$ 对应平凡的标量表示，我们将在后文讨论 $(1,0)， (0,1)$ 
表示以及它们的直和.

下面我们考虑宇称变换  $ 
    cal(P) = diag(1,-1,-1,-1) 
  $
也被纳入到Lorentz群以及它的表示中，其令 $beta = D(cal(P))$,则我们立刻有  $ 
    beta vb(J) beta^(-1) = vb(J),\
    beta vb(K) beta^(-1) = - vb(K)
  $
于是  $ 
    beta vb(A) beta^(-1) = vb(B),\
    beta vb(B) beta^(-1) = vb(A) 
  $
即宇称变换交换了 $vb(A)$ 和 $vb(B)$. 因此若我们希望表示 $D(Lambda)$ 包含宇称变换，则要么去 $(a,a)$ 表示，要么取 $(a,b) plus.o (b,a)$ 的直和表示.
  
  

=== Weyl旋量表示
本小节我们介绍Lorentz群的两个基本表示，即左手Weyl表示 $(1/2,0)$ 和右手Weyl表示 $(0,1/2)$. 这两个表示都是自旋 $1/2$ 的表示，因此我们也称它们为左手旋量和右手旋量. 这两个表示的维数都是 $2$,因此我们可以用一个二分量的旋量来描述它们. 

首先对于左手旋量，我们记作 $psi_a$.此时我们可以取  $ 
    vb(A) &= vb(sigma)/2, \
    vb(B) &= 0 
  $
这里 $vb(sigma)$ 是我们熟悉的Pauli矩阵  $ 
    sigma_1 = mat(
      0,1;
      1,0
    ) ,  
    sigma_2 = mat(
      0,-i;
      i,0
    ) ,
    sigma_3 = mat(
      1,0;
      0,-1
    )
  $
由此，我们得到  $ 
    vb(J) = vb(sigma)/2, \
    vb(K) = -i vb(sigma)/2 
  $
这里我们可以发现 $vb(J)$ 是厄米的，而 $vb(K)$ 是反厄米的. 在该表示下，我们有  $ 
    psi'_a = tensor(D(Lambda),-a,+b) psi_b 
  $
忽略旋量指标，我们取  $ 
    sigma^mu = (1, sigma),
    overline(sigma)^mu  =(1, - sigma) 
  $
于是 $tensor(D(Lambda),-a,+b)$ 生成元可以写作  $ 
    cal(S)_L^(mu nu) = i/4 (sigma^mu overline(sigma)^nu - sigma^nu overline(sigma)^mu) 
  $
   
  



下面我们考虑 $tensor(D(Lambda),-a, +b)$ 的一个等价表示，其可以通过 $i sigma_2$ 得到，具体地，我们定义  $ 
    epsilon^(a b) = 
    (i sigma_2)^(a b) = mat(
      0,1;
      -1,0
    )\ 
    epsilon_(a b) = 
    (-i sigma_2)_(a b) = mat(
      0,-1;
      1,0
    )
  $
注意其中 $ (i sigma_2)^dagger=-i sigma_2$,再注意到  $ 
    sigma_2  (cal((S))_L^(mu nu)) sigma_2 
    &= i/4 
    [
      sigma_2 sigma^mu sigma_2 sigma_2 overline(sigma)^nu sigma_2 -
      sigma_2 sigma^nu sigma_2 sigma_2 overline(sigma)^mu sigma_2
    ]\ 
    &=i/4 
    [
      (overline(sigma)^mu)^T (sigma^nu)^T - 
      (overline(sigma)^nu)^T (sigma^mu)^T 
    ]\ &= -i/4 (cal((S))_L^(mu nu))^T
  $
这里利用了  $ 
    sigma_2 sigma_i sigma_2 = -sigma_i=
    - sigma_i^T 
  $
  
  于是我们有  $ 
    epsilon^(a b) tensor((cal((S))_L^(mu nu)),- b,+c) 
    epsilon_(c d) = - tensor((cal((S))_L^(T mu nu)),+a,-d)
  $
进一步  $ 
     epsilon^(a b) tensor(D(Lambda),- b,+c) 
    epsilon_(c d) = tensor((D(Lambda)^(- T)),+a,-d)
  $
因此我们得到了 $tensor(D(Lambda),-a,+b)$ 的一个等价表示 $tensor((D(Lambda)^(- T)),+a,-b)$. 这个表示对应的旋量记作 $psi^a$,其满足  $ 
    psi'^a = tensor((D(Lambda)^(- T)),+a,-b) psi^b
  $
同时不难发现  $ 
    psi^a = epsilon^(a b) psi_b 
  $
因此，我们将 $epsilon_(a b),epsilon^(a b)$ 称为旋量的度规记号.

下面我们引入旋量的内积  $ 
    psi chi := psi^a chi_a 
  $
在Lorentz变换下  $ 
    psi' chi' = 
      tensor((D(Lambda)^(- T)),+a,-b) psi^b 
      tensor(D(Lambda),-a,+c) chi_c = 
      psi^b tensor(delta,-b,+c) chi_c =
    psi^b chi_b = psi chi
  $
于是 $psi chi$ 是一个Lorentz标量. 值得注意 $epsilon^(a b)$ 的反对称性使得内积缩并不是平凡的：
  $ 
    psi^a = epsilon^(a b) psi_b 
    = - epsilon^(b a) psi_b = -psi_b epsilon^( b a) 
    = psi_b epsilon^(a b) 
  $
然而  $ 
    psi chi = 
    psi^a chi_a = 
    psi_b epsilon^(a b) chi_a =
    - psi_b epsilon^(b a) chi_a =
    - psi_b chi^b 
  $
特别地，  $ 
    psi^a psi_a = - psi_a psi^a 
  $
我们将 $psi_a,chi^a$ 这类满足反交换性质的代数对象称为Grassmann数. 这也是我们在构造自旋 $1/2$ 场算符时引入反对易关系的原因.

值得注意,内积关系满足  $ 
    psi chi = psi^a chi_a =
    -psi_b chi^b chi^b psi_b = chi psi 
  $
于是内积 $psi chi ,chi psi$ 仍是相等的. 

下面我们引入右手旋量 $psi^dagger_(dot(a))$,按照上一节的结论，右手旋量来自共轭表示 $D^* (Lambda)$ 的表示空间. 不难发现对于共轭表示，我们有  $ 
      cal(S)_R^(mu nu) = -i/4 (overline(sigma)^mu
      sigma^nu  - overline(sigma)^mu sigma^nu
      ) 
  $
类似的，我们可以引入度规记号  $ 
    epsilon^(dot(a) dot(b)) =
    mat(
      0,1;
      -1,0
    ) ,
    epsilon_(dot(a) dot(b)) =
    mat(
      0,-1;
      1,0
    )
  $
于是仿照左手旋量的论述，我们有  $ 
    psi^dagger_(dot(a)) = 
    epsilon_(dot(a) dot(b)) psi^(dagger dot(b))
  $
其中 $ psi^(dagger dot(b))$ 来自表示 $tensor(D)^(-dagger) (Lambda)$. 
下面我们定义右手旋量的内积为  $ 
    psi^dagger eta^dagger = 
    psi_(dot(a))^dagger eta^(dagger dot(a)) 
  $
不难发现其也是Lorentz标量且是Grassmann数，即有  $ 
    psi^dagger eta^dagger =  
    psi_(dot(a))^dagger eta^(dagger dot(a)) 
    =- psi^(dagger dot(a)) eta_(dot(a))^dagger
    = eta_(dot(a))^dagger psi^(dagger dot(a)) = eta^dagger
     psi^dagger
  $
这样我们得到  $ 
    (psi eta)^dagger =  
    (psi^a eta_a)^dagger 
    =eta^dagger_(dot(a)) 
    psi^(dagger dot(a)) = eta^dagger psi^dagger 
  $
这个结果与正常数的共轭性质是一致的.
  


=== 高阶表示
利用左，右Weyl旋量我们几乎可以构造所有高自旋的表示.其中矢量场对应于 $(1/2,1/2)$ 表示，Diracc场对应于 $(1/2,0) plus.o (0,1/2)$ 表示. 我们将在后文详细介绍它们.本小节我们主要关心 $(1,0)$ 表示和 $(0,1)$ 表示. 考虑到宇称变换，我们实际更关心它们的直和表示 $(1,0) plus.o (0,1)$. 我们首先考虑矢量场 $A^mu$ 和  $partial_mu$ 的直积，其反对易部分必须写作  $ 
    F_(mu nu) = partial_mu A_nu - partial_nu A_mu 
  $
值得注意，这样的表示允许再耦合一个标量场，这是因为  $ 
    (1/2,1/2) times.o (0,0) equiv 
    (1/2,1/2) 
  $
事实上，考虑 $A_mu$ 的_规范变换_：
  $ 
    A_mu arrow.r A_mu + partial_mu alpha 
  $
利用 $F_(mu nu)$ 的反对称性，我们发现 $F_(mu nu)$ 不受规范变换的影响.
有趣的是在 $d=4$ 维时空中有, 反对称性给出 $F_(mu nu)$ 的独立分量为 $6$,但是 $(1,0) plus.o (0,1)$ 表示给出的粒子最多存在 $3$ 个自旋自由度.即我们通过Lorentz群表示论的方法构造的量子场理论总可能带来冗余的自由度，我们将在后文论述如何消去这些冗余自由度.

最后，我们给出$(1,0) plus.o (0,1)$ 实际是无质量矢量场的一个有效表示. 一般地，对于洛伦兹群有效表示 $(A,B)$,我们姑且用 $ket(k\,sigma_A\,sigma_B)$ 表示它的标准单粒子态. 为了消除XOY平面平移带来的自由度，我们要求  $ 
    J_y+ K_x ket(k\,sigma_A\,sigma_B) = 0\ 
    -J_x+K_y ket(k\,sigma_A\,sigma_B) = 0
  $
进一步，引入  $ 
    L_+ =J_y+ K_x + i(-J_x+K_y)\ 
    L_- =J_y+ K_x - i(-J_x+K_y)  
  $
我们注意到在幺正表示下，取  $ 
    vb(N) = vb(J) + i vb(K)\ 
    vb(N)^dagger = vb(J) - i vb(K) 
  $
则  $ 
    N_+  = J_x + i J_y + i (K_x + i K_y) = i L_+\
    N^dagger_-  = J_x - i J_y - i (K_x - i K_y) = -i L_-
  $
即  $ 
    N_+  ket(k\,sigma_A\,sigma_B) = 0\
    N^dagger_-  ket(k\,sigma_A\,sigma_B) = 0
  $
这要求螺旋度必须取为 $sigma_A-sigma_B$ 的形式. 因此当我们用 $(A,B)$ 描述无质量粒子时，其螺旋度为 $A-B$. 对于 $(1,0) plus.o (0,1)$ 表示，它可以描述螺旋度为 $plus.minus 1$ 的无质量粒子. 值得注意，该表示只有两个自由度，当我们直接用 $A^mu$ 描述时，我们总要消去一些非物理的自由度. 
  



== 自由标量场

=== 自由标量场的路径积分
满足Klein-Gordon方程的自由标量场的拉氏量可以写作  $ 
    cal(L) &= -1/2 partial_mu phi partial^mu phi - 1/2 m^2 phi^2\ 
    &=-1/2 phi (-partial^2 + m^2) phi
  $
我们考虑场对应的路径积分  $ 
    Z[J] &= 
    integral D phi exp[i integral dd(x) (cal(L) + J phi)] \ 
    &= integral D phi exp[-i/2 integral dd(x) [phi (-partial^2 + m^2) phi + J phi]] \ 
    &= exp[i/2 integral dd(x) dd(y)  
      J(x) Delta_F (x-y) J(y) 
    ]
  $
最后一步利用了@eq:gaussian_functional_integral.
其中 $Delta_F (x-y) $ 满足  $ 
      (-partial^2 + m^2) Delta_F (x-y) = delta^4 (x-y)
  $ 
利用泛函导数得到  $ 
    braket(0,bf(T)phi(x) phi(y),0) 
    = (1/i)^2 evaluated((delta^2 Z[J])/(delta J(x) delta J(y)))_(J=0)\ 
    =1/i Delta_F (x-y)
  $
上述结果可以进一步推广为：
  $ 
      braket(0,bf(T)phi(x_1) dots.c phi(x_n)phi(y_1)dots.c phi(y_n),0) 
      &= 1/i^n sum_(pi)
      product_(i=1)^n Delta_F (x_i-y_(pi(i)))
  $
其中 $pi$ 是 $n$ 个元素的置换. 该结果被称为Wick定理.
  
  

== 自由Dirac场

== Clifford代数
自由Dirac场 $psi(x)$ 来自于Lorentz群的$(1/2,0) plus.o (0,1/2)$ 表示，我们不妨称为Dirac表示，其生成元为  $ 
    cal(S) = mat(
      S_L^(mu nu),0;
      0, S_R^(mu nu)
    ) = i/4 mat(
      sigma^mu overline(sigma)^nu - sigma^nu overline(sigma)^mu,0;
      0, overline(sigma)^mu sigma^nu  - overline(sigma)^nu sigma^mu
    )
  $
为了给出该表示的一般性质，我们引入 $gamma^mu$ 矩阵  $ 
    gamma^mu = mat(
      0, sigma^mu;
      overline(sigma)^mu,0
    ) 
  $
其满足  $ 
   cal(S)^(mu nu) = i/4 [gamma^mu, gamma^nu]  
  $
其满足Clifford代数关系  $ 
    {gamma^mu, gamma^nu} = -2 g^(mu nu) 
  $
进一步，我们有  $ 
    [cal(S)^(mu nu), gamma^rho] = i (g^(nu rho) gamma^mu - g^(mu rho) gamma^nu) 
  $
于是它给出 $gamma^mu$ 满足Lorentz协变性：
  $ 
    D^(-1) (lambda) gamma^mu D(Lambda) = tensor(Lambda,+mu,-nu) gamma^nu   
  $
类似地  $ 
     D^(-1) (lambda) cal(S)^(mu nu ) D(Lambda) = tensor(Lambda,+mu,-rho) 
     tensor(Lambda,+nu, - sigma) cal(S)^(rho sigma)
  $
我们也记 $beta=gamma^0$,于是我们发现  $ 
    beta gamma^i beta = -gamma^i\ 
    beta gamma^0 beta = gamma^0  
  $
进一步  $ 
     beta cal(S)^(i j) beta = cal(S)^(i j)\ 
     beta cal(S)^(i 0) beta = -cal(S)^(i 0)\ 
  $
此外，我们发现 $gamma^mu,cal(S)^(mu nu)$ 尽管都不是幺正的，但是其满足  $ 
    beta  (gamma^mu)^dagger beta = gamma^mu\
    beta (cal(S)^(mu nu))^dagger beta = cal(S)^(mu nu)
  $
于是对于Lorentz变换，我们有  $ 
    beta D^dagger (Lambda) beta =  D^(-1) (Lambda)
  $<eq:Dirac_pseudo_unitary>
我们称其为_赝幺正关系_

为了方便，我们再引入  $ 
    gamma^5 = i gamma^0 gamma^1  gamma^2 gamma^3  = mat(
      -1,0;
      0,1
    )
  $
我们容易发现  $ 
    gamma_5^dagger = gamma_5\ 
    gamma_5^2 = 1\ 
    {gamma^mu, gamma_5} = 0
  $
此外，由于  $ 
    beta gamma^5 beta = - gamma^5\
    [cal(S)^(mu nu), gamma^5] = 0
  $
我们称 $gamma_5$ 是_赝标量_.  
  
   

另一个重要的矩阵是
  $ 
    cal(C) = 
    mat(-epsilon^(a b),0;0,-epsilon_(dot(a) dot(b))) =
    mat(
      0, 1, 0,0;
      -1,0,0,0;
      0,0,0,-1;
      0,0,1,0
    )
  $
其满足  $ 
    cal(C) gamma^5 cal(C)^(-1) = gamma^5\ 
    cal(C) gamma^mu cal(C)^(-1) = - (gamma^mu)^T\ 
    cal(C) cal(S)^(mu nu) cal(C)^(-1) = - (cal(S)^(mu nu))^T 
  $

本节最后，我们梳理一些 $gamma^mu$ 矩阵的典型结果：

#prop()[
    $ 
      beta bf(1) beta = bf(1) \ 
      beta (i gamma_5) beta = i gamma_5\
      beta gamma^0 beta = gamma^0\
      beta gamma^i beta = - gamma^i\ 
      beta gamma^0 gamma_5  beta = - gamma^ gamma_5 0\ 
      beta gamma^i gamma_5  beta = gamma^i gamma_5 
    $<eq:gamma_matrix_properties_P>
]  

#prop()[
    $ 
      cal(C) bf(1) cal(C)^(-1) = bf(1)\ 
      cal(C) (i gamma_5) cal(C)^(-1) = i gamma_5\ 
    cal(C) (gamma^mu) cal(C)^(-1) = - (gamma^mu)^T\
    cal(C) (gamma^mu gamma_5) cal(C)^(-1) = (gamma^mu gamma_5)^T
    $<eq:gamma_matrix_properties_C>
] 

更复杂的，我们有#prop()[
      $ 
      gamma_5 cal(C) bf(1)^* cal(C)^(-1) gamma_5 = bf(1)\ 
       gamma_5cal(C) (i gamma_5)^* cal(C)^(-1)  gamma_5 = -i gamma_5\ 
    gamma_5  cal(C) (gamma^0)^* cal(C)^(-1)  gamma_5=  gamma^0 \ 
        gamma_5  cal(C) (gamma^i)^* cal(C)^(-1)  gamma_5= - gamma^i \ 
         gamma_5  cal(C) (gamma^0 gamma_5)^* cal(C)^(-1)  gamma_5=  gamma^0 \ 
        gamma_5  cal(C) (gamma^i gamma_5)^* cal(C)^(-1)  gamma_5= - gamma^i
    $<eq:gamma_matrix_properties_T>
] 


=== Dirac场的结构
下面我们考察Dirac场的具体结构，我们取其为  $ 
    psi_l (x) =  sum_(s = plus.minus ) integral dd(p,3)/((2pi)^3 2 E_vb(p)) 
   [ u_l (vb(p),s)  
    a_(vb(p),s) e^(i p x)
    + v_l (vb(p),s)   
    b^dagger_(vb(p),s) e^(-i p x)]
  $
此处 $u_l,v_l$ 是 $4-$ 旋量，代入@eq:ulvl_rotation_transformation，我们可以将其分解为 $2-$ 旋量的形式  $ 
    sum_(sigma') u_(l plus.minus ) (vb(p),sigma') bf(J)^((1\/2))_(sigma',sigma)  
    &= sum_(l') 1/2 vb(sigma)_(l l') u_(l' plus.minus ) (0,sigma)\ 
    sum_(sigma') v_(l plus.minus ) (vb(p),sigma') bf(J)^(*(1\/2))_(sigma',sigma) 
    &= -sum_(l') 1/2 vb(sigma)_(l l') v_(l' plus.minus ) (0,sigma)
  $
注意到 $bf(J)^((1\/2))_(sigma',sigma),bf(J)^(*(1\/2))_(sigma',sigma) $ 和 $1/2 vb(sigma)$ 只相差一个相似变换，于是我们取  $ 
     bf(J)^((1\/2)) &= 1/2 vb(sigma),\
      bf(J)^(*(1\/2)) &= -1/2 sigma_2 vb(sigma) sigma_2
  $
由此我们解出  $ 
    u_(l plus.minus ) (0, sigma) &=sqrt(m) c_(plus.minus  ) delta_(m,sigma)\ 
    v_(l plus.minus ) (0, sigma) &=sqrt(m) -i d_(plus.minus  ) (sigma_2)_(m,sigma) 
  $
下面我们用 $+,-$ 分别标记 $sigma=plus.minus  1/2$,于是上式等价于  $ 
    u_+ (vb(0)) &=sqrt(m)  mat(c_+;0;c_-;0),
    u_- (vb(0)) &=sqrt(m)  mat(0;c_+;0;c_-),\
    v_+ (vb(0)) &= sqrt(m) mat(0;d_+;0;d_-),
    v_- (vb(0)) &=sqrt(m)  -mat( d_+;0; d_-;0)
  $
对于有限动量态，我们有  $ 
    u_plus.minus  (vb(p)) = D(L(p)) u_plus.minus  (vb(0)),\
    v_plus.minus  (vb(p)) = D(L(p)) v_plus.minus  (vb(0)) 
  $
为了让 $psi_l$ 具有空间反演对称性，我们首先注意到  $ 
    P a(vb(p),sigma) P^(-1) = eta^* a(-vb(p),sigma),\ 
    P b^dagger(vb(p),sigma) P^(-1) = eta^c b^dagger(-vb(p),sigma)
  $
于是我们有
  $ 
    P psi_l (x) P^(-1)  
    = sum_(sigma = plus.minus ) integral tilde(dd(vb(p)))
    [
      eta^* u_l (-vb(p),s) a_(vb(p),s) e^(i p (cal(P)x))
      + eta^c v_l (-vb(p),s) b^dagger_(vb(p),s) e^(-i p (cal(P)x))
    ]
  $
注意到  $ 
    gamma^0 scr(S)^(i 0) gamma^0 = - scr(S)^(i 0)
  $
于是
  $ 
     u_plus.minus  (vb(-p)) = beta D(L(p)) beta u_plus.minus  (vb(0)),\
    v_plus.minus  (vb(-p)) =beta D(L(p)) beta v_plus.minus  (vb(0))  
  $
其中 $beta=gamma^0$. 
由此如果 $u_plus.minus (0),v_plus.minus (0) $ 正好是 $beta$ 的本征向量，即  $ 
    beta u_plus.minus (0) = b_u  u_plus.minus  (0),\
    beta v_plus.minus (0) = b_v  v_plus.minus  (0) 
  $
其中 $b_u^2=b_v^2=1$, 现在我们就有  $ 
    P psi_l (x) P^(-1) =  sum_(sigma = plus.minus ) integral tilde(dd(vb(p)))
    [
      eta^*  b_u  beta _l (vb(p),s) a_(vb(p),s) e^(i p x)
      + eta^c b_v beta v_l (vb(p),s) b^dagger_(vb(p),s) e^(-i p x)
    ]
  $<eq:dirac_field_parity_transformation01>
下面我们考察和式：
  $ 
    N(0) = sum_sigma u_l (0,sigma) u_l'^* (0,sigma) =m (1+b_u beta)\ 
    M(0) = sum_sigma v_l (0,sigma) v_l'^* (0,sigma) = m (1+b_v beta)
  $
进一步  $ 
    N(vb(p)) =  sum_sigma u_l (p,sigma) u_l'^* (p,sigma)
    = m/2D(L(p))(1+b_u beta) D^dagger (L(p))\
    M(vb(p)) =  sum_sigma v_l (p,sigma) v_l'^* (p,sigma)
    = m/2 D(L(p))(1+b_v beta) D^dagger (L(p))
  $
注意到  $ 
    D(L(p)) beta D^dagger (L(p)) = beta 
  $
进一步，
    $ 
      \ 
      D(L(p))  D^dagger (L(p)) &=  D(L(p))  beta D^(-1) (L(p)) beta 
      \ 
      &= [ D(L(p))  gamma^0 D^(-1) (L(p)) ] beta \
      &= 
      tensor(L(p),-mu,+0) gamma^mu beta \
      &=-p_mu/m gamma^mu beta
  $
其中最后一步利用了@eq:standard_Lorentz_transformation. 至此我们得到  $ 
      N(vb(p))  = sum_sigma u_l (p,sigma) u_l'^* (p,sigma) 
      = [-slashed(p)+b_u m] beta\
      M(vb(p))  = sum_sigma v_l (p,sigma) v_l'^* (p,sigma)
      = [-slashed(p)+b_v m] beta
  $
进一步，我们引入  $ 
    overline(u)_plus.minus  (vb(p),sigma) = u^dagger_plus.minus  (vb(p),sigma) beta,\
    overline(v)_plus.minus  (vb(p),sigma) = v^dagger_plus.minus  (vb(p),sigma) beta 
  $
于是有  $ 
    N'(vb(p)) = sum_sigma u_l (p,sigma) overline(u)_l' (p,sigma)
    = -slashed(p)+b_u m\
    M'(vb(p)) = sum_sigma v_l (p,sigma) overline(v)_l' (p,sigma)
    = -slashed(p)+b_v m 
  $
类似引入共轭场算符  $ 
    overline(psi)_l (x) = psi^dagger_l (x) beta = 
    sum_(sigma = plus.minus ) integral tilde(dd(vb(p)))
    [
      overline(u)_l (vb(p),s) a^dagger_(vb(p),s) e^(-i p x)
      +  overline(v)_l (vb(p),s) b_(vb(p),s) e^(i p x)
    ] 
  $
此时我们考虑对易关系  $ 
    [psi_l (x), overline(psi)_m (y)]_(minus.plus ) = 
    integral dd(vb(p),3)/((2pi)^3 2 E_vb(p))
    [
      (-i slashed(partial)+b_u m)_(l m) e^(i p (x-y)) minus.plus 
      (-i slashed(partial)+b_u m)_(l m) e^(-i p (x-y))
    ]  
  $
注意到  $ 
    Delta_(+) (x-y) = 
    integral dd(vb(p),3)/((2pi)^3 2 E_vb(p)) e^(i p (x-y)) 
  $
在类空时是偶函数，则 $partial_mu  Delta_(+) (x-y)$在类空时是积函数，为此我们必须将对易关系取为费米子型对易关系，且取
 $b_u=-b_v = -1$,则有  $ 
     psi_l (x) = 
     integral tilde(dd(vb(p),3)) 
      sum_(sigma = plus.minus ) 
      [
        u_l (vb(p),s)  
        a_(vb(p),s) e^(i p x)
        + v_l (vb(p),s)   
        b^dagger_(vb(p),s) e^(-i p x)]\ 
    overline(psi)_l (x) =
      integral tilde(dd(vb(p),3)) 
        sum_(sigma = plus.minus ) 
        [
          overline(u)_l (vb(p),s) a^dagger_(vb(p),s) e^(-i p x)
          +  overline(v)_l (vb(p),s) b_(vb(p),s) e^(i p x)
        ]\
   $<eq:dirac_field_expansion>
     
=== Dirac 旋量
本节我们给出Dirac旋量 $u_plus.minus  (vb(p)), v_plus.minus  (vb(p))$ 的一般性质，首先注意到  $ 
    beta u_plus.minus (vb(0)) = u_plus.minus (vb(0)),\
    beta v_plus.minus (vb(0)) = - v_plus.minus (vb(0)) 
  $
对于第一个等式，我们有  $ 
   [D(L(p)) beta  D^(-1)(L(p))] D(L(p)) u_plus.minus  (vb(0)) = u(vb(p))
  $
即 $u_plus.minus  (vb(p))$ 是 $ [D(L(p)) beta  D^(-1)(L(p))] =-slashed(p)\/m beta$ 的本征向量，且其本征值为 $+1$. 同样地，$v_plus.minus  (vb(p))$ 是 $-slashed(p)\/m beta$ 的本征向量，且其本征值为 $-1$. 上述本征方程也可以写作  $ 
    (slashed(p)+ m ) u_plus.minus  (vb(p)) = 0,\
    (-slashed(p) +  m ) v_plus.minus  (vb(p)) = 0 
  $<eq:dirac_spinor_eigenvalue_equation>
我们也可以将其看作Dirac粒子的 on-shell条件. 由此，我们还可以得到@eq:dirac_field_expansion 中场算符满足Dirac方程：
  $ 
    (-i slashed(partial)+m) psi_l (x) = 0 
  $<eq:dirac_field_equation>
对@eq:dirac_spinor_eigenvalue_equation 取厄米共轭，我们得到Dirac共轭旋量满足:
  $ 
    overline(u)_(plus.minus ) (vb(p)) (slashed(p)+ m ) = 0,\
    overline(v)_(plus.minus ) (vb(p)) (-slashed(p) +  m ) = 0 
  $
于是共轭Dirac场满足  $ 
    overline(psi)_l  (i slashed(partial)+m) = 0
  $<eq:dirac_conjugate_field_equation>
我们上节给出了旋量 $u,v $的完备关系：
  $ 
    sum_sigma u_sigma (vb(p)) overline(u)_sigma (vb(p)) = -slashed(p)+m,\
    sum_sigma v_sigma (vb(p)) overline(v)_sigma (vb(p)) = -slashed(p)-m 
  $<eq:dirac_spinor_completeness>
类似的我们有Dirac旋量的正交归一化关系：
  $ 
    overline(u)_sigma (vb(p)) u_sigma' (vb(p)) &= 2 m delta_(sigma sigma'),\
    overline(v)_sigma (vb(p)) v_sigma' (vb(p)) &= -2 m delta_(sigma sigma'),\
    overline(u)_sigma (vb(p)) v_sigma' (vb(p)) &= 0
  $<eq:dirac_spinor_orthonormality>
进一步，我们有  $ 
     overline(u)_sigma (vb(p)) gamma^mu  u_sigma' (vb(p)) &= 2 p^mu delta_(sigma sigma'),\ 
    overline(v)_sigma (vb(p)) gamma^mu  v_sigma' (vb(p)) &= 2 p^mu delta_(sigma sigma'),\
  $<eq:dirac_spinor_current1>
     

=== Dirac场的路径积分
满足Dirac方程@eq:dirac_field_equation,@eq:dirac_conjugate_field_equation 的自由Dirac场的拉氏量可以写作  $ 
    cal(L) &= overline(psi) (i slashed(partial)-m) psi\ 
    &=-overline(psi) (-i slashed(partial)+m) psi\ 
  $
于是Dirac场的路径积分  $ 
     Z[overline(eta), eta] &=
      integral cal(D) psi cal(D) overline(psi)
      exp[i integral dd(x) (cal(L) + overline(eta) psi + overline(psi) eta)] \
      &=exp[
        i integral dd(x) dd(y)
        overline(eta) (x) S_F (x-y) eta(y)
      ]
  $ 
第二步利用了@eq:gaussian_integral_grassmann. 
其中 $S_F (x-y)$ 满足  $ 
    (-i slashed(partial)_x + m) S_F (x-y) = delta^4 (x-y)
  $
由此我们得到  $ 
    braket(0,bf(T) psi(x) overline(psi)(y),0) 
    = (1/i)^2 evaluated(
      dv(, overline(eta)(x),d:delta)  Z[overline(eta), eta] dv(, eta(y),d:delta)
    )_(overline(eta)=eta=0)\ 
    =1/i S_F (x-y)
  $

我们也可以将该结果进行推广到一般形式：
  $ 
    braket(0,bf(T) psi(x_1) dots.c psi(x_n) overline(psi)(y_1) dots.c overline(psi)(y_n),0) 
    &=(1/i)^(2n)  evaluated(dv(, overline(eta) (x_1),d:delta)   dv(, overline(eta) (x_n),d:delta) 
    Z[overline(eta),eta]   dv(, eta(y_1),d:delta) 
    dots.c dv(, eta(y_n),d:delta))_(overline(eta)=eta=0)\ 
    &= (1/i)^(n) sum_(pi) (-1)^(pi) product_(i=1)^n S_F (x_i-y_(pi(i)))
  $
  

== 自由矢量场

=== 有质量矢量场的路径积分
对于有质量矢量场，我们将其作用量写作规范固定后的形式  $ 
    S = integral dd(x) [-1/4 F_(mu nu) F^(mu nu) - 1/2 m^2 A_mu A^mu - 1/(2 xi) (partial_mu A^mu)^2]
  $<eq:massive_vector_field_action>
我们可以丢去所有散度项得到二次形  $ 
    S = integral dd(x,4) #h(0.3em)
   { -1/2 A_mu [g^(mu nu) (-partial^2+m^2)+(1-1/xi) partial^mu partial^nu] A_nu }
  $
此时 $A^mu$ 的运动方程是  $ 
    [g_(mu nu) (-partial^2+m^2)+(1-1/xi) partial_mu partial_nu] A^nu (x) = 0
  $
等式两边再取散度得到  $ 
     (-partial^2 + xi m^2) partial_mu A^mu (x) = 0
  $
则我们可以我们将 $Phi(x)=partial_mu A^mu$ 看作质量为 $sqrt(xi) m$ 的标量场. 因此， @eq:massive_vector_field_action 在路径积分不存在自由度冗余，那么  $ 
     Z[J] = 
     integral cal(D) A exp[i S + i integral dd(x) J_mu A^mu]
      = exp[i/2 integral dd(x) dd(y) J_mu (x) D^(mu nu) (x-y) J_nu (y)]
  $
其中#footnote()[见@prob:propagator_Vector]  $ 
    D_(mu nu ) (x) = 
    integral dd(p,4)/(2pi)^4 e^(i p x) /(p^2+m^2-i epsilon) 
    [
      g_(mu nu)
      +(xi-1) ( p_mu p_nu)/(p^2+xi m^2-i epsilon)
    ]
  $<eq:massive_vector_field_propagator>
当 $m->0$ 时，我们可以得到无质量矢量场的传播子  $ 
    D_(mu nu)^"photon" (x) = 
      integral dd(p,4)/(2pi)^4 e^(i p x) /(p^2-i epsilon) 
    [
      g_(mu nu)
      +(xi-1) ( p_mu p_nu)/(p^2-i epsilon)
    ]
  $
注意 $S-$ 矩阵是规范不变的，于是我们可以选择不同的规范参数 $xi$ 来计算 $S-$ 矩阵元素，最终结果应该是相同的. 例如在Feynman规范 $xi=1$ 下，传播子简化为  $ 
    D^"photon"_(mu nu) (x) = 
    integral dd(p,4)/(2pi)^4 g_(mu nu)/(p^2+m^2-i epsilon)  e^(i p x)
  $ 
对于 $xi=0$, 我们称为Landau规范，此时传播子为  $ 
    D^"photon"_(mu nu) (x) = 
    integral dd(p,4)/(2pi)^4 e^(i p x) /(p^2-i epsilon) 
    [
      g_(mu nu)
      - ( p_mu p_nu)/(p^2-i epsilon)
    ]
  $
对于有质量矢量场，取 $xi arrow.r oo$ 时，传播子变为  $ 
    D_(mu nu) (x) = 
    integral dd(p,4)/(2pi)^4 e^(i p x) /(p^2+m^2-i epsilon) 
    [g_(mu nu)+
    ( p_mu p_nu)/(p^2+m^2-i epsilon)
    ]
  $

  
   

== 无质量矢量场



== 自由传播子
为了给出不同时空处场算符的关联，我们引入_传播子_:
  $ 
    1/i Delta_(l m) := 
    braket(0,bf(T) psi_l (x) psi^dagger_m (x),0) 
  $
注意该定义对于相互作用场和自由场都是适用的，本节我们只考虑自由场的情形.我们首先注意到
  $ 
     braket(0,bf(T) psi_l (x) psi^dagger_m (x),0)  &= 
     theta(x^0-y^0) braket(0, psi_l (x) psi^dagger_m (y),0) 
     plus.minus  theta(y^0-x^0) braket(0, psi^dagger_m (y) psi_l (x),0)\ 
     &=theta(x^0-y^0) braket(0, psi^+_l (x) psi^(+ dagger)_m (y),0) 
     plus.minus  theta(y^0-x^0) braket(0, psi^(-dagger)_m (y) psi^-_l (x),0)\ 
     &=theta(x^0-y^0) braket(0, [psi^+_l (x), psi^(+ dagger)_m]_(minus.plus ) ,0) plus.minus 
      theta(y^0-x^0) braket(0, [psi^(-dagger)_m (y), psi^-_l (x)]_(minus.plus ) ,0)
  $
其中第一步利用了时序乘积的定义，第二步利用了 $psi^+,psi^(- dagger)$ 会湮灭真空. 进一步，我们可以得到
  $ 
     braket(0, [psi^+_l (x), psi^(+ dagger)_m]_(minus.plus ) ,0) &= 
     integral tilde(dd(p,3)) 
     sum_(sigma) u_l (vb(p),sigma) u_m^* (vb(p),sigma) e^(i p (x-y))\
      braket(0, [psi^(-dagger)_m (y), psi^-_l (x)]_(minus.plus ) ,0) &=
      integral tilde(dd(p,3))
      sum_(sigma) v_l (vb(p),sigma) v_m^* (vb(p),sigma) e^(-i p (x-y))
  $
利用@eq:spin_sum_Plm，我们有  $ 
      braket(0,bf(T) psi_l (x) psi^dagger_m (x),0)  &= 
      theta(x^0-y^0) + P_(l m) (1/i partial_x) Delta_(+) (x-y)\ 
      & +
      theta(y^0-x^0)  P_(l m) (1/i partial_x) Delta_(+) (y-x)\ 
      &= P_(l m) (1/i partial_x) (-i) Delta_"F" (x-y)
  $<eq:free_propagator1>
其中  $ 
     - i Delta_"F" (x-y) = 
      theta(x^0-y^0) Delta_(+) (x-y) +
      theta(y^0-x^0) Delta_(+) (y-x)
  $
称为Feynman传播子. 注意到 $theta(t)$ 可以利用如下复积分表示#footnote()[见@prob:theta_t]：
  $ 
    theta(t) = -1/(2pi i) integral_(- oo)^oo 
    dd(s) e^(-i s t) / (s + i epsilon)  
  $<eq:theta_integral_representation>
由此，我们可以将 $Delta_F$ 写作  $ 
   Delta_F (x-y) = 
   -1/(2pi)^4 integral dd(s) integral  dd(vb(p),3)/(2 E_vb(p)) 
   [
    e^(i p (x-y)-i s t)/(s+i epsilon) +
    e^(-i p (x-y)+i s t)/(s+i epsilon)
   ]  
  $
我们取  $ 
    vb(q) equiv vb(p), q^0 equiv s+p^0  
  $
则有  $ 
        Delta_F (x-y) &= 
   -1/(2pi)^4 integral dd(q,4) e^(i q (x-y))/(2 E_vb(q))
   [
1/(q^0-sqrt(vb(q)^2+m^2)+i epsilon) +1/ (-q^0-sqrt(vb(q)^2+m^2)+i epsilon)
   ]\ 
   &=1/(2pi)^4 integral dd(q,4) e^(i q (x-y))/(q^2 + m^2 - i epsilon)
  $
注意Feynman传播子的动量一般是off-shell，且其存在极点 $q^2=-m^2.$ 事实上， $Delta_F$ 恰是Klein-Gordon方程的逆：
  $ 
    (partial^2 - m^2) Delta_F (x-y) = - delta^4 (x-y)
  $
  

将Feynman传播子代入@eq:free_propagator1,我们得到  $ 
     Delta_(l m) (x-y) &= 
    P_(l m) (-i partial_x)  
    1/(2pi)^4 integral dd(q,4) e^(i q (x-y))/(q^2 + m^2 - i epsilon) \ 
    &= 1/(2pi)^4 integral dd(q,4) (P_(l m) (q))/(q^2 + m^2 - i epsilon)
    e^(i q (x-y))
     \ 
  $
下面我们考虑 $Delta_(l m) (x)$ 的Fourier变换：
  $ 
    Delta_(l m) (p) &= 
    integral dd(x,4) e^(-i p x) Delta_(l m) (x) =
      1/(2pi)^4 integral dd(q,4) integral dd(x,4) (P_(l m) (q))/(q^2 + m^2 - i epsilon)
    e^(i (q-p) x)\ 
    &=(P_(l m) (p))/(p^2 + m^2 - i epsilon)
  $
对于标量场，由于 $u=v equiv 1,$则有  $ 
    P_(l m) =1  
  $
对于Dirac场， $ 
    P_(l m) (p) = sum_sigma u_l (vb(p),sigma) u_m^* (vb(p),sigma) =
    (- slashed(p)+m)beta 
  $

  

== 标量场的C,P,T变换
== 旋量场的C,P,T变换

=== 空间反演对称
@eq:dirac_field_parity_transformation01 以及 $b_u=-b_v=-1$ 要求体系满足空间反演对称必须有  $ 
    eta^* = -eta^c 
  $
为此，我们约定 $eta = eta^c=-i$,则有  $ 
    P psi (x) P^(-1) = eta^* beta psi(cal(P) x)
  $ <eq:dirac_field_parity_transformation02>
其中我们发现 $D((cal(P))) =beta$ 就是旋量空间的空间反演矩阵.

考虑质心系下的一对正反Dirac粒子：
  $ 
    ket(Psi) =  integral tilde(dd(vb(p))) f(vb(p))
    a^dagger_sigma (vb(p)) b^dagger_sigma' (-vb(p)) ket(0)
  $
于是我们有  $ 
    P ket(phi) &= 
    integral tilde(dd(vb(p))) f(vb(p)) 
    [P a^dagger_sigma (vb(p)) P^(-1)] [P b^dagger_sigma' (-vb(p)) P^(-1)] ket(0) \
    &=eta eta^c  integral tilde(dd(vb(p))) f(vb(p))
    a^dagger_sigma (vb(-p)) b^dagger_sigma' (vb(p)) ket(0)\ 
    &=(-1)  integral tilde(dd(vb(p))) f(vb(-p))
    a^dagger_sigma (vb(p)) b^dagger_sigma' (vb(-p)) ket(0)\ 
    &= (-1) (-1)^l ket(phi)
  $
其中 $l$ 是波函数 $f(vb(p))$ 的角动量. 由此我们得到正反Dirac粒子得到的束缚态内禀宇称是 $-1$.

下面我们考虑Dirac双线形：
  $ 
    overline(psi) A psi$.其中 $A$ 是由 $bf(1), i gamma_5, gamma^mu, gamma^mu gamma_5$ 线性组合而成的矩阵.不难发现
      $ 
        P overline(psi) A psi P^(-1) = 
        overline(psi)( beta A beta)  psi 
      $
利用@eq:gamma_matrix_properties_P，我们有
#prop()[
    $ 
        P overline(psi)  psi P^(-1) = overline(psi)  psi\ 
        P overline(psi) i gamma_5 psi P^(-1) = - overline(psi)  i gamma_5 psi\
        P overline(psi) gamma^mu psi P^(-1) = tensor(cal(P),-nu,+mu)   overline(psi) gamma^nu psi\
        P overline(psi) gamma^mu gamma_5 psi P^(-1) = - tensor(cal(P),-nu,+mu)   overline(psi) gamma^nu gamma_5 psi
    $
注意其中 $overline(psi) i gamma_5 psi, gamma^mu gamma_5$ 分别是赝标量和轴矢量.
]   

=== 荷共轭变换
下面我们考虑荷共轭算符，其满足  $ 
    C a^dagger (vb(p),sigma) C^(-1) = eta b^dagger (vb(p),sigma),\
    C b^dagger (vb(p),sigma) C^(-1) = eta^c a^dagger (vb(p),sigma)
  $
于是我们有  $ 
    C psi (x) C^(-1) = 
    integral tilde(dd(vb(p)))
    sum_sigma 
    [
      eta^* u (vb(p),sigma) b (vb(p),sigma) e^(i p x) + 
      eta^c v (vb(p),sigma) a^dagger (vb(p),sigma) e^(-i p x)
    ]\
  $
注意到  $ 
    u (vb(p),sigma) = cal(C) overline(v)_s^T\ 
    v (vb(p),sigma) = cal(C) overline(u)_s^T 
  $<eq:dirac_spinor_charge_conjugation>
于是我们得到  $ 
      C psi (x) C^(-1) = cal(C) overline(psi)^T (x)\ 
      C overline(psi) (x) C^(-1) =  psi^T (x)cal(C)\ 
  $
下面我们考虑双线形：
  $ 
     C overline(psi) A psi C^(-1) =  psi^T cal(C) A  cal(C) overline(psi)^T  =
     overline(psi) [cal(C)^(-1) A^T cal(C)] psi
  $
其中我们利用了  $ 
    cal(C)^(-1) = cal(C)^T = - cal(C) 
  $
利用@eq:gamma_matrix_properties_C，我们有
#prop()[
    $ 
     C overline(psi)  psi C^(-1) = overline(psi)  psi\ 
     C overline(psi) i gamma_5 psi C^(-1) =+ overline(psi)  i gamma_5 psi\
     C overline(psi) gamma^mu psi C^(-1) = - overline(psi) gamma^mu psi\
     C overline(psi) gamma^mu gamma_5 psi C^(-1) = + overline(psi) gamma^mu gamma_5 psi
    $
]

=== 时间反演对称
  
== 矢量场的C,P,T变换
  
  
  




== 习题



#prob()[
  对于有质量Dirac粒子，求解本征方程@eq:dirac_spinor_eigenvalue_equation.
] 

#prob()[
  证明正交关系@eq:dirac_spinor_orthonormality. 
]

#prob()[
  证明Gordon恒等式：  $ 
      2 m overline(u)_sigma (vb(p')) gamma^mu u_sigma' (vb(p)) =
      overline(u)_sigma (vb(p')) ( (p'+p)^mu - 2 i sigma^(mu nu) (p'-p)_nu ) u_sigma' (vb(p))\ 
      -2 m overline(v)_sigma (vb(p')) gamma^mu v_sigma' (vb(p)) =
      overline(v)_sigma (vb(p')) ( (p'+p)^mu - 2 i sigma^(mu nu) (p'-p)_nu ) v_sigma' (vb(p))
    $
  从而证明@eq:dirac_spinor_current1
]

#prob()[
  证明@eq:dirac_spinor_charge_conjugation
]

#prob()[
  证明一对正反Dirac粒子构成的束缚态在色共轭下是奇的，而不是偶的.
]



#prob(label: <prob:theta_t>)[证明@eq:theta_integral_representation.
  ]

#prob(label: <prob:propagator_Vector>)[证明
  @eq:massive_vector_field_propagator
  ]
#sol()[
  注意到算子 $(-partial^2+m^2) g_(mu nu )+(1-1/xi) partial_mu partial_nu$ 在动量空间是
   $square_(mu nu) = (p^2+m^2) g_(mu nu ) - (1-1/xi) partial_mu partial_nu $，此外 $D_(mu nu) (x)$ 在动量空间是  $ 
       D_(mu nu) (p) =  1/(p^2+m^2-i epsilon) 
    [
      g_(mu nu)
      +(xi-1) ( p_mu p_nu)/(p^2+xi m^2-i epsilon)
    ]
     $
    因此我们需要证明  $ 
         square^(mu nu) D_(nu rho) = tensor(delta,+mu,-rho)
      $
      
] 


