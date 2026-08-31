#import "../../lib.typ": *
#import "@preview/cetz:0.4.2"

= 从关联函数到散射振幅

散射实验通过入射与出射粒子的动量、种类和偏振研究相互作用，路径积分则直接给出局域场的关联函数. 两者如何联系，是本章的中心问题. 稳定粒子在精确关联函数中留下单粒子极点；LSZ 约化公式从这些极点提取散射矩阵元，将场的关联函数与粒子的跃迁振幅联系起来.

这条联系需要两方面的准备. 一方面，以 $phi^4$ 理论为例计算微扰关联函数，区分连通、截肢与单粒子不可约结构，并由二点函数确定物理质量和极点留数. 另一方面，构造入射态、出射态及散射算符，说明振幅如何通过相空间和入射通量给出衰变率与截面. 完成 LSZ 推导后，这些结果汇成动量空间 Feynman 规则；章末的单圈散射计算展示其具体用法.

== 微扰关联函数

相互作用的微扰展开会同时产生带外腿的图与无源真空气泡. 要得到归一化的真空关联函数，须先消去后者，再按耦合常数的阶数收集 Wick 缩并. 以下用实标量 $phi^4$ 理论计算二点函数和四点函数，保留到 $O(lambda^2)$，以此说明归一化、图形拓扑与组合因子的关系.

在 Minkowski 时空中，将作用量分为自由部分与相互作用部分：

$
  S_M [phi]
  = S_(0,M) [phi] + S_("int",M) [phi].
$

从未归一化的含源路径积分出发：

$
  Z_M [J]
  := integral cal(D) phi
  exp(
    i (S_(0,M) [phi] + S_("int",M) [phi]
      + integral dd(x, [4]) J (x) phi (x))
  )
$

零源值 $Z_M [0]$ 是真空-真空振幅，其值一般不等于一. 能够生成归一化真空期望值的泛函应定义为比值

$
  cal(Z)_M [J] := (Z_M [J])/(Z_M [0]),
  quad
  cal(Z)_M [0] = 1.
$

展开这一比值时，只把相互作用作用量内部的场替换为外源微分. 利用 @eq:scalar-feynman-generating-functional 中的归一化自由泛函 $cal(Z)_(0,M) [J]$，可写成

$
  cal(Z)_M [J]
  = frac(
    exp[i S_("int",M) [1/i (delta)/(delta J)]]
    cal(Z)_(0,M) [J],
    [
      exp[i S_("int",M) [1/i (delta)/(delta J)]]
      cal(Z)_(0,M) [J]
    ]_(J=0)
  ).
$ <eq:normalized-minkowski-interacting-functional>

不与外源相连的 Wick 分量构成真空气泡，其总和指数化为分母中的零源因子，并在比值中相消. 归一化仍保留带外腿的非连通图：外点可以分布在几个连通分量上，只要每个分量都与外源相连.

本节所有运算都应先在正规化条件下进行，并采用 Feynman $i 0$ 处方. 此时 $m$ 与 $lambda$ 均为裸参数，$Delta_F (0)$ 表示正规化后的重合点传播子；移除紫外正规化后，它会发散.

对外源作泛函微分，得到归一化的时间有序函数：

$
  G_M^((n)) (x_1,dots,x_n)
  = [
    1/i^n
    (delta^n cal(Z)_M [J])/
    (delta J (x_1) dots delta J (x_n))
  ]_(J=0).
$

将上述方法用于 Minkowski $phi^4$ 理论：

$
  cal(L)_"int" = -lambda/(4!) phi^4,
  quad
  S_("int",M) [phi]
  = -lambda/(4!) integral dd(z, [4]) phi^4 (z).
$

于是，@eq:normalized-minkowski-interacting-functional 中的指数在每个顶角产生因子 $-i lambda$. 下面依次计算二点函数和四点函数，并保留到 $O(lambda^2)$ 为止的全部 Wick 拓扑.

=== 二点函数

直接展开得到

$
  G_M^((2)) (x,y) & = Delta_F (x-y) \
                  & + (-i lambda)/2 integral dd(z, [4])
                    Delta_F (x-z) Delta_F (0) Delta_F (z-y) \
                  & + (-i lambda)^2/6 integral dd(z_1, [4]) dd(z_2, [4])
                    Delta_F (x-z_1) [Delta_F (z_1-z_2)]^3 Delta_F (z_2-y) \
                  & + (-i lambda)^2/4 integral dd(z_1, [4]) dd(z_2, [4])
                    Delta_F (x-z_1) Delta_F (0) Delta_F (z_1-z_2)
                    Delta_F (0) Delta_F (z_2-y) \
                  & + (-i lambda)^2/4 integral dd(z_1, [4]) dd(z_2, [4])
                    Delta_F (x-z_1) [Delta_F (z_1-z_2)]^2
                    Delta_F (0) Delta_F (z_1-y)
                    + O(lambda^3).
$ <eq:two-point-function-through-second-order>

#figure(
  image("../../fig/feynman/ch4_two_point_topologies.svg", width: 96%),
  caption: [
    @eq:two-point-function-through-second-order 中依次出现的五种二点拓扑. 彩色圆点表示相互作用顶角，所有线均为标量传播子.
  ],
) <fig:two-point-topologies-through-second-order>

第一项修正是单顶角蝌蚪图. 在二阶，@fig:two-point-topologies-through-second-order 中最后三幅图依次为日落拓扑、连续两次蝌蚪插入，以及带蝌蚪修饰的双线插入；其对称因子分别为 $1/6$、$1/4$ 与 $1/4$. 归一化以后，不会留下自由线 $Delta_F (x-y)$ 与无源真空气泡的乘积. 又因为理论在 $phi arrow.r -phi$ 下不变，二点图也不可能分裂成两个非零的含源分量.

=== 四点函数

四点函数是第一个“真空气泡相消、含源非连通项仍然保留”的例子. 为紧凑表示展开，把前面的二点函数写成

$
  G_M^((2)) (x_i,x_j)
  = D_M^((0)) (x_i,x_j)
  + D_M^((1)) (x_i,x_j)
  + D_M^((2)) (x_i,x_j)
  + O(lambda^3),
$

其中 $D_M^((r))=O(lambda^r)$ 表示 $r$ 阶的完整贡献；特别地，$D_M^((2))$ 是上述三个二阶项之和. 将四个外点分成两对共有三种方式：

$
  cal(P)_4^((2))
  := {((1,2),(3,4)),((1,3),(2,4)),((1,4),(2,3))}.
$

对双顶角项，定义两个紧凑的被积函数

$
   cal(T)_"leg" (z_1,z_2) & := sum_(a=1)^4
                            product_(b=1, b != a)^4 Delta_F (x_b-z_1)
                            Delta_F (z_1-z_2) Delta_F (0) Delta_F (z_2-x_a), \
  cal(T)_"fish" (z_1,z_2) & := sum_(((i,j),(k,l)) in cal(P)_4^((2)))
                            Delta_F (x_i-z_1) Delta_F (x_j-z_1)
                            [Delta_F (z_1-z_2)]^2
                            Delta_F (z_2-x_k) Delta_F (z_2-x_l).
$

第一个式子包含在四条外腿上插入蝌蚪的四种选择；第二个式子包含三个配对道中的鱼图. 完整的归一化四点函数为

$
  G_M^((4)) (x_1,x_2,x_3,x_4) & = sum_(((i,j),(k,l)) in cal(P)_4^((2))) [
                                D_M^((0)) (x_i,x_j) D_M^((0)) (x_k,x_l) \
                              & quad + D_M^((1)) (x_i,x_j) D_M^((0)) (x_k,x_l)
                                + D_M^((0)) (x_i,x_j) D_M^((1)) (x_k,x_l) \
                              & quad + D_M^((2)) (x_i,x_j) D_M^((0)) (x_k,x_l)
                                + D_M^((0)) (x_i,x_j) D_M^((2)) (x_k,x_l) \
                              & quad + D_M^((1)) (x_i,x_j) D_M^((1)) (x_k,x_l)
                                ] \
                              & quad + (-i lambda) integral dd(z, [4])
                                product_(a=1)^4 Delta_F (x_a-z) \
                              & quad + ((-i lambda)^2)/2
                                integral dd(z_1, [4]) dd(z_2, [4])
                                [cal(T)_"leg" (z_1,z_2) + cal(T)_"fish" (z_1,z_2)] \
                              & quad + O(lambda^3).
$ <eq:normalized-four-point-through-second-order>

#figure(
  image("../../fig/feynman/ch4_leg_fish_topologies.svg", width: 96%),
  caption: [
    @eq:normalized-four-point-through-second-order 中有代表性的二阶连通拓扑. 外腿插入可选择四个不同的外点 $x_a$，鱼图则对应 $cal(P)_4^((2))$ 收集的三个配对道.
  ],
) <fig:four-point-leg-fish-topologies>

第一重求和包含直到二阶为止的全部含源非连通贡献. 零阶给出三种自由 Wick 配对；一阶修正其中一个二点分量，另一个仍为自由分量；二阶同时包含 $D_M^((2)) D_M^((0))$ 与 $D_M^((1)) D_M^((1))$. 最后两行则把四个外点放在同一个连通分量中：一阶为接触图，二阶为四种外腿插入和三个鱼图道，如 @fig:four-point-leg-fish-topologies 所示. 鱼图内部由两条传播子构成的环有时也称为“泡图”. 它带有外腿，与无源真空气泡不同，因而不会被归一化消去.

至此已得到二阶以内的完整归一化关联函数. 为从中提取散射信息，还需选出连通部分，并分离外部传播与内部相互作用.

== 连通函数、截肢函数与 1PI 函数

归一化关联函数仍混合着几类结构：不同外点组之间可能互不相连，外腿含有传播修正，内部图也可能由较小的部分通过一条线连接. 取生成泛函的对数可以选出连通函数；用完整逆传播子截肢可以消去外部传播；对连通生成泛函作 Legendre 变换则得到生成 1PI 顶角的有效作用量. 下面以四点函数逐一说明这些操作.

=== 由对数生成连通函数

将归一化 Minkowski 泛函写成

$
  W_M [J] := -i log cal(Z)_M [J],
  quad
  cal(Z)_M [J] = exp(i W_M [J]).
$ <eq:chapter-four-connected-generator>

根据 @eq:minkowski-connected-correlators，它的泛函导数就是连通时间有序函数：

$
  G_(M,c)^((n)) (x_1,dots,x_n)
  = [
    1/i^(n-1)
    (delta^n W_M [J])/
    (delta J (x_1) dots delta J (x_n))
  ]_(J=0).
$ <eq:chapter-four-connected-correlators>

由于相互独立的连通分量之积会在 $cal(Z)_M [J]$ 中指数化，取对数便选出单个含源连通分量. 这是真空归一化之后的第二层筛选：除以 $Z_M [0]$ 消去没有外点的分量，取对数则消去两个或多个各自带有外点的连通分量之积.

在对称的 $phi^4$ 真空中，所有奇数点关联函数均为零. 因此，完整四点函数分解为

$
  G_M^((4)) (x_1,x_2,x_3,x_4)
  = G_(M,c)^((4)) (x_1,x_2,x_3,x_4)
  + sum_(((i,j),(k,l)) in cal(P)_4^((2)))
  G_(M,c)^((2)) (x_i,x_j) G_(M,c)^((2)) (x_k,x_l).
$ <eq:minkowski-four-point-connected-decomposition>

与 @eq:normalized-four-point-through-second-order 比较，消去其中第一重求和后得到

$
  G_(M,c)^((4)) (x_1,x_2,x_3,x_4) & = (-i lambda) integral dd(z, [4])
                                    product_(a=1)^4 Delta_F (x_a-z) \
                                  & quad + ((-i lambda)^2)/2
                                    integral dd(z_1, [4]) dd(z_2, [4])
                                    [cal(T)_"leg" (z_1,z_2) + cal(T)_"fish" (z_1,z_2)] \
                                  & quad + O(lambda^3).
$ <eq:connected-four-point-through-second-order>

因此，接触图、外腿蝌蚪图与鱼图都是连通图. 连通性本身既不会消去位于外腿上的修正，也不能判断某条内部线是否为桥.

=== 截肢消去外部传播

记完整连通二点函数为

$
  G_M (x,y) := G_(M,c)^((2)) (x,y),
$

并以卷积关系定义其逆：

$
  integral dd(y, [4]) G_M^(-1) (x,y) G_M (y,z)
  = delta^((4)) (x-z).
$ <eq:full-propagator-convolution-inverse>

截肢连通 $n$ 点函数定义为

$
  cal(A)_M^((n)) (y_1,dots,y_n)
  := integral product_(r=1)^n dd(x_r, [4])
  product_(r=1)^n G_M^(-1) (y_r,x_r)
  G_(M,c)^((n)) (x_1,dots,x_n).
$ <eq:amputated-connected-function>

该定义从每条外腿上消去一个*完整*传播子. 例如，对树级接触图作用自由逆传播子，得到

$
  cal(A)_(M,"tree")^((4)) (y_1,y_2,y_3,y_4)
  = (-i lambda) integral dd(z, [4])
  product_(a=1)^4 delta^((4)) (y_a-z).
$ <eq:amputated-four-point-contact>

将 @eq:amputated-connected-function 一致展开到 $O(lambda^2)$ 时，@eq:connected-four-point-through-second-order 中的 $cal(T)_"leg"$ 项被吸收到四个完整外部传播子及其逆中；接触核和三个鱼图核仍然保留. 截肢只消去外部传播，相互作用区域内部的圈修正仍在.

截肢 Green 函数仍是离壳对象. 得到散射振幅还需确定物理单粒子极点及其留数，并按 LSZ 公式取在壳极限. 截肢后的内部结构则由单粒子可约性进一步分类.

=== 单粒子可约性

若切断一条内部传播子会把连通图分成两个分量，且每个分量至少连接一个外点，则称这条传播子为*桥*. 含桥的连通图称为单粒子可约（1PR）图；不含此类内部线的连通图称为单粒子不可约（1PI）图. 1PI 判据只检查内部线；外腿由截肢操作去除.

若理论具有非零三点 1PI 顶角，两个三点顶角可通过一条完整传播子组成连通四点图. 连接线是桥，因此该图即使已截肢，仍属 1PR 图. 在 $phi arrow.r -phi$ 对称真空中，三点顶角为零，这一四点道随之消失；同一 $phi^4$ 理论的六点函数却可由两个四点顶角通过一条传播子连接，在树级就有 1PR 贡献.

对于第 4.1 节计算的四点图，接触图是 1PI 图. 每个鱼图也都是 1PI 图，因为切断两条平行内部线中的任意一条，两个顶角仍由另一条相连. 外腿蝌蚪项则属于 $G_M$ 的修饰，在以完整传播子截肢后消失.

=== 有效作用量与 1PI 顶角

生成 1PI 顶角的泛函由 Legendre 变换得到. 定义依赖外源的平均场

$
  phi_"cl" (x) := (delta W_M [J])/(delta J (x)),
$

将 $J$ 反解为 $phi_"cl"$ 的泛函，并令

$
  Gamma_M [phi_"cl"]
  := W_M [J] - integral dd(x, [4]) J (x) phi_"cl" (x).
$ <eq:minkowski-effective-action>

其一阶导数满足

$
  (delta Gamma_M [phi_"cl"])/(delta phi_"cl" (x)) = -J (x).
$ <eq:effective-action-field-equation>

在 $J=0$ 时，以 $phi_v$ 表示真空平均场，并定义

$
  Gamma_M^((n)) (x_1,dots,x_n)
  := [
    (delta^n Gamma_M [phi_"cl"])/
    (delta phi_"cl" (x_1) dots delta phi_"cl" (x_n))
  ]_(phi_"cl"=phi_v).
$ <eq:proper-vertex-definition>

这些核称为 1PI 顶角. @ex:effective-action-generates-1pi 将从 Legendre 变换推导其图形意义以及逆传播子恒等式

$
  integral dd(y, [4])
  Gamma_M^((2)) (x,y) G_M (y,z)
  = i delta^((4)) (x-z).
$ <eq:effective-action-inverse-propagator-identity>

因此，$Gamma_M^((2))$ 包含完整逆传播子的全部信息. 对于 $n>=3$，该习题将以微扰方法证明 $Gamma_M^((n))$ 恰好包含全部 1PI 图；在本书的 Minkowski 约定下，对应 1PI 顶角的 Feynman 核为 $i Gamma_M^((n))$. 树级时，重合点上的 $Gamma_M^((4))=-lambda$，故 $i Gamma_M^((4))=-i lambda$，与第 4.1 节一致.

反过来，连通函数可由完整传播子和 1PI 顶角组装而成. 分离四个完整外部传播子后，精确四点结构为

$
  G_(M,c)^((4)) (x_1,x_2,x_3,x_4) & = integral product_(r=1)^4 dd(y_r, [4]) \
                                  & quad product_(r=1)^4 G_M (x_r,y_r) [
                                    i Gamma_M^((4)) (y_1,y_2,y_3,y_4) \
                                  & quad + cal(R)_(M,"1PR")^((4)) (y_1,y_2,y_3,y_4)
                                    ].
$ <eq:connected-four-point-from-proper-vertices>

其中 $cal(R)_(M,"1PR")^((4))$ 包含由桥传播子连接的 1PI 顶角. 在对称 $phi^4$ 真空中，$Gamma_M^((3))=0$，故 $cal(R)_(M,"1PR")^((4))=0$. 到 $O(lambda^2)$ 为止，$i Gamma_M^((4))$ 因而由接触核和三个截肢鱼图核构成；@eq:connected-four-point-through-second-order 中的外腿项则来自四个完整传播子的展开.

实际计算所用的层级关系可以概括为

$
  cal(Z)_M
  arrow.r^("取对数") W_M arrow.r^("泛函微分") G_(M,c)^((n))arrow.r^("截肢") cal(A)_M^((n)),
  quad
  Gamma_M arrow.r^("泛函微分") "1PI 顶角".
$

下一节从这一层级中的二点函数出发：极点位置确定物理质量，极点留数确定渐近单粒子场的归一化.

== 单粒子极点与场归一化

完整传播子中如何辨认稳定粒子？在两个场之间插入精确态的完备集，就能把二点函数分解为单粒子贡献与多粒子连续谱. 稳定单粒子态产生孤立极点，其位置确定物理质量 $m_"phys"$，留数 $Z_phi$ 则衡量所选局域场与该态的重叠. 采用第二章的不变态归一化后，这两个量将固定渐近场的匹配关系.

=== 精确二点函数及其单粒子贡献

设 $ket(Omega)$ 为平移不变的相互作用真空. 在本章采用的未破缺 $phi arrow.r -phi$ 对称真空中，所有奇数点关联函数都为零，因此精确二点函数本身已经连通，可以直接写成

$
  G_M (x-y)
  :=chevron.l Omega|T hat(phi) (x) hat(phi) (y)|Omega chevron.r.
$ <eq:chapter-four-exact-two-point>

假设理论中存在稳定的零自旋单粒子态 $ket(p)$. 其归一化与质量壳为

$
  braket(p, q)
  =2 E_p (2 pi)^3 delta^((3)) (bold(p)-bold(q)),
  quad
  E_p:=sqrt(bold(p)^2+m_"phys"^2),
  quad
  p^2=-m_"phys"^2.
$ <eq:chapter-four-physical-one-particle-normalization>

真空在平移与 Lorentz 变换下为标量，$hat(phi)$ 也是标量，故它与单粒子态之间的矩阵元除平面波外不能含有其他矢量结构. 选择 $ket(p)$ 的相位，使系数为非负实数，并定义

$
  chevron.l Omega|hat(phi) (x)|p chevron.r
  =sqrt(Z_phi) e^(i p dot x),
  quad
  Z_phi>=0.
$ <eq:chapter-four-one-particle-overlap>

指数因子由平移协变性确定. 由于 $tensor(hat(P), +mu) ket(p)=tensor(p, +mu) ket(p)$，且第二章的被动变换约定在矩阵元中给出 $hat(phi) (x)=e^(-i tensor(hat(P), +mu) tensor(x, -mu))hat(phi) (0)e^(i tensor(hat(P), +mu) tensor(x, -mu))$，故相位为 $p dot x=-p^0 t+bold(p) dot bold(x)$. 在固定的态归一化下，$Z_phi$ 由所选场与物理单粒子态的重叠确定.

为说明该矩阵元如何进入传播子，先考虑 Wightman 函数

$
  W (x-y)
  :=chevron.l Omega|hat(phi) (x)hat(phi) (y)|Omega chevron.r.
$ <eq:chapter-four-wightman-function>

在两个场之间插入精确能量--动量本征态的完备集. 将真空、单粒子与多粒子扇区分开，即写成

$
  1=ketbra(Omega)+cal(I)_1+cal(I)_"multi".
$ <eq:chapter-four-complete-state-sectors>

由于一点函数为零，真空项在此消失. 使用 @eq:one-particle-invariant-completeness 中的不变单粒子完备关系 $cal(I)_1=integral tilde(dd(p)) ket(p)ketbra(p)$，单粒子部分为

$
  W_1 (x-y) & = integral tilde(dd(p))
              chevron.l Omega|hat(phi) (x)|p chevron.r
              chevron.l p|hat(phi) (y)|Omega chevron.r \
            & = Z_phi integral tilde(dd(p)) e^(i p dot (x-y)).
$ <eq:chapter-four-one-particle-wightman>

其余精确态给出额外的正能贡献. 对标量场，Lorentz 不变性允许把具有相同不变质量 $s=-p^2$ 的所有态归入一个非负谱密度，因而

$
  W (x-y)
  =integral_0^infinity dd(s) rho (s)
  integral (dd(p, [4]))/((2 pi)^3)
  theta (tensor(p, +0)) delta (p^2+s) e^(i p dot (x-y)),
$ <eq:chapter-four-wightman-spectral-representation>

其中显式的四维因子就是质量为 $sqrt(s)$ 的正能质量壳测度. 等价地，

$
  W (x-y)
  =integral_0^infinity dd(s) rho (s) W_0 (x-y;s),
  quad
  W_0 (z;s):=integral (dd(p, [4]))/((2 pi)^3)
  theta (tensor(p, +0)) delta (p^2+s) e^(i p dot z).
$ <eq:chapter-four-wightman-spectral-representation-short>

单粒子矩阵元 @eq:chapter-four-one-particle-overlap 固定谱密度中的 delta 函数部分：

$
  rho (s)
  =Z_phi delta (s-m_"phys"^2)+rho_"cont" (s),
  quad
  rho_"cont" (s)>=0.
$ <eq:chapter-four-spectral-density-decomposition>

$rho>=0$ 直接来自 Hilbert 空间的正定性，与微扰展开无关.$rho$ 的每一项都由 $hat(phi)$ 的矩阵元绝对值平方乘以正的相空间测度构成. 稳定粒子的所有态具有相同不变质量，因而产生 delta 函数；多粒子态的不变质量连续变化，因而形成连续谱. 若某种对称性禁止场与两粒子态耦合，连续谱将从允许的最轻高粒子数阈值开始. 在当前 $phi^4$ 例子的未破缺 $phi arrow.r -phi$ 真空中，奇场 $hat(phi)$ 只与奇粒子数态耦合；若不存在束缚态，第一个一般性连续谱从 $s=(3 m_"phys")^2$ 开始.

#figure(
  cetz.canvas(length: 0.82cm, {
    import cetz.draw: *

    let axis = rgb("#657b85")
    let pole = rgb("#d86483")
    let continuum = rgb("#36a6b6")
    let threshold = rgb("#d09217")

    line((0, 0), (7.25, 0), stroke: 0.8pt + axis, mark: (end: ">"))
    line((0, 0), (0, 3.55), stroke: 0.8pt + axis, mark: (end: ">"))
    content((7.3, -0.05), text(size: 8pt, fill: axis)[$s=mu^2$], anchor: "west")
    content((0.08, 3.60), text(size: 8pt, fill: axis)[$rho (s)$], anchor: "south-west")

    line((1.48, 0), (1.48, 2.42), stroke: 1.6pt + pole)
    circle((1.48, 2.42), radius: 0.095, fill: pole, stroke: pole)
    content((1.48, 2.72), text(size: 8pt, fill: pole)[$Z_phi delta (s-m_"phys"^2)$], anchor: "south")
    line((3.15, 0), (3.15, 2.55), stroke: (paint: threshold, thickness: 0.9pt, dash: "dashed"))
    content((3.15, -0.25), text(size: 8pt, fill: threshold)[$s_"th"$], anchor: "north")

    let points = (
      (3.15, 0.08),
      (3.55, 0.24),
      (3.95, 0.43),
      (4.35, 0.66),
      (4.75, 0.93),
      (5.15, 1.23),
      (5.55, 1.56),
      (5.95, 1.91),
      (6.35, 2.27),
    )
    for i in range(0, points.len() - 1) {
      line(points.at(i), points.at(i + 1), stroke: 1.5pt + continuum)
    }
    content((5.78, 2.45), text(size: 8pt, fill: continuum)[$rho_"cont" (s)$], anchor: "west")
    content((3.55, -0.60), text(size: 8pt, fill: axis)[离散极点 + 连续谱], anchor: "north")
  }),
  caption: [
    Källén--Lehmann 谱权重示意图.$s=m_"phys"^2$ 处孤立的 delta 函数表示稳定单粒子态；在第一个允许阈值 $s_"th"$ 以上，多粒子态填充为连续谱. 连续谱的具体形状依赖理论，本图未按比例绘制.
  ],
) <fig:chapter-four-spectral-density>

将 Wightman 函数按时间排序，得到精确传播子：

$
  G_M (z)
  =theta (z^0) W (z)+theta (-z^0) W (-z).
$ <eq:chapter-four-time-ordering-from-wightman>

对每个质量分量执行这一时间排序，并利用自由标量结果 @eq:scalar-feynman-time-ordering，得到 Källén--Lehmann 表示

$
  G_M (z)
  =integral_0^infinity dd(s) rho (s) Delta_F (z;s),
  quad
  Delta_F (p;s):=(-i)/(p^2+s-i 0).
$ <eq:chapter-four-kallen-lehmann-coordinate>

再按 @eq:chapter-two-fourier-convention 作 Fourier 变换，得到

$
  G_M (p)
  =integral_0^infinity dd(s) rho (s)
  (-i)/(p^2+s-i 0).
$ <eq:chapter-four-kallen-lehmann-momentum>

分离 @eq:chapter-four-spectral-density-decomposition 中的 delta 函数，可显式写出单粒子极点：

$
  G_M (p)
  =(-i Z_phi)/(p^2+m_"phys"^2-i 0)
  +G_"reg" (p),
  quad
  G_"reg" (p):=integral_0^infinity dd(s) rho_"cont" (s)
  (-i)/(p^2+s-i 0).
$ <eq:chapter-four-isolated-one-particle-pole>

若 $s_"th">m_"phys"^2$，则 $G_"reg"$ 在 $p^2=-m_"phys"^2$ 邻域内正则，因此该极点是孤立的. 相反，当外部不变量达到阈值时，连续谱产生非解析性；在微扰论中，这表现为圈积分解析延拓后的支切. 可衰变粒子不对应实轴上孤立的 delta 函数，其谱权重属于连续谱，且共振极点需要另行作复解析延拓. 这样的不稳定激发不能作为 LSZ 构造中的渐近单粒子态.

=== 从 1PI 二点核读取极点

上述谱论证是精确且非微扰的. 为把它与第 4.2 节的组织方式联系起来，利用平移不变性对角化卷积恒等式 @eq:effective-action-inverse-propagator-identity：

$
  Gamma_M^((2)) (p) G_M (p)=i.
$ <eq:chapter-four-momentum-space-inverse-two-point>

对标量理论，1PI 核只依赖 $p^2$. 定义精确自能函数

$
  Gamma_M^((2)) (p)
  :=-[p^2+m_0^2+Pi_M (p^2)],
$ <eq:chapter-four-self-energy-definition>

其中 $m_0$ 是第 4.1 节使用的正规化裸质量. 因此，完整传播子为

$
  G_M (p)
  =(-i)/(p^2+m_0^2+Pi_M (p^2)-i 0).
$ <eq:chapter-four-dyson-resummed-propagator>

物理极点是实质量壳上逆传播子的零点. 代入 $p^2=-m_"phys"^2$，得到极点质量方程

$
  m_0^2-m_"phys"^2+Pi_M (-m_"phys"^2)=0.
$ <eq:chapter-four-pole-mass-equation>

该方程应在移除正规化之前施加，并沿用 $G_M$ 定义中的同一 $i 0$ 处方. 对于位于第一连续谱阈值以下的稳定极点，$Pi_M$ 在极点处为实数；超过阈值后它产生虚部，这正表明实的孤立粒子解释已经失效.

在极点附近展开逆传播子. 令 $q:=p^2+m_"phys"^2$，并假设极点为单极点，则

$
  p^2+m_0^2+Pi_M (p^2) & =q [1+Pi_M (-m_"phys"^2)] + O(q^2) \
                       & =Z_phi^(-1) q+O(q^2),
$ <eq:chapter-four-inverse-propagator-pole-expansion>

其中撇号表示对标量变量 $p^2$ 求导. 与精确极点形式 @eq:chapter-four-isolated-one-particle-pole 比较，得到

$
  Z_phi^(-1)
  =1+Pi'_M (-m_"phys"^2)
  =-[(partial Gamma_M^((2)) (p))/(partial p^2)]_(p^2=-m_"phys"^2).
$ <eq:chapter-four-pole-residue-from-self-energy>

$Pi_M$ 在极点处的取值确定质量，斜率确定留数. 留数依赖所选内插场；若以非零常数重标度场 $hat(phi) arrow.r c hat(phi)$，则 $G_M arrow.r c^2 G_M$、$Z_phi arrow.r c^2 Z_phi$，极点位置保持不变.


== S-matrix 与散射算符

有了稳定粒子的质量与归一化，就可以构造散射的初态和末态. 在远离相互作用区域的渐近时刻，彼此分离的粒子用自由 Fock 态描述；它们之间的跃迁由完整 Hamiltonian 决定. 将自由态分别映射到入射态与出射态，便可定义散射算符，并由渐近完备性、Hermitian 演化和微观因果性研究其幺正性与 Lorentz 不变性.

=== 渐近态

设 $hat(H)$ 为精确 Minkowski Hamiltonian. 渐近 Hamiltonian $hat(H)_0$ 描述所有稳定粒子种类，并使用各自的*物理*质量. 标量单粒子能量因此由第 4.3 节得到的 $m_"phys"$ 决定.

对于上一节的标量粒子，@eq:chapter-four-one-particle-overlap 表明精确场产生物理单粒子态的重叠为

$
  mel(Omega, hat(phi)_H (x), p)
  =sqrt(Z_phi) e^(i p dot x).
$

为按第二章的不变归一化构造入射与出射 Fock 态，需要引入单粒子矩阵元满足标准自由场归一化的场：

$
  mel(Omega, hat(phi)_"in/out" (x), p_"in/out")
  =e^(i p dot x).
$ <eq:chapter-four-asymptotic-field-one-particle-normalization>

这一要求自然引出两个渐近自由场，它们满足

$
  (partial^2-m_"phys"^2)hat(phi)_"in/out" (x)=0,
$

因为渐近态描述位于物理质量壳上的稳定粒子. 比较两个矩阵元即可固定匹配因子. 在散射问题所需的弱极限、即波包意义下，

$
  hat(phi)_H (x) & arrow.r sqrt(Z_phi) hat(phi)_"in" (x)
                   quad "当" x^0 arrow.r -infinity, \
  hat(phi)_H (x) & arrow.r sqrt(Z_phi) hat(phi)_"out" (x)
                   quad "当" x^0 arrow.r +infinity,
$ <eq:chapter-four-asymptotic-field-condition>

上述极限须在波包意义下理解：平面波是广义态，未经涂抹的算符极限未必存在. 从 $hat(phi)_"in/out"$ 提取的渐近产生算符作用于同一个精确真空 $ket(Omega)$，生成入射与出射多粒子态.

更紧凑的定义使用 Møller 算符. 以 $cal(H)_"as"$ 表示渐近 Fock 空间，并定义

$
  Omega_(-) & :=lim_(t arrow.r -infinity)
              e^(i hat(H)t)e^(-i hat(H)_0 t), \
  Omega_(+) & :=lim_(t arrow.r +infinity)
              e^(i hat(H)t)e^(-i hat(H)_0 t).
$ <eq:chapter-four-moller-operators>

这些极限同样在波包意义下理解，并交织自由演化与精确演化. 若 $ket(alpha_0)$ 与 $ket(beta_0)$ 是自由 Fock 态，其标记包含全部动量、粒子种类及自旋或螺旋度指标，则

$
  ket(alpha_"in") :=Omega_(-) ket(alpha_0),
  quad
  ket(beta_"out") :=Omega_(+) ket(beta_0).
$ <eq:chapter-four-in-out-states>

每个外部动量都位于相应的正能物理质量壳上. 例如，对标量标记 $alpha=(p_1,dots,p_n)$，有 $p_r^2=-m_"phys"^2$ 且 $tensor(p_r, +0)>0$. 态的不变归一化与相空间测度正是第二章所定义的形式.

@eq:chapter-four-moller-operators 中极限的存在性依赖彼此分离的稳定粒子. 不稳定共振不属于 $cal(H)_"as"$ 的基矢，只作为稳定态之间振幅的中间结构出现；稳定束缚态则应作为额外的渐近粒子种类纳入.

=== 散射算符与不变振幅

散射算符作用在同一个参考空间 $cal(H)_"as"$ 上，用来比较该空间与相互作用理论之间的两种对应：

$
  hat(S):=Omega_(+)^dagger Omega_(-).
$ <eq:chapter-four-scattering-operator>

其矩阵元构成 $S$-matrix：

$
  S_(beta alpha)
  := braket(beta_0, S, alpha_0)
  =bra(beta_"out") ket(alpha_"in").
$ <eq:chapter-four-s-matrix-elements>

$S_(beta alpha)$ 是算符 $hat(S)$ 在所选基底中的矩阵表示，随基底改变. 平面波态的矩阵元是分布；改用可归一化波包后，其模平方给出跃迁概率.

记

$
  hat(S)=1+i hat(T).
$ <eq:chapter-four-transition-operator>

平移不变性使非平凡跃迁矩阵元含有一个整体四动量 delta 函数. 令 $P_alpha=sum_(r in alpha) p_r$、$P_beta=sum_(s in beta) p_s$，并以此定义散射振幅：

$
  S_(beta alpha)
  =braket(beta_0, alpha_0)
  +i (2 pi)^4 delta^((4)) (P_beta-P_alpha)
  cal(M)_(beta alpha).
$ <eq:chapter-four-scattering-amplitude-definition>

因此，$cal(M)_(beta alpha)$ 既不含恒等贡献，也不含整体守恒 delta 函数；精确态归一化仍是该定义的一部分.



=== 散射算符的幺正性

Møller 算符保持 $cal(H)_"as"$ 上的内积：

$
  Omega_(-)^dagger Omega_(-)
  =Omega_(+)^dagger Omega_(+)
  =1_"as".
$ <eq:chapter-four-moller-isometries>

要进一步推出 $hat(S)$ 幺正，还需要渐近完备性：入射与出射映射的值域必须是同一个散射子空间 $cal(H)_"sc"$. 若 $P_"sc"$ 表示该子空间上的投影算符，则

$
  Omega_(-)Omega_(-)^dagger
  =Omega_(+)Omega_(+)^dagger
  =P_"sc".
$ <eq:chapter-four-asymptotic-completeness>

利用 @eq:chapter-four-scattering-operator 与 @eq:chapter-four-asymptotic-completeness，可以直接验证幺正性：

$
  hat(S)^dagger hat(S) & =Omega_(-)^dagger Omega_(+)Omega_(+)^dagger Omega_(-)
                         =Omega_(-)^dagger P_"sc" Omega_(-)=1_"as", \
   hat(S)hat(S)^dagger & =Omega_(+)^dagger Omega_(-)Omega_(-)^dagger Omega_(+)
                         =Omega_(+)^dagger P_"sc" Omega_(+)=1_"as".
$ <eq:chapter-four-s-matrix-unitarity>

若遗漏某个允许的稳定道，概率会流入该道，限制在其余道上的矩阵也就失去幺正性. 渐近完备性直接决定散射子空间上的概率守恒.


=== 相互作用绘景演化与 Dyson 级数

在作任何微扰展开之前，也能看出同一幺正性. 分解 $hat(H)=hat(H)_0+hat(H)_"int"$，并定义相互作用绘景 Hamiltonian

$
  hat(H)_I (t)
  :=e^(i hat(H)_0 t)hat(H)_"int" e^(-i hat(H)_0 t).
$ <eq:chapter-four-interaction-picture-hamiltonian>

相互作用绘景演化算符满足

$
  i (partial hat(U)_I (t,t_0))/(partial t) & =hat(H)_I (t)hat(U)_I (t,t_0), \
                        hat(U)_I (t_0,t_0) & =1.
$ <eq:chapter-four-interaction-picture-evolution>

以相互作用绘景 Hamiltonian 密度表示，即 $hat(H)_I (t)=integral dd(x, [3]) hat(cal(H))_I (t,bold(x))$.

若相互作用 Hamiltonian 为 Hermitian，

$
  (partial)/(partial t)
  [hat(U)_I (t,t_0)^dagger hat(U)_I (t,t_0)] & =i hat(U)_I^dagger hat(H)_I^dagger hat(U)_I
                                               -i hat(U)_I^dagger hat(H)_I hat(U)_I \
                                             & =0.
$ <eq:chapter-four-evolution-unitarity>

结合初始条件，便证明 $hat(U)_I^dagger hat(U)_I=1$. 必要时令相互作用绝热开启和关闭，散射算符为

$
  hat(S)=lim_(t_+ arrow.r +infinity\
  t_- arrow.r -infinity)
  hat(U)_I (t_+,t_-).
$ <eq:chapter-four-s-as-interaction-evolution>

迭代 @eq:chapter-four-interaction-picture-evolution，得到 Dyson 级数

$
  hat(S) & =T exp[-i integral_(-infinity)^infinity dd(t) hat(H)_I (t)] \
         & =sum_(n=0)^infinity ((-i)^n)/(n!)
           integral product_(r=1)^n dd(t_r)
           T {hat(H)_I (t_1)dots hat(H)_I (t_n)}.
$ <eq:chapter-four-dyson-series-hamiltonian>

因时间排序把完整积分区域分成 $n!$ 个可能的时间次序，故可在式中保留因子 $1/n!$. 等价地，也可把第 $n$ 阶项限制在 $t_1>t_2>dots>t_n$ 上积分，并去掉 $1/n!$.

对于不含时间导数的相互作用，$hat(cal(H))_I=-hat(cal(L))_"int"$. 此时同一展开可写成显式的时空积分形式

$
  hat(S) & =T exp[i integral dd(x, [4]) hat(cal(L))_"int" (x)] \
         & =sum_(n=0)^infinity i^n/(n!)
           integral product_(r=1)^n dd(x_r, [4]) \
         & quad times T {product_(r=1)^n hat(cal(L))_"int" (x_r)}.
$ <eq:chapter-four-dyson-series-lagrangian>

在标量 $phi^4$ 理论中，具体为

$
  hat(S)
  =sum_(n=0)^infinity 1/(n!) ((-i lambda)/(4!))^n
  integral product_(r=1)^n dd(x_r, [4])
  T {product_(r=1)^n hat(phi)_I^4 (x_r)}.
$ <eq:chapter-four-phi-four-dyson-series>

对该式作 Wick 展开，会生成与第 4.1 节相同的顶角、传播子与对称因子. 真空气泡分解为一个整体真空持续相位，不影响归一化跃迁概率；连通散射振幅会舍去这一公共因子. Dyson 级数的有限阶截断本身并不严格幺正，但只要在每一阶保留该阶全部贡献，就能逐阶恢复微扰幺正性.

=== 由微观因果性推出 Lorentz 不变性

时间排序选定了一个坐标时间，因此不能仅从 @eq:chapter-four-dyson-series-lagrangian 的外观直接断言 Lorentz 不变性. 证明需要两个条件. 第一，相互作用密度必须是 Lorentz 标量. 按第二章的被动变换约定，

$
  hat(U)_0 (Lambda,b)^(-1)
  hat(cal(L))_"int" (x)
  hat(U)_0 (Lambda,b)
  =hat(cal(L))_"int" (Lambda^(-1) (x-b)).
$ <eq:chapter-four-interaction-density-passive-transform>

其中 $hat(U)_0$ 是渐近 Fock 空间上的 Poincare 表示，且 $Lambda in "SO"^+ (1,3)$ 保持时间取向. 第二，场论的局域性蕴含相互作用密度的微观因果性：

$
  [hat(cal(L))_"int" (x),hat(cal(L))_"int" (y)] & =0, & quad (x-y)^2>0 quad ("类空").
$ <eq:chapter-four-interaction-density-microcausality>

在当前例子中，相互作用密度是局域多项式 $-lambda hat(phi)_I^4\/(4!)$，故该条件直接来自类空间隔下的 $[hat(phi)_I (x),hat(phi)_I (y)]=0$. 在含费米场的理论中，相互作用密度是 Grassmann 偶算符，同样属于可观测局域算符，在类空间隔下满足普通对易关系.

比较两个正时向 Lorentz 参考系中两个顶角的时间次序. 若间隔类时，所有此类参考系都同意其先后顺序；若间隔类空，不同参考系可能颠倒次序，但 @eq:chapter-four-interaction-density-microcausality 保证两个算符乘积相等. 对任意多个顶角，两个依赖参考系的排序都可通过相邻交换若干类空点对而互相转化. 因此

$
  & hat(U)_0 (Lambda,b)^(-1)
    T {product_(r=1)^n hat(cal(L))_"int" (x_r)}
    hat(U)_0 (Lambda,b) \
  & quad =T {product_(r=1)^n
      hat(cal(L))_"int" (Lambda^(-1) (x_r-b))}.
$ <eq:chapter-four-time-ordering-covariance>

将这一恒等式代入 @eq:chapter-four-dyson-series-lagrangian 的每一项，再作变量代换 $y_r=Lambda^(-1) (x_r-b)$. 四维体积测度与积分区域均不变，故

$
  hat(U)_0 (Lambda,b)^(-1) hat(S) hat(U)_0 (Lambda,b)=hat(S).
$ <eq:chapter-four-s-poincare-invariance>

因此，散射算符与渐近 Poincare 表示对易. 若外粒子为标量，$cal(M)_(beta alpha)$ 是在壳动量不变量的 Lorentz 不变函数；若粒子带自旋，各自旋分量则随相应的 Wigner 转动作协变变换.

不变振幅已由散射算符确定. 将它用于可观测跃迁率，还需计入末态相空间、态归一化与入射通量.

== 衰变率与散射截面

给定散射振幅 $cal(M)_(beta alpha)$，如何求实验测量的衰变率与截面？平面波态采用 delta 函数归一化，振幅的模平方须结合态密度与观测时间才能成为跃迁率. 以下先建立不变相空间测度，再用有限时空体积处理归一化因子，分别得到单粒子衰变与双粒子碰撞的公式. 振幅暂作已知量，其场论计算由后面的 LSZ 公式给出.

=== Lorentz 不变相空间

对于种类为 $r$、质量为 $m_r$ 的正能末态粒子，令

$
  E_r:=sqrt(bold(p)_r^2+m_r^2),
  quad
  p_r^2=-m_r^2,
  quad
  tensor(p_r, +0)=E_r>0,
$

定义单粒子在壳测度

$
  dd(Pi)_r & :=(dd(p_r, [3]))/((2 pi)^3 2 E_r) \
           & =(dd(p_r, [4]))/((2 pi)^3)
             theta (tensor(p_r, +0)) delta (p_r^2+m_r^2).
$ <eq:chapter-four-one-particle-phase-space>

第二种形式直接表明不变性：$dd(p_r, [4])$ 与 $p_r^2+m_r^2$ 都是 Lorentz 不变量，正时向 Lorentz 变换又保持 $theta (tensor(p_r, +0))$ 所选择的正能壳. 对第二行中的 $tensor(p_r, +0)$ 积分即可得到第一行，因为

$
  delta (p_r^2+m_r^2)
  =1/(2 E_r) [
    delta (tensor(p_r, +0)-E_r)
    +delta (tensor(p_r, +0)+E_r)
  ].
$ <eq:chapter-four-on-shell-delta-decomposition>

若 $n$ 粒子末态道的总入射四动量为 $P$，则 Lorentz 不变相空间测度为

$
  dd(Phi)_n (P;p_1,dots,p_n)
  :=(2 pi)^4 delta^((4)) (P-sum_(r=1)^n p_r)
  product_(r=1)^n dd(Pi)_r.
$ <eq:chapter-four-n-particle-phase-space>

每个末态动量都在壳上，剩余 delta 函数施加四动量守恒. 若末态道中每种粒子 $a$ 含有 $n_a$ 个全同粒子，对带标记动量积分会把同一个 Fock 态重复计数 $product_a n_a!$ 次. 定义

$
  cal(S)_f:=product_a n_a!.
$ <eq:chapter-four-final-state-symmetry-factor>

可以除以 $cal(S)_f$，也可以限制积分区域，使每个无序末态构型只出现一次. 下文采用前一种约定. 相应出射态扇区的完备关系示意为

$
  cal(I)_n
  =1/(cal(S)_f) sum_"离散指标"
  integral product_(r=1)^n dd(Pi)_r
  ket(beta_"out") bra(beta_"out").
$ <eq:chapter-four-final-state-completeness>

这里的离散求和包括自旋、螺旋度以及未被末态道选择预先固定的内部量子数.

=== 从平面波矩阵元到跃迁率

对非平凡跃迁，@eq:chapter-four-scattering-amplitude-definition 给出

$
  S_(beta alpha)^"连通"
  =i (2 pi)^4 delta^((4)) (P_beta-P_alpha)
  cal(M)_(beta alpha).
$ <eq:chapter-four-connected-plane-wave-s-matrix>

直接平方该式似乎会产生没有定义的分布 $[delta^((4))]^2$. 为明确其意义，暂将体系置于体积为 $V$ 的大空间盒中，并在长时间 $T$ 内观测. 正规化后的零动量 delta 函数满足

$
  (2 pi)^3 delta^((3)) (0)=V,
  quad
  2 pi delta (0)=T,
  quad
  (2 pi)^4 delta^((4)) (0)=V T.
$ <eq:chapter-four-delta-zero-volume-time>

令 $Q:=P_beta-P_alpha$，于是

$
  abs((2 pi)^4 delta^((4)) (Q))^2
  =(2 pi)^4 delta^((4)) (Q) V T.
$ <eq:chapter-four-squared-delta-function>

不变归一化单粒子态在盒中的对角范数为

$
  braket(p_0, p_0)=2 E_p V.
$ <eq:chapter-four-box-one-particle-norm>

故单位归一化盒态为

$
  ket(p)_"box"
  :=1/sqrt(2 E_p V) ket(p_0).
$ <eq:chapter-four-unit-box-state>

对每个末态动量，盒中的离散求和趋于

$
  sum_(bold(p))
  arrow.r V integral (dd(p, [3]))/((2 pi)^3).
$ <eq:chapter-four-box-density-of-states>

设初态含有 $N_"in"$ 个粒子，其能量为 $E_a$. 单位盒态之间的连通矩阵元平方，对每个初态和末态粒子贡献一个 $1/(2 E V)$. 末态求和消去全部末态体积因子，@eq:chapter-four-squared-delta-function 则提供 $V T$. 再除以观测时间 $T$，得到固定离散量子数下的微分跃迁率：

$
  (dd(P)_(alpha arrow.r beta))/(dd(t))
  =1/(cal(S)_f)
  (V^(1-N_"in"))/(product_(a=1)^N_"in" 2 E_a)
  abs(cal(M)_(beta alpha))^2
  dd(Phi)_n (P_alpha).
$ <eq:chapter-four-master-box-transition-rate>

空间盒用于追踪归一化因子；改用可归一化波包也能得到同一极限. 在 @eq:chapter-four-master-box-transition-rate 中分别取 $N_"in"=1$ 和 $N_"in"=2$，即可求衰变率与散射截面.

=== 衰变率

考虑已制备的单粒子态 $A$，其质量为 $M$、四动量为 $p_A$. 在 @eq:chapter-four-master-box-transition-rate 中令 $N_"in"=1$，盒体积随即消去. 对指定的初始自旋或偏振，衰变到 $n$ 粒子道的微分率为

$
  dd(Gamma)_(A arrow.r f)
  =1/(2 E_A) 1/(cal(S)_f)
  sum_"末态离散指标"
  abs(cal(M)_(A arrow.r f))^2
  dd(Phi)_n (p_A).
$ <eq:chapter-four-general-differential-decay-rate>

右端是在 $tensor(p_A, +0)=E_A$ 的参考系中，单位坐标时间内的衰变概率. 若实验制备含 $g_A$ 个等概率初态的非偏振系综，应把依赖自旋的振幅平方替换为

$
  overline(abs(cal(M))^2)
  :=1/g_A sum_"初态离散指标"sum_"末态离散指标" abs(cal(M))^2.
$ <eq:chapter-four-spin-summed-averaged-amplitude>

若初始偏振确定，则不对初态平均.

严格不稳定的激发不属于精确 Hamiltonian 的渐近态. @eq:chapter-four-general-differential-decay-rate 采用微扰长寿命态构造：在弱衰变相互作用尚未被分辨前，把 $A$ 制备为渐近 Hamiltonian 的单粒子态，该公式给出它向稳定出射态损失概率的最低阶速率. 宽共振必须分析谱线形状，不能用尖锐的初始质量壳描述.

在母粒子静止系中，$p_A=(M,bold(0))$ 且 $E_A=M$，故分波道宽度为

$
  Gamma_(A arrow.r f)
  =1/(2 M) 1/(cal(S)_f)
  integral dd(Phi)_n (p_A)
  overline(abs(cal(M)_(A arrow.r f))^2).
$ <eq:chapter-four-rest-frame-partial-width>

总宽度是所有互斥衰变道之和，静止系寿命为 $tau_A=1/Gamma_A$. 相空间积分与振幅均为不变量，因此 @eq:chapter-four-general-differential-decay-rate 中唯一依赖参考系的因子是 $1/(2 E_A)$. 于是

$
  Gamma_A (E_A)
  =(M)/(E_A) Gamma_A (M),
$ <eq:chapter-four-decay-time-dilation>

这正是寿命的通常相对论时间延缓.

=== 二体衰变相空间

对 $A arrow.r 1+2$，在母粒子静止系中相空间积分可以直接完成. 从 @eq:chapter-four-n-particle-phase-space 出发，

$
  dd(Phi)_2 & =(2 pi)^4 delta (M-E_1-E_2)
              delta^((3)) (bold(p)_1+bold(p)_2) \
            & quad times
              (dd(p_1, [3]))/((2 pi)^3 2 E_1)
              (dd(p_2, [3]))/((2 pi)^3 2 E_2).
$ <eq:chapter-four-two-body-phase-space-start>

空间 delta 函数令 $bold(p)_2=-bold(p)_1$. 记 $p:=abs(bold(p)_1)=abs(bold(p)_2)$，并使用 $dd(p_1, [3])=p^2 dd(p) dd(Omega)$，得到

$
  dd(Phi)_2
  =1/(16 pi^2)
  (p^2 dd(p) dd(Omega))/(E_1 E_2)
  delta (M-E_1 (p)-E_2 (p)).
$ <eq:chapter-four-two-body-phase-space-radial>

在物理解 $p=p_*$ 处，

$
  abs((partial)/(partial p) [M-E_1 (p)-E_2 (p)])_(p=p_*)
  =(p_* M)/(E_1^* E_2^*).
$ <eq:chapter-four-two-body-delta-jacobian>

故径向积分给出

$
  dd(Phi)_2
  =(p_*)/(16 pi^2 M) dd(Omega).
$ <eq:chapter-four-two-body-phase-space-result>

能量守恒与两个在壳条件给出

$
  E_1^* & =(M^2+m_1^2-m_2^2)/(2 M), \
  E_2^* & =(M^2+m_2^2-m_1^2)/(2 M), \
    p_* & =sqrt(lambda (M^2,m_1^2,m_2^2))/(2 M),
$ <eq:chapter-four-two-body-rest-kinematics>

其中 Källén 函数定义为

$
  lambda (a,b,c) & :=a^2+b^2+c^2 \
                 & quad -2 a b-2 a c-2 b c.
$ <eq:chapter-four-kallen-function>

阈值条件为 $M>=m_1+m_2$，等价于 $lambda (M^2,m_1^2,m_2^2)>=0$. 结合 @eq:chapter-four-rest-frame-partial-width 与 @eq:chapter-four-two-body-phase-space-result，得到

$
  (dd(Gamma))/(dd(Omega))
  =1/(cal(S)_f)
  (p_*)/(32 pi^2 M^2)
  overline(abs(cal(M)_(A arrow.r 1+2))^2).
$ <eq:chapter-four-two-body-differential-width>

若振幅平方与角度无关，对完整立体角积分得到

$
  Gamma_(A arrow.r 1+2)
  =1/(cal(S)_f)
  (p_*)/(8 pi M^2)
  overline(abs(cal(M)_(A arrow.r 1+2))^2).
$ <eq:chapter-four-two-body-total-width>

若两个末态粒子全同，对完整球面积分时应取 $cal(S)_f=2!$.

=== 散射截面与入射通量

现在令初态含有动量分别为 $p_1$、$p_2$ 的两个稳定粒子. @eq:chapter-four-master-box-transition-rate 的 $N_"in"=2$ 情形，就是盒中一个归一化粒子对在单位时间内的跃迁概率：

$
  dd(R)
  =1/(4 E_1 E_2 V) 1/(cal(S)_f)
  abs(cal(M))^2 dd(Phi)_n (p_1+p_2).
$ <eq:chapter-four-two-particle-box-rate>

截面等于该跃迁率除以入射粒子数通量. 若体积 $V$ 中每束各含一个粒子，通量为

$
  j_"inc"=(v_"M")/V.
$ <eq:chapter-four-box-incident-flux>

进入该通量的 Lorentz 不变量为

$
  F & :=sqrt((p_1 dot p_2)^2-m_1^2 m_2^2) \
    & =E_1 E_2 v_"M".
$ <eq:chapter-four-invariant-flux-factor>

在 mostly-plus 标量积下，$p_1 dot p_2=-E_1 E_2+bold(p)_1 dot bold(p)_2$. 依赖参考系的 Møller 速度为

$
  v_"M"
  =sqrt(
    (bold(v)_1-bold(v)_2)^2
    -(bold(v)_1 times bold(v)_2)^2
  ).
$ <eq:chapter-four-moller-flux-velocity>

对共线粒子束，它退化为两个有向速度之差的绝对值. 用 @eq:chapter-four-two-particle-box-rate 除以 @eq:chapter-four-box-incident-flux，最后一个盒体积相消，得到不变微分截面

$
  dd(sigma)
  =1/(4 F) 1/(cal(S)_f)
  overline(abs(cal(M))^2)
  dd(Phi)_n (p_1+p_2).
$ <eq:chapter-four-general-differential-cross-section>

若两种入射粒子分别有 $g_1$ 与 $g_2$ 个等概率占据的离散态，则

$
  overline(abs(cal(M))^2)
  :=1/(g_1 g_2)
  sum_"初态离散指标"sum_"末态离散指标" abs(cal(M))^2.
$ <eq:chapter-four-scattering-spin-sum-average>

若初始偏振已指定，则省略初态平均. 初始粒子对没有全同粒子因子；$cal(S)_f$ 只用于修正对同一末态 Fock 态的重复积分.

=== 质心系中的二对二散射

对于过程

$
  p_1+p_2 arrow.r p_3+p_4,
$

按适合 mostly-plus 度规的符号定义 Mandelstam 不变量：

$
  s & :=-(p_1+p_2)^2, \
  t & :=-(p_1-p_3)^2, \
  u & :=-(p_1-p_4)^2.
$ <eq:chapter-four-mostly-plus-mandelstam>

利用 $p_r^2=-m_r^2$ 与动量守恒，得到

$
  s+t+u=m_1^2+m_2^2+m_3^2+m_4^2.
$ <eq:chapter-four-mandelstam-sum>

在总动量为零的质心系中，$P=(sqrt(s),bold(0))$. 在二体结果 @eq:chapter-four-two-body-phase-space-result 中令 $M arrow.r sqrt(s)$，得到

$
  dd(Phi)_2
  =(p_f^*)/(16 pi^2 sqrt(s)) dd(Omega),
$ <eq:chapter-four-two-body-scattering-phase-space>

其中

$
  p_i^* & =sqrt(lambda (s,m_1^2,m_2^2))/(2 sqrt(s)), \
  p_f^* & =sqrt(lambda (s,m_3^2,m_4^2))/(2 sqrt(s)).
$ <eq:chapter-four-center-of-momentum-momenta>

不变通量因子化为

$
  F=sqrt(s) p_i^*.
$ <eq:chapter-four-center-of-momentum-flux>

代入 @eq:chapter-four-general-differential-cross-section，得到本书度规约定下的标准二对二公式：

$
  (dd(sigma))/(dd(Omega))
  =1/(cal(S)_f)
  1/(64 pi^2 s)
  (p_f^*)/(p_i^*)
  overline(abs(cal(M))^2).
$ <eq:chapter-four-two-to-two-differential-cross-section>

若不分辨方位角，则 $dd(Omega)=2 pi dd(cos theta)$，且

$
  t=m_1^2+m_3^2-2 E_1^* E_3^*
  +2 p_i^* p_f^* cos theta,
  quad
  (dd(t))/(dd(cos theta))=2 p_i^* p_f^*.
$ <eq:chapter-four-two-to-two-t-angle-relation>

因此

$
  (dd(sigma))/(dd(t))
  =1/(cal(S)_f)
  (overline(abs(cal(M))^2))/(16 pi lambda (s,m_1^2,m_2^2)).
$ <eq:chapter-four-two-to-two-differential-cross-section-t>

对无质量二对二散射，$p_i^*=p_f^*=sqrt(s)/2$，于是 @eq:chapter-four-two-to-two-differential-cross-section 退化为

$
  (dd(sigma))/(dd(Omega))
  =1/(cal(S)_f)
  (overline(abs(cal(M))^2))/(64 pi^2 s).
$ <eq:chapter-four-massless-two-to-two-cross-section>

在自然单位制下，衰变宽度具有质量量纲，散射截面具有质量负二次方量纲，可据此检验结果. 相空间与通量因子现已确定，剩下的动力学问题是从关联函数计算 $cal(M)$.








== LSZ 约化公式

LSZ 约化公式把入射态与出射态的重叠 $S_(beta alpha)=bra(beta_"out")ket(alpha_"in")$ 化为时间有序关联函数. 推导从渐近产生、湮灭算符之差出发，用时空积分逐条替换外部粒子；在动量空间中，这一操作提取所有外腿的单粒子极点. 再与完整传播子截肢的定义比较，便能确定截肢核与散射振幅之间的归一化因子.

先列出一般场的渐近展开，再对实标量场完成约化推导，最后恢复自旋波函数. 假设所选场内插稳定粒子，其极点与连续谱分离，且已选定不混合不同粒子极点的场基. 存在场混合时，应先在各物理极点处对角化留数矩阵.

=== 一般渐近场展开

设 $hat(Psi)^a_H (x)$ 为相互作用 Heisenberg 场. 上标 $a$ 是场分量指标：标量场没有该指标，Dirac 场中它是旋量指标，矢量场中则是 Lorentz 指标. 在约化论证中，我们把这类指标直接写在场及其系数函数上，不另行引入抽象指标记号. 渐近自由场的一般展开为

$
  hat(Psi)^a_"in/out" (x)
  =sum_ell integral tilde(dd(p)) [
    u_ell^a (p)
    hat(a)_"in/out" (p,ell)e^(i p dot x)
    +v_ell^a (p)
    hat(b)_"in/out"^dagger (p,ell)e^(-i p dot x)
  ].
$ <eq:chapter-four-general-asymptotic-field-expansion>

其中 $p^2=-m^2$、$tensor(p, +0)=E_p>0$，$ell$ 汇集单粒子的离散标记. 第一项湮灭粒子，第二项产生反粒子；对于自共轭场，两类算符描述同一种粒子. 相应共轭场展开为

$
  overline(hat(Psi))^b_"in/out" (x)
  =sum_ell integral tilde(dd(p)) [
    hat(a)_"in/out"^dagger (p,ell)
    overline(u)_ell^b (p)e^(-i p dot x)
    +hat(b)_"in/out" (p,ell)
    overline(v)_ell^b (p)e^(i p dot x)
  ].
$ <eq:chapter-four-general-conjugate-asymptotic-field-expansion>

对 Dirac 场，横线表示 Dirac 伴随；对实标量场或光子势，场是 Hermitian 的，系数函数上的横线表示普通复共轭.

精确场在弱波包意义下趋于这些自由场：

$
  hat(Psi)^a_H (x) & arrow.r sqrt(Z_Psi) hat(Psi)^a_"in" (x)
                     quad "当" x^0 arrow.r -infinity, \
  hat(Psi)^a_H (x) & arrow.r sqrt(Z_Psi) hat(Psi)^a_"out" (x)
                     quad "当" x^0 arrow.r +infinity,
$ <eq:chapter-four-general-asymptotic-matching>

共轭场也满足相同的渐近关系. 利用 @eq:chapter-four-general-asymptotic-field-expansion 与 @eq:chapter-four-general-conjugate-asymptotic-field-expansion 中的阶梯算符，得到四个单粒子矩阵元

$
            mel(Omega, hat(Psi)^a_H (x), (p,ell)_+) & =sqrt(Z_Psi) u_ell^a (p)e^(i p dot x), \
  mel((p,ell)_+, overline(hat(Psi))^b_H (x), Omega) & =sqrt(Z_Psi) overline(u)_ell^b (p)e^(-i p dot x), \
            mel((p,ell)_-, hat(Psi)^a_H (x), Omega) & =sqrt(Z_Psi) v_ell^a (p)e^(-i p dot x), \
  mel(Omega, overline(hat(Psi))^b_H (x), (p,ell)_-) & =sqrt(Z_Psi) overline(v)_ell^b (p)e^(i p dot x).
$ <eq:chapter-four-general-one-particle-wavefunctions>

下标 $+$ 与 $-$ 区分粒子和反粒子扇区；两类渐近态均取正能. 对旋量，第二行即 $mel((p,s)_+, overline(hat(Psi)) (x), Omega) =sqrt(Z_Psi) overline(u)_s (p)e^(-i p dot x)$，带横线的系数可直接从共轭场展开读取.

=== 从 in--out 重叠导出约化公式

从散射矩阵元出发，可以直接导出约化公式. 先对实标量场完成算符论证. 自旋只会改变附着在外线上的系数，不会改变通过边界项消去外线的机制.

对精确标量场，在有限时间 $t$ 定义内插产生算符

$
  hat(a)^dagger (bold(p),t)
  :=(-i)/(sqrt(Z_phi)) integral dd(x, [3]) [
    e^(i p dot x) partial_t hat(phi)_H (x)
    -(partial_t e^(i p dot x))hat(phi)_H (x)
  ]_(x^0=t),
  quad tensor(p, +0)=E_p.
$ <eq:chapter-four-lsz-time-dependent-creation-operator>

当两个因子都满足自由方程时，中括号就是守恒的 Klein--Gordon 配对. 代入自由模展开可以直接验证归一化：$a^dagger$ 项贡献 $(E_p+E_k)/(2E_k)$，空间积分令 $bold(k)=bold(p)$，而 $a$ 项因两个频率相消而为零. 因此，渐近条件 @eq:chapter-four-general-asymptotic-matching 蕴含

$
  lim_(t arrow.r -infinity) hat(a)^dagger (bold(p),t) & =hat(a)^dagger_"in" (bold(p)), \
  lim_(t arrow.r +infinity) hat(a)^dagger (bold(p),t) & =hat(a)^dagger_"out" (bold(p)).
$ <eq:chapter-four-lsz-creation-operator-limits>

这时自然出现关键差值 $hat(a)^dagger (+infinity)-hat(a)^dagger (-infinity)$. 对 @eq:chapter-four-lsz-time-dependent-creation-operator 求导，两个交叉项相消；又因 $partial_t^2 e^(i p dot x)=-E_p^2 e^(i p dot x)$，故

$
  partial_t hat(a)^dagger (bold(p),t) & =(-i)/(sqrt(Z_phi)) integral dd(x, [3])
                                        e^(i p dot x)[partial_t^2+E_p^2]hat(phi)_H (x) \
                                      & =i/(sqrt(Z_phi)) integral dd(x, [3])
                                        e^(i p dot x)(partial^2-m_"phys"^2)hat(phi)_H (x).
$ <eq:chapter-four-lsz-creation-operator-derivative>

第二行使用了 $E_p^2=bold(p)^2+m_"phys"^2$，对空间 Laplace 算符分部积分，并采用 mostly-plus 恒等式 $partial^2=-partial_t^2+bold(nabla)^2$. 随后对时间积分，把渐近算符之差化为一次时空插入：

$
  hat(a)^dagger_"out" (bold(p))
  -hat(a)^dagger_"in" (bold(p))
  =i/(sqrt(Z_phi)) integral dd(x, [4])
  e^(i p dot x)(partial_x^2-m_"phys"^2)hat(phi)_H (x).
$ <eq:chapter-four-lsz-creation-operator-difference>

取 Hermitian 共轭，得到相应的湮灭算符之差：

$
  hat(a)_"out" (bold(q))-hat(a)_"in" (bold(q))
  =(-i)/(sqrt(Z_phi)) integral dd(x, [4])
  e^(-i q dot x)(partial_x^2-m_"phys"^2)hat(phi)_H (x).
$ <eq:chapter-four-lsz-annihilation-operator-difference>

将有序的标量入射态与出射态写成

$
  ket(alpha_"in") & :=hat(a)^dagger_"in" (bold(p)_1)dots
                    hat(a)^dagger_"in" (bold(p)_n)ket(Omega), \
  bra(beta_"out") & :=bra(Omega)hat(a)_"out" (bold(q)_m)dots
                    hat(a)_"out" (bold(q)_1).
$ <eq:chapter-four-lsz-asymptotic-fock-states>

因此，约化的起点正是

$
  S_(beta alpha)
  =braket(beta_"out", alpha_"in")
  =bra(Omega)
  hat(a)_"out" (bold(q)_m)dots hat(a)_"out" (bold(q)_1)
  hat(a)^dagger_"in" (bold(p)_1)dots
  hat(a)^dagger_"in" (bold(p)_n)
  ket(Omega).
$ <eq:chapter-four-lsz-s-matrix-as-ladder-overlap>

约化第一个入射粒子时，写成

$
  hat(a)^dagger_"in" (bold(p))
  =hat(a)^dagger_"out" (bold(p))
  -[
    hat(a)^dagger_"out" (bold(p))
    -hat(a)^dagger_"in" (bold(p))
  ].
$ <eq:chapter-four-lsz-split-incoming-creation-operator>

第一项可穿过出射湮灭算符向左对易. 每次对易产生一个不变单粒子 delta 函数，并留下少一个粒子的重叠；若产生算符最终到达 $bra(Omega)$，则将其湮灭. 这些项正是恒等贡献与含旁观者线的过程，属于 $S_(beta alpha)$ 的非连通部分. 在完全连通矩阵元中，只保留中括号的负值. 因此，@eq:chapter-four-lsz-creation-operator-difference 把一条入射外腿替换为

$
  (-i)/(sqrt(Z_phi)) integral dd(y, [4])
  e^(i p dot y)(partial_y^2-m_"phys"^2)hat(phi)_H (y).
$ <eq:chapter-four-lsz-one-incoming-reduction>

对出射粒子，使用 $hat(a)_"out"=hat(a)_"in"+[hat(a)_"out"-hat(a)_"in"]$. 把 $a_"in"$ 项向右对易仍只产生旁观者缩并，而 @eq:chapter-four-lsz-annihilation-operator-difference 中的差值把该外粒子替换为

$
  (-i)/(sqrt(Z_phi)) integral dd(x, [4])
  e^(-i q dot x)(partial_x^2-m_"phys"^2)hat(phi)_H (x).
$ <eq:chapter-four-lsz-one-outgoing-reduction>

重复操作即可消去全部外部阶梯算符. 为理解时间有序积为何出现，计算过程中先把渐近时间保持为有限值. 尚未约化的 out 算符位于上边界，in 算符位于下边界；下一次约化时，新场插入可能落在已有插入的任意一侧. 边界代数把时间积分拆成所有可能的相对次序，其总和恰好就是时间排序 $T$. 对于费米场，应使用分次时间排序并计入置换符号. 完成这一重排后再令两端趋于 $plus.minus infinity$，得到

$
  S_(beta alpha)^"连通" & =product_(r=1)^m [
                            (-i)/(sqrt(Z_phi)) integral dd(x_r, [4])
                            e^(-i q_r dot x_r)(partial_(x_r)^2-m_"phys"^2)
                          ] \
                        & quad times product_(s=1)^n [
                            (-i)/(sqrt(Z_phi)) integral dd(y_s, [4])
                            e^(i p_s dot y_s)(partial_(y_s)^2-m_"phys"^2)
                          ] \
                        & quad times mel(
                            Omega,
                            T {
                              product_(r=1)^m hat(phi)_H (x_r)
                              product_(s=1)^n hat(phi)_H (y_s)
                            },
                            Omega
                          )_c.
$ <eq:chapter-four-scalar-lsz-from-operator-differences>

这就是标量 LSZ 约化公式. 每条外腿的波动算符来自渐近阶梯算符的时间导数，因子 $1/sqrt(Z_phi)$ 来自场的渐近匹配；取连通部分则消去旁观者缩并产生的边界项.

=== Green 函数的同时极点

定义连通标量 Green 函数的混合 Fourier 变换

$
  tilde(G)_(M,c)^((m+n))
  (q_1,dots,q_m;p_1,dots,p_n) & :=integral product_(r=1)^m dd(x_r, [4])
                                product_(s=1)^n dd(y_s, [4]) \
                              & quad times e^(-i sum_(r=1)^m q_r dot x_r)
                                e^(i sum_(s=1)^n p_s dot y_s)
                                G_(M,c)^((m+n))
                                (x_1,dots,x_m;y_1,dots,y_n).
$ <eq:chapter-four-lsz-mixed-fourier-transform>

按第二章的 Fourier 约定，$partial^2-m_"phys"^2$ 贡献 $-(p^2+m_"phys"^2)$. 因此，@eq:chapter-four-scalar-lsz-from-operator-differences 变为

$
  S_(beta alpha)^"连通"=lim_"所有外腿在壳"
  product_(r=1)^m [
    (i(q_r^2+m_"phys"^2))/(sqrt(Z_phi))
  ]
  product_(s=1)^n [
    (i(p_s^2+m_"phys"^2))/(sqrt(Z_phi))
  ]
  tilde(G)_(M,c)^((m+n)).
$ <eq:chapter-four-scalar-lsz-momentum-space>

由该关系反解 Green 函数的奇异部分，可看出 LSZ 的解析含义：

$
  tilde(G)_(M,c)^((m+n)) & tilde.op
                           product_(r=1)^m [
                             ((-i)sqrt(Z_phi))/(q_r^2+m_"phys"^2-i 0)
                           ]
                           S_(beta alpha)^"连通" \
                         & quad times product_(s=1)^n [
                             ((-i)sqrt(Z_phi))/(p_s^2+m_"phys"^2-i 0)
                           ].
$ <eq:chapter-four-scalar-green-function-simultaneous-poles>

这里 $tilde.op$ 表示两边的领先同时极点相等. 每个省略项至少对一个外部动量正则，乘以所有逆极点分母并取在壳极限后便会消失. 连通散射矩阵元因此由全部外部单粒子极点的共同留数给出.

对第 4.6.1 节的一般场，只需在渐近展开中保留系数函数即可得到同一结论. 对出射粒子 $beta=((q_1,rho_1)_+,dots,(q_m,rho_m)_+)$ 与入射粒子 $alpha=((p_1,ell_1)_+,dots,(p_n,ell_n)_+)$，定义

$
  G_(M,c)^((m+n))
  (x_1,dots,x_m;y_1,dots,y_n)
  :=mel(
    Omega,
    T {
      product_(r=1)^m hat(Psi)^(a_r)_H (x_r)
      product_(s=1)^n overline(hat(Psi))^(b_s)_H (y_s)
    },
    Omega
  )_c.
$ <eq:chapter-four-general-lsz-correlator>

其领先同时极点为

$
  tilde(G)_(M,c)^((m+n)) & tilde.op
                           sum_(rho_1,dots,rho_m)
                           sum_(ell_1,dots,ell_n)
                           product_(r=1)^m [
                             ((-i)sqrt(Z_r)u_(rho_r)^(a_r) (q_r))
                             /(q_r^2+m_r^2-i 0)
                           ] \
                         & quad times S_(beta alpha)^"连通"
                           product_(s=1)^n [
                             ((-i)sqrt(Z_s)overline(u)_(ell_s)^(b_s) (p_s))
                             /(p_s^2+m_s^2-i 0)
                           ].
$ <eq:chapter-four-general-green-function-simultaneous-poles>

场分量指标 $a_r,b_s$ 保留在 Green 函数上，$rho_r,ell_s$ 则标记物理自旋或螺旋度态. @eq:chapter-four-general-lsz-correlator 所示的排列次序同时也是 Fock 态的排列次序；这一约定吸收全部费米置换符号.

同一留数还可以用另一种方式计算. 完整二点函数的单粒子部分具有形式

$
  tilde(G)_M^(a b) (p)
  tilde.op
  ((-i)Z_Psi)/(p^2+m^2-i 0)
  sum_ell u_ell^a (p)overline(u)_ell^b (p).
$ <eq:chapter-four-general-full-propagator-pole>

撤销 @eq:amputated-connected-function 中完整逆传播子的作用，可示意地写成

$
  tilde(G)_(M,c)^((m+n))
  =[
    product_(r=1)^m tilde(G)_M (q_r)
  ]
  tilde(cal(A))_M^((m+n))
  (q_1,dots,q_m;p_1,dots,p_n)
  [
    product_(s=1)^n tilde(G)_M (p_s)
  ],
$ <eq:chapter-four-lsz-propagators-times-amputated-kernel>

其中相邻场分量指标彼此缩并. 代入 @eq:chapter-four-general-full-propagator-pole，并与 @eq:chapter-four-general-green-function-simultaneous-poles 比较. 每个完整传播子提供 $Z_Psi$，而同一外腿的渐近留数只提供 $sqrt(Z_Psi)$；二者之比使截肢核旁留下一个 $sqrt(Z_Psi)$. 因此

$
  S_(beta alpha)^"连通"
  =[
    product_(r=1)^m sqrt(Z_r)overline(u)_(rho_r) (q_r)
  ]
  tilde(cal(A))_M^((m+n))
  (q_1,dots,q_m;p_1,dots,p_n)
  [
    product_(s=1)^n sqrt(Z_s)u_(ell_s) (p_s)
  ]_"在壳".
$ <eq:chapter-four-general-lsz-amputated-kernel>

平移不变性给出整体动量 delta 函数. 按第 4.4 节的记号，

$
  S_(beta alpha)^"连通"
  =i(2 pi)^4 delta^((4)) (P_beta-P_alpha)
  cal(M)_(beta alpha).
$ <eq:chapter-four-lsz-to-scattering-amplitude>

因此，按极点归一化并取在壳值的截肢连通核给出连通 $S$-matrix 元；再去掉显式因子 $i(2 pi)^4 delta^((4))$，便得到第 4.5 节衰变率与截面公式所用的不变振幅.

=== 外态因子的统一列表

从 @eq:chapter-four-general-one-particle-wavefunctions 的四个矩阵元读取截肢后留下的系数，可统一列出不同粒子的外态因子：

#align(center)[
  #table(
    columns: (auto, auto),
    align: (left, center),
    inset: (x: 9pt, y: 5pt),
    stroke: (x: none, y: 0.4pt),
    [外态], [与 $tilde(cal(A))_M$ 缩并的因子],
    [入射实标量], [$sqrt(Z_phi)$],
    [出射实标量], [$sqrt(Z_phi)$],
    [入射费米子], [$sqrt(Z_Psi)u_s (p)$],
    [出射费米子], [$sqrt(Z_Psi)overline(u)_s (p)$],
    [入射反费米子], [$sqrt(Z_Psi)overline(v)_s (p)$],
    [出射反费米子], [$sqrt(Z_Psi)v_s (p)$],
    [入射光子], [$sqrt(Z_A)epsilon^mu (k,lambda)$],
    [出射光子], [$sqrt(Z_A)epsilon^(mu *) (k,lambda)$],
  )
]

例如，带一个入射和一个出射费米指标的截肢核夹在下列因子之间：

$
  dots sqrt(Z_Psi)overline(u)_r (q)
  tilde(cal(A))_M
  sqrt(Z_Psi)u_s (p) dots,
$ <eq:chapter-four-dirac-lsz-external-contraction>

而入射与出射光子指标对应的缩并为

$
  dots sqrt(Z_A)epsilon^(mu *) (q,rho)
  tilde(cal(A))_(M,mu nu)
  sqrt(Z_A)epsilon^nu (k,lambda) dots.
$ <eq:chapter-four-photon-lsz-external-contraction>


== 散射振幅的 Feynman 规则

有了 LSZ 公式，便可直接在动量空间计算散射振幅. 需要构造连通截肢图，为外腿附上单粒子波函数，并将外部动量置于物理质量壳. 下面从作用量读取传播子与顶角，结合动量守恒、统计符号和对称因子，整理出可逐图执行的 Feynman 规则.

以下规则使用作用量二次部分给出的传播子，以及相互作用部分给出的顶角，因而描述通常微扰展开. 也可以改用重求和传播子或 1PI 顶角重新组织微扰论，但不能混用自由与重求和对象，以免同一自能或顶角修正被重复计数.

=== 动量流向与计算对象

把每个顶角上各条线的动量都规定为*流入*该顶角. 对入射动量为 $p_1,dots,p_n$、出射动量为 $q_1,dots,q_m$ 的物理过程，图中使用的外部动量因此为

$
  k_s=p_s quad "入射粒子",
  quad
  k_(n+r)=-q_r quad "出射粒子".
$ <eq:chapter-four-all-incoming-external-momenta>

动量守恒写成

$
  sum_"全部外腿" k_i=0
  quad arrow.l.r quad
  P_alpha=P_beta.
$ <eq:chapter-four-all-incoming-momentum-conservation>

每个顶角起初各自贡献 $(2 pi)^4 delta^((4)) (sum_i k_i)$. 完成内部动量积分后，只留下一个表达整体动量守恒的 delta 函数. 完整图之和具有形式

$
  sum_"连通截肢图" cal(F)_Gamma
  =(2 pi)^4 delta^((4)) (P_beta-P_alpha)
  i cal(M)_(beta alpha).
$ <eq:chapter-four-diagram-sum-defines-i-amplitude>

剥去整体 delta 函数后，图规则给出 $i cal(M)$. 标量 $phi^4$ 接触顶角贡献 $i cal(M)=-i lambda$，故 $cal(M)=-lambda$，与 @eq:chapter-four-lsz-to-scattering-amplitude 的约定一致.

实际计算中常从一开始就省略各顶角的 delta 函数. 此时在每个顶角施加动量守恒，选择独立圈动量，并约定唯一的整体 delta 函数已经剥去. 下列规则与例子均采用这一剥离约定.

=== 外态与内部线

外态贡献极点波函数，但不贡献外部传播子. 结合第 4.6.4 节与在壳条件，得到

#align(center)[
  #table(
    columns: (auto, auto, auto),
    align: (left, center, center),
    inset: (x: 7pt, y: 6pt),
    stroke: (x: none, y: 0.4pt),
    [外态], [外态因子], [质量壳],
    [入射实标量], [$sqrt(Z_phi)$], [$p^2=-m^2$],
    [出射实标量], [$sqrt(Z_phi)$], [$q^2=-m^2$],
    [入射费米子], [$sqrt(Z_Psi)u_s (p)$], [$p^2=-m^2$],
    [出射费米子], [$sqrt(Z_Psi)overline(u)_s (q)$], [$q^2=-m^2$],
    [入射反费米子], [$sqrt(Z_Psi)overline(v)_s (p)$], [$p^2=-m^2$],
    [出射反费米子], [$sqrt(Z_Psi)v_s (q)$], [$q^2=-m^2$],
    [入射光子], [$sqrt(Z_A)epsilon^mu (k,lambda)$], [$k^2=0$],
    [出射光子], [$sqrt(Z_A)epsilon^(mu *) (k,lambda)$], [$k^2=0$],
  )
]

表中每个动量都具有正的物理能量. 只有把出射动量插入全流入顶角或动量守恒方程时，才作 $q arrow.r -q$ 的替换；外部波函数的正能动量参数并不因此改变. 费米线箭头记录荷流，不必与所选动量路由同向.

若微扰场已归一化为单位极点留数，则 $Z_phi=Z_Psi=Z_A=1$，可以省略平方根因子；否则必须始终保留. 不要再显式添加外腿自能插入，因为完整外腿截肢与这些留数因子已经将其计入.

对每条携带动量 $k$ 的内部线，插入由二次作用量得到的传播子：

$
        "实标量：" & quad
                     Delta_F (k)=(-i)/(k^2+m^2-i 0), \
  "Dirac 费米子：" & quad
                     S_F (k)=i(slashed(k)-m)/(k^2+m^2-i 0), \
      "协变光子：" & quad
                     tensor(D_F, -mu, -nu) (k)
                     =(-i)/(k^2-i 0)[
                       tensor(eta, -mu, -nu)
                       -(1-xi)(tensor(k, -mu)tensor(k, -nu))/(k^2)
                     ].
$ <eq:chapter-four-scattering-internal-propagators>

在 Feynman 规范中，光子传播子的分子退化为 $tensor(eta, -mu, -nu)$. 复标量传播子具有相同的标量分母，但连接 $phi$ 与 $phi^dagger$，因而绘图时带有方向. Dirac 传播子同样有向；其旋量指标及其他内部指标按顶角所固定的次序缩并.

这些都是*内部*传播子. 若在外部波函数与第一个顶角之间再连接一个传播子，就会撤销 LSZ 截肢，得到错误的计算对象.

=== 由相互作用 Lagrangian 得到顶角

由 Dyson 级数 @eq:chapter-four-dyson-series-lagrangian，对 $i cal(L)_"int"$ 按连接顶角的各个场分别微分，即得局域顶角因子. 微分同时给出全同场的阶乘，并要求保留 Grassmann 奇场的排列次序.

例如，相互作用

$
  cal(L)_"int"
  =dots-g/(product_(A=1)^r n_A!)
  product_(A=1)^r Phi_A^(n_A)+dots
$

在每种全同场不含额外分量张量时给出因子 $-i g$. 特别地，

$
  cal(L)_"int"=-lambda/(4!)phi^4
  quad arrow.r quad
  "四标量顶角"=-i lambda.
$ <eq:chapter-four-phi-four-momentum-space-vertex>

若耦合带有 Lorentz、旋量、味或群指标，相应不变张量保留在顶角因子中，并与相邻线缩并. 二点反项按双腿顶角处理，更高点反项则与原相互作用完全同样处理.

对于导数相互作用，采用第二章的 Fourier 约定. 若动量 $k$ 随某场流入顶角，作用在该场上的导数变为

$
  tensor(partial, -mu) Phi (x)
  quad arrow.r quad
  i tensor(k, -mu) Phi (k).
$ <eq:chapter-four-derivative-interaction-momentum-rule>

该规则中的所有动量均为流入动量. 因此，对物理出射场作用的导数在替换 $k=-q$ 后提供 $-i tensor(q, -mu)$. 最后在顶角施加 $sum_i k_i=0$. 若尚未剥去顶角 delta 函数，还要把局域因子乘以 $(2 pi)^4 delta^((4)) (sum_i k_i)$.

=== 圈、统计符号与对称因子

施加所有顶角守恒关系后，对每个尚未固定的独立动量作积分

$
  integral (dd(ell, [4]))/((2 pi)^4).
$ <eq:chapter-four-loop-integration-measure>

对含 $I$ 条内部线、$V$ 个顶角的连通图，独立圈动量数为

$
  L=I-V+1.
$ <eq:chapter-four-connected-graph-loop-number>

$I$ 个内部动量受到 $V$ 个顶角 delta 函数约束，其中整体守恒律不构成独立的内部约束，故剩下 $I-(V-1)=L$ 个积分. 动量路由可以任意选择；只要正规化保持所需对称性，不同路由应能通过圈动量平移互相转化并给出相同结果.

每个闭合费米圈额外贡献因子 $-1$，并对沿圈有序相乘的旋量及内部指标矩阵取迹. 外部费米子的置换也会产生符号，使所选外态次序恢复为振幅的固定次序. 传播子是费米型本身并不会额外产生负号.

每幅图还带有图形对称因子的倒数

$
  1/(cal(S)_Gamma),
  quad
  cal(S)_Gamma:=abs(upright("Aut") Gamma).
$ <eq:chapter-four-diagram-symmetry-factor>

这里 $upright("Aut") Gamma$ 是保持每条*已标记*外腿、场种类、荷流箭头、顶角类型及其他装饰不变的图自同构群. 在标量理论中，它通常对应于不改变图形的不可区分内部线与全同顶角置换.

同一因子总能从 Wick 缩并直接恢复. 在 $phi^4$ 理论的 $V$ 阶，若有 $N_Gamma$ 种缩并产生某幅带标记外腿的图，则

$
  1/(cal(S)_Gamma)
  =(N_Gamma)/(V!(4!)^V).
$ <eq:chapter-four-symmetry-factor-from-wick-contractions>

对本章使用的基本例子：

- 四点接触图满足 $cal(S)_Gamma=1$；
- 任意固定道中的单圈四点鱼图满足 $cal(S)_Gamma=2$，因为两条内部线可以交换；
- 单顶角二点蝌蚪图满足 $cal(S)_Gamma=2$.

$s$、$t$、$u$ 三个鱼图的外腿标记不同，因而是三幅不同的图；三种道的计数与单幅图的对称因子相互独立. 同样，不能把 $cal(S)_Gamma$ 与第 4.5 节的末态相空间因子 $cal(S)_f$ 混淆. 振幅已经包含全同外粒子所要求的全部交换，而随后对带标记末态动量积分时再除以 $cal(S)_f$，以免重复计数同一个末态 Fock 态.

综合上述要素，剥离整体 delta 函数后的规则可写成

$
  i cal(M)_(beta alpha)
  =sum_(Gamma in cal(G)_(beta alpha))
  ((-1)^(N_F (Gamma)))/(cal(S)_Gamma)
  cal(F)_Gamma.
$ <eq:chapter-four-momentum-space-diagram-master-rule>

其中 $cal(G)_(beta alpha)$ 是连通截肢图集合，$N_F (Gamma)$ 是闭合费米圈数，$cal(F)_Gamma$ 是外态因子、内部传播子、顶角因子、指标缩并及 $L$ 个圈测度的有序乘积. 反项图应与其所抵消的发散计入同一微扰阶.

连通截肢图的求和包括内部 1PR 交换图. 真空气泡、非连通散射分量、外部传播子及外腿自能子图均已在归一化、取连通部分和截肢时去除. 内部自能插入仍须保留，或统一计入重求和传播子，避免重复计数.

=== 实用计算流程

对给定过程与微扰阶数，可按以下次序应用规则：

+ 画出全部连通截肢拓扑，包括内部 1PR 交换图和所需反项图.
+ 标记每个物理外部动量与离散态，再把物理出射动量 $q$ 替换为图中流入的动量 $-q$.
+ 为每条带荷线或费米线选定方向，在各顶角施加动量守恒，并选择 $L=I-V+1$ 个独立圈动量.
+ 相乘全部外部波函数、内部传播子、顶角因子、圈测度、指标缩并、$(-1)^(N_F)$ 与 $1/cal(S)_Gamma$.
+ 对图及内部指标求和，正规化发散圈积分，按所选重整化方案加入反项，并令所有物理外部动量在壳.
+ 去掉唯一的整体动量 delta 函数，剩余结果即为 $i cal(M)_(beta alpha)$；只有在需要 $cal(M)_(beta alpha)$ 本身时才除以 $i$.

=== 例：$phi^4$ 散射至单圈阶

考虑实标量理论 $cal(L)_"int"=-lambda phi^4/(4!)$ 中的过程 $p_1+p_2 arrow.r p_3+p_4$. 采用极点归一化的重整化场，使 $Z_phi=1$；若采用其他归一化，四条外腿会提供整体因子 $Z_phi^2$. 在全流入约定下，

$
  k_1=p_1,
  quad k_2=p_2,
  quad k_3=-p_3,
  quad k_4=-p_4,
  quad sum_(i=1)^4 k_i=0.
$ <eq:chapter-four-phi-four-all-incoming-momenta>

树级只有一幅连通截肢图，其对称因子为一，因此

$
  i cal(M)_"tree"=-i lambda,
  quad
  cal(M)_"tree"=-lambda.
$ <eq:chapter-four-phi-four-tree-amplitude>

$lambda^2$ 阶共有三个鱼图. 定义

$
  cal(I) (P)
  :=integral (dd(ell, [4]))/((2 pi)^4)
  [(-i)/(ell^2+m^2-i 0)]
  [(-i)/((ell+P)^2+m^2-i 0)].
$ <eq:chapter-four-phi-four-bubble-integral>

穿过两条内部线的动量可以分别选为

$
  P_s=p_1+p_2,
  quad
  P_t=p_1-p_3,
  quad
  P_u=p_1-p_4,
$ <eq:chapter-four-phi-four-channel-momenta>

按第 4.5 节 mostly-plus Mandelstam 约定，有 $P_s^2=-s$、$P_t^2=-t$、$P_u^2=-u$. 每幅图都有 $I=2$、$V=2$，因而只有一个独立圈动量，且均满足 $cal(S)_Gamma=2$. 计入四点反项 $-delta lambda phi^4/(4!)$ 后，到该阶的结果为

$
  i cal(M)_(2 arrow.r 2)
  =-i lambda-i delta lambda
  +((-i lambda)^2)/2 [
    cal(I) (P_s)+cal(I) (P_t)+cal(I) (P_u)
  ]
  +O(lambda^3).
$ <eq:chapter-four-phi-four-one-loop-amplitude>

#figure(
  image("../../fig/feynman/ch4_phi4_scattering_one_loop.svg", width: 92%),
  caption: [
    对 @eq:chapter-four-phi-four-one-loop-amplitude 有贡献的五幅连通截肢图. 外部标记为物理动量；在顶角处，出射动量 $p_3,p_4$ 分别按 $-p_3,-p_4$ 路由. 带叉顶角表示四点反项，用以区别树级接触顶角；每个鱼图均有 $cal(S)_Gamma=2$.
  ],
) <fig:chapter-four-phi-four-scattering-one-loop>



四维时空中的圈积分具有紫外发散，必须在同一方案中处理正规化与反项. @fig:chapter-four-phi-four-scattering-one-loop 的三个道展示了全部要素：截肢外腿、两个 $-i lambda$ 因子、两条内部传播子、一个圈测度、对称因子 $1/2$，以及已剥去的整体守恒 delta 函数. 重整化后，有限振幅 $cal(M) (s,t,u)$ 可直接代入第 4.5 节的衰变率与截面公式.

#pagebreak()

== 习题

#exercise(
  title: "有效作用量为何生成 1PI 顶角",
  label: <ex:effective-action-generates-1pi>,
)[
  先在有限正规化下工作，此时 Hessian 都是通常的可逆矩阵. 采用 @eq:chapter-four-connected-generator 与 @eq:minkowski-effective-action 的 Minkowski 约定，但不要预先假定 1PI 解释.

  + 从 $phi_"cl" (x)=(delta W_M [J])/(delta J (x))$ 与 $(delta Gamma_M [phi_"cl"])/(delta phi_"cl" (x))=-J (x)$ 出发，证明

    $
      (delta phi_"cl" (x))/(delta J (y))=i G_M (x,y).
    $

    对第二个关系应用泛函链式法则，证明 @eq:effective-action-inverse-propagator-identity，并特别核对其中的因子 $i$.

  + 对上述逆关系再作一次微分，由此导出

    $
      G_(M,c)^((3)) (x_1,x_2,x_3)
      = integral product_(r=1)^3 dd(y_r, [4])
      product_(r=1)^3 G_M (x_r,y_r)
      i Gamma_M^((3)) (y_1,y_2,y_3).
    $

    再微分一次并证明 @eq:connected-four-point-from-proper-vertices，其中 1PR 核应明确写为

    $
      cal(R)_(M,"1PR")^((4)) (y_1,y_2,y_3,y_4) & = sum_(((i,j),(k,l)) in cal(P)_4^((2)))
                                                 integral dd(u, [4]) dd(v, [4]) \
                                               & quad (i Gamma_M^((3)) (y_i,y_j,u)) G_M (u,v)
                                                 (i Gamma_M^((3)) (v,y_k,y_l)).
    $

    检查这里出现的每条内部线都是桥，并说明在具有 $phi arrow.r -phi$ 对称性的真空中，该表达式恒为零.

  + 对任意 $n$ 重复上述微分. 证明所得图为树图，其顶角为 $i Gamma_M^((r))$，边为完整传播子 $G_M$. 解释完整传播子为何吸收全部二点插入，从而在平稳真空处只需保留 $r>=3$ 的顶角.

  + 切断一幅连通截肢微扰图中的全部桥. 将各个唯一的极大无桥分量收缩为点后，所得图构成一棵树. 对分量数作归纳，证明每幅 1PR 图都由至少含两个 1PI 顶角的树图生成，而无桥图则保留在单顶角余项 $Gamma_M^((n))$ 中. 由此说明：当 $n>=3$ 时，有效作用量的导数恰好生成截肢 1PI 顶角；$n=2$ 的情形则应另用 @eq:effective-action-inverse-propagator-identity 处理.
]

#exercise(
  title: "Dyson 级数的推导",
  label: <ex:derive-dyson-series>,
)[
  从相互作用绘景的初值问题 @eq:chapter-four-interaction-picture-evolution 出发，通过迭代积分推导 Dyson 展开 @eq:chapter-four-dyson-series-hamiltonian.

  + 将微分方程积分一次，得到 Volterra 方程

    $
      hat(U)_I (t,t_0)
      =1-i integral_(t_0)^t dd(t_1)
      hat(H)_I (t_1)hat(U)_I (t_1,t_0).
    $

    反复将此方程代回自身，证明 $n$ 阶项为有序积分

    $
      (-i)^n integral_(t_0)^t dd(t_1)
      integral_(t_0)^(t_1) dd(t_2) dots
      integral_(t_0)^(t_(n-1)) dd(t_n)
      hat(H)_I (t_1)hat(H)_I (t_2)dots hat(H)_I (t_n).
    $

    解释为何时间最晚的算符必定位于最左侧.

  + 忽略测度为零的边界后，超立方体 $[t_0,t]^n$ 可按各时间变量的不同次序分成 $n!$ 个区域. 利用这一分割证明

    $
      & integral_(t_0)^t dd(t_1)
        integral_(t_0)^(t_1) dd(t_2) dots
        integral_(t_0)^(t_(n-1)) dd(t_n)
        hat(H)_I (t_1)dots hat(H)_I (t_n) \
      & quad =1/(n!) integral_(t_0)^t product_(r=1)^n dd(t_r)
        T {hat(H)_I (t_1)dots hat(H)_I (t_n)}.
    $

    对 $n=2$ 与 $n=3$ 显式检验此恒等式；当 $[hat(H)_I (t_r),hat(H)_I (t_s)] !=0$ 时，必须保留算符的先后次序.

  + 对所有阶求和，再令 $t_0 arrow.r -infinity$、$t arrow.r +infinity$，得到 @eq:chapter-four-dyson-series-hamiltonian. 最后对所得级数的时间上限求导，同时验证演化方程与初始条件. 若不同时刻的 Hamiltonian 两两对易，结果可化成什么形式？
]

#exercise(
  title: "固定靶实验室系中的二对二散射",
  label: <ex:two-to-two-fixed-target-lab-frame>,
)[
  考虑反应 $p_1+p_2 arrow.r p_3+p_4$，并选取粒子 2 初始静止的实验室系. 记

  $
    p_1=(E_1,bold(k)),
    quad
    p_2=(m_2,bold(0)),
  $

  以下计算始终采用 @eq:chapter-four-mostly-plus-mandelstam 所定义的 Mandelstam 变量.

  + 由动量守恒，两个动量转移可分别写成 $p_1-p_3=p_4-p_2$ 与 $p_1-p_4=p_3-p_2$. 使用 mostly-plus 度规证明

    $
      s=m_1^2+m_2^2+2 m_2 E_1,
      quad
      t=m_2^2+m_4^2-2 m_2 E_4,
      quad
      u=m_2^2+m_3^2-2 m_2 E_3.
    $

    结合 @eq:chapter-four-mandelstam-sum，可将实验室系能量直接表示为不变量：

    $
      E_1 & =(s-m_1^2-m_2^2)/(2 m_2), \
      E_3 & =(m_2^2+m_3^2-u)/(2 m_2)
            =(s+t-m_1^2-m_4^2)/(2 m_2), \
      E_4 & =(m_2^2+m_4^2-t)/(2 m_2).
    $

  + 令 $k:=abs(bold(k))$，并将 $p_3=(E_3,bold(q))$ 中的三动量模记为 $q:=abs(bold(q))$，再定义 $cos theta=(bold(k) dot bold(q))/(k q)$. 证明

    $
      k & =sqrt(lambda (s,m_1^2,m_2^2))/(2 m_2), \
      q & =sqrt(lambda (u,m_2^2,m_3^2))/(2 m_2), \
      F & =m_2 k=1/2 sqrt(lambda (s,m_1^2,m_2^2)).
    $

    先导出

    $
      t=m_1^2+m_3^2-2 E_1 E_3+2 k q cos theta,
    $

    再消去实验室系中的能量与动量，得到

    $
      cos theta
      =(2 m_2^2 (t-m_1^2-m_3^2)
      +(s-m_1^2-m_2^2)(m_2^2+m_3^2-u))
      /(sqrt(
        lambda (s,m_1^2,m_2^2)
        lambda (u,m_2^2,m_3^2)
      )).
    $

    说明条件 $abs(cos theta)<=1$、末态能量为正以及 $s>=(m_3+m_4)^2$ 如何共同界定物理区域.

  + 将 @eq:chapter-four-two-to-two-differential-cross-section-t 用于固定靶实验室系，证明微分截面可写成紧凑形式

    $
      ((dd(sigma))/(dd(t)))_"lab"
      =1/(cal(S)_f)
      (overline(abs(cal(M) (s,t))^2))
      /(16 pi lambda (s,m_1^2,m_2^2))
      =1/(cal(S)_f)
      (overline(abs(cal(M) (s,t))^2))
      /(64 pi m_2^2 k^2).
    $

    说明用实验室系变量写出的 $dd(sigma)/dd(t)$ 如何保持 Lorentz 不变性，并证明总截面为

    $
      sigma
      =1/(cal(S)_f)
      integral_(t_-)^(t_+) dd(t)
      (overline(abs(cal(M) (s,t))^2))
      /(16 pi lambda (s,m_1^2,m_2^2)),
    $

    其中积分端点同样是不变量：

    $
      t_- & =m_1^2+m_3^2
            -((s+m_1^2-m_2^2)(s+m_3^2-m_4^2)
            +sqrt(
              lambda (s,m_1^2,m_2^2)
              lambda (s,m_3^2,m_4^2)
            ))/(2 s), \
      t_+ & =m_1^2+m_3^2
            -((s+m_1^2-m_2^2)(s+m_3^2-m_4^2)
            -sqrt(
              lambda (s,m_1^2,m_2^2)
              lambda (s,m_3^2,m_4^2)
            ))/(2 s).
    $

  + 作为一致性检验，重新导出实验室系的角分布公式. 令 $W:=E_1+m_2$、$C:=(s+m_3^2-m_4^2)/2$. 粒子 4 的在壳条件给出 $W E_3-k q cos theta=C$. 沿一条物理运动学分支对此关系求导，并证明

    $
      abs((dd(t))/(dd(cos theta)))
      =(2 m_2 k q^2)/
      (abs(q (E_1+m_2)-k E_3 cos theta)).
    $

    利用 $dd(Omega)=2 pi dd(cos theta)$，证明

    $
      ((dd(sigma))/(dd(Omega)))_"lab"
      =1/(cal(S)_f)
      1/(64 pi^2 m_2 k)
      (q^2 overline(abs(cal(M) (s,t))^2))/
      abs(q (E_1+m_2)-k E_3 cos theta).
    $

    若 $t$ 与 $cos theta$ 之间的映射存在多条物理分支，应将各分支的 Jacobian 贡献相加. 最后检查两种微分截面的量纲.
]
