#import "../../lib.typ":*

= 相对论量子力学

== 符号约定
本文取自然单位制 $c=hbar=k_B=1$, 同时取 $epsilon_0=mu_0=1$,于是精细结构常数为  $ 
    alpha  = e^2/(4 pi) approx 1/(137) 
  $ 
在该单位制下,质量维度约定为$[M]=1$，于是几何维度 $[L]=-1$.

Minkowski空间的度规采用 $(-,+,+,+)$,于是粒子on-shell关系为 $p^2=p_mu p^mu = -m^2.$ 

 $4-$ 维度Fourier变换定义为  $ 
     tilde(phi) (k) 
     = integral dd(x,4) e^(-i k x) phi(x)\ 
     phi(x) 
     = integral dd(k,4)/(2pi)^4 e^(i k x) tilde(phi)(k)  
   $ 
 $gamma$ 矩阵记为  $ 
     gamma^mu = mat(
      0, sigma^mu;
      overline(sigma)^mu,0 
     ) 
   $ 
其中 $sigma^mu=(1, sigma^i)$, $overline(sigma)^mu=(1, -sigma^i)$, $sigma^i$ 是Pauli矩阵.由此， $ 
     gamma^5 = i gamma^0 gamma^1 gamma^2 gamma^3 = mat(
      -1, 0;
      0, 1
     ) 
   $
    
    



== Lorentz群的幺正表示
Lorentz群$O(1,3)$ 定义为保持Minkowski度规不变的线性变换群. 即对于_张量_ $tensor(Lambda,+mu,-nu) in S O(1,3)$, 其满足  $ 
     tensor(Lambda,+mu,-nu) 
     tensor(Lambda,+rho,-sigma) 
    g_(mu rho) = g_(nu sigma) 
  $<eq:def_Lorentz_group>
不难验证 $ O(1,3)$构成群结构，进一步其构成Lie群。 特别地，其固有正时分支是一个连通Lie群 .其中固有指 $det Lambda=1,Lambda in O(1,3)$,而正时分支指 $tensor(Lambda,+0,-0) >= 1$. 我们将该子群记为 $S O^+ (1,3)$.

所有的态矢量都处于Minkowski时空，因此我们希望它们具有Lorentz对称性，即  $ 
    braket(psi',psi) = 
    braket(U(Lambda) psi',U(Lambda) psi) 
  $ 
以此，我们要求Lornetz群的表示 $U(Lambda)$ 必须是幺正的.#remark()[
  更严格地， $U(Lambda)$ 可以是反幺正的，这对应于时间反演变换，我们暂时不考虑这一点。 
]  
然而注意到态矢量 $ket(psi)$ 可以相差一个相位因子，因此我们有  $ 
    U(Lambda_2) U(Lambda_1) ket(psi) =
    e^(i phi.alt(Lambda_2, Lambda_1))
     U(Lambda_2 Lambda_1) ket(psi) 
  $ 
因此 $U(Lambda)$ 作用到态矢量并不能直接构成一个线性表示，而是一个投影表示. 幸运的是，如果群 $G$ 是单连通且 $G$ 对应的Lie代数 $frak(g)$ 不包含中心荷，则我们可以取 $phi=0$,从而将投影表示提升为线性表示. 
=== 拓扑性质
对于Lorentz群 $S O^+ (1,3)$, 而言，我们可以证明其拓扑等价为  $ 
     S O^+ (1,3) tilde.equiv RR^3 times S O(3)
  $ 
于是其显然是双连通的，即有  $ 
     U(Lambda_2) U(Lambda_1) = plus.minus 
      U(Lambda_2 Lambda_1)
  $ 
在量子力学中，我们曾经看到自旋 $j$ 取半整数的粒子在旋转 $2pi$ 后会得到一个负号，这就是上述双连通性的体现。

为了得到一个线性表示，我们一般取Lorentz群 $S O^+ (1,3)$ 的通用覆盖群 $S L(2,CC)$,其拓扑等价于 $ 
     S L(2,CC) tilde.equiv RR^3 times S U(2)
  $ 
其中 $S U(2)$ 拓扑上等价于三维球面 $S^3$,因此是单连通的.事实上，我们有  $ 
  S O^+ (1,3) tilde.equiv    (S L(2,CC) )\/ ZZ_2 
  $ 
因此，二者的Lie代数是相同的，即 $frak(s o(1,3)) equiv frak(s l(2,CC))$. 
=== Lie代数

为了具体计算这个Lie代数，考虑无穷小变换  $ 
    U(Lambda) = 1+i/2 omega_(mu nu) M^(mu nu ) 
  $ 
这里 $U(Lambda)$ 是幺正的，于是 $M^(mu nu)$ 是厄米的. 注意到  $ 
    tensor(Lambda,+mu,-nu) = 
    1+  tensor(omega,+mu,-nu)
  $ 
满足@eq:def_Lorentz_group,我们可以得到  $ 
    omega_(mu nu) = - omega_(nu mu)
  $
对于 $d=4$,我们可以得到只有 $6$ 个 $omega_(mu nu)$ 是独立的，对应的 $M^(mu nu)=-M^(nu mu)$,于是 $U(Lambda)$ 存在 $6$ 个生成元. 下面考虑一个通用的技巧：
  $ 
    U(Lambda) U(1+omega) U^(-1) (Lambda) 
    = U(1+Lambda omega Lambda^(-1)) 
  $ 
等式两边关于 $omega$ 展开，我们得到  $ 
    U(Lambda)  M^(mu nu) U^(-1) (Lambda)
    =tensor(Lambda,-rho,+mu) tensor(Lambda,-sigma,+nu) M^(rho sigma)
  $<eq:generator_transformation1>
其中我们利用了  $ 
    tensor((Lambda^(-1)),+mu,-nu) = 
    tensor(Lambda,-nu,+mu) equiv 
    g_(nu rho) g^(mu sigma) tensor(Lambda,+rho,-sigma)
  $ 
@eq:generator_transformation1 给出了生成元 $M^(mu nu)$ 在Lorentz变换下的变换规律，即 $M^(mu nu)$ 确实是一个Lorentz张量.进一步，我们将@eq:generator_transformation1 按小量 $omega$ 展开，我们可以得到  $ 
    i [M^(mu nu), M^(rho sigma)] = 
     (g^(nu rho) M^(mu sigma) - g^(mu rho) M^(nu sigma)   -
       g^( sigma mu) M^(rho nu ) + g^(sigma nu)
        M^(rho mu ))
  $<eq:Lie_algebra_Lorentz>
为了简单，我们记  $ 
    upright(J)^i = 1/2 epsilon^(i j k) M^(j k), 
    upright(K)^i = M^(0i)  
  $ 
于是上述Lie代数可以化简为  $ 
    [upright(J)_i,upright(J)_j] &= i epsilon_(i j k) upright(J)_k\
    [upright(K)_i,upright(K)_j] &= - i epsilon_(i j k) upright(K)_k\ 
    [upright(J)_i,upright(K)_j] &=  i epsilon_(i j k) upright(J)_k\
  $ 

最后，我们再引入旋转角和boost参数  $ 
    theta^i &= 1/2 epsilon^(i j k) omega_(j k)\ 
    eta_i &= omega_(0 i) 
  $
则 $U(Lambda)$ 可以写作  $ 
    U(Lambda(vb(theta), vb(eta))) = 
    exp(i (vb(theta) dot.c bf(J) 
    + vb(eta) dot.c bf(K) ))
  $ 

=== Poincare群和Poincare代数
我们将Lorentz群和 $4-$ 维平移群 $T(4)$ 的半直积称为Poincare群，具体地，其满足  $ 
    U(Lambda_2,a_2) U(Lambda_1,a_1) 
    = U(Lambda_2 Lambda_1, Lambda_2 a_1 + a_2) 
  $ 
利用上一小节的方法，我们可以得到平移部分的生成元为 $P^mu$:
  $ 
    P^mu = (H, vb(P)) 
  $ 
其Lie代数满足  $ 
    [P^mu, P^nu] = 0\ 
    i [P^mu, M^(rho sigma)] = 
     (g^(mu rho) P^(sigma) - g^(mu sigma) P^(rho))\
  $
或者  $ 
    [upright(J)_i,upright(P)_j] &= i epsilon_(i j k )upright(P)_k\ 
    [upright(K)_i,upright(P)_j] &= -i H delta_(i j)\ 
    [upright(K)_i, H] &= i P_i\ 
    [upright(J)_i,H] &= [upright(P)_i,H] = 0 
  $ 
我们将与 $H$ 对易的算符称为守恒量，显然 $vb(K) $ 不是守恒量.在该符号约定下，我们将纯时空平移记作   $ 
    U(1,a) = e^(-i P_mu a^mu) = 
    e^(i H t) e^(-i vb(P) dot.c vb(x)) 
  $ 

== 单粒子态
本节我们考察单粒子态 $ket(p\,sigma)$ 在Lorentz变换下的变换规律.其中 $p^mu$ 标记粒子的动量，这是一组连续指标，而 $sigma$ 标记粒子其他可能的离散指标. 按照定义，我们有  $ 
    P^mu  ket(p\,sigma) = p^mu ket(p\,sigma)
  $
进一步，在时空平移变换下：
  $ 
    U(1, a)  ket(p\,sigma) = e^(-i p a) ket(p\,sigma)
  $
即时空平移仅贡献一个相位因子.下面我们考虑Lorentz变换 $U(Lambda)$ 的作用：
  $ 
    P^mu U(Lambda) ket(p\,sigma) &=
    U(Lambda) [U^(-1) (Lambda) P^mu U(Lambda)] ket(p\,sigma) = \ 
    &=
    U(Lambda) tensor((Lambda^(-1)),-nu,+mu) P^nu ket(p\,sigma)\ 
    & =
    tensor(Lambda,+mu,-nu) p^nu U(Lambda) ket(p\,sigma)
  $
由此我们得到 $U(Lambda) ket(p\,sigma)$ 的动量本征值为 $Lambda p$.另一方面，我们假设Lorentz变换也改变了 $sigma$ 指标，即  $ 
      U(Lambda) ket(p\,sigma) = 
      sum_(sigma') C_(sigma' sigma) (Lambda,p) ket(Lambda p\,sigma')
  $
下面我们需要确定系数 $C_(sigma' sigma) (Lambda,p)$. 在此之前，我们需要指定单粒子态的基本性质满足  $ 
    p^2 = -m^2 <=0\, 
    p^0 >0  
  $
其中 $m$ 是粒子的质量.对于满足上述条件的动量，我们可以将每个粒子指定一个标准动量态 $ket(k\, sigma)$ ,其动量满足  $ 
    k^mu = (m,0,0,0) , m>0\ 
    k^mu = (kappa,0,0,kappa) , m=0
  $
此外，我们引入标准Lorentz变换 $L(p)$ ，其将 $ket(k\,sigma)$ 标准动量态变换为 $ket(p\,sigma)$:
  $ 
    U(L(p)) ket(k\,sigma) = ket(p\,sigma) 
  $ 
#footnote()[我们在定义 $U(L(p))$ 可以相差一个归一化因子，我们此处取 $N(p)equiv 1$.  ]

现在，我们在考虑单粒子态的Lorentz变换：
  $ 
    U(Lambda)  ket(p\,sigma)  &=  U(Lambda) U(L(p)) ket(k\,sigma) 
    = U(L(Lambda p)) U[L^(-1) (Lambda p) Lambda L(p)] ket(k\,sigma)\ 
    &=U(L(Lambda p)) U[W(Lambda, p)] ket(k\,sigma)
  $<eq:intro_Wigner_rotation>
其中Lorentz变换 $W(Lambda, p)$ 使得标准动量的变换为  $ 
    k^mu arrow.r p^mu arrow.r (Lambda p)^mu arrow.r k^mu  
  $
即  $ 
     (W(Lambda, p) k)^mu equiv k^mu
  $
不难验证 $W(Lambda, p)$ 构成Lorentz群的一个子群，我们将其称为_小群_. 对应地， $W(Lambda, p)$ 对应的表示为：  $ 
    U(W(Lambda, p)) ket(k\,sigma)
    = sum_(sigma' ) D_(sigma' sigma) (W(Lambda, p)) ket(k\,sigma')
  $
进一步，  $ 
    U(Lambda) ket(p\, sigma) &= 
    U(Lambda)  U(W(Lambda, p)) ket(k\,sigma) = 
sum_(sigma' ) D_(sigma' sigma) (W(Lambda, p)) U(L(Lambda p))  ket(k\,sigma')\ 
&=sum_(sigma' ) D_(sigma' sigma) (W(Lambda, p)) ket((Lambda p)\,sigma')
  $<eq:single_particle_Lorentz_transformation>
其中第二步利用了@eq:intro_Wigner_rotation, 最后一步是标准动量的定义. 至此，我们需要确定系数矩阵 $ C_(sigma' sigma) (Lambda,p)$ 等价于确定小群的表示 $D_(sigma' sigma) (W(Lambda, p))$. 在我们具体讨论 $m>0,m=0$ 对应地小群表示前，我们给出单粒子态的归一化条件：
  $ 
    braket(vb(p')\, sigma' ,vb(p)\,sigma) =
    (2pi)^3 2 E_p delta_(n n') delta_(sigma sigma') delta^(3) (vb(p)-vb(p'))
  $
不难验证上述归一化条件在Lorentz变换下保持不变.
   


=== 有质量粒子
对于 $m>0$ 的粒子，其标准动量是 $(m,vb(0))$,因此不难发现保证该动量不变的Lorentz变换为三维旋转.因此其对应的小群是 $S O(3)$. 由于前文提及的拓扑性质，我们常常将 $S U(2)$ 的幺正表示也视为该小群的幺正表示：
  $ 
    D^((j))_(sigma' sigma) (1+vb(theta)) &= 1+i/2 vb(theta) dot.c vb(J)^((j))_(sigma' sigma) \ 
    (J_x plus.minus  J_y)^((j))_(sigma' sigma) &= 
    delta_(sigma', sigma plus.minus 1) sqrt((j minus.plus  sigma)(j plus.minus  sigma plus 1))\ 
    J_z^((j))_(sigma' sigma) &= sigma delta_(sigma' sigma)
  $
其中 $j=0,1/2,1 dots.c$ 称为角动量量子数， $sigma=-j,-j+1,dots., j$ 称为自旋量子数.

对应地，我们将@eq:single_particle_Lorentz_transformation 中的 $W(Lambda, p)$ 称为_Winger_旋转.

对于将有质量的标准动量旋转到 $p^mu$, 我们可以如下显式构造标准Lorentz变换 $L(p)$:
  $ 
   tensor(L,+mu,-nu) = 
   mat(
    gamma, p_1\/m, p_2\/m, p_3\/m;
    p_1\/m, 1+(gamma-1) p_1^2\/vb(p)^2, (gamma-1) p_1 p_2\/vb(p)^2, (gamma-1) p_1 p_3\/vb(p)^2;
    p_2\/m, (gamma-1) p_2 p_1\/vb(p)^2, 1+(gamma-1) p_2^2\/vb(p)^2, (gamma-1) p_2 p_3\/vb(p)^2;
    p_3\/m, (gamma-1) p_3 p_1\/vb(p)^2, (gamma-1) p_3 p_2\/vb(p)^2, 1+(gamma-1) p_3^2\/vb(p)^2
   )
  $<eq:standard_Lorentz_transformation>
可以证明，若 $tensor(Lambda,+mu,-nu)$ 恰恰是三维旋转 $scr(R)$, 我们就有  $ 
     W(scr(R),p) = scr(R)
  $
即我们在非相对论关于量子力学的旋转性质，可以完全吸纳到现有的理论下.
    
=== 无质量粒子
对于 $m=0$ 的粒子，其标准动量是 $(kappa,0,0,kappa)$, 为了保证其不变，可能的操作只能是绕 $z$ 轴的旋转
和 $x,y$ 轴的平移.因此其对应的小群是 $I S O(2)$,即二维欧几里得群. 该群的幺正表示可以写作一下生成元：
  $ 
    J_z &= J_z,\ 
    A &= J_y + K_x,\
    B &= - J_x + K_y 
  $
于是对应的Lie代数为  $ 
    [J_z, A] &= i B,\ 
    [J_z, B] &= -i A,\ 
    [A,B] &= 0 
  $
我们注意到 $A, B$ 是对易的.因此无质量粒子态可以写作 $ket(k\,sigma\,a\,b)$ 其中 $sigma$ 是 $J_z$ 的本征值， $a,b$ 是 $A,B$ 的本征值. 注意到  $ 
    e^(-i theta J_z) A e^(i theta J_z) = A cos(theta) + B sin(theta),\
  $
作用到单粒子态，我们就有  $ 
       e^(-i theta J_z) A e^(i theta J_z) ket(k\,sigma\,a\,b) 
       = (a cos(theta) + b sin(theta)) ket(k\,sigma\,a\,b)
  $
实际上，我们并没有观测到依赖于 $theta$ 这样连续变换的本征值.于是我们必须有要求 $a=b=0.$ 至此，无质量粒子态只要 $J_z$ 是非平凡的幺正表示生成元.对此，我们有  $ 
   e^(i theta J_z) ket(k\, sigma) =   e^(i theta sigma) ket(k\, sigma)
  $
此处，我们将 $sigma$ 称为粒子的螺旋度，从而区分于粒子的自旋.每个粒子只有一个螺旋度，这与有质量粒子的自旋量子数不同.然而，对于存在空间反演对称性的体系，空间反演操作会反转螺旋度 $sigma arrow.r -sigma$. 为此，我们常常引入一对无质量粒子 $ket(k\,sigma),ket(k\,-sigma)$ 来描述存在空间反演对称性的体系.  
   

  
  







== 多粒子态
本节我们在单粒子态的基础上构造多粒子态.不妨将单粒子态构成的Hilbert空间记作 $cal(H)$,则我们可以利用张量积构造多粒子态：
  $ 
    cal(H)^(times.o N) :
    ket(p_1\,sigma_1\,n_1\, dots.c\,p_N\,sigma_N\,n_N) :=
    ket(p_1\,sigma_1\,n_1) times.o dots.c 
    times.o
     ket(p_N\,sigma_N\,n_N)
  $
其中 $n_i$ 表示第 $i$ 个粒子的种类.特别地，对于完全同种粒子构成的多粒子态，任意置换二者，我们注意到态矢量可以相差一个相位：
  $ 
    ket(p\,sigma\,p'\, sigma'\, dots.c) = 
    alpha  ket(p'\, sigma'\,p\,sigma\,dots.c)
  $
注意到置换两次后，态矢量保持不变，于是我们立刻得到 $alpha^2=1$,即 $alpha= plus.minus 1$. 因此，全同粒子构成的巨Hilbert空间可以分为两类：$alpha=1$ 的Boson态空间和 $alpha=-1$ 的Fermion态空间.对于Boson态空间，任意交换两粒子态矢量不变，而对于Fermion态空间，任意交换两粒子态矢量会得到一个负号.因此，我们可以将多粒子态写作  $ 
    ket(p_1\,sigma_1\,dots.c\,p_N\,sigma_N)_plus.minus = 
    1/sqrt(N!) sum_(pi in S_N) alpha^(pi) 
    ket(p_(pi(1))\,sigma_(pi(1))\,dots.c\,p_(pi(N))\,sigma_(pi(N)))
  $
即对于玻色子而言，其多粒子态是单粒子态的对称化，而对于费米子而言，其多粒子态是单粒子态的反对称化. 

#remark()[
  对于玻色子体系，由于不同粒子可以完全占据相同的态，于是归一化系数进一步写作  $ 
    1/(sqrt(N!) sqrt(m_1 ! m_2 ! ... m_k !))
  $
] 

进一步，对于非全同粒子体系，我们将以上约定推广为置换任意两费米子是反对称的，其余情形是对称的.

在该记号下，我们将单粒子内积为  $ 
     delta_(q q') = braket(q',q) = 
     braket(vb(p')\,sigma'\,n' ,vb(p)\,sigma\,n) =
     (2pi)^3 2 E_p delta_(n n') delta_(sigma sigma') delta^(3) (vb(p)-vb(p'))
  $
则有  $ 
    braket(q_1'\,dots.c\,q_n' ,q_1\,dots.c\,q_n) =
  delta_(n' n) sum_(pi in S_n) alpha^(pi) 
    delta_(q_(pi(1)) q_1') dots.c delta_(q_(pi(n)) q_n')
  $
  


=== Lorentz协变性
现在我们考虑多粒子态的Lorentz协变性.首先我们假设 $ket(Phi)=
ket(p_1\,sigma_1\,dots.c\,p_N\,sigma_N)$ 是自由态，即粒子之间不存在相互作用.于是我们就有  $ 
    U_0(Lambda, a) ket(Phi) &= 
    e^(-i (Lambda p_1) a) ... e^(-i (Lambda p_N) a)\
     & times 
    sum_(sigma_1' ... sigma_N') 
    D^(j_1)_(sigma_1' sigma_1)
     (W(Lambda,p_1)) ... D^(j_N)_(sigma_N' sigma_N) (W(Lambda,p_N))\ 
     & times  
    ket((Lambda p_1)\,sigma_1'\,dots.c\,(Lambda p_N)\,sigma_N')
  $
此处 $U_0(Lambda, a)$ 是自由态的Lorentz变换算符，即其生成元 $H,vb(P)$ 是自由哈密顿量和动量算符.  

下面我们考虑相互作用情形，注意此时单粒子态的哈密顿量可以写作 $H=H_0+H_"I"$ 其中 $H_"I"$ 描述体系的相互作用.一般而言，我们不能完全求解 $H_"I"$,因此我们尝试通过 $H_0$ 得到相互作用态的一些性质，这将是我们引入量子场论的核心动机之一.

此处我们引入_渐进入态_ $ket(psi^+)$,它满足在时间平移至 $t_0-> -infinity$ 时称为_渐进自由态_，此时我们假设粒子间相互作用可以忽略不记，即可以视为自由态. 具体地，我们有：
  $ 
    e^(-i H t) ket(psi^+) 
    stretch(=)^(t arrow.r -infinity) 
    e^(-i H_0 t) ket(Phi) 
  $<eq:rel_sac_free>
等价地，我们有  $ 
    U(Lambda) e^(-i H t)  stretch(=)^(t arrow.r -infinity) 
    U_0(Lambda) e^(-i H_0 t) ket(Phi)
  $
  
下面我们讨论 $ket(psi^+)$ 的Lorentz协变性：
  $ 
    U(Lambda,a)  ket(psi^+_(p_1,sigma_1,dots.c)) 
    &= U(1,a) U(Lambda) U(1,t) U^(-1) (1, t) 
    ket(psi^+_(p_1,sigma_1,dots.c)) \ 
    & = 
     U(1,Lambda t) U(Lambda, a) 
      U^(-1) (1, t) ket(Phi_(p_1,sigma_1,dots.c)) \
    &  stretch(=)^(t_0 arrow.r -infinity)  
    e^(-i(E_1 t +dots.c))
      U_0(1,Lambda t) U_0(Lambda, a)
     ket(Phi_(p_1,sigma_1,dots.c)) \
    &= e^(-i(E_1 t +dots.c)) U_0(1,Lambda t) 
     e^(-i (Lambda p_1) a)dots.c\ 
    & times   sum_(sigma_1') 
     D_(sigma_1' sigma_1) (W(Lambda,p_1))
     dots.c ket(Phi_((Lambda p_1)\,sigma_1'\,dots.c))\
     &=e^(-i (Lambda p_1) a)dots.c
   sum_(sigma_1') 
     D_(sigma_1' sigma_1) (W(Lambda,p_1))
     dots.c ket(Phi_((Lambda p_1)\,sigma_1'\,dots.c))\
  $
其中第三步利用了  $ 
    U(1,a) U(Lambda) U(1,t) = 
    U(Lambda,a+ Lambda t_0) = 
    U(1,Lambda t_0) U(Lambda,a) 
  $
由此我们验证了渐进入态 $ket(psi^+)$ 的Lorentz协变性.同样地，我们可以验证_渐出态_ $ket(psi^-)$ 的Lorentz协变性. 

利用散射态我们可以定义散射矩阵  $ 
    S_(beta alpha) = braket(psi^-_beta,psi^+_alpha) 
  $<eq:def_S_mat>
由此我们可以通过 $S_(beta alpha)$ 得到多粒子态相互作用的信息.为此，我们当然希望散射矩阵具有Lorentz不变性：
  $ 
    S_(beta alpha) = 
      braket(psi^-_beta,psi^+_alpha)  stretch(=)^? 
      braket(U(Lambda) psi^-_beta,U(Lambda) psi^+_alpha)
  $
事实上，我们将作用在入态的Lorentz变换记作$U_+(Lambda,a)$，而作用在出态的Lorentz变换记作$U_-(Lambda,a)$,则上式要求  $ 
    U_+ (Lambda)  equiv U_- (Lambda)
  $
在后文中我们将在微扰论上，引入微观因果性，从而证明该结果.下面我们假设 $S$ 矩阵具有Lorentz协变性，于是我们得到  $ 
    S_(p_1'\,sigma_1'\,dots.c\,p_n'\,sigma_n' \;p_1\,sigma_1\,dots.c\,p_n\,sigma_n) &=
    e^(i a Lambda(p_1'+dots.c+p_n'-p_1-dots.c-p_n))\ 
    & times  
    sum_(overline(sigma_1) ... overline(sigma_n)) 
    D^(j_1)_(overline(sigma_1') sigma_1)
     (W(Lambda,p_1)) dots.c D^(j_n)_(overline(sigma_n') sigma_n)
     (W(Lambda,p_n))\ 
     & times
      sum_(overline(sigma_1') ... overline(sigma_n')) 
      D^(j_1*)_(overline(sigma_1') sigma_1')
     (W(Lambda,p_1')) dots.c D^(j_n*)_(overline(sigma_n') sigma_n')
     (W(Lambda,p_n'))\ 
      & times
    S_(Lambda p_1'\,overline(sigma_1')\,dots.c\,Lambda p_n'\,overline(sigma_n') \; Lambda p_1\,overline(sigma_1)\,dots.c\,Lambda p_n\,overline(sigma_n))
  $
这里我们注意到等式左边不依赖坐标 $a$,于是我们必须有动量守恒  $ 
    p_1'+dots.c+p_n' = p_1 +dots.c+p_n 
  $
因此我们可以将 $S-$ 矩阵写作  $ 
    S_(beta alpha) = delta(beta-alpha) + 
    i (2pi)^4 delta^4 (p_alpha-p_beta) cal(M)_(beta alpha)
  $
其中 $cal(M)_(beta alpha)$ 是所谓的散射振幅.由上式我们可以验证 $cal(M)_(beta alpha)$ 的Lorentz协变性：
   
   
   
  
  

  


=== 产生湮灭算符
描述多粒子态的一个重要工具是引入产生湮灭算符.本节我们简要介绍它们的定义与性质.我们将产生算符定义为  $ 
    a_(vb(p),sigma)^dagger ket(0) =
     ket(vb(p)\,sigma) 
  $
其中 $sigma$ 表示粒子的自旋 $z$ 分量或者螺旋度.  
=== 集团分解原理
本节我们要引入散射矩阵 $S_(beta alpha)$ 的一个重要性质.为此，我们需要引入_连通散射矩阵_.我们将通过递归的方法引入：

首先我们考虑 $1arrow.r 1'$ 散射，它的散射矩阵我们可以写作  $ 
    S_(q_1' q_1) = S^C_(q_1' q_1)= delta(q_1'-q_1) 
  $
进一步，对于 $2 arrow.r 2'$ 散射，我们可以写作  $ 
    S_(q_2' q_1' q_1 q_2) &=
     S^C_(q_2' q_1' q_1 q_2) + S^C_(q_2' q_1) S^C_(q_1' q_2) plus.minus  S^C_(q_2' q_2) S^C_(q_1' q_1)\
     &=S^C_(q_2' q_1' q_1 q_2) +delta(q_2'-q_2) delta(q_1'-q_1) plus.minus  delta(q_2'-q_1) delta(q_1'-q_2)
  $
其中 $plus.minus $ 表示对交换费米子取 $-$,其他情况取 $+$.

类似的，对于 $3 arrow.r 3'$ 散射，我们有  $ 
     S_(q_3' q_2' q_1' q_1 q_2 q_3) &=S^C_(q_3' q_2' q_1' q_1 q_2 q_3) 
    \ &+
     S^C_(q_3' q_2' q_2 q_3) delta(q_1'-q_1) plus.minus  "置换"\ 
     &=delta(q_3'-q_3) delta(q_2'-q_2) delta(q_1'-q_1) plus.minus  "置换"\
  $
其中等式右边共有 $1+C_3^1 C_3^1+3! =16$ 项.

再考虑 $4'arrow.r 4$ 散射：
  $ 
    S_(q_4' q_3' q_2' q_1' q_1 q_2 q_3 q_4) &=S^C_(q_4' q_3' q_2' q_1' q_1 q_2 q_3 q_4) \
    &+ S^C_(q_4' q_3' q_3 q_4) S^C_(q_2' q_1' q_1 q_2) plus.minus  "置换"\

    &+ S^C_(q_4' q_3' q_2'q_2 q_3 q_4) delta(q_1'-q_1) plus.minus  "置换"\
    &+ S^C_(q_4' q_3' q_3 q_4) delta(q_2'-q_2) delta(q_1'-q_1) plus.minus  "置换"\
    & + delta(q_4'-q_4) delta(q_3'-q_3) delta(q_2'-q_2) delta(q_1'-q_1) plus.minus  "置换"\
  $
其中等式右边的项数为：
  $ 
    1+(C_4^2 C_4^2) /2+C_4^1 C_4^1+2C_4^2 C_4^2 + 4! = 131 
  $#footnote()[
      第二项的 $1/2$因此来源于 $(1' 2';1 2),(3' 4',3 4)$ 和
         $(3' 4',3 4),(1' 2';1 2)$ 是同一项. 
    ]
注意上述所有散射过程我们都假设单粒子态是稳定的，否则上述过程会有更多项.一般地，我们可以将散射矩阵写为  $ 
    S_(beta alpha) = 
    sum_("PART") (plus.minus ) S^C_(beta_1 alpha_1) S^C_(beta_2 alpha_2) dots.c
  $<eq:cluster_decomposition>
为了进一步看到连通散射矩阵 $S^C$ 的性质，我们考虑Fourier变换：
  $ 
    S^C_(vb(x_1') vb(x_2') dots.c vb(x_1) vb(x_2) dots.c) &=
    integral dd(vb(p_1')) dd(vb(p_2')) dots.c dd(vb(p_1)) dd(vb(p_2)) dots.c
    S^C_(vb(p_1') vb(p_2') dots.c vb(p_1) vb(p_2) dots.c)\ 
    & times  e^(i vb(p_1') vb(x_1')) e^(i vb(p_2') vb(x_2')) dots.c e^(-i vb(p_1) vb(x_1)) e^(-i vb(p_2) vb(x_2)) dots.c 
  $
我们在本节开始给出 $S_(beta alpha)$ 由于时空平移不变性，带有一个 $4-$ 动量守恒因子，于是对于连通散射矩阵，我们有  $ 
      S^C_(vb(p_1') vb(p_2') dots.c vb(p_1) vb(p_2) dots.c) =
      delta^4 (p_1'+dots.c+p_n'-p_1-dots.c-p_n) C_(vb(p_1') vb(p_2') dots.c vb(p_1) vb(p_2) dots.c)
  $
下面我们考虑 $vb(x_1'),vb(x_2)$ 同时移动到无穷远处，则有  $ 
     S^C_(vb(x_1') vb(x_2') dots.c vb(x_1) vb(x_2) dots.c) & stretch(=)^(abs(vb(a)) arrow.r oo) 
    integral dd(vb(p_1')) dd(vb(p_2')) dots.c dd(vb(p_1)) dd(vb(p_2)) dots.c
    S^C_(vb(p_1') vb(p_2') dots.c vb(p_1) vb(p_2) dots.c)\ 
    & times  e^(i vb(p_1') vb(x_1')) e^(i vb(p_2') vb(x_2')) dots.c e^(-i vb(p_1) vb(x_1)) e^(-i vb(p_2) vb(x_2)) dots.c \ 
    & times  e^(i (vb(p_1'-p_2)) dot.c vb(a))
  $
Riemann-Lebesgue引理告诉我们，除非 $vb(p_1')=vb(p_2)$, 否则上述积分会趋于零.这个结果立刻给出，如果 $C_(vb(p_1') vb(p_2') dots.c vb(p_1) vb(p_2) dots.c)$ 没有关于某些 $vb(p'),vb(p)$ 的 $delta$ 函数因子，那么当 $(beta,alpha)$ 中的某个子集 $(beta_1,alpha_1)$ 在空间上距离其他粒子无穷远时，我们有 $S^C_(beta alpha) arrow.r 0$.进一步地，利用@eq:cluster_decomposition, 散射矩阵将满足  $ 
    S_(beta alpha) arrow.r S_(beta_1 alpha_1) S_(beta' alpha')
  $
其中 $S_(beta' alpha')$ 是剩余粒子构成的散射矩阵.我们将这个结果称为_集团分解原理_，它保证了微观体系的_局域性_.
      
   
    
   
  
  

== 单粒子的路径积分
本节我们简单考虑单粒子的路径积分，即计算散射过程  $ 
    braket(q_f\,t_f,q_i\,t_i)= 
    braket(q_f,e^(-i H(t_f-t_i)),q_i) 
  $
对于单粒子而言，其满足正则对易关系  $ 
    [Q,P] = i  
  $
其中 $P, Q$ 分别是动量算符和位置算符.因此我们有  $ 
    braket(q,p) = 1/sqrt(2 pi) exp(i p q) 
  $
记  $ 
    Delta t = (t_N-t_0)/N$
于是 
  $ 
    braket(q_f,e^(-i H(t_f-t_i)),q_i) =braket(
      q_f, e^(-i H Delta t ) dots.c e^(-i H Delta t ) ,q_i
    )  
  $
我们再插入 $N$ 个坐标完备关系到每个$e^(-i H Delta t )$前面， 
$N$ 个动量完备关系到每个$e^(-i H Delta t )$后面，则有  $ 
      braket(q_f,e^(-i H(t_f-t_i)),q_i) &= 
      product_(k=1)^N integral dd(p_k) 
      product_(m=1)^(N) integral dd(q_m)\ 
      & times 
      braket(q_f,q_(N)) 
      braket(q_(N),e^(-i H Delta t ),p_(N)) 
      dots.c 
      braket(q_1,e^(-i H Delta t ),p_1) 
      braket(p_1,q_i) \
      &=product_(k=1)^N integral dd(p_k)/(2pi) 
      dd(q_k) 
      exp{ sum_k
        [-i H(p_k, q_k) Delta t +i p_k  (q_k-q_(k-1))]
      }\ 
      &=product_(k=1)^N integral dd(p_k)/(2pi) 
      dd(q_k) 
      exp{ i  sum_k
        [p_k (q_k-q_(k-1))/(Delta t) - H(p_k, q_k)]Delta t 
      }\ 
  $
取 $N arrow.r oo$,引入积分测度  $ 
    integral cal(D)q cal(D) p = 
    lim_(N arrow.r oo) 
    product_(k=1)^N integral dd(p_k)/(2pi) 
      dd(q_k) 
  $
且指数部分变为  $ 
     sum_k
        [p_k (q_k-q_(k-1))/(Delta t) - H(p_k, q_k)]Delta t  
        arrow.r integral_(t_i)^(t_f) dd(t)  [p(t) dot.c dot(q)(t) - H(p(t), q(t))]
  $
即有  $ 
     braket(q_f,e^(-i H(t_f-t_i)),q_i)  = 
      integral cal(D)q cal(D) p exp{ i integral_(t_i)^(t_f) dd(t)  [p(t) dot.c dot(q)(t) - H(p(t), q(t))]}
  $<eq:path_integral_phase_space>
注意上述积分关于 $q(t)$ 存在边界条件  $ 
    q(t_i) = q_i, q(t_f) = q_f  
  $
而关于 $p(t)$ 是无约束的，于是若 $H(p,q)$ 是关于 $p$ 的二次型，我们总能关于 $p$ 积分，从而将上述写作  $ 
     braket(q_f,e^(-i H(t_f-t_i)),q_i) = 
      integral cal(D)q exp{ i integral_(t_i)^(t_f) dd(t)  L(dot(q)(t), q(t))}
  $<eq:path_integral_configuration_space>
其中 $L(q,dot(q))$ 是单粒子的经典拉氏量#footnote()[详见@prob:saddle_point].
     
下面我们考虑一组依赖 $P,Q$ 的算符，在Heisenberg表象下，它们显然依赖时间.因此，我们可以记作  $ 
    O_a (t_a) equiv O_a (P(t_a), Q(t_a)) 
  $
将其插入散射振幅，我们有  $ 
    braket(q_f\,t_f, O_a (t_a),q_i\,t_i) &= 
    braket(q_f,e^(-i H(t_f-t_a)) O_a e^(-i H(t_a-t_i)),q_i)\
    &=
    integral dd(p_a) dd(q_a)  
    braket(q_f,e^(-i H(t_f-t_a)),p_a)
    braket(p_a,O_a,q_a)
     braket(q_a,e^(-i H(t_a-t_i)),q_i)\
     &=integral cal(D) q 
     O_a (q(t_a))
      exp{ i integral_(t_i)^(t_f) dd(t)  L(dot(q)(t), q(t))}
  $
这里我们假设 $O_a$ 仅依赖于位置算符 $Q$,因此我们可以直接将 $O_a$ 写作 $O_a (q(t_a))$.

类似的，我们考虑一组算符 $O_a (t_a), O_b (t_b),dots.c$, 为了满足路径积分中的时序性，我们引入时序算符：
  $ 
    bf(T) [O_a (t_a) O_b (t_b) dots.c] =
    product_i O_i (t_i)  , t_1 > t_2 > dots.c > t_n
  $
因此，可以将上式写作：
  $ 
     braket(q_f\,t_f, bf(T) [O_a (t_a) O_b (t_b) dots.c],q_i\,t_i)
     &= integral cal(D) q
      O_a (q(t_a)) O_b (q(t_b)) dots.c\ 
      & times 
        exp{ i integral_(t_i)^(t_f) dd(t)  L(dot(q)(t), q(t))}
  $<eq:single_time_ordered_path_integral>
  

== 泛函积分


=== 实变量
我们从二次型积分开始：
  $ 
    I [J]= integral dd(x,[n]) e^(-1/2 x^T A x + J^T x)  
  $
其中 $A$ 是一个实对称正定矩阵，首先注意到  $ 
    I_0 = integral dd(x,[n]) e^(-1/2 x^T A x) = sqrt((2pi)^n/det A)
  $
下面考虑 $x arrow.r x+A^(-1) J$,则
  $ 
      x^T A x arrow.r (x+A^(-1) J)^T A (x+A^(-1) J) 
      = x^T A x + J^T A^(-1) J + x^T J + J^T x
  $
于是我们得到  $ 
    I[J] = e^(1/2 J^T A^(-1) J) I_0
  $
下面我们将该结果推广到_不可数无穷维_, 即所谓泛函型积分：
  $ 
    Z[J=0] =  integral cal(D phi) exp[
      -1/2 integral dd(x,y) phi(x) A(x,y) phi(y) 
    ] 
  $
其中 $A(x,y)$ 是一个实对称正定算符.注意此时 $Z_0$ 是无穷大，一般地，我们将其作归一化处理：
  $ 
    Z[J=0] equiv 1
  $
由此，我们有  $ 
    Z[J] &=  integral cal(D phi) exp[
      -1/2 integral dd(x,y) phi(x) A(x,y) phi(y) 
    ] \ 
    &=exp[
      1/2 integral dd(x,y) J(x) A^(-1) (x,y) J(y)
    ]
  $<eq:gaussian_functional_integral>


=== 复变量
下面我们将实变量推广到复变量，考虑如下积分：
  $ 
    Z_0 = integral cal(D) Phi^dagger cal(D) Phi exp[
      - integral dd(x,y) Phi^dagger (x) A(x,y) Phi(y)
    ] 
  $
其中 $Phi,Phi^dagger$ 可以看作实变量的组合：
  $ 
    Phi &= 1/sqrt(2) [phi_1 + i phi_2]\
     Phi^dagger &= 1/sqrt(2) [phi_1 - i phi_2]
  $
于是我们实际有  $ 
    Z_0 = cal(N) integral cal(D) phi_1 cal(D) phi_2 exp[
      -1/2 integral dd(x,y) 
     (
      phi_1 (x) A(x,y) phi_1 (y) + phi_2 (x) A(x,y) phi_2 (y)
     )
    ] 
  $
其中 $cal(N)$ 是换元导致的雅可比行列式，其是常数，我们常常将其吸入到归一化中.此外， 我们利用了 $A(x,y)$ 的对称性, 即 $A(x,y)=A(y,x).$ 
  $ 
    integral dd(x,y) phi_1 (x) A(x,y) phi_2 (y) 
    = integral dd(x,y) phi_2 (x) A(x,y) phi_1 (y) 
  $
进一步，我们考虑：
  $ 
    Z[J^dagger,J] &= 
     integral cal(D) Phi^dagger cal(D) Phi exp[
      - integral dd(x,y) Phi^dagger (x) A(x,y) Phi(y) \ 
      &
      + integral dd(x) [J^dagger (x) Phi(x) + Phi^dagger (x) J(x)]
    ] 
  $
其中 $J,J^dagger$ 也可以按实变量写成：
  $ 
    J = 1/sqrt(2) (J_1+i J_2)\ 
    J^dagger = 1/sqrt(2) (J_1 - i J_2) 
  $
于是我们有  $ 
     Z[J_1,J_2] & = 
 integral cal(D) phi_1 cal(D) phi_2 exp[
      -1/2 integral dd(x,y) 
     (
      phi_1 (x) A(x,y) phi_1 (y) + phi_2 (x) A(x,y) phi_2 (y)
     )\ 
      &+ integral dd(x) [J_1 (x) phi_1 (x) + J_2 (x) phi_2 (x)]
    ] \ 
    &=exp [ 1/2
      integral dd(x) dd(y)  
      (J_1 (x) A^(-1) (x,y) J_1 (y) + J_2 (x) A^(-1) (x,y) J_2 (y))
    ]\ 
    &= exp [ integral dd(x) dd(y) J^dagger (x) A^(-1) (x,y) J(y)]
  $

=== Grassmann变量
进一步，我们引入Grassmann变量 $xi, eta$,其生成数域 $FF$ 上的_代数_，满足反对易乘法：
  $ 
    xi eta = - eta xi 
  $
显然，我们有 $xi^2 =0$. 对于函数 $f(xi)$,其一般写作  $ 
    f(xi) = a + b xi  
  $
于是定义Grassmann变量的积分为  $ 
    integral d xi f(xi) = b 
  $
对于多元Grassmann函数：
  $ 
    f(vb(xi)) = a + sum_i b_i xi_i + sum_(i<j) c_(i j) xi_i xi_j + ... 
  $
定义其积分为  $ 
    integral dd(vb(xi)) f(vb(xi))
    = integral dd(xi_n) dot.c dd(xi_1) 
    f(vb(xi)) = c_(1 2 ... n)     
  $
当 $FF= RR$ 时，我们考虑Gauss型积分：
  $ 
    integral dd(vb(xi)) 
    exp[
      1/2 vb(xi)^T M vb(xi)
    ]  = sqrt(det M)
  $
其中 $M$ 是一个反对称矩阵. 由此，我们可以将其推广:
  $ 
       integral dd(vb(xi)) 
    exp[
      1/2 vb(xi)^T M vb(xi) + vb(eta)^T vb(xi)
    ]  = sqrt(det M) exp[
      1/2 vb(eta)^T M^(-1) vb(eta)
    ]
  $
其中我们取 $vb(xi) arrow.r vb(xi) + M^(-1) vb(eta)$,并利用 $M,M^(-1)$ 的反对称性.进一步，我们将其推广到泛函形式：
  $ 
    &integral cal(D) psi exp[
      1/2 integral dd(x,y) psi(x) A(x,y) psi(y) + integral dd(x) eta(x) psi(x)
    ] \
    &=  exp[
      1/2 integral dd(x,y) eta(x) A^(-1) (x,y) eta(y)
    ] 
  $
下面考虑 $FF=bb(C)$ 时，考察泛函积分  $ 
    Z[eta^dagger,eta] &=
      integral  cal(D) psi cal(D) psi^dagger exp[
        integral dd(x,y) psi^dagger (x) A(x,y) psi(y) \ 
        &+ integral dd(x) [eta^dagger (x) psi(x) + psi^dagger (x) eta(x)]
      ]
  $
其中积分测度如下定义：
  $ 
    dd(x,[n]) dd(x^dagger,[n]) = 
    dd(x_n) dd(x^dagger_n) dots.c dd(x_1) dd(x^dagger_1)  
  $
进一步，复变量可以由实变量表示：$ 
    psi &= 1/sqrt(2) (xi + i eta)\
    psi^dagger &= 1/sqrt(2) (xi - i eta)
  $
由此，将换元带来的常数吸入到归一化中，我们就有 $Z[0,0]=1$. 进一步，作平移变换：
  $ 
    psi arrow.r psi - A^(-1) eta\ 
    psi^dagger arrow.r psi^dagger - eta^dagger A^(-1) 
  $
我们就可以得到  $ 
    Z[eta^dagger,eta] = exp[
     - integral dd(x,y) eta^dagger (x) A^(-1) (x,y) eta(y)
    ]
  $<eq:gaussian_integral_grassmann>

=== 泛函导数
为了简单，我们考虑实变量的泛函积分  $ 
    Z[J] = integral cal(D) phi
    exp[
    i { integral dd(x,4) cal(L) [phi] + J(x) phi(x)}
    ] 
  $
这里 $cal(L)[phi]$ 可以看作 $phi$ 的二次型，于是取归一化条件  $ 
    Z[J=0] = 1 
  $
由此考察上式关于 $J(x)$ 的泛函导数：    $ 
    1/i dv(Z, J(x_1),d:delta) &
    =  integral cal(D) phi exp[
    i { integral dd(x,4) cal(L) [phi] + J(x) phi(x)}
    ] integral dd(x,4)  dv(, J(x_1),d:delta) J(x) phi(x)\ 
    &=integral cal(D) phi exp[
    i { integral dd(x,4) cal(L) [phi] + J(x) phi(x)}
    ] integral dd(x) delta(x-x_1) phi(x)\ 
    &=
     integral cal(D) phi phi(x_1) exp[
    i { integral dd(x,4) cal(L) [phi] + J(x) phi(x)}
    ]
  $
我们再取 $J-> 0$,则有  $ 
    1/i evaluated(dv(Z, J(x_1),d:delta))_(J=0) 
    = integral cal(D) phi phi(x_1) exp[i S(phi)]   
  $
类似的，  $ 
    (1/i)^n  evaluated(dv(Z, J(x_1),d:delta)
    dots.c dv(Z, J(x_n),d:delta)
    )_(J=0) = 
    integral cal(D) phi phi(x_1) dots.c phi(x_n) exp[i S(phi)]
  $
注意等式右边类似于包含算符时序乘积的散射振幅@eq:single_time_ordered_path_integral.


以后我们把上述只包含 $phi$ 的二次型泛函的称为自由泛函，记作 $Z_0[J]$,从而区分包含相互作用的泛函 $Z[J]$：  
  $ 
    Z[J] = 
    integral cal(D) phi
      exp [
        i integral dd(x,4) {
          cal(L) [phi] + J(x) phi(x) + 
          cal(L)_"I" [phi]
        } 
      ]
  $
利用泛函导数，我们有：  $ 
     Z[J] &=exp[i cal(L)_I (1/i dv(, J(x),d:delta))] 
      integral cal(D) phi
        exp [
          i integral dd(x,4) {
            cal(L) [phi] + J(x) phi(x) 
          } 
        ]\ 
        &= exp[i cal(L)_I (1/i dv(, J(x),d:delta))]  Z_0 [J]
  $<eq:interaction_functional>
即相互作用泛函可以通过泛函导数作用在自由泛函上得到. 
    
== 习题

#prob()[
  本习题我们将讨论 $S^C_(vb(q'),vb(q))$ 在包含一些关于动量的奇异结构时，其仍然满足集团分解原理.
  首先我们考虑  $ 
      S^C (vb(p),vb(q)) = 1/(vb(p)-vb(q))^2 
    $
我们将其Fourier变换到坐标空间，得到  $
    S^C (vb(x),vb(y)) = integral dd(vb(p),3) dd(vb(q),3) 
    e^(-i vb(p) vb(x)) e^(i vb(q) vb(y)) 1/(vb(p)-vb(q))^2 
  $
    
] 

#prob(label: <prob:saddle_point>)[
  在@eq:path_integral_phase_space 中，假设 $H(p,q)$ 是关于 $p$ 的二次型，利用Stationary phase approximation，证明上述在吸纳一个归一化常数后等价于@eq:path_integral_configuration_space.
]

