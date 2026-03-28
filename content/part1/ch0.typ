#import "../../lib.typ":*

= 符号约定与基本概念

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
    =tensor(Lambda,+mu,-rho) tensor(Lambda,+nu,-sigma) M^(rho sigma)
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




== 路径积分简介
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
  $


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
  $

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
如果再考虑如下泛函  $ 
    Z[J] = 
    integral cal(D) phi
      exp [
        i integral dd(x,4) {
          cal(L) [phi] + J(x) phi(x) + 
          cal(L)_"I" [phi]
        } 
      ]
  $
  
    
  