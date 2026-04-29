#import "../../lib.typ":*

= 泛函形式
== 有效作用量
区别于生成泛函 $Z[J]$,我们将 $W[J]$ 称为连通生成泛函，其满足  $ 
    Z[J] = sum_(N=0)^infinity 1/N! (i W[J])^N = exp(i W[J])
  $
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
  $
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
  


== 有效势和能量诠释

===  $phi^4$ model
=== NJL model 

== Dyson-Schwinger方程

== 可重整性

