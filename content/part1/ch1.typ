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
    



== 微分同胚不变性
== 测地线方程
== 协变导数与曲率张量
== 测地线偏移方程
== 能动张量