#import "../../lib.typ":*

= 泛函形式
== 有效作用量
区别于生成泛函 $Z[J]$,我们将 $W[J]$ 称为连通生成泛函，其满足  $ 
    Z[J] = sum_(N=0)^infinity 1/N! (i W[J])^N = exp(i W[J])
  $<eq:W_def>
其中 $W[J]$ 的物理意义是所有连通图的总和. 下面我们引入场 $phi$ 的外源 $J$ 下的真空期望值  $ 
    phi_J (x) = 
    braket(0,phi(x),0)_(J) = 
    1/i dv(Z[J], J(x),d:delta) = 
    dv(W[J], J(x),d:delta)   
  $<eq:phi_J_def>
同时我们定义 $J_phi (x)$ 是 $phi=phi_J$ 时的外源 $J(x)$.如此，我们便可以引入Legendre变换定义有效作用量 $Gamma[phi]$:
  $ 
    Gamma[phi] := 
    - integral d^4 x J_phi (x) phi(x) + W[J_phi] 
  $<eq:Gamma_def>
下面我们将证明 $Gamma[phi]$ 实际表示所有连通1PI图的和. 

为了证明这一点，我们引入新的连通生成泛函 $W_Gamma [J,g]$,其满足
  $ 
    exp(i W_Gamma [J,g]) = 
    integral D phi exp[i/g [Gamma[phi] + integral d^4 x J(x) phi(x)]]
  $ 
其中 $g$ 是一个辅助参数.上式对应的每张Feynman图，每一个内线都正比于 $g$,每一个顶点都正比于 $1/g$#footnote()[
  这是因为传播子是 $Gamma[phi]$ 关于 $phi$ 二次项的逆.  
]. 因此，$W_Gamma [J,g]$ 的每一项都正比于 $g^(I-V)$,对于连通图，我们有 $L=I-V+1$,于是我们得到  $ 
     W_Gamma [J,g] #sym.prop g^(L-1)
  $
或者我们显式地将 $g$ 展开成幂级数，得到
  $ 
    W_Gamma [J,g] = sum_(L=0)^infinity g^(L-1) W_Gamma ^(L) [J]
  $ 
下面我们取 $g arrow.r 0$, 只有 $W_Gamma^((0))$ 有贡献， 利用Saddle point近似，我们得到
  $ 
    exp[i W_Gamma [J,0]] approx  exp[i
    [Gamma[phi_J]
    + integral d^4 x J(x) phi_J (x)]
    ]
    ]
  $
其中 $phi_J$ 由稳相点确定：
  $ 
    evaluated(pdv(Gamma, phi(x)))_(phi=phi_J) =-J (x)
  $
如此，我们得到  $ 
     W_Gamma [J] = Gamma[phi_J]
    + integral d^4 x J(x) phi_J (x) = W[J]
  $
为此我们发现 $W_Gamma [J]$ 就是连通振幅的和，但是 $W_Gamma [J]$ 来源于量子作用量 $Gamma[phi]$ 提供的树图，而不包括任何圈图：
  $ 
    i W[J] equiv 
    integral_("C,tree") cal(D) phi exp[i [Gamma[phi] + integral d^4 x J(x) phi(x)]] 
  $
现在， $i W[J]$ 的每一张子图都是连通的树图，而每个顶点是 $Gamma[phi]$ 生成的1PI图. 这要求 $i Gamma[phi]$ 必须是外线数目任意的连通1Pi图的和，且外线上的因子对应场 $phi$. 进一步，我们可以将 $Gamma$ 在场构型 $phi_0$ 处按幂级数展开：
  $ 
    Gamma[phi] = Gamma^((0)) [phi_0] 
    + sum_(n=1)^infinity 1/n! integral d^4 x_1 ... d^4 x_n Gamma^((n)) 
    [phi_0; x_1,...,x_n] phi.alt(x_1) ... phi.alt(x_n) 
  $<eq:Gamma_expansion>
其中 $phi.alt=phi-phi_0$.而系数 $Gamma^((n)) [phi_0; x_1,...,x_n]$ 可以视为 $phi_0$点下的重整化耦合常数，我们将在下文论述.


等价地，对于固定的场 $phi_0 (x)$, $i Gamma[phi_0]$ 是真空连通1Pi散射振幅的生成函数：
  $ 
     i Gamma[phi_0] = integral_("C,1Pi") cal(D) phi exp[i S[phi + phi_0]]
  $<eq:Gamma_phi01>
我们也可以考察所有连通和不连通的1Pi图，即  $ 
    exp[i Gamma[phi_0]] = 
    integral_("C") cal(D) phi exp[i S[phi + phi_0]]
  $
下面我们考察@eq:Gamma_expansion 中的前几个系数项.首先注意到  $ 
    dv(Gamma[phi], phi(x),d:delta)  &= 
    - J_phi (x) - integral dd(y,4) dv(J_phi (y), phi(x),d:delta) phi(y) +
     integral dd(y,4)  dv(W[J_phi], J(y),d:delta) dv(J_phi (y), phi(x),d:delta)\ 
     &=- J_phi (x)
  $
其中第一步利用了@Gamma_def 中 $Gamma$ 的定义，第二步利用了@phi_J_def 中 $phi_J$ 的定义.因此，我们得到了  $ 
    evaluated(pdv(Gamma, phi(x),d:delta)) =-J_phi (x)
  $
当 $J=0$,即没有外源时，我们得到  $ 
      evaluated(pdv(Gamma, phi(x),d:delta)) = 0
  $<eq:Gamma_EOM>
这也是我们将 $Gamma[phi]$ 称为_量子有效作用量_的原因，它满足量子运动方程@eq:Gamma_EOM. 在@eq:Gamma_expansion，我们就有 $Gamma^((1))[phi]=0.$ 

另一方面，我们注意到严格传播子为  $ 
    1/i Delta(x-y) = (1/i)^2 pdv(Z[J], J(x),J(y),d:delta,) =1/i pdv(W[J], J(x),J(y),d:delta)
    =pdv(phi_J (x), J(y),d:delta) 
  $
以及  $ 
    Gamma^((2)) [phi; x,y] =
     pdv(Gamma[phi], phi(x),phi(y),d:delta,) = - pdv(J_phi (x), phi(y),d:delta)
  $
因此我们有  $ 
    Gamma^((2)) [phi, x,y] = -  Delta^(-1) (x-y)
  $
即 $Gamma^((2))$ 是严格传播子的逆.
  


== 有效势
本节我们将讨论讨论 $Gamma[phi_0]$ 的物理意义以及它的单圈结果.首先，我们假设 $phi_0$ 不依赖于位置，于是@eq:Gamma_phi01
中右边每一项都包含体系因子  $ 
    cal(V) = integral dd(x,4) = (2pi)^4 delta^4 (0)  
  $
因此我们可以将 $Gamma[phi_0]$ 写成  $ 
    Gamma[phi_0] = - cal(V) V (phi_0)
  $
其中我们将 $V(phi_0)$ 称为_有效势_. 

为了看到 $Gamma[phi_0],V[phi_0]$ 的物理意义，我们假设外源 $J(x)$ 从 $t arrow.r -infinity$ 缓慢增加到有限值 $cal(F) (vb(x))$,并在 $T$ 时间内保持几乎不变，最后在 $t arrow.r +infinity$ 时缓慢减小到0.在这个过程中，真空-真空散射振幅积累了相位因子  $ 
    braket(0_"out",0_"in") = exp(-i E[cal(F)] T) 
  $
其中 $E[cal(F)(vb(x))]$ 是真空被外源激发到了某个态的能量.上式代入到@eq:W_def，这给出  $ 
    W[J] =  - E[cal(F)] T
  $
下面我希望找到量子态 $ket(Psi)_cal(F)$, 其正是由 $J(vb(x))$ 激发到能量为 $E[cal(F)]$ 的态.为此，我们考虑如下的量子态
 $ket(Omega)_phi$,其使得能量期望值最小：
   $ 
    expval(H) =  upright(m i n) braket(Omega,H,Omega)/braket(Omega,Omega) 
   $
此外，量子场 $Phi(vb(x),t)$ 对其期望值的时间无关的：
  $ 
    braket(Omega,Phi(vb(x),t),Omega)/braket(Omega,Omega) = phi (vb(x)) 
  $
此外，我们要求 $ket(Omega)$ 也能归一化，为此我们最好构建拉格朗日乘子：
  $ 
    braket(Omega,H,Omega) - alpha braket(Omega,Omega) - 
    integral dd(vb(x),3) beta(vb(x)) [braket(Omega,Phi(vb(x),t),Omega)]  
  $
如果我们求得上式的极小值，我们得到  $ 
    H ket(Omega) = alpha ket(Omega) + integral dd(vb(x),3) beta(vb(x)) Phi(vb(x),t) ket(Omega)
  $
此外，我们期望的 $ket(Psi)_cal(F)$ 满足  $ 
    [H - integral dd(x,3) cal(F)(vb(x)) Phi(vb(x),t)] ket(Psi)_cal(F) = E[cal(F)] ket(Psi)_cal(F)
  $
因此为了上述最小化程序成立，我们要求  $ 
    ket(Omega) =  ket(Psi)_(cal(F)_phi)\ 
    alpha = E[cal(F)_phi]\ 
    beta(vb(x)) = cal(F)_phi(vb(x))
  $
其中 $cal(F)_phi$ 是让 $Phi(x)$ 作用到 $ket(Psi)_cal(F)$ 得到本征值 $phi(vb(x))$ 的指定流.于是我们得到  $ 
    expval(H) = E[cal(F)_phi] + integral dd(vb(x),3) cal(F)_phi (vb(x)) phi(vb(x))
  $
于此，我们得到  $ 
    expval(H) = 1/T [-W[J_phi] + integral dd(x,4) J_phi (x) phi(x)] = -1/T Gamma[phi]=
    cal(V)_3 V[phi_0]
  $
因此，我们可以将 $Gamma[phi]$ 视为在外源 $J_phi$ 下的能量.而有效势将被视为在常数背景 $phi_0$ 下的能量密度.
  



===  $phi^4$ model
作为例子，我们考察 $phi^4$ 模型的有效势.其经典作用量  $ 
    I[phi] = - integral dd(x,4) 
    [
      lambda + 1/2 partial_mu phi partial^mu phi + 1/2 m^2 phi^2 + g/4! phi^4
    ]  
  $
这里我们显式引入了一个 $lambda$ 因子，我们将在后文中看到它的物理意义.下面我们考虑偏移 $phi$ 到 $phi+phi_0$:
  $ 
    I[phi+phi_0] & = -cal(V) [lambda + 1/2 m^2 phi_0^2 + g/4! phi_0^4] 
    - integral dd(x,4) [1/2 partial_mu phi partial^mu phi + 1/2 (m^2 + g/2 phi_0^2) phi^2] \ 
    &+integral dd(x,4) [ g/3! phi_0 phi^3 + g/4! phi^4]
  $<eq:phi4_shift>
其中我们忽略了关于 $phi$ 的线性项，因为它们不贡献于有效势.上述第一相贡献于有效势的零圈项:
  $ 
    i Gamma^((0))[phi_0] = - i cal(V) [lambda + 1/2 m^2 phi_0^2 + g/4! phi_0^4] 
  $
其第二项贡献了单圈项：
  $ 
     exp[i Gamma^((1))[phi_0]] = 
     integral D phi exp[-i/2 integral dd(x,4) phi(x) (-partial^2 +mu^2 (phi_0)) phi(x)]
  $
其中我们引入了有效质量  $ 
    mu^2 (phi_0) = m^2 + g/2 phi_0^2 
  $
上述高斯积分结果为  $ 
     i Gamma^((1))[phi_0] = ln det(i/pi [-partial^2 + mu^2 (phi_0)])^(-1/2) &=
     -1/2 Trace ln(i/pi [-partial^2 + mu^2 (phi_0)]) \
     &=-cal(V)/2  integral dd(k,4)/(2pi)^4  ln( i/pi (k^2 + mu^2 (phi_0))) 
  $
现在，完整的有效势  $ 
    V[phi_0] = 
    lambda + 1/2 m^2 phi_0^2 + g/4! phi_0^4 
    - i/2 integral dd(k,4)/(2pi)^4  ln( i/pi (k^2 + mu^2 (phi_0))) 
  $
最后一项显然是发散的，为此我们单独处理：
  $ 
    cal(F) (mu^2) = 
    - i/2 integral dd(k,4)/(2pi)^4  ln( i/pi (k^2 + mu^2)) 
  $
关于 $mu^2$ 取三次导数：
  $ 
    cal(F)''' (mu^2) = -i/2 integral dd(k,4)/(2pi)^4 1/(k^2 + mu^2)^3 
  $
为了计算这个积分，我们引入Wick旋转：
  $ 
    p^0 = i p_E  
  $
其中 $p_E in (-infinity, + infinity)$,即将 $p^0$ 从实轴逆时针转动到虚轴.注意 $(p^2+m^2- i epsilon)$ 约定使得积分极点处于 $2,3$ 象限，于是Wick旋转不会碰到任何极点，则  $ 
      cal(F)''' (mu^2) = 1/2 integral dd(k_E,4)/(2pi)^4 1/(k^2 + mu^2)^3 =
      1/(2pi)^4 integral dd(k) (2pi^2 k^3 )/(k^2 + mu^2)^3 = 1/(32 pi^2 mu^2)
  $
连续积分 $3$ 次我们得到  $ 
    cal(F) (mu^2) = 
    (mu^4 ln mu^2)/(64 pi^2) + A+ B mu^2 + C mu^4 
  $
其中 $A, B ,C$ 承担了无穷大因子.为了消除这些发现，我们引入重整化点：
  $ 
    lambda_R &= lambda_R + A + B m^2 +C m^4\ 
    m_R^2 &= m^2 + g B +2g m^2 C\ 
    g_R^2 &= g + 6g^2 C 
  $
于是我们得到  $   
    V[phi_0] = 
    1/2 m_R^2 phi_0^2 + g_R/4! phi_0^4 
    + (mu^4 (phi_0) ln mu^2 (phi_0) )/(64 pi^2)
  $
其中我们取 $lambda_R=0$,$ 
    mu^2 (phi_0) = m_R^2 + g_R/2 phi_0^2 
  $
  
         

   

=== NJL model 
下面我们考虑一个另一个著名的 $4-$ 费米子相互作用量理论：
  $ 
    cal(L) = overline(psi) (i slashed(partial) - m) psi + G 
    [
      (overline(psi) psi)^2 + (overline(psi) i gamma^5 psi)^2
    ]
  $<eq:NJL_L>
注意相互作用的第二项是赝标量的. 我们将在后文说明该理论是_不可重整化_的，为了得到该理论的单圈有效势，我们利用Hubbard-Stratonovich变换引入辅助标量场 $sigma$ 和赝标量场 $pi$:
  $ 
    cal(L) = overline(psi) (i slashed(partial) - m - sigma - i gamma^5 pi) psi - 1/(4G) (sigma^2 + pi^2)
  $<eq:NJL_L_HS>
其中 $sigma, pi$ 是_辅助场_, 它们没有引入动能项.利用变分法不难得到辅助场的运动方程  $ 
    sigma = -2 G overline(psi) psi \ 
    pi = -2 G overline(psi) i gamma^5 psi 
  $
将其带回@eq:NJL_L_HS,我们就得到了@eq:NJL_L .因此，@eq:NJL_L_HS 与@eq:NJL_L 是完全等价的. 下面我们考虑常数背景  $ 
    sigma_0 = sigma(x) , pi_0 = pi(x) 
  $
于是偏移作用量  $ 
    S[sigma+sigma_0, pi +pi_0] &= - cal(V) [sigma_0^2 + pi_0^2]/(4G) 
    + integral dd(x,4) overline(psi) (i slashed(partial) - m - sigma_0 - i gamma^5 pi_0) psi \ 
    &+ dots.c 
  $
其中我们忽略了关于 $sigma, pi$ 的线性项，因为它们不贡献于有效势.上述第一项贡献于有效势的零圈项:
  $ 
   V^((0)) [sigma_0, pi_0] = [sigma_0^2 + pi_0^2]/(4G)
  $
我们定义有效质量  $ 
    M[sigma_0,pi_0] = m + sigma_0 + i gamma^5 pi_0 
  $
于是有效作用量的一圈部分为  $ 
   exp[i Gamma^((1)) [sigma_0,pi_0] ]  = 
    integral cal(D) psi cal(D) overline(psi) 
    exp[i integral dd(x,4) overline(psi) (i slashed(partial) - M[sigma_0,pi_0]) psi] 
  $
完成高斯积分我们也能得到  $ 
     i Gamma^((1)) [sigma_0,pi_0] &= ln det(
      i (-slashed(partial) + M)
     ) =  Trace ln (i (- i slashed(partial) + M))\ 
     &= cal(V) Trace integral dd(k,4)/(2pi)^4  ln [slashed(k) + M] \ 
     &= cal(V) integral dd(k,4)/(2pi)^4 ln det [slashed(k) + M] \
  $
为了进一步得到结果，我们取  $ 
    M_s = m  + sigma_0, M_p = pi_0 
  $
于是 $M=M_s + i gamma^5 M_p$,进一步定义  $ 
    rho^2 = M_s^2 + M_p^2 
  $
我们可以证明  $ 
    det[slashed(k) + M] = det[slashed(k) + rho]  =
    (k^2+rho^2)^2
  $<eq:det_M_rhoM>
因此我们得到  $ 
        i Gamma^((1)) [sigma_0,pi_0] = 
        2 cal(V)integral dd(k,4)/(2pi)^4 ln (k^2 + rho^2)
  $
进一步我们得到有效势满足  $ 
    V(sigma_0, pi_0) = [sigma_0^2 + pi_0^2]/(4G) + 2 i integral dd(k,4)/(2pi)^4 ln (k^2 + rho^2)
  $
Wick转动得到  $ 
      V(sigma_0, pi_0) = [sigma_0^2 + pi_0^2]/(4G) -2 integral dd(k_E,4)/(2pi)^4 ln (k^2 + rho^2)
  $
我们曾经提及过该理论是不可重整化的，因此我们引入一个硬截止 $Lambda$ 来处理发散，得到  $ 
    V(sigma_0, pi_0) = [sigma_0^2 + pi_0^2]/(4G) 
    -2 integral_(abs(vb(k))<Lambda) dd(vb(k),3)/(2pi)^3 ln (vb(k)^2 + rho^2)
  $
其中我们以及扔去了由 $k_E$ 积出的常数项.

@fig:NJL1,@fig:NJL2 分别给出费米子质量 $m=0,m!=0$ 情形下的有效势. 我们注意到对于 $m=0$ 的情形，有效势在 $sigma_0^2+pi_0^2=rho^2$ 处达到最小值，即系统的真空倾向于形成一个非零的标量凝聚 $sigma_0$ 或赝标量凝聚 $pi_0$. 这就是所谓的_自发对称破缺_. 另一方面，对于 $m!=0$ 的情形，我们注意到有效势最小值向 $sigma>0$ 方向倾斜，我们将其称为_显式对称破缺_.


#table(columns: 2,
  stroke:0.1pt + black,
  [#figure( caption:  $m=0$  )[
    #image("../../fig/NJL1.svg",width:80%)
  ]<fig:NJL1>],
   [#figure(caption:  $m!=0$ )[
    #image("../../fig/NJL2.svg",width:80%)
  ]<fig:NJL2>]
)

   
  
  
  
  

== Dyson-Schwinger方程

== 可重整性

#prob()[证明@eq:det_M_rhoM ，进一步证明 $ 
    det[slashed(k) + M] = det[slashed(k) + rho]  =
    (k^2+rho^2)^2
  $]
#sol()[
 


] 