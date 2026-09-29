#import "../../lib.typ": *
#import "../../fig/feynman/ch5-two-point.typ": dyson-diagrams, self-energy-parts, two-point-legend
#import "../../fig/feynman/ch5-four-point.typ": four-point-panels
#import "../../fig/feynman/ch5-fish.typ": fish-channels

= 零温 $phi^4$ 理论

第 4 章中，我们从关联函数的单粒子极点确定质量和外线归一化，再通过 LSZ 公式求散射振幅. 这也提示我们：粒子的质量由完整传播子决定，不能在计入圈修正后仍直接把它等同于裸 Lagrangian 中的质量参数. 耦合常数与散射振幅之间同样存在量子修正. 本章以具有未破缺 $phi arrow.r -phi$ 对称性的有质量实标量场为例，研究如何用物理质量和散射振幅确定理论的参数，并以这些参数组织微扰展开.

圈积分包含任意大的内部动量，裸参数与物理量之间的关系因而可能出现紫外发散. 我们先引入正规化，使这一关系有明确的数学意义；随后固定物理质量和选定的散射振幅，让裸参数随正规化相应改变. 把裸理论改写成这些有限参数与重整化场的形式时，便会出现反项（counterterm）. 它们记录裸量与重整化量之间的差别，使我们能够直接围绕给定的物理条件计算圈修正.

我们将采用维数正规化处理圈积分，并用 on-shell 条件确定反项：令重整化质量 $m$ 等于粒子的极点质量，将重整化场的单粒子极点留数归一为一，再用两粒子散射在阈值处的振幅定义耦合常数 $lambda$. 我们先计算单圈自能，确定最低阶质量反项，并说明这一阶为什么不需要场反项；随后计算四点函数的单圈修正，用阈值条件确定耦合常数反项，得到有限的散射振幅.


== 维数正规化与 on-shell 重整化

在计算圈图之前，我们先说明怎样把物理质量和耦合常数放进 Lagrangian. 裸参数与物理量之间的关系可能含有发散，因此需要先用维数正规化定义圈积分. 随后，我们用重整化场和参数改写裸 Lagrangian，把两种写法之间的差额记为反项. 反项的系数由传播子的极点和散射振幅确定；至于这些反项能否消去各阶圈图的紫外发散，还需要检查图的大动量行为.

=== 维数正规化下的裸理论

一个在四维发散的圈积分，在适当的维数范围内可能收敛. 维数正规化先在这样的范围内求积分，再把结果解析延拓到四维附近，将发散表示为维数参数的极点. 我们记

$
  d=4-2 epsilon,
  quad epsilon>0,
$ <eq:chapter-five-dimension-convention>

四维极限对应于 $epsilon arrow.r 0$. 用下标 $0$ 标记裸量，$d$ 维 Minkowski 时空中的裸 Lagrangian 为

$
  cal(L)_0
  =-1/2 tensor(partial, +mu) phi_0 tensor(partial, -mu) phi_0
  -1/2 m_0^2 phi_0^2
  -lambda_0/(4!) phi_0^4.
$ <eq:chapter-five-bare-phi-four-lagrangian>

其中 $phi_0$ 是裸场，$m_0$ 和 $lambda_0$ 分别是裸质量与裸耦合常数. 这里仍采用全书的 mostly-plus 度规，物理质量为 $m$ 的粒子满足 $p^2=-m^2$. Fourier 变换和传播子的 Feynman $i 0$ 处方也保持不变；$i 0$ 规定绕过传播子极点的方式，与维数正规化参数 $epsilon$ 含义不同.

维数改变以后，场和耦合常数的量纲也会改变. 在自然单位制下，作用量没有量纲，而 $d$ 维时空体积元的质量量纲为 $-d$，所以 $cal(L)_0$ 的质量量纲为 $d$. 用方括号表示质量量纲，先由动能项确定 $phi_0$ 的量纲，再考察质量项和相互作用项，得到

$
  [phi_0]=(d-2)/2=1-epsilon,
  quad
  [m_0]=1,
  quad
  [lambda_0]=4-d=2 epsilon.
$ <eq:chapter-five-bare-mass-dimensions>

因此，$lambda_0$ 在 $d$ 维不再是无量纲量. 我们仍希望用无量纲的重整化耦合常数 $lambda$ 作微扰展开，为此引入一个具有质量量纲的参数 $mu$，用 $mu^(2 epsilon)$ 补足相互作用项的量纲. $mu$ 可以任意选取；固定物理质量和阈值散射振幅后，四维极限中的物理结果应与这个辅助参数无关.

=== 重整化变量与反项

第 4 章告诉我们，粒子的物理质量由完整传播子的极点决定. 加入自能以后，极点一般会偏离自由传播子中裸质量所确定的位置. 即使自能是有限的，这种偏移也会发生. 如果希望从一开始就用物理质量 $m$ 写自由传播子，就需要把裸质量与 $m$ 之间的差别放入相互作用部分，作为微扰处理. 耦合常数和场的归一化也可以作类似的安排.

我们保留正规化，定义重整化场 $phi$ 以及参数 $m$、$lambda$，令它们与裸量满足

$
              phi_0 & =sqrt(Z_"ct") phi, \
       Z_"ct" m_0^2 & =m^2+delta m^2, \
  Z_"ct"^2 lambda_0 & =mu^(2 epsilon) (lambda+delta lambda), \
            delta Z & :=Z_"ct"-1.
$ <eq:chapter-five-bare-renormalized-relations>

其中 $Z_"ct"$ 表示场的归一化改变，$delta m^2$ 和 $delta lambda$ 记录质量项与相互作用项系数的改变. $m$ 和 $lambda$ 的具体定义将在下一小节给出. 将这些关系代入裸 Lagrangian，把不含 $delta Z$、$delta m^2$ 和 $delta lambda$ 的部分分开，得到

$
  cal(L)_0=cal(L)_"ren"+cal(L)_"ct",
$ <eq:chapter-five-lagrangian-splitting>

其中

$
  cal(L)_"ren" & =-1/2 tensor(partial, +mu) phi tensor(partial, -mu) phi
                 -1/2 m^2 phi^2
                 -(mu^(2 epsilon) lambda)/(4!) phi^4, \
   cal(L)_"ct" & =-1/2 delta Z
                 tensor(partial, +mu) phi tensor(partial, -mu) phi
                 -1/2 delta m^2 phi^2
                 -(mu^(2 epsilon) delta lambda)/(4!) phi^4.
$ <eq:chapter-five-renormalized-and-counterterm-lagrangians>

$cal(L)_"ren"$ 具有原来 Lagrangian 的形式，但使用了重整化场和参数. $cal(L)_"ct"$ 中的三项称为反项，它们分别对应动能项、质量项和四次相互作用项. 在给定的正规化下，两部分之和仍是同一个裸 Lagrangian. 因此，我们也可以用裸参数完成计算，最后再换成物理量；引入反项的好处，是能直接用选定的 $m$ 和 $lambda$ 写传播子与顶点.

当圈积分发散时，保持物理质量和散射振幅不变，就要求裸参数随正规化参数改变. 这种依赖体现在反项系数中，在维数正规化下表现为 $epsilon$ 的极点. 计算重整化量时，应先把圈图与反项相加，再取 $epsilon arrow.r 0$ 的极限. 反项的形式受原有 Lagrangian 的局域性和对称性限制，同一个反项系数也必须用于所有过程. 仅仅改写变量还不能保证结果有限，后面需要检查这三类反项是否足够.

这里还要区分两种场的归一化因子. $Z_"ct"$ 联系裸场与重整化场；第 4 章的 $Z_phi$ 表示所选场的完整传播子在单粒子极点处的留数. 我们将通过选择 $Z_"ct"$，使重整化场的 $Z_phi=1$. 这并不要求 $Z_"ct"=1$，因为它需要补偿圈修正对留数的影响.

=== on-shell 重整化条件

上面的变量替换尚未确定反项系数. 要确定它们，需要说明重整化参数对应于哪些物理量. 我们把 $m$ 定义为稳定粒子的极点质量，并把重整化场的单粒子极点留数取为一. 记这个场的完整传播子为 $G_R$，两个要求可以写成

$
  G_R (p)
  =(-i)/(p^2+m^2-i 0)+"正则项",
  quad p^2 arrow.r -m^2.
$ <eq:chapter-five-on-shell-normalization>

正则项在 $p^2=-m^2$ 附近没有奇点. 上式要求计入圈修正以后，极点仍位于 $-m^2$，极点项的系数仍为 $-i$. 这就给出确定质量反项和场反项的两个条件. 它们约束的是极点附近的完整结果，因此反项也要包含相应的有限部分，只减去发散项一般不能满足这些要求.

还需要一个条件确定 $lambda$ 和 $delta lambda$. 树级两粒子散射振幅为 $cal(M)=-lambda$，我们要求加入圈修正后，这一关系在散射阈值处仍然成立. 沿用第 4 章的 Mandelstam 变量，四维极限中的条件为

$
  cal(M) (s=4 m^2,t=0,u=0)=-lambda.
$ <eq:chapter-five-on-shell-coupling-condition>

这里所有外粒子都在质量壳上，阈值对应于质心系中相对三动量趋于零的极限. 这个条件通过阈值振幅定义 $lambda$，并逐阶确定 $delta lambda$，包括它的有限部分. 一旦 $lambda$ 确定，其他能量和角度处的振幅便可由理论计算. 以上条件利用了物理质量壳，因此称为 on-shell 重整化条件.

在逐阶计算之前，可以先从图的顶点数判断反项的最低阶数：

$
  delta m^2=O(lambda),
  quad
  delta lambda=O(lambda^2),
  quad
  delta Z=O(lambda^2).
$ <eq:chapter-five-counterterm-leading-orders>

一圈 tadpole 图只含一个四次顶点，贡献为 $O(lambda)$，而且不依赖外动量. 因而这一阶只需要质量反项. 自能从两圈开始依赖外动量，场反项相应地从 $O(lambda^2)$ 开始出现. 四点函数的一圈图含有两个四次顶点，所以耦合常数反项也从 $O(lambda^2)$ 开始.

=== 动量空间 Feynman 规则

现在可以写出包含反项的 Feynman 规则. 我们用 $cal(L)_"ren"$ 的二次部分定义自由传播子，把四次相互作用以及 $cal(L)_"ct"$ 中的各项都作为顶点. 按照第 4.7 节的方法，令顶点动量全部流入，得到

$
              "标量内线：" & quad
                             (-i)/(p^2+m^2-i 0), \
      "四次相互作用顶点：" & quad
                             -i mu^(2 epsilon) lambda, \
          "二点反项顶点：" & quad
                             -i [delta Z p^2+delta m^2], \
          "四点反项顶点：" & quad
                             -i mu^(2 epsilon) delta lambda, \
  "每个独立圈动量的积分：" & quad
                             integral (dd(ell, [d]))/((2 pi)^d).
$ <eq:chapter-five-on-shell-feynman-rules>

顶点因子中的 $1/2$ 和 $1/(4!)$ 已被相同场的排列数抵消. 二点反项中的 $p^2$ 来自动能反项的两个导数，质量反项则不含动量. 这些顶点与普通顶点一样参与缩并，每幅图仍要按第 4.7.4 节计入对称因子. 图中用叉号标记反项顶点，以便与普通顶点区分.

反项顶点本身也带有 $lambda$ 的幂次，其最低阶数见 @eq:chapter-five-counterterm-leading-orders. 例如，最低阶质量反项虽然画成一个没有圈的二点顶点，却与一圈 tadpole 图同为 $O(lambda)$. 因此，在给定阶次必须同时计入普通圈图和总阶数相同的反项图. 高阶图还会用到低阶反项插入，用来抵消其中已经出现过的子图发散.

由重整化 Green 函数求散射振幅时，仍按 LSZ 公式截去外线传播子. on-shell 条件使标量外线的留数因子等于一，因而不再产生额外的乘数. 不过，使留数保持为一正是场反项的作用，计算中仍须包含 $delta Z$ 的贡献.

=== 幂次计数与可重整化性

到目前为止，我们只从裸 Lagrangian 中分出了三类反项. 如果更高阶的圈图产生了它们无法抵消的发散，就还需要新的反项. 为了判断这种情况是否发生，我们先考察圈积分在大动量处的幂次. 考虑一幅由普通四次顶点构成、已截去外线传播子的连通 1PI 圈图，记独立圈动量数、内线数、顶点数和外线数分别为 $L$、$I$、$V$ 和 $E$.

我们按 $t=-i tau$ 作 Wick 转动，在 Euclidean 动量下分析紫外行为. 这里要判断的是四维理论需要哪些反项，因此先取四维作幂次计数，实际积分仍用维数正规化计算. 保持外动量和质量不变，将所有独立圈动量同时放大 $rho$ 倍，其中 $rho>0$ 为无量纲参数. 每个圈积分有四个动量分量，测度随之变为

$
  dd(ell_E, [4]) arrow.r rho^4 dd(ell_E, [4]).
$ <eq:chapter-five-loop-measure-scaling>

再看传播子. 内线动量是圈动量与外动量的线性组合，记其中由圈动量组成的部分为 $q_E$. 缩放以后，这一部分变为 $rho q_E$. 在所有内线动量都变大的区域，固定的外动量和质量不影响最高次幂，所以每条标量内线带来的因子按下式变化：

$
  1/(rho^2 q_E^2+m^2)
  tilde.op rho^(-2) 1/q_E^2,
  quad rho arrow.r infinity.
$ <eq:chapter-five-propagator-uv-scaling>

$phi^4$ 顶点不含导数，因而不带来额外的动量因子. 把 $L$ 个测度和 $I$ 个传播子的幂次相加，就得到包含测度在内的总缩放次数，称为*表面发散度*：

$
  omega:=4 L-2 I.
$ <eq:chapter-five-superficial-degree-definition>

为什么这个次数能够判断发散？把全部圈动量看成一个 $4 L$ 维向量，并将它的大小与方向分开，径向测度正比于 $rho^(4 L-1) dd(rho)$. 再乘上传播子的 $rho^(-2 I)$，大动量部分就具有如下径向积分形式：

$
  integral_1^infinity dd(rho) rho^(omega-1).
$ <eq:chapter-five-uv-radial-power-counting>

下限只表示大动量区域的起点. 当 $omega=0$ 时，被积函数为 $1/rho$，产生对数发散；$omega>0$ 时允许幂律发散，例如 $omega=2$ 对应二次发散；$omega<0$ 时，这个径向积分收敛. 在维数正规化中，这些紫外发散表现为 $epsilon$ 的极点. 这里称为“表面”发散度，是因为幂次计数尚未考虑不同项之间的抵消，也没有检查只有部分圈动量变大的情况.

圈数、内线数和顶点数并不独立. 每个四次顶点连接四个线端，一条内线占两个线端，一条外线占一个，因此共有 $4 V=2 I+E$. 另一方面，$V$ 个顶点的动量守恒条件中，一个给出整体外动量守恒，其余 $V-1$ 个用来约束内线动量. 从 $I$ 个内线动量中扣去这些约束，剩下的就是独立圈动量. 因而

$
  4 V & =2 I+E, \
    L & =I-V+1.
$ <eq:chapter-five-graph-counting-identities>

代入表面发散度的定义，得到

$
  omega=4-E.
$ <eq:chapter-five-phi-four-superficial-degree>

这个结果与圈数无关，只取决于外线数. 不过，$omega<0$ 还不能保证整幅图收敛：即使所有圈动量同时变大的区域是收敛的，某一部分圈动量单独变大时仍可能发散. 这就是子图的紫外发散，需要用相应的低阶反项逐级减去.

在减去所有子发散以后，剩余整体发散的形式由局域性和幂次计数限制. 它是外动量的多项式，每增加一阶外动量，大圈动量的幂次便降低一阶，因此多项式的次数至多为 $omega$. 动量的多项式在位置空间中对应有限次导数，所以能够用局域反项抵消. 结合 $omega=4-E$，就可以按外线数判断所需的反项.

二点函数有 $E=2$，因此 $omega=2$. 发散多项式至多为外动量的二次式，而 Lorentz 不变性只允许常数项与 $p^2$ 项. 它们恰好对应质量反项和动能反项，分别由 $delta m^2$ 和 $delta Z$ 抵消. 幂次计数只给出可能出现的最高次数；例如 tadpole 图虽然有 $omega=2$，却不含外动量，因此只需要质量反项.

四点函数有 $E=4$，因此 $omega=0$. 剩余的整体发散与外动量无关，用 $delta lambda$ 就可以抵消. 当 $E>=6$ 时，$omega<0$，减去子发散以后已经没有整体紫外发散，无需加入 $phi^6$ 或更高次相互作用的反项. 至于 $E=0$ 的真空图，它们在归一化关联函数中抵消，不影响这里讨论的散射振幅.

因此，更高阶计算会改变三个反项的系数，却不要求增加新的反项形式. @eq:chapter-five-renormalized-and-counterterm-lagrangians 中的三类反项足以使归一化场关联函数在各阶微扰计算中保持有限，这就是四维 $phi^4$ 理论的微扰可重整化性. 下面回到二点函数，具体说明怎样用 on-shell 条件求出反项系数.

=== 自能与 on-shell 反项

圈图计算直接给出的是自能，而 on-shell 条件规定的是传播子的极点和留数. 我们需要把这些条件改写成自能所满足的等式. 沿用第 4.3 节的符号，定义重整化 1PI 二点函数

$
  Gamma_R^((2)) (p)
  :=-[p^2+m^2+Pi_R (p^2)].
$ <eq:chapter-five-renormalized-self-energy-definition>

其中 $Pi_R$ 包含圈图和反项两部分贡献. 完整传播子于是为

$
  G_R (p)
  =(-i)/(p^2+m^2+Pi_R (p^2)-i 0).
$ <eq:chapter-five-renormalized-full-propagator>

在 $p^2=-m^2$ 处，分母中的 $p^2+m^2$ 已经为零. 要使这里仍是传播子的极点，就必须有

$
  Pi_R (-m^2)=0,
  quad m=m_"phys".
$ <eq:chapter-five-on-shell-pole-mass>

再在极点附近对分母作一阶展开，$p^2+m^2$ 的系数为 $1+Pi'_R (-m^2)$. 它的倒数就是单粒子极点留数 $Z_phi$. 要求留数为一，得到

$
  Z_phi^(-1)=1+Pi'_R (-m^2)=1,
  quad Pi'_R (-m^2)=0.
$ <eq:chapter-five-on-shell-pole-residue>

撇号表示对 $p^2$ 求导. 我们讨论的是稳定粒子，单粒子极点位于连续谱阈值以下，自能在极点附近为实函数. 因而这两个条件可以用来确定实的反项系数.

现在考虑某个给定的微扰阶次. 先把圈图以及所需的低阶反项插入全部算出，将结果记为 $Pi_"loop"$. 其中尚未包含该阶要确定的二点反项. 按 @eq:chapter-five-on-shell-feynman-rules 加上这部分贡献，该阶自能为

$
  Pi_R (p^2)=Pi_"loop" (p^2)+delta Z p^2+delta m^2.
$ <eq:chapter-five-self-energy-counterterm-decomposition>

对上式求导，常数 $delta m^2$ 消失，因此先用留数条件就能求出 $delta Z$. 再令 $p^2=-m^2$，用极点位置条件求出 $delta m^2$，得到

$
    delta Z & =-Pi'_"loop" (-m^2), \
  delta m^2 & =-Pi_"loop" (-m^2)-m^2 Pi'_"loop" (-m^2).
$ <eq:chapter-five-on-shell-two-point-counterterms>

质量反项中的第二项来自 $delta Z p^2$ 在质量壳上的取值. 这与 @eq:chapter-five-bare-renormalized-relations 中的定义一致：$delta m^2$ 是 $Z_"ct" m_0^2-m^2$，其中包含场归一化的改变. 上式使用的是圈积分在质量壳上的完整结果，所以同时确定了反项的发散部分与有限部分. 将两个反项代回，得到

$
  Pi_R (p^2)
  =Pi_"loop" (p^2)-Pi_"loop" (-m^2)
  -(p^2+m^2) Pi'_"loop" (-m^2).
$ <eq:chapter-five-on-shell-subtracted-self-energy>

这里减去的是 $Pi_"loop"$ 在 $p^2=-m^2$ 处 Taylor 展开的常数项和一次项. 令 $p^2=-m^2$，或者先求一次导数再取这一值，都得到零，因而两个 on-shell 条件同时满足. 后续计算得到 $Pi_"loop"$ 后，就可以用此式作减除；仍须在圈图与反项合并以后，才取 $epsilon arrow.r 0$ 的极限.

=== Feynman 图表示

为了把上面的关系用于具体圈图，我们先约定完整传播子、自能插入和反项的图形记号：
#figure(
  two-point-legend(),
  caption: [传播子、自能插入与二点反项的图形记号.],
) <fig:chapter-five-two-point-notation>

直线表示自由传播子 $G_0 (p)=(-i)/(p^2+m^2-i 0)$，其中使用重整化质量 $m$. 斜线填充圆表示完整传播子 $G_R$；灰底“1PI”圆表示重整化自能插入，因子为 $-i Pi_R$. 自能圆两侧的短线只标明连接位置，不包含外线传播子. 要把它插入一条传播线，还需要在两侧各乘一个传播子.

根据上一小节的分解，给定阶次的自能插入可写成

$
  -i Pi_R (p^2)
  =-i Pi_"loop" (p^2)-i [delta Z p^2+delta m^2].
$ <eq:chapter-five-diagram-self-energy-insertion>

其中 $Pi_"loop"$ 包括必要的低阶反项插入. 用白底“1PI”圆表示这一部分，叉号表示该阶二点反项，便得到下图：
#figure(
  self-energy-parts(),
  caption: [重整化自能插入的分解. 灰底圆包含右侧圈图与反项的全部贡献.],
) <fig:chapter-five-self-energy-counterterms>

因此，一次自能插入 $G_0 (-i Pi_R) G_0$ 已经包含圈图和反项两部分，不能在使用灰底圆以后再把同一反项加一次. 多次插入也按照同样的规则展开.

完整传播子还包含由多次自能插入组成的图. 每幅连通二点图都可以沿连接两条外线的桥分开，得到一串由自由传播子连接的 1PI 自能插入. 按插入次数从零次、一次、两次依次相加，就得到 Dyson 级数：

#figure(
  dyson-diagrams(),
  caption: [完整传播子的 Dyson 展开.],
) <fig:chapter-five-dyson-series>

将图中的各个部分换成相应因子，得到

$
  G_R & =G_0+G_0 (-i Pi_R) G_0
        +G_0 (-i Pi_R) G_0 (-i Pi_R) G_0+dots \
      & =G_0+G_0 (-i Pi_R) G_R.
$ <eq:chapter-five-diagram-dyson-equation>

第二行把第一次自能插入之后的全部图重新合成了 $G_R$. 各因子具有相同的外动量，式中省略了这一自变量. 将含有 $G_R$ 的项移到同一边，再用 $G_0^(-1)=i (p^2+m^2-i 0)$，解得

$
  G_R (p)
  =[G_0^(-1) (p)+i Pi_R (p^2)]^(-1)
  =(-i)/(p^2+m^2+Pi_R (p^2)-i 0).
$ <eq:chapter-five-diagram-resummed-propagator>

结果与 @eq:chapter-five-renormalized-full-propagator 相同，因而自能插入的 $-i$ 因子与传播子分母中的符号相符. 计算 $Pi_R$ 时只需列出相应阶次的 1PI 图和反项图；由它们串联而成的图已经由 Dyson 级数计入.

四点顶点也可以作类似的分解. 用斜线填充圆表示完整四点顶点，实心点表示树级顶点，白底“1PI”圆表示圈修正，白底圆内的“×”表示独立的四点反项. 圈修正记为 $i Gamma_"loop"^((4))$，其中包括所需的反项插入图，但不包括单独列出的四点反项顶点. 图中的四条短线只表示截肢顶点的连接位置，不包含外线传播子.

#figure(
  four-point-panels(),
  caption: [完整四点顶点分解为树级顶点、1PI 圈修正和四点反项.],
) <fig:chapter-five-four-point-corrections>

图中省略了动量标记. 记四个流入动量为 $k_1,k_2,k_3,k_4$，满足 $sum_(j=1)^4 k_j=0$，则上图表示
$
  i Gamma_R^((4)) (k_1,k_2,k_3,k_4) & =-i mu^(2 epsilon) lambda
                                      +i Gamma_"loop"^((4)) (k_1,k_2,k_3,k_4) \
                                    & quad -i mu^(2 epsilon) delta lambda.
$ <eq:chapter-five-four-point-diagram-expansion>

在这里未破缺的 $phi arrow.r -phi$ 对称性下，三点顶点为零. 因而把四个外动量取到质量壳上后，利用单位极点留数，便可由这个四点顶点得到两粒子散射振幅. 耦合常数的 on-shell 条件要求圈修正与四点反项在阈值处相互抵消. 我们将在计算四点函数时使用这一条件；接下来先从 tadpole 图求出最低阶自能和质量反项.

== 单圈自能

我们先计算最简单的自能图：只有一个四次顶点的 tadpole 图. 它的贡献为 $O(lambda)$，圈内动量与外动量无关. 因而只要算出一个依赖质量的积分，就能用上一节的 on-shell 条件确定最低阶质量反项. 下面先通过 Wick 转动把积分转到 Euclidean 空间，再用 Schwinger 参数求出它在四维附近的展开.

=== 维数正规化

按照 @eq:chapter-five-on-shell-feynman-rules，单圈自能插入为

$
  -i Pi_"1-loop" (p^2) & = #image("/fig/feynman/1pi_self.svg", width: 32mm) \
                       & =(-i mu^(2 epsilon) lambda)/2
                         integral (dd(ell, [d]))/((2 pi)^d)
                         (-i)/(ell^2+m^2-i 0).
$ <eq:chapter-five-tadpole-integral>

因子 $1/2$ 来自图的对称因子：交换圈的两个线端不会改变这幅图. 外动量 $p$ 从顶点流入后直接流出，因此圈内传播子只含 $ell$，积分结果不依赖 $p^2$. 记

$
  I_d (m^2):=(-i) integral (dd(ell, [d]))/((2 pi)^d)
  1/(ell^2+m^2-i 0),
  quad Pi_"1-loop"=(lambda mu^(2 epsilon))/2 I_d (m^2).
$ <eq:chapter-five-tadpole-scalar-integral>

先考察能量变量 $tensor(ell, +0)$ 的积分路径. 由 mostly-plus 度规，分母为 $-(tensor(ell, +0))^2+bold(ell)^2+m^2-i 0$，它的两个极点位于

$
  tensor(ell, +0)=omega_ell-i 0,
  quad tensor(ell, +0)=-omega_ell+i 0,
  quad omega_ell=sqrt(bold(ell)^2+m^2).
$ <eq:chapter-five-tadpole-energy-poles>

正能极点在实轴下方，负能极点在实轴上方. 因此可以把正实半轴逆时针转到正虚半轴，同时把负实半轴转到负虚半轴，路径不穿过极点. 在固定空间动量时，被积函数在大能量处按能量的负二次方衰减，无穷远圆弧的贡献为零. 令

$
  tensor(ell, +0)=i tensor(ell_E, +0),
  quad dd(tensor(ell, +0))=i dd(tensor(ell_E, +0)),
  quad ell_E^2=(tensor(ell_E, +0))^2+bold(ell)^2.
$ <eq:chapter-five-tadpole-wick-rotation>

这个动量变换与 $t=-i tau$ 相配合. 测度中的 $i$ 抵消 $I_d$ 定义中的 $-i$，所以

$
  I_d (m^2)=integral (dd(ell_E, [d]))/((2 pi)^d)
  1/(ell_E^2+m^2).
$ <eq:chapter-five-tadpole-euclidean-integral>

由于 $m^2>0$，Euclidean 分母处处为正，这里可以去掉 $i 0$. 但大动量处的发散仍然存在，Wick 转动没有把紫外发散消去. 为计算这个积分，我们引入 Schwinger 参数 $alpha$：

$
  1/(ell_E^2+m^2)=integral_0^infinity dd(alpha)
  e^(-alpha (ell_E^2+m^2)).
$ <eq:chapter-five-tadpole-schwinger-parameter>

先在 $0<op("Re") d<2$ 的收敛范围内交换积分次序. 动量积分成为 Gauss 积分，给出

$
  I_d (m^2) & =integral_0^infinity dd(alpha) e^(-alpha m^2)
              integral (dd(ell_E, [d]))/((2 pi)^d) e^(-alpha ell_E^2) \
            & =1/(4 pi)^(d/2) integral_0^infinity dd(alpha)
              alpha^(-d/2) e^(-alpha m^2) \
            & =((m^2)^(d/2-1))/(4 pi)^(d/2) Gamma(1-d/2).
$ <eq:chapter-five-tadpole-gamma-integral>

第二步用到了 $integral dd(ell_E, [d]) e^(-alpha ell_E^2)=(pi/alpha)^(d/2)$；最后一步令 $u=alpha m^2$，把参数积分化为 Gamma 函数. 右边给出了积分关于 $d$ 的解析延拓，因此可以用它研究 $d=4-2 epsilon$ 附近的行为. 这里不能把四维附近的原积分当作收敛积分直接计算.

把顶点中的 $mu^(2 epsilon)$ 一并保留，可将结果写为

$
  mu^(2 epsilon) I_d (m^2)
  =m^2/(16 pi^2)
  ((4 pi mu^2)/(m^2))^epsilon Gamma(epsilon-1).
$ <eq:chapter-five-tadpole-regulated-expression>

现在展开的是无量纲比值的幂. 用 Euler 常数 $gamma_E$ 表示 Gamma 函数展开中的常数，有

$
             Gamma(epsilon-1) & =-1/epsilon+gamma_E-1+O(epsilon), \
  ((4 pi mu^2)/(m^2))^epsilon & =1+epsilon ln ((4 pi mu^2)/(m^2))+O(epsilon^2).
$ <eq:chapter-five-tadpole-laurent-factors>

第二行的一次项乘上第一行的极点，会留下有限的对数项. 将它们相乘，再乘以 $lambda/2$，得到

$
  Pi_"1-loop" (p^2)
  = (lambda m^2)/(32 pi^2)
  [-1/epsilon+gamma_E-1+ln ((m^2)/(4 pi mu^2))]
  +O(epsilon lambda).
$ <eq:chapter-five-tadpole-self-energy-result>

结果的质量量纲为二，与传播子分母中的 $m^2$ 相同. 发散由 $1/epsilon$ 极点表示，有限部分包含常数项和质量与辅助尺度之比的对数. 解析延拓后的 $I_d$ 在四维附近不再具有正积分的意义，因此它的负极点系数与 Euclidean 被积函数为正并不矛盾.

=== 抵消项

单圈自能与 $p^2$ 无关，因而其导数为零. 将它代入 @eq:chapter-five-on-shell-two-point-counterterms，得到这一阶的场反项和质量反项：

$
    delta Z_((1)) & =0, \
  delta m^2_((1)) & =-Pi_"1-loop"
                    = (lambda m^2)/(32 pi^2)
                    [1/epsilon-gamma_E+1-ln ((m^2)/(4 pi mu^2))]
                    +O(epsilon lambda).
$ <eq:chapter-five-tadpole-onshell-counterterms>

下标 $(1)$ 表示单圈阶的贡献. 质量反项抵消整个 tadpole 自能，包括有限部分，所以在保留正规化时就有

$
  Pi_R^((1)) (p^2)=Pi_"1-loop"+delta m^2_((1))=0.
$ <eq:chapter-five-tadpole-renormalized-zero>

这个等式对任意外动量成立. 因此在单圈阶，重整化传播子保持自由传播子的形式，极点质量为 $m$，留数为一. 两圈自能开始依赖外动量，届时质量壳上的减除只会消去 Taylor 展开的常数项和一次项，不能消去全部自能.

单圈自能被抵消，并不意味着相互作用没有圈修正. 四点函数的单圈图依赖外动量，耦合常数反项只能在选定的阈值处固定其值. 下面就计算这一修正.

== 四点关联函数

上一节固定了传播子的极点和留数，耦合常数反项 $delta lambda$ 还没有确定. 我们用两粒子散射的阈值振幅定义 $lambda$，因此需要计算四点函数. 先从连通四点函数中分出外线传播子，再计算其中的单圈顶点修正，最后要求阈值处的振幅仍等于 $-lambda$. 离开阈值以后留下的动量依赖，就是这一阶对散射的预言.

=== 连通函数与四点顶点

完整四点函数含有三个由二点函数相乘得到的非连通项. 它们对应粒子各自传播，计算散射时需要取出连通部分. 由于真空保持 $phi arrow.r -phi$ 对称性，三点顶点为零，@eq:connected-four-point-from-proper-vertices 中的 1PR 项随之消失. 因而动量空间中的重整化连通四点函数可写为

$
  tilde(G)_(R,c)^((4)) (k_1,k_2,k_3,k_4) & =(2 pi)^d delta^((d)) (sum_(j=1)^4 k_j) \
                                         & quad times [product_(j=1)^4 G_R (k_j)]
                                           i Gamma_R^((4)) (k_1,k_2,k_3,k_4).
$ <eq:chapter-five-connected-four-point-reconstruction>

这里四个动量全部流入，$Gamma_R^((4))$ 已去掉整体动量守恒 delta 函数. 四个 $G_R$ 描述外部传播，$i Gamma_R^((4))$ 描述截肢后的相互作用. 上式首先是离壳关联函数的关系；只有把外动量取到物理质量壳上，才能借助 LSZ 公式读出散射振幅. 在 $Z_phi=1$ 的归一化下，四维极限中的振幅为

$
  cal(M) (s,t,u)
  =lim_(epsilon arrow.r 0)
  Gamma_R^((4)) (k_1,k_2,k_3,k_4)|_(k_j^2=-m^2).
$ <eq:chapter-five-four-point-to-amplitude>

对于 $p_1+p_2 arrow.r p_3+p_4$，取 $k_1=p_1$、$k_2=p_2$、$k_3=-p_3$、$k_4=-p_4$. 三个通道的动量与 Mandelstam 变量满足

$
  P_s=k_1+k_2, & quad s=-P_s^2, \
  P_t=k_1+k_3, & quad t=-P_t^2, \
  P_u=k_1+k_4, & quad u=-P_u^2.
$ <eq:chapter-five-four-point-channel-invariants>

这些组合也可以用于离壳顶点. 只有外粒子均在质量壳上时，才有 $s+t+u=4 m^2$.

=== 单圈图与共同的圈积分

树级顶点为 $-i mu^(2 epsilon) lambda$. 在 $O(lambda^2)$ 阶，两个四次顶点之间可以连接两条内线，余下四条线作为外线. 将四个外动量分成两对，只有三种不等价的配对，分别给出 $s$、$t$、$u$ 通道的 fish 图：

#figure(
  fish-channels(),
  caption: [四点顶点的三个单圈 fish 图. 所有 $k_j$ 均取流入，外部短线不包含传播子. 三幅图采用相同画法，以外动量的配对区分通道.],
) <fig:chapter-five-four-point-fish-channels>

每幅图交换两条内线以后保持不变，因此都有对称因子 $1/2$. 它们的积分形式相同，只是流经两个顶点的总动量不同. 记 $chi=-P^2$，定义共同的圈积分

$
  B_d (chi):=(-i) mu^(2 epsilon)
  integral (dd(ell, [d]))/((2 pi)^d)
  1/[(ell^2+m^2-i 0)((ell+P)^2+m^2-i 0)].
$ <eq:chapter-five-bubble-definition>

其中 $mu^(2 epsilon)$ 使 $B_d$ 无量纲. 两个顶点和两条传播子各自带有 $-i$ 因子，四个因子的乘积为一. 因而单个通道的图因子是 $i mu^(2 epsilon) (lambda^2)/2 B_d (chi)$. 加上三个通道和四点反项，得到

$
  i Gamma_R^((4))
  =i mu^(2 epsilon) { -lambda-delta lambda_((2))
    +lambda^2/2 [B_d (s)+B_d (t)+B_d (u)] }
  +O(lambda^3).
$ <eq:chapter-five-four-point-one-loop-sum>

这里 $delta lambda_((2))$ 表示 $O(lambda^2)$ 的耦合常数反项. 在 fish 图的内线上插入最低阶质量反项会再增加一阶 $lambda$，因此不属于当前阶次. 外线修正则已包含在 @eq:chapter-five-connected-four-point-reconstruction 的 $G_R$ 中；上一节算出的单圈自能与质量反项恰好相消.

=== Feynman 参数与积分结果

要计算 $B_d$，先用 Feynman 参数合并两个分母：

$
  1/(A B)=integral_0^1 dd(x) 1/[(1-x) A+x B]^2.
$ <eq:chapter-five-feynman-two-denominators>

这个恒等式可直接对右侧积分验证；两个分母采用同一 Feynman 处方. 取 $A=ell^2+m^2-i 0$、$B=(ell+P)^2+m^2-i 0$，完成平方，得到

$
    (1-x) A+x B & =(ell+x P)^2+Delta_x (chi)-i 0, \
  Delta_x (chi) & :=m^2-x(1-x) chi.
$ <eq:chapter-five-bubble-completed-square>

令 $q=ell+x P$. 维数正规化允许这样的积分变量平移，测度不变. 先取 $chi<4 m^2$，此时对所有 $x in [0,1]$ 都有 $Delta_x>0$，可以像上一节一样作 Wick 转动. 测度中的 $i$ 与定义中的 $-i$ 抵消，得到

$
  B_d (chi)=mu^(2 epsilon) integral_0^1 dd(x)
  integral (dd(q_E, [d]))/((2 pi)^d)
  1/[q_E^2+Delta_x (chi)]^2.
$ <eq:chapter-five-bubble-euclidean>

这个积分与 tadpole 积分只差分母的幂次. 用 $1/C^2=integral_0^infinity dd(alpha) alpha e^(-alpha C)$，先作 Gauss 积分，再作参数积分，可得

$
  integral (dd(q_E, [d]))/((2 pi)^d) 1/(q_E^2+Delta)^2
  =1/(4 pi)^(d/2) integral_0^infinity dd(alpha)
  alpha^(1-d/2) e^(-alpha Delta)
  =(Gamma(2-d/2))/(4 pi)^(d/2) Delta^(d/2-2).
$ <eq:chapter-five-bubble-gamma-integral>

上式先在 $0<op("Re") d<4$、$Delta>0$ 时成立，再作解析延拓. 对一般运动学，需要恢复 $Delta_x-i 0$，使越过阈值时的分支仍由 Feynman 处方确定. 因而

$
  B_d (chi)= (mu^(2 epsilon) Gamma(epsilon))/(4 pi)^(2-epsilon)
  integral_0^1 dd(x) [m^2-x(1-x) chi-i 0]^(-epsilon).
$ <eq:chapter-five-bubble-regulated>

利用 $Gamma(epsilon)=1/epsilon-gamma_E+O(epsilon)$ 展开，得到

$
  B_d (chi)=1/(16 pi^2) { C_epsilon
    -integral_0^1 dd(x) ln ((m^2-x(1-x) chi-i 0)/(mu^2)) }
  +O(epsilon),
  quad C_epsilon:=1/epsilon-gamma_E+ln (4 pi).
$ <eq:chapter-five-bubble-laurent>

发散项与 $chi$ 无关，与上一节四点函数的幂次计数一致. $C_epsilon$ 只是这里用来缩短公式的记号，并未改变重整化方案. 为分开辅助尺度与外动量的依赖，我们再定义有限函数

$
  F (z):=-integral_0^1 dd(x) ln [1-z x(1-x)-i 0],
  quad z=chi/m^2.
$ <eq:chapter-five-bubble-finite-function>

于是圈积分化为

$
  B_d (chi)=1/(16 pi^2)
  [C_epsilon-ln ((m^2)/(mu^2))+F (chi/m^2)]+O(epsilon).
$ <eq:chapter-five-bubble-finite-decomposition>

所有动量依赖都放在 $F$ 中. 先保留这个参数积分形式，就足以确定反项并求出重整化顶点.

=== 阈值条件与耦合常数反项

on-shell 条件要求阈值处的振幅为 $-lambda$. 将 $s=4 m^2$、$t=u=0$ 代入 @eq:chapter-five-four-point-one-loop-sum，要求圈修正与反项抵消，便有

$
  delta lambda_((2))=lambda^2/2 [B_d (4 m^2)+2 B_d (0)].
$ <eq:chapter-five-coupling-counterterm-regulated>

这里把阈值条件延拓到保留正规化的表达式上；取四维极限后便恢复所需的物理条件. 因为 $F (0)=0$，只需再求 $F (4)$. 利用 $1-4 x(1-x)=(2 x-1)^2$，得到

$
  F (4)=-integral_0^1 dd(x) ln (2 x-1)^2
  =-2 integral_0^1 dd(y) ln y=2.
$ <eq:chapter-five-bubble-threshold-value>

第二步利用 $x=1/2$ 两侧的对称性，并令 $y=abs(2 x-1)$. 虽然被积函数在 $x=1/2$ 处有对数奇点，积分仍然有限，阈值处的虚部也为零. 因而耦合常数反项为

$
  delta lambda_((2))=(lambda^2)/(32 pi^2)
  [3 C_epsilon-3 ln ((m^2)/(mu^2))+2]+O(epsilon lambda^2).
$ <eq:chapter-five-onshell-coupling-counterterm>

三个通道各贡献一个相同的紫外极点，给出括号中的 $3 C_epsilon$. 常数 $2$ 来自阈值处的 $s$ 通道，它与有限对数项一起由 on-shell 条件固定.

把反项代回，并在各项相加后取 $epsilon arrow.r 0$，得到有限的四点顶点：

$
  Gamma_R^((4)) (s,t,u)
  =-lambda+(lambda^2)/(32 pi^2)
  [F (s/m^2)+F (t/m^2)+F (u/m^2)-2]+O(lambda^3).
$ <eq:chapter-five-renormalized-four-point-result>

紫外极点和 $mu$ 依赖都已抵消. 上式也给出了本阶离壳顶点，只是离壳时不要求 $s+t+u=4 m^2$. 把它与四个完整传播子相乘，就得到 @eq:chapter-five-connected-four-point-reconstruction 中的连通四点函数；把外粒子取到质量壳上，则得到散射振幅 $cal(M)$.

代入阈值，方括号为 $2+0+0-2=0$，因此恢复 $cal(M) (4 m^2,0,0)=-lambda$. 交换三个通道也不会改变结果，符合相同实标量粒子的交叉对称性. 与 tadpole 自能不同，四点圈积分依赖动量，常数反项只在选定的归一化点抵消圈修正，其他位置仍留下有限贡献.

=== 物理区域与散射振幅

参数积分已经给出完整的单圈结果. 为看清散射阈值与虚部，我们进一步计算 $F (z)$. 令 $y=2 x-1$，利用被积函数的对称性，得到

$
  F (z)=-integral_0^1 dd(y)
  ln [1-z/4+(z/4) y^2-i 0].
$ <eq:chapter-five-bubble-symmetric-parameter>

在 $0<z<4$ 时，分母组合始终为正. 令 $a=sqrt(4/z-1)$，对上式分部积分，就有

$
  F (z)=2-2 a arctan (1/a),
  quad 0<z<4.
$ <eq:chapter-five-bubble-below-threshold>

它在 $z arrow.r 0$ 时趋于零，在 $z arrow.r 4$ 时趋于二，与刚才直接求得的两个值一致. 类空通道对应 $z<0$，同一积分给出实函数

$
  F (z)=2-r ln ((r+1)/(r-1)),
  quad r=sqrt(1-4/z)>1,
  quad z<0.
$ <eq:chapter-five-bubble-spacelike>

物理散射中的 $s$ 通道满足 $z=s/m^2>4$. 此时 $1-z x(1-x)$ 在一个有限区间内为负，不能去掉 $i 0$. 对数从负实轴下方取值，因而

$
  ln (-a-i 0)=ln a-i pi,
  quad a>0.
$ <eq:chapter-five-bubble-log-prescription>

记 $beta=sqrt(1-4/z)$，负值区间为 $(1-beta)/2<x<(1+beta)/2$，长度为 $beta$. 因此 $F$ 的虚部为 $pi beta$，完整结果为

$
  F (z)=2-beta ln ((1+beta)/(1-beta))+i pi beta,
  quad beta=sqrt(1-4/z),
  quad z>4.
$ <eq:chapter-five-bubble-above-threshold>

在等质量两体散射的质心系中，$s>4 m^2$，而

$
  t=-(s-4 m^2)/2 (1-cos theta),
  quad u=-(s-4 m^2)/2 (1+cos theta).
$ <eq:chapter-five-scattering-physical-region>

因此 $t$、$u$ 通道使用类空表达式，只有 $s$ 通道产生虚部. 由 @eq:chapter-five-renormalized-four-point-result 得到

$
  op("Im") cal(M) (s,t,u)
  =(lambda^2)/(32 pi) sqrt(1-(4 m^2)/s)+O(lambda^3).
$ <eq:chapter-five-amplitude-absorptive-part>

这个虚部对应圈中的两个粒子可以同时在壳传播. 还可以用光学定理检查它的归一化. 树级振幅为 $-lambda$，计入全同末态的 $1/2!$，总截面为 $sigma_"LO"=lambda^2/(32 pi s)$. 令质心系入射三动量大小为 $q=sqrt(s-4 m^2)/2$，则

$
  2 q sqrt(s) sigma_"LO"
  =(lambda^2)/(32 pi) sqrt(1-(4 m^2)/s)
  =op("Im") cal(M)_"1-loop" (s,0,4 m^2-s).
$ <eq:chapter-five-optical-theorem-check>

这与前向散射的光学定理相符，也检查了圈图的对称因子与对数分支.

最后，用所得振幅计算截面时，应当保持微扰阶数一致. 写成 $cal(M)=-lambda+cal(M)_"1-loop"+O(lambda^3)$，其中 $cal(M)_"1-loop"=O(lambda^2)$，则

$
  abs(cal(M))^2=lambda^2-2 lambda op("Re") cal(M)_"1-loop"
  +O(lambda^4).
$ <eq:chapter-five-amplitude-squared-nlo>

严格的次领头阶截面保留到 $O(lambda^3)$；单圈振幅模方属于 $O(lambda^4)$，与树级振幅和两圈振幅的干涉同阶，不能只保留前者就称为完整的下一阶结果. 对全立体角积分并计入全同末态，得到

$
  sigma_"NLO" (s)=1/(64 pi s) integral_(-1)^1 dd(cos theta)
  [lambda^2-2 lambda op("Re") cal(M)_"1-loop" (s,t,u)]
  +O(lambda^4).
$ <eq:chapter-five-cross-section-nlo>

其中 $t$ 和 $u$ 由 @eq:chapter-five-scattering-physical-region 给出. 阈值处的圈修正为零，截面趋于树级结果；离开阈值以后，有限的圈修正随能量和角度改变. 至此，质量和耦合常数都已由物理条件固定，单圈阶的二点与四点计算使用的是同一组反项.

== 重整化群方程(RGE)

== 习题

#include "../../problems/ch5.typ"
