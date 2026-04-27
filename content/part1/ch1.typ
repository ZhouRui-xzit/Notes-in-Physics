#import "../../lib.typ":*

= 广义协变性与微分同胚不变性


== 等效原理与广义协变性
区别于狭义相对论, 广义相对论认为Lorentz惯性系不是全局的, 而是局部的. 这一点被论述为_等效原理_: 时空上任意一点可以选取一个_局部_惯性系, 使得在该点及其的物理规律与狭义相对论中的物理规律_几乎_相同.

既然Lorentz对称性不再是全局的, 度规张量也不再是时空的不变量，我们将其记作 $g_(mu nu)$,从而区分于Lorentz度规 $eta_(mu nu)$. 我们考虑一个具体的例子，即点粒子的作用量：
  $ 
    S = -m integral dd(s) = 
    -m integral dd(tau)  sqrt(-g_(mu nu)
    dv(x^mu, tau) dv(x^nu, tau))    
  $<eq:action_particle>
其中 $s$ 是粒子沿着世界线的弧长, 也可以看作是粒子在时空中的固有时. 而 $tau$ 是任意参数，可以选择为粒子在时空中的坐标时间 $t$，我们很容易发现上式的重参数不变性：考虑 $tau$ 的重参数化：
  $ 
    tau' = f(tau) 
  $ 
代入@eq:action_particle 中，我们得到  $ 
    S' &= 
     -m integral dd(tau')  sqrt(-g_(mu nu)
    dv(x^mu, tau') dv(x^nu, tau'))  
  = 
   -m integral dd(tau')  sqrt(-g_(mu nu)
    dv(x^mu, tau) dv(tau, tau')  
    dv(x^nu, tau') dv(tau, tau')  ) \ 
    &= -m integral dd(tau)  sqrt(-g_(mu nu)
    dv(x^mu, tau) dv(x^nu, tau)) = S 
  $ 
因此，点粒子作用量具有重参数不变性. 由此，我们可以将对$tau$的选取看作点粒子的坐标系的选取，而重参数不变性则是点粒子的作用量不依赖于坐标系的选取. 我们将其推广到一般理论中，即任意物理规律都不依赖于坐标系的选取，这就是_广义协变性_. 广义协变性和等效原理共同给出了广义相对论的基本框架.
    

== 微分同胚
广义协变性要求物理理论在坐标变换 $x arrow.r x'$ 下保持不变. 在主动视角下，坐标变换 $x arrow.r x'$ 可以看作是一个_微分同胚 _$phi: {x} arrow.r {x'}$，它将时空中的点 $p$ 映射到另一个点 $p'$. 本节我们将介绍微分同胚的基本性质.

首先我们考察无穷小微分同胚:
  $ 
    x arrow.r x' = x + epsilon(x) 
  $
由此，我们有  $ 
    pdv(x'^mu, x^nu) = tensor(delta,+mu,-nu) + partial_nu epsilon^mu (x) \ 
    pdv(x^mu, x'&nu) = tensor(delta,+mu,-nu) - partial_nu epsilon^mu (x) 
  $
下面我们考虑一些基本场关于微分同胚的变换性质. 首先是标量场 $phi$:
  $ 
    phi'(x') equiv phi(x) = 
    phi(x' - epsilon) = phi(x') - epsilon^mu partial_mu phi(x')
  $
即有  $ 
    delta phi(x) equiv phi'(x) - phi(x) = -  epsilon^mu partial_mu phi(x)
  $<eq:delta_phi>
类似地，对于矢量场  $ 
    V'^mu (x') = pdv(x'^mu, x^nu) V^nu (x) &=
    [ tensor(delta,+mu,-nu) + partial_nu epsilon^mu ] V^nu (x)\ 
    &=V^mu (x' - epsilon) + V^nu  partial_nu epsilon^mu \ 
    &=V^mu (x') - V^mu partial_nu   epsilon^nu  + V^nu  partial_nu epsilon^mu
   $
即一阶近似下：  $ 
    delta V^mu (x) = -[epsilon^nu partial_nu V^mu - V^nu partial_nu epsilon^mu] 
  $<eq:delta_V>
类似地对偶矢量场给出  $ 
    delta W_mu (x) = -[epsilon^nu partial_nu W_mu + W_nu partial_mu epsilon^nu] 
  $<eq:delta_W>
类似地，我们能将该结果推广到任意 $(k, l)$ 型张量场  $ 
    delta tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l)
    &= tensor(T',+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) - tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) \
    &=-[
      epsilon^rho partial_rho tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) -
      sum_(i=1)^k tensor(T,+mu_1 dots.c rho dots.c mu_k,-nu_1 nu_2 dots.c nu_l) partial_rho epsilon^(mu_i) \ 
      & + sum_(j=1)^l tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 dots.c rho dots.c nu_l) partial_(nu_j) epsilon^rho
    ]
  $<eq:delta_T>
由此，我们发现 $delta T$也是一个张量场. 此外，我们可以验证 $delta$ 算符满足Leibniz法则：  $ 
    delta (tensor(T) tensor(S)) = (delta tensor(T)) tensor(S) + tensor(T) (delta tensor(S))
  $<eq:delta_Leibniz>
  
我们知道，给定时空的一个矢量场 $V^mu (x)$,实际上其给定了时空上的曲线 $x^mu (tau)$,其满足  $ 
    dv(x^mu, tau) = V^mu (x(tau))  
  $
于是我们便可以将微分同胚看作坐标 $x^mu $ 随着曲线参数 $tau$ 流动到 $x'^mu$,具体地，我们有  $ 
    x'^mu = x^mu + delta tau V^mu (x) 
  $
这里我们便看到  $ 
    epsilon^mu (x) equiv delta tau V^mu (x) 
  $
下面我们来考察在 $delta tau$ 流动下，张量场 $tensor(T)$ 从 $x$ 流动到 $x'$ 变成 $tensor(T') (x')$,我们需要考察其与
 $x'$ 原始的张量场 $tensor(T)(x')$ 的差距.由此，     
我们引入_Lie导数_：
  $ 
    scr(L)_V tensor(T) = 
    lim_(delta tau arrow.r 0) 
    (tensor(T) (x') - tensor(T)' (x'))/(delta tau) = 
    - (delta tensor(T))/(delta tau)
  $
由此，我们立刻得到  $ 
    scr(L)_V phi &= V^mu partial_mu phi\ 
    scr(L)_V U^mu &= V^nu partial_nu U^mu - U^nu partial_nu V^mu \
    scr(L)_V W_mu &= V^nu partial_nu W_mu + W_nu partial_mu V^nu \
  $
一般地，我们有  $ 
    scr(L)_V tensor(T, +mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) &= 
    V^rho partial_rho tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) -
    sum_(i=1)^k tensor(T,+mu_1 dots.c rho dots.c mu_k,-nu_1 nu_2 dots.c nu_l) partial_rho V^(mu_i) \
    & + sum_(j=1)^l tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 dots.c rho dots.c nu_l) partial_(nu_j) V^rho 
  $
由此， $scr(L)_V tensor(T)$ 也是一个张量场，且Lie导数对张量场的乘积满足Leibniz法则和线性性  $ 
    scr(L)_V (a T + b S) = a scr(L) T + b scr(L) S \ 
    scr(L)_V (tensor(T) tensor(S)) = (scr(L)_V tensor(T)) tensor(S) + tensor(T) (scr(L)_V tensor(S))
  $
此外，Lie导数对矢量场 $V$ 也满足线性性  $ 
    scr(L)_(a V + b W) tensor(T) = 
    a scr(L)_V tensor(T) + b scr(L)_W tensor(T)
  $
    


== 测地线方程
本节我们求解@eq:action_particle 给出的运动方程，它将描述了由度规 $g_(mu nu) (x)$ 刻画的时空中自由粒子的运动轨迹.
首先注意到  $ 
    L delta(L) = 1/2 delta (L^2) 
    &= -g_(mu nu) dv(x^mu, tau) delta dv(x^nu, tau) 
    - 1/2 delta g_(mu nu) dv(x^mu, tau) dv(x^nu, tau)\ 
    &= -g_(mu nu) dv(x^mu, tau)  dv((delta x^nu), tau) 
    -1/2 partial_rho g_(mu nu) dv(x^mu, tau) dv(x^nu, tau) delta x^rho
  $
于是对@eq:action_particle 变分给出  $ 
    delta S &= 
  m integral dd(tau) 1/L [g_(mu nu) dv(x^mu, tau)  dv((delta x^nu), tau) + 1/2 partial_rho g_(mu nu) dv(x^mu, tau) dv(x^nu, tau) delta x^rho] \ 
  &= m integral dd(tau) 
  dv(, tau) [
    1/L g_(mu nu) dv(x^mu, tau) delta x^nu
  ] -
  m integral dd(tau)
  {dv(, tau)[
     1/L g_(mu rho) dv(x^mu, tau)
  ] 
  -1/(2 L) partial_rho g_(mu nu) dv(x^mu, tau) dv(x^nu, tau)
  } delta x^rho
  $
注意到第一个积分项是一个全导数项，因此可以忽略掉. 于是最小作用量原理要求：  $ 
    dv(, tau)[
     1/L g_(mu rho) dv(x^mu, tau)
  ] 
  -1/(2 L) partial_rho g_(mu nu) dv(x^mu, tau) dv(x^nu, tau) = 0
  $
对于有质量粒子，我们可以选择 $tau$ 为弧长参数 $s$, 从而 $L=1$(参考@prob:four_v), 上式可以简化为  $ 
   0 &= dv(, s)[
     g_(mu rho) dv(x^mu, s)
  ] 
  -1/2 partial_rho g_(mu nu) dv(x^mu, s) dv(x^nu, s) \
  &= g_(mu rho) dv(x^mu, s,2) +
   partial_nu g_(mu rho) dv(x^mu, s) dv(x^nu, s)- 
    1/2 partial_rho g_(mu nu) dv(x^mu, s) dv(x^nu, s) \
    &=g_(mu rho) dv(x^mu, s,2) +
    1/2 [partial_nu g_(mu rho) + partial_mu g_(nu rho) - partial_rho g_(mu nu)] dv(x^mu, s) dv(x^nu, s) \
  $<eq:geodesic01>
下面我们引入Christoffel符号  $ 
    tensor(Gamma,+rho,-mu,-nu) = 1/2 g^(rho sigma) [partial_nu g_(mu sigma) + partial_mu g_(nu sigma) - partial_sigma g_(mu nu)]
  $<eq:Christoffel>
于是@eq:geodesic01 等价于  $ 
    dv(x^rho, s,2) + tensor(Gamma,+rho,-mu ,-nu) dv(x^mu, s) dv(x^nu, s) = 0  
  $<eq:geodesic>
我们将@eq:geodesic 叫做测地线方程, 它描述了弯曲时空中自由粒子的运动轨迹. 由此我们可以看出，测地线方程与度规张量 $g_(mu nu)$ 对应的Christoffel符号密切相关. 因此，测地线方程的解，即自由粒子的运动轨迹，也与度规张量密切相关.
  
下面我们介绍Christoffel的一些基本性质，首先我们可以验证Christoffel符号是对称的，即  $ 
    tensor(Gamma,+rho,-mu,-nu) = tensor(Gamma,+rho,-nu,-mu)
  $
一般地，我们将满足该对称性的时空称为_无挠时空_.此外，@eq:Christoffel 等价于  $ 
    g_(rho sigma)  tensor(Gamma,+sigma,-mu,-nu) = 
    1/2 [partial_nu g_(mu rho) + partial_mu g_(nu rho) - partial_rho g_(mu nu)]
  $
利用轮换对称性，给出  $ 
    g_(mu sigma)  tensor(Gamma,+sigma,-nu rho) =
    1/2 [partial_rho g_(nu mu) + partial_nu g_(rho mu) - partial_mu g_(nu rho)] \ 
    g_(nu sigma)  tensor(Gamma,+sigma,-rho mu) =
    1/2 [partial_mu g_(rho nu) + partial_rho g_(nu mu) - partial_nu g_(rho mu)]
  $
两式相加：
  $ 
    partial_rho g_(mu nu) =  g_(mu sigma)  tensor(Gamma,+sigma,-nu rho) 
    +  g_(nu sigma)  tensor(Gamma,+sigma,-mu rho )
  $<eq:Gamma_metric>
最后一步利用了Christoffel记号的对称性.我们将@eq:Gamma_metric 叫做_度规相容条件_.

另一方面，等效原理给出了在弯曲时空中局部惯性系的存在:在局部惯性系中，度规张量满足 $g_(mu nu) = eta_(mu nu)$, 且 $partial_mu g_(mu nu)=0$,等价地，我们要求局部惯性系满足  $ 
     g_(mu nu) (P) = 0\ 
     tensor(Gamma,+rho,-mu,-nu) (P) = 0
  $
#remark()[
  以上我们几乎给出了引入Riemann几何的所有必要条件. 事实上，Riemann几何的基本对象就是满足上述条件的度规张量 $g_(mu nu)$ 和Christoffel符号 $tensor(Gamma,+rho,-mu,-nu)$. 因此，我们可以将引入Riemann几何看作是为了满足等效原理和广义协变性而引入的一种_数学工具_.
] 
   
  
  
  


== 协变导数与曲率张量
利用速度矢量 $u^mu = dv(x^mu, s),$ 我们可以将@eq:Christoffel 改写为  $ 
    (D u^mu)/(D s) = dv(u^mu, s) + tensor(Gamma,+mu,-rho,-sigma) u^rho u^sigma = 0  
  $
其中我们引入了_协变微分算符_ $D$. 下面我们再引入协变导数算符 $nabla_mu$,其满足  $ 
    nabla_mu V^nu = 
    partial_mu V^nu + tensor(Gamma,nu,-mu rho) V^rho \
    nabla_mu W_nu =
    partial_mu W_nu - tensor(Gamma,rho,-mu nu) W_rho
  $<eq:covariant_derivative1>
不难验证@eq:covariant_derivative1 在坐标变换下满足协变性(@prob:Christoffel_transformation). 
由此，我们可以证明协变导数满足线性性和Leibniz法则：  $ 
    nabla_mu (a V^nu + b U^nu) &= a nabla_mu V^nu + b nabla_mu U^nu \ 
    nabla_mu (tensor(T) tensor(S)) &= (nabla_mu tensor(T)) tensor(S) + tensor(T) (nabla_mu tensor(S))
  $<eq:nabla_Leibniz>
特别地，对于标量场，其满足  $ 
    nabla_mu phi = partial_mu phi 
  $<eq:nabla_phi>
一般地，我们有  $ 
    nabla_rho 
    tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) &=
    partial_rho tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 nu_2 dots.c nu_l) +
    sum_(i=1)^k tensor(T,+mu_1 dots.c sigma dots.c mu_k,-nu_1 nu_2 dots.c nu_l) tensor(Gamma,+mu_i,-rho sigma) \
    & - sum_(j=1)^l tensor(T,+mu_1 mu_2 dots.c mu_k,-nu_1 dots.c sigma dots.c nu_l) tensor(Gamma,+sigma,-rho nu_j)
  $
注意到  $ 
     dv(u^mu, s) + tensor(Gamma,+mu,-rho,-sigma) u^rho u^sigma 
     &= dv(u^mu, x^nu) dv(x^nu, s) + tensor(Gamma,+mu,-rho,-sigma) u^rho u^sigma\ 
     &= u^nu  partial_nu u^mu + tensor(Gamma,+mu,-rho,-nu) u^rho u^nu \
      &= u^nu nabla_nu u^mu
  $
于是我们得到测地线方程等价于：  $ 
    (D u^mu)/(D s) = u^nu nabla_nu u^mu = 0
  $
对于一般地矢量 $A^mu$, 我们称 $A^mu$ 是沿着由 $C(tau)$ 曲线_平移_的，若  $ 
     (D A^mu)/(D s) = u^nu nabla_nu A^mu = 0
  $
其中 $u^nu$ 是曲线 $C(tau)$ 上的切向量. 
     
在_规范场论_中我们已经看到，规范场的场强张量可以看作是规范场的协变导数的非交换部分. 类似地，在弯曲时空中，我们也可以定义一个_曲率张量_，它可以看作是协变导数的非交换部分. 具体地，我们定义Riemann曲率张量为  $ 
    
    (nabla_mu nabla_nu - nabla_nu nabla_mu) W_rho
    =-tensor(R,+sigma,-rho,-mu nu) W_sigma = 
  $
由此，我们可以给出  $ 
     tensor(R,+sigma,-rho,-mu nu) =
     partial_mu tensor(Gamma,+sigma,-nu rho) - partial_nu tensor(Gamma,+sigma,-mu rho) +
      tensor(Gamma,+sigma,-mu lambda) tensor(Gamma,+lambda,-nu rho) -
      tensor(Gamma,+sigma,-nu lambda) tensor(Gamma,+lambda,-mu rho)
  $
利用度规降低Riemann曲率张量的指标，我们可以得到 $R_(sigma rho mu nu )$ 的一些简单对称性：
  $ 
    R_(sigma rho mu nu ) &= R_(mu nu sigma rho) 
    R_(sigma rho mu nu ) &= - R_(rho sigma mu nu) = - R_(sigma rho nu mu) = R_(mu nu sigma rho)\ 
    R_(sigma (rho mu nu)) &= R_(sigma [rho mu nu]) = 0\ 
  $
其中第二行第一个等式来源于度规相容条件，最后一个等式来源于对易子.第一行是第二行的结果，第一行引入了：
  $ 
    T_(( mu_1 mu_2 dots.c mu_l)) = 
    1/l! sum_(pi) T_(mu_(pi(1)) mu_(pi(2)) dots.c mu_(pi(l)))\ 
    T_([ mu_1 mu_2 dots.c mu_l]) = 
    1/l! sum_(pi) sgn(pi) T_(mu_(pi(1)) mu_(pi(2)) dots.c mu_(pi(l)))
  $
  


由此，我们可以证明Riemann张量的独立分量的个数为  $ 
    N_R = (D^2 (D^2 -1))/12
  $
此外，Riemann张量作为由协变导数构造的场强张量，利用:
  $ 
    [nabla_mu, [nabla_nu, nabla_rho]]]  + 
    [nabla_nu, [nabla_rho, nabla_mu]] +
    [nabla_rho, [nabla_mu, nabla_nu]] =0
  $
其满足Bianchi恒等式  $ 
    nabla_lambda tensor(R,+sigma,-rho,-mu nu) +
    nabla_mu tensor(R,+sigma,-rho,-nu lambda) +
    nabla_nu tensor(R,+sigma,-rho,-lambda mu) = 0
  $
等价地：
  $ 
    nabla_(\[lambda) tensor(R,+sigma,- tilde(rho) mu nu ]) = 0 
  $
进一步，我们引入Ricci张量和标量曲率：
  $ 
    R_(mu nu) = tensor(R,+rho,-mu,-rho nu) \
  $
不难发现Ricci张量是对称的，即 $R_(mu nu) = R_(nu mu)$. 由此，我们可以定义标量曲率为  $ 
    R = g^(mu nu) R_(mu nu) = tensor(R,+mu,-mu)
  $
下面我们再引入Einstein张量：
  $ 
    G_(mu nu) = R_(mu nu) - 1/2 g_(mu nu) R
  $
利用Bianchi恒等式，我们可以验证Einstein张量满足  $ 
    nabla_mu G^(mu nu) = 0
  $
#proof()[
    $ 
      0 &= g^(mu lambda) g^(nu sigma) 
      [nabla_lambda R_(rho sigma mu nu) +
       nabla_rho R_(sigma lambda mu nu) + 
      nabla_sigma R_(lambda rho mu nu)] \
      &=2 nabla^mu R_(mu rho) -nabla_rho R\ 
      &=2 nabla^mu [R_(mu rho) - 1/2 g_(mu rho) R] = 2 nabla^mu G_(mu rho)
    $
  ] 



== 测地线偏移方程
== 体元与Gauss定理
== 能动张量与Einstein场方程
尽管 $tensor(R,+sigma,-rho mu nu)$ 是最直接的场强张量，但是我们希望引力场的运动方程只是二阶的，因此最简洁引入到
引力场拉式量中的是曲率标量 $R$，   
下面我们考虑同时耦合物质场和引力场的作用量：
  $ 
    S = S_"G" + S_"M" = 
    1/(16 pi) integral dd(x,4)   sqrt(-g) R + integral dd(x,4)  sqrt(-g) cal(L)
  $<eq:EH_action>
我们首先考虑物质场在微分同胚变换 $x^mu arrow.r x^mu +epsilon^mu $下： 
  $ 
    delta  S_"M" &= 
    integral dd(x,4) sqrt(-g) 
    T^(mu nu) delta g_(mu nu) \
  $
这里我们将能动张量定义为  $ 
    T^(mu nu ) = 2/sqrt(-g)  dv(S_"M", g_(mu nu),d:delta)  
  $<eq:energy_momentum_tensor>
注意到  $ 
    delta g_(mu nu) &=- epsilon^rho partial_rho g_(mu nu)  
    -g_(mu rho) partial_nu epsilon^rho - g_(nu rho) partial_mu epsilon^rho\ 
    &=-nabla_mu epsilon_nu - nabla_nu epsilon_mu
  $
最后一步利用了度规相容条件@eq:Gamma_metric. 由此，我们可以得到  $ 
    delta S_"M" = -2 integral dd(x,4) sqrt(-g) T^(mu nu) 
    [nabla_mu epsilon_nu + nabla_nu epsilon_mu]
  $
忽略边界项，在无引力场下， $delta S_"M" =0$ 要求  $ 
    nabla_mu T^(mu nu) =0
  $
下面考虑引力场的关于度规 $g_(mu nu)$ 的变分,首先注意到  $ 
    delta (sqrt(-g) R) &= 
    delta(sqrt(-g)) R + sqrt(-g) delta R \
    &=(-g^(mu nu))/(2 sqrt(-g)) (delta g_(mu nu)) R + sqrt(-g) delta (g_(mu nu) R^(mu nu))\
    &=(-g^(mu nu))/(2 sqrt(-g)) (delta g_(mu nu)) R + sqrt(-g) [delta g_(mu nu) R^(mu nu) + g_(mu nu) delta R^(mu nu)]\
    &=sqrt(-g) [R^(mu nu)-1/2 g^(mu nu) R] delta g_(mu nu) + sqrt(-g) g_(mu nu) delta R^(mu nu)
  $
注意到第二项 $g_(mu nu) delta R^(mu nu)$ 实际上是一个全导数项，因此可以忽略掉. 由此，我们得到  $ 
    delta S_"G" = 1/(16 pi) integral dd(x,4) sqrt(-g) [R^(mu nu)-1/2 g^(mu nu) R] delta g_(mu nu)
  $
因此， 利用@eq:energy_momentum_tensor ,$delta S=0$ 要求  $ 
    G_(mu nu) = 
    R_(mu nu) -1/2 g_(mu nu) R =8 pi T_(mu nu) 
  $<eq:Einstein_equation> 
我们将@eq:EH_action 叫做Einstein-Hilbert作用量, 它的运动方程@eq:Einstein_equation 叫做Einstein场方程. 我们看到方程左边描述了时空的弯曲，而方程右边给出时空弯曲的源正是物质场的能动张量.

事实上，
我们允许@eq:EH_action 相差一个宇宙学常数项 $Lambda$，即  $ 
    S = 1/(16 pi) integral dd(x,4)   sqrt(-g) (R - 2 Lambda) + integral dd(x,4)  sqrt(-g) cal(L)
  $
由此，我们得到Einstein场方程的推广形式  $ 
    G_(mu nu) + Lambda g_(mu nu) = 8 pi T_(mu nu)
  $
  
   
  
  
  



== 习题

#prob(label:<prob:four_v>)[
  本习题我们将考察弯曲时空中的有质量粒子的 $4-$速度:
  1. 证明有质量粒子的 $4-$速度满足归一化条件
  $
    g_(mu nu) u^mu u^nu = -1.
  $

  2. 若用坐标时间 $t$ 重新参数化世界线，定义坐标速度
  $
    v^i = dv(x^i,t),
  $
  证明
  $
    u^0 = dv(t,s)
    =
    1 / sqrt(-g_(00)-2g_(0i)v^i-g_(i j)v^i v^j),
  $
  并进一步得到
  $
    u^i = u^0 v^i.
  $

  3. 说明为什么在弯曲时空中，$v^i=dv(x^i, t)$ 本身不是一个几何不变量，
  而 $u^mu=dv(x^mu, s)$ 是世界线上的切向量，因此具有明确的几何意义。

  4. 定义 $4-$加速度
  $
    a^mu = u^nu nabla_nu u^mu.
  $
  证明若粒子沿测地线运动，则
  $
    a^mu = 0,
  $
  等价于
  $
    dv(u^mu,s)+Gamma^mu_(rho sigma) u^rho u^sigma = 0.
  $

  5. 考虑 Schwarzschild 时空
  $
    d s^2 =
    - (1 - 2 M / r) d t^2
    + (1 - 2 M / r)^(-1) d r^2
    + r^2 d theta^2
    + r^2 sin^2 theta d phi^2.
  $
  对一个静止观察者，即
  $
    r,theta,phi = "const.",$
  求它的 $4-$速度 $u^mu$。并说明为什么这个观察者虽然空间坐标不变，
  但一般并不是自由下落的测地线观察者。
]

#prob()[
  证明@eq:delta_W
] 
#prob()[
  证明@eq:delta_Leibniz
] 

#prob(label:<prob:Christoffel_transformation>)[
  证明Christoffel@eq:Christoffel 在坐标系变换下满足  $ 
      tensor(Gamma',+rho,-mu -nu) =
      pdv(x'^rho, x^sigma) 
      [
        tensor(Gamma,+sigma,-alpha,-beta) pdv(x^alpha, x'^mu) pdv(x^beta, x'^nu) +
        pdv(x^sigma,x'^mu,x'^nu,total:2) 
      ]  
    $
  进一步证明@eq:covariant_derivative1 是协变的.
]

#prob(label:<prob:nabla_transformation>)[
  证明@eq:nabla_Leibniz,@eq:nabla_phi.
]
#prob()[
  证明 $g_(mu nu) delta R^(mu nu)$ 是全导数项. 
]