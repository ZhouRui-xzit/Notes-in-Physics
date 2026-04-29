#import "../../lib.typ":*

= Yukawa理论
本章我们将利用微扰论处理一类简单且深刻的模型，即Yukawa理论。Yukawa理论是一个包含一个标量场和一个费米场的量子场论模型，它们曾经作为描述核子与介子相互作用的有效理论。通过分析Yukawa理论，我们可以得到到许多重要的量子场论技术，如Feynman图、重整化以及 $beta$ 函数等。
== Yukawa理论及其Feynman规则
为了描述费米子场和标量场的耦合，我们将相互作用项取为  $ 
    cal(L)_I = g overline(psi) psi phi 
  $
此时我们再引入自由项,则得到完整的拉氏量  $ 
    cal(L)_I = 
    -1/2 partial_mu phi partial^mu phi - 1/2 m^2 phi^2 + overline(psi) (i gamma^mu partial_mu - M) psi + g overline(psi) psi phi 
  $
注意到 $[cal(L)]=4$,于是我们不难分析得到 $[phi]=1,[psi]=3\/2,[g]=0$, 我们将在下一节发现 $[g]=0$ 的重要性。利用@sec:feyn_pole 引入的Feynman规则，我们不难计算Yukawa理论下的一些典型树阶振幅.

为了简单，我们假设体系只要一味费米子，我们称为(正)电子，记作 $e^(plus.minus )$,而标量场记作 $phi$,于此我们将介绍以下几个典型散射过程：
-  $e^- phi arrow.r e^- phi$:
  $ 
    i cal(M)  &= 
    (1/i) (i g)^2 overline(u)_s' (vb(p')) 
    [(-slashed(p)-slashed(k)+M) / (-s+M^2)
    + (-slashed(p)+slashed(k')+M) / (-u+M^2)] u_s (vb(p))\ 
    & = #move()[
      #image("../../fig/Yukawa_tree-1.pdf")
    ]
  $
- $e^- e^+ arrow.r phi phi$: 
  $ 
    i cal(M) &= 
    1/i(i g)^2 overline(v)_(s_2) (vb(p_2)) 
    [(-slashed(p_1)+slashed(k_1)+M) / (-t+M^2)
    + (-slashed(p_1)+slashed(k_2)+M) / (-u+M^2)
    ] u_(s_1) (vb(p_1))\ 
    & =  #move()[
      #image("../../fig/Yukawa_tree-2.pdf")
    ] 
  $
-  $e^+ e^- arrow.r e^+ e^-$:
  $ 
    i cal(M) &= 
    1/i (i g)^2 [
      ((overline(v)_2 u_1 ) (overline(u)_1' v_2'))/(-s + m^2)
     - ((overline(v)_2 v_2') (overline(u)_1' u_1))/(-t + m^2)
    ]
    \
    & =   #move()[
      #image("../../fig/Yukawa_tree-3.pdf")
    ] 
  $
- $e^- e^- arrow.r e^- e^-$:
  $ 
    i cal(M) &= 
    1/i (i g)^2 [
      ((overline(u)_1' u_1 ) (overline(u)_2' u_2))/(-t + m^2)
     - ((overline(u)_2' u_1 ) (overline(u)_1' u_2))/(-u + m^2)
    ]
    \
    & =   #move()[
      #image("../../fig/Yukawa_tree-4.pdf")
    ] 
  $
其中我们引入了Mandelstam变量 $s,t,u$ 来简化表达式，定义如下：
  $ 
   s = - (p_1 + p_2)^2, t = - (p_1 - k_1)^2, u = - (p_1 - k_2)^2
  $
对于 $e^+ e^- arrow.r e^+ e^-$ 这类散射过程，由于不同子图之间交换了一个费米子线，因此我们需要在振幅前面加上一个负号来满足费米子交换反对称性。  
  
== Yukawa理论的树图振幅



== Yukawa理论的1-loop修正
== Yukawa理论的重整化及其 $beta$ 函数  
== 线性Sigma模型

