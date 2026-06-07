#import "../lib.typ": *
#import "../AppLet.typ": *

=  Gamma函数与Beta函数
本章我们考察Gamma函数 $Gamma$ 与beta函数  $B$ 的定义与初步性质.
== Gamma 函数 
 $Gamma$ 函数定义为如下形式的积分：
   $ 
     Gamma(x):= integral_0^(+infinity) dd(t) t^(x-1) e^(-t)  #h(2em) x>0
   $<defGamma>
  特别地：  $ 
      0!eq.triple Gamma(1) = integral_0^(+infinity) 
      dd(t) e^(-t) = 1
    $


      
    
  容易发现递推关系：  $ 
      Gamma(x+1) &= integral_0^(+infinity) dd(t) t^x e^(-t) = - integral_0^(+infinity) dd(t) 
      t^x dd(e^(-t)) \ 
      &=x integral_0^(+infinity) dd(t) t^(x-1) e^(-t) 
    $
  即有递推公式  $ 
      Gamma(x+1) = x Gamma(x)
    $ 
  对于 $x=n in NN$的情形，我们就有
    $ 
     (n-1)! eq.triple Gamma(n) &= 
     (n-1)Gamma(n-1) \ 
     & = (n-1) dots.c Gamma(1)\ 
     &=(n-1) dots.c 1
    $
  对于 $x$ 是半整数的情形，如 $x=n+1/2$，我们有 
    $ 
      (n-1/2)! &= Gamma(n+1/2) =
      (n-1/2)Gamma(n-1/2) \ &=
      (n-1/2) dots.c (3/2) Gamma(1/2)
    $ 
   其中  $ 
       Gamma(1/2) = sqrt(pi) 
     $ 
  我们将在后文证明这个结果.
     
   
#figure(
  image("../fig/Gammazero.png",width: 55%),
  caption: "Gamma函数的极点"
)<GammaPole>
     
我们可以利用*解析延拓*的方法给出 $Gamma(x),x=0,-1,dots.c$的性质.首先注意到
  $ 
    Gamma(-n+epsilon) =1/((-n+epsilon)(-n+1+epsilon)dots.c (-1+epsilon)epsilon) Gamma(1+epsilon), #h(2em) epsilon -> 0^+
  $ 
于是我们得到 $Gamma(-n)$的渐进行为：
  $ 
    Gamma(-n+epsilon) = (-1)^n / (n! epsilon) ,   #h(2em) epsilon -> 0^+
  $ 
如@GammaPole 所示， $Gamma(x)$ 的极点分布在实轴的左半边(含原点). 
    
利用Gamma函数我们不难得到常见的Gauss函数，为此，取 $t=alpha y^2$ 代入@defGamma, 我们有  $ 
    Gamma(nu) = 2 alpha^nu integral_0^(+infinity) dd(y) 
    e^(-alpha y^2) y^(2nu-1)  
  $<GGint>
记Gauus积分为  $ 
    I_nu = integral_(0)^(+infinity) dd(y) e^(-alpha y^2) y^nu 
  $ 
其可以由Gamma函数表示：
  $ 
    I_nu = 1/(2alpha^(sfrac(nu+1,2))) Gamma((nu+1) / 2)
  $ 
对参数 $alpha$ 求导显然有
  $ 
   I_(nu+2) = -pdv(, alpha) I_nu   
  $ 
当 $nu$ 取前几个值，我们得到
  $ 
    I_0 = 1/2 sqrt(pi / alpha) ,#h(2em) & I_1=1/(2alpha) \ 
    I_2 = 1/4 sqrt(pi / alpha^3),#h(2em) & I_3 = 1/(2alpha^2) \ 
    I_4 = 3/8 sqrt(pi / alpha^5),#h(2em) & I_5 = 1/(2alpha^3)
  $ 

下面我们希望考察 $nu!$ 在无穷远处的渐进行为.为此，我们取 $t=nu+sqrt(nu) u$,带入@defGamma,我们有
  $ 
    nu! &= integral_0^(+infinity) e^(-t) t^(nu) dd(t)  \ 
    &=sqrt(nu) (nu/e)^nu integral_(-sqrt(nu))^(+infinity) 
    e^(-sqrt(nu) u ) (1+u/sqrt(nu))^nu dd(u)\ 
    &= sqrt(nu) (nu/e)^nu integral_(-sqrt(nu))^(+infinity)  
    exp(nu ln(1+u / sqrt(nu)) -sqrt(nu) u )
  $ 
将 $u$在 $u=0$ 处展开，得到
  $ 
      nu! =
      sqrt(nu) (nu/e)^nu integral_(-sqrt(nu))^(+infinity)  
      exp(-u^2/2+u^3/(3sqrt(nu))-u^4/(4nu)+dots.c)
  $ 
取 $nu-> +infinity$,只考虑最低阶近似，得到*String近似*：
  $ 
    nu! = sqrt(2 pi nu) (nu/e)^nu 
  $
对该近似等式两边取对数：
  $ 
    ln nu! approx nu ln nu-nu 
  $ 
最后，我们来考察beta函数，为此对式@GGint 取 $alpha=1$，则有 
  $ 
    Gamma(mu) Gamma(nu) &= 4 integral_0^(+infinity) dd(x) 
    integral_0^(+infinity) dd(y) e^(-(x^2+y^2)) 
    x^(2mu-1) y^(2nu-1),#h(1em)mu,nu >0 \ 
    &=4 integral_0^(+infinity) e^(-r^2) r^(2(mu+nu)-1) 
    dd(r) integral_0^(sfrac(pi,2))  cos^(2mu-1) theta 
    sin^(2nu-1) theta dd(theta) \ 
    &=Gamma(mu+nu) dot.c B(mu,nu)
  $ 
其中第二步利用了极坐标换元，最后一步引入了beta函数：
  $ 
    B(mu,nu) := 2  integral_0^(sfrac(pi,2))  cos^(2mu-1) theta 
    sin^(2nu-1) theta dd(theta) ,#h(2em)mu,nu>0
  $ 
我们立刻可以联系Gamma函数和beta函数的关系：
  $ 
    B(mu,nu) = B(nu,mu) = (Gamma(mu) Gamma(nu)) / Gamma(mu+nu)  
  $<BGamma>
再考虑换元 $eta=cos^2 theta$,则有beta函数的标准形式
  $ 
    B(mu,nu) = integral_0^1 dd(eta) eta^(mu-1) (1-eta)^(nu-1) 
  $ 
特别地，取 $mu=nu=sfrac(1,2)$,我们得到
  $ 
    B(1/2,1/2) = 2integral_0^(sfrac(pi,2)) dd(theta) =pi
  $
利用@BGamma,我们得到  $ 
    Gamma(1/2)^2 = Gamma(1)dot.c B(1/2,1/2) = pi 
  $ 
即有 $Gamma(sfrac(1,2))=sqrt(pi)$.

作为一个基本的例子，我们考察 $n-$维球体积问题： 
#exm()[对于 $n-$维球坐标，我们有  $ 
    dd(r,[n]) = 
    r^(n-1) dd(r) sin^(n-2) theta_1 dd(theta_1)  dots.1
    sin theta_(n-2) dd(theta_(n-2))  dd(phi) 
  $
  其中 $theta_i in [0,pi],phi in [0,2pi]$，于是 $n-$维球体积为 
    $ 
      V_n &= integral dd(r,[n]) =
        2pi R^n / n B((n-1)/2,1/2) B((n-2)/2,1/2) 
        dots.c B(1,1/2) \ 
        &= 2pi R^n / n (Gamma(sfrac(n-1,2)) Gamma(sfrac(1,2)))/Gamma(sfrac(n,2)) 
        (Gamma(sfrac(n-2,2)) Gamma(sfrac(1,2))) / Gamma(sfrac((n-1),2)) 
        dots.c (Gamma(1) Gamma(1/2))/Gamma(sfrac(3,2))\ 
        &=2pi R^n/n Gamma^(n-2)(1/2) 1/Gamma(sfrac(n,2))\ 
        &=pi^(sfrac(n,2)) / (sfrac(n,2))! R^n
    $ 
  对 $R$ 求导，我们得到 $n$ 维球表面积：
    $ 
      S_n = (2pi^(sfrac(n,2)))/Gamma(sfrac(n,2)) R^(n-1) 
    $ 
   ] 
  
   
  
