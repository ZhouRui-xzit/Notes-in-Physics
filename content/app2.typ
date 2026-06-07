#import "../lib.typ": *
#import "../AppLet.typ": *

= 概率论初步
== 单变量概率论
本节我们考察连续单变量概率：
#def()[
设 $Omega subset RR$ 是一样本空间(其元素称为自由变量)，映射
$ scr(P): E subset (-infinity,x) -> RR 
$
其中 $E subset Omega $是样本空间的子集).若 $scr(P)(x)$ 
满足:
1.  $scr(P)(x)$ 是 $Omega$上的可微，不减函数
2.  $ lim_(x -> -oo) scr(P)(x)=0,
  lim_(x -> +oo) scr(P)(x)=1,
$
则称 $scr(P)(x)$ 是 $Omega$ 上的一个*累计概率函数*(CPF)
] 

#def()[
  称 $p(x)$ 是累计概率函数 $scr(P)(x)$的*概率密度函数*(PDF),若
   $ P(x) = integral_(-infinity)^x p(x) dd(x) $   
] 
#remark()[显然， $p(x)$有归一性：
  $ 
     integral_(-infinity)^(+infinity) 
     p(x) dd(x) = P(+infinity) = 1 
  $ 
   ] 
#remark()[现在，自由变量取 $[a,b]$ 域内的概率可以写作
  $ 
    scr(P)(b) - scr(P)(a) = 
    integral_a^b p(x) dd(x)  
  $ 
  ] 
#def()[设 $F(x)$是样本空间 $Omega$上的连续函数，则 $F(x)$在 $(Omega,scr(P))$ 上的*平均值*记为
  $ 
    <F> := integral_(-infinity)^(+infinity) 
    p(x) F(x) dd(x)  
  $ 
  ] 
#remark()[注意到 
  $ 
     integral_(-infinity)^(+infinity) 
    p(x) F(x) dd(x)  =
    integral_(-infinity)^(+infinity)  
    p(x) F(x)  dv(x,F)  dd(F) 
  $ 
  ] 


#exm(text("指数分布",font:"FZHei-B01"))[即指数分布的PDF为  $ 
    p(x) = lambda/2 e^(-lambda abs(x))
  $
对应的函数 $F(x)=x^2$,于是设 $F(x)=y$,我们有 $x=plus.minus sqrt(y),$ 于是  $ 
    p_F (y)  =
    lambda/2 e^(-lambda abs(sqrt(y))) 
   [ abs(1/(2 sqrt(y))) +
    abs(-1/(2 sqrt(y)))] =
    lambda/(2 sqrt(y)) 
    e^(-lambda sqrt(y))
  $ 
     
  ]   


== 多变量概率论


== 大数定理

== 