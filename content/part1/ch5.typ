#import "../../lib.typ": *

= 零温 $phi^4$ 理论

第 4 章中，我们从关联函数的单粒子极点确定质量和外线归一化，再通过 LSZ 公式求散射振幅. 这也提示我们：粒子的质量由完整传播子决定，不能在计入圈修正后仍直接把它等同于裸 Lagrangian 中的质量参数. 耦合常数与散射振幅之间同样存在量子修正. 本章以具有未破缺 $phi arrow.r -phi$ 对称性的有质量实标量场为例，研究如何用物理质量和散射振幅确定理论的参数，并以这些参数组织微扰展开.

圈积分包含任意大的内部动量，裸参数与物理量之间的关系因而可能出现紫外发散. 我们先引入正规化，使这一关系有明确的数学意义；随后固定物理质量和选定的散射振幅，让裸参数随正规化相应改变. 把裸理论改写成这些有限参数与重整化场的形式时，便会出现反项（counterterm）. 它们记录裸量与重整化量之间的差别，使我们能够直接围绕给定的物理条件计算圈修正.

我们采用维数正规化处理圈积分，并用 on-shell 条件确定反项：令重整化质量 $m$ 等于粒子的极点质量，将重整化场的单粒子极点留数归一为一，再用两粒子散射在阈值处的振幅定义耦合常数 $lambda$. 这样，微扰展开中的参数便有了明确的物理含义. 我们先把二点函数算到 $O(lambda^2)$，确定质量反项与场反项，再转向四点函数及散射振幅.

这一顺序也反映了 $phi^4$ 理论的微扰结构. 一圈 tadpole 图与外动量无关，只需要质量反项；两圈自能开始依赖外动量，我们才需要调整场的归一化. 四点函数在一圈就需要耦合常数反项. 沿着这条线索，我们可以逐步看清圈图如何改变传播和散射，以及这些修正如何与给定的物理归一化条件相容.

== 维数正规化与 on-shell 重整化

要把上述想法变成可用的计算方法，我们需要回答两个问题：如何用重整化量重写裸 Lagrangian，以及这种重写为什么足以消去圈图的紫外发散. 我们先用维数正规化定义圈积分，再从裸量与重整化量的关系得到反项，并用 on-shell 条件确定其系数. 随后的幂次计数将说明，减去子发散后，剩余发散恰好具有这些局域反项所允许的形式. 只有同一组反项能使各个关联函数同时有限，重整化才保留了理论的预言能力.

=== 维数正规化下的裸理论

维数正规化将把圈积分视为时空维数 $d$ 的解析函数. 我们在四维附近记

$
  d=4-2 epsilon,
  quad epsilon>0,
$ <eq:chapter-five-dimension-convention>

并从裸 Minkowski Lagrangian 出发：

$
  cal(L)_0
  =-1/2 tensor(partial, +mu) phi_0 tensor(partial, -mu) phi_0
  -1/2 m_0^2 phi_0^2
  -lambda_0/(4!) phi_0^4.
$ <eq:chapter-five-bare-phi-four-lagrangian>

这里沿用全书的 mostly-plus 度规，有质量粒子的质量壳满足 $p^2=-m^2$，Fourier 变换约定与第 2 章相同. 圈积分延拓到 $d$ 维时，仍保留第 4 章的 Feynman $i 0$ 处方.

在自然单位制下，作用量无量纲，因此 $cal(L)_0$ 的质量量纲为 $d$. 我们用方括号表示质量量纲，由动能项、质量项和四次相互作用项依次得到

$
  [phi_0]=(d-2)/2=1-epsilon,
  quad
  [m_0]=1,
  quad
  [lambda_0]=4-d=2 epsilon.
$ <eq:chapter-five-bare-mass-dimensions>

偏离四维后，裸耦合常数带有 $2 epsilon$ 次质量量纲. 为使重整化耦合常数仍然无量纲，我们引入任意的质量尺度 $mu$，用 $mu^(2 epsilon)$ 补足量纲. 这里的 $mu$ 是正规化所需的辅助尺度；当我们固定极点质量与阈值散射振幅后，四维极限中的物理结果应与它无关.

=== 重整化变量与反项

我们先保留正规化，并把物理质量与选定的散射振幅作为输入. 即使圈积分完全有限，自能也会移动传播子的极点，使裸质量一般不同于物理质量. 如果我们希望自由传播子中的 $m$ 就是粒子的物理质量，就要重新表达裸质量，并把相应的差额计入微扰. 耦合常数和场的归一化也作同样处理. 因此，即使没有紫外发散，我们仍可引入反项，用它们把微扰展开改写成围绕物理参数的形式.

我们也可以始终用裸参数计算，最后再把结果换成物理量. 在给定的正规化下，这与引入反项的写法等价；反项的便利在于，自由传播子和最低阶顶点从一开始就使用我们选定的重整化参数.

当裸参数与物理量之间的关系含有紫外发散时，我们固定物理输入，让裸参数随正规化相应改变. 在维数正规化中，所谓发散反项，是指这种参数关系的微扰系数在 $epsilon arrow.r 0$ 时含有极点. 我们始终先合并正规化后的圈图和反项，再对所求的重整化量取这一极限. 裸 Lagrangian 虽然不直接是可观测量，却决定着场的动力学，其形式仍受局域性和对称性约束；不能仅凭裸参数不直接可测，就任意向其中加入无穷大.

为具体实现这种改写，我们定义重整化场 $phi$、质量 $m$ 和耦合常数 $lambda$，使它们与裸量满足

$
              phi_0 & =sqrt(Z_"ct") phi, \
       Z_"ct" m_0^2 & =m^2+delta m^2, \
  Z_"ct"^2 lambda_0 & =mu^(2 epsilon) (lambda+delta lambda), \
            delta Z & :=Z_"ct"-1.
$ <eq:chapter-five-bare-renormalized-relations>

其中 $m$ 和 $lambda$ 将由下面的 on-shell 条件确定，反项则保留对正规化参数 $epsilon$ 和辅助尺度 $mu$ 的依赖. 在给定的正规化下，这些关系只是同一个裸理论的变量替换. 我们将它们代回裸 Lagrangian，得到

$
  cal(L)_0=cal(L)_"ren"+cal(L)_"ct",
$ <eq:chapter-five-lagrangian-splitting>

其中重整化部分具有标准的动能项，其余部分归入局域反项：

$
  cal(L)_"ren" & =-1/2 tensor(partial, +mu) phi tensor(partial, -mu) phi
                 -1/2 m^2 phi^2
                 -(mu^(2 epsilon) lambda)/(4!) phi^4, \
   cal(L)_"ct" & =-1/2 delta Z
                 tensor(partial, +mu) phi tensor(partial, -mu) phi
                 -1/2 delta m^2 phi^2
                 -(mu^(2 epsilon) delta lambda)/(4!) phi^4.
$ <eq:chapter-five-renormalized-and-counterterm-lagrangians>

反项的结构因此来自原有的动能项、质量项和四次相互作用项. 圈图计算告诉我们裸量与重整化量的具体关系，重整化条件则逐阶固定其中的反项系数. 同一个系数必须用于所有包含相应顶点的图，不能为不同过程分别调整. 真正需要检验的是：这有限种参数和场的重新定义，是否足以使各个关联函数同时有限. 后面的幂次计数将说明本理论为何满足这一要求. 一旦我们固定质量、场归一化和阈值振幅，其他运动学位置的散射振幅便由理论决定.

@eq:chapter-five-bare-renormalized-relations 中的 $Z_"ct"$ 联系裸场与重整化场；第 4 章的 $Z_phi$ 则表示所选场的完整传播子在单粒子极点处的留数. 我们将在 on-shell 方案中选择 $Z_"ct"$，使重整化场的 $Z_phi=1$. 因而即使留数已经归一，$Z_"ct"$ 本身仍可含有非零的微扰修正.

=== on-shell 重整化条件

我们希望重整化 Lagrangian 中的 $m$ 直接表示稳定粒子的质量，并使场具有单位极点留数. 记重整化场的完整传播子为 $G_R$，这两个要求可以合写为极点附近的形式

$
  G_R (p)
  =(-i)/(p^2+m^2-i 0)+"正则项",
  quad p^2 arrow.r -m^2.
$ <eq:chapter-five-on-shell-normalization>

这里的正则项在 $p^2=-m^2$ 附近有限. 我们选取质量反项使极点保持在这一位置，再选取场反项使极点系数保持为 $-i$. 这些要求逐阶施加，因此反项既要抵消紫外发散，也要抵消圈图在极点位置和留数上产生的有限修正.

质量和场的归一化还不能确定四次耦合. 我们沿用第 4 章的 Mandelstam 变量，以两粒子散射的阈值作为归一化点，要求四维极限中的不变振幅满足

$
  cal(M) (s=4 m^2,t=0,u=0)=-lambda.
$ <eq:chapter-five-on-shell-coupling-condition>

所有外粒子均在质量壳上，阈值对应质心系中相对三动量趋于零的极限. 上式的负号与树级四次顶点 $-i lambda$ 一致. 我们用这一条件确定 $delta lambda$ 的有限部分；离开阈值后，圈图仍会产生非平凡的能量和角度依赖.

从最低阶圈图的结构，我们可以预期三个反项分别始于

$
  delta m^2=O(lambda),
  quad
  delta lambda=O(lambda^2),
  quad
  delta Z=O(lambda^2).
$ <eq:chapter-five-counterterm-leading-orders>

一圈 tadpole 图与外动量无关，因此它的贡献可由质量反项抵消，一圈无需场反项. 两圈自能的动量依赖使 $delta Z$ 始于 $O(lambda^2)$；四点函数的一圈图含有两个四次顶点，故 $delta lambda$ 也始于 $O(lambda^2)$. 后续计算将给出这些反项的具体系数.

=== 动量空间 Feynman 规则

我们以 $cal(L)_"ren"$ 的二次部分定义自由传播子，将四次相互作用和 $cal(L)_"ct"$ 都作为微扰顶点. 沿用第 4.7 节所有顶点动量均取流入的约定，可得

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

对场求导产生的组合因子已抵消 Lagrangian 中的 $1/2$ 和 $1/(4!)$，顶点因子中无需再乘这些系数. 每幅图仍须按第 4.7.4 节的方法计入对称因子. 反项顶点的组合计数与普通局域顶点相同，图上的叉号仅用来标明反项插入.

反项顶点的微扰阶数由其系数决定，最低阶见 @eq:chapter-five-counterterm-leading-orders. 因而在给定的 $lambda$ 阶次，除了普通顶点构成的圈图，还要计入总阶数相同的反项插入图. 高圈图中若含有发散的低阶子图，相应的低阶反项插入先抵消子发散，再由该阶的新反项消去剩余的整体发散.

从重整化 Green 函数求散射振幅时，我们仍须按 LSZ 公式截去外线传播子. 由于 on-shell 条件已将重整化场的留数固定为 $Z_phi=1$，相应的标量外线留数因子等于一. 圈修正对场归一化的影响已计入 $delta Z$，因此仍要保留这一反项所产生的贡献.

=== 幂次计数与可重整化性

上述三类反项是否足以消去任意阶的紫外发散？我们先判断一幅图在大圈动量区域可能怎样发散，再据此确定它需要什么形式的局域反项. 考虑由普通四次顶点构成、已截去外线传播子的连通 1PI 圈图，记独立圈动量数、内线数、顶点数和外线数分别为 $L$、$I$、$V$ 和 $E$. 我们固定外动量和质量，只考察内部动量变大的极限.

为避开 Minkowski 传播子的质量壳奇点，我们按 $t=-i tau$ 作 Wick 转动，在 Euclidean 动量下计数紫外幂次. 实际计算仍采用维数正规化；这里取四维，是为了判断四维理论需要哪些反项. 令所有独立圈动量同时放大 $rho$ 倍，其中 $rho$ 为无量纲的正数. 对每个圈积分，四个动量分量各带来一个 $rho$，因此测度变为

$
  dd(ell_E, [4]) arrow.r rho^4 dd(ell_E, [4]).
$ <eq:chapter-five-loop-measure-scaling>

内线动量是圈动量与外动量的线性组合. 我们把其中由圈动量组成的部分记为 $q_E$；在共同缩放后，这一部分变为 $rho q_E$，外动量仍保持不变. 在所有内部动量都变大的区域，固定的外动量不影响最高次幂，每个 Euclidean 标量传播子因而具有如下大动量行为：

$
  1/(rho^2 q_E^2+m^2)
  tilde.op rho^(-2) 1/q_E^2,
  quad rho arrow.r infinity.
$ <eq:chapter-five-propagator-uv-scaling>

普通 $phi^4$ 顶点不含导数，不再带来动量因子. 因此，$L$ 个积分测度给出 $rho^(4 L)$，$I$ 条内线给出 $rho^(-2 I)$. 我们把包含积分测度在内的总缩放次数称为这幅图的*表面发散度*，记作 $omega$：

$
  omega:=4 L-2 I.
$ <eq:chapter-five-superficial-degree-definition>

这个次数与发散的关系可以用径向积分看清. 在 $4 L$ 维圈动量空间中，把共同的动量大小与相对方向分开，前者在大动量区域的幂次为

$
  integral_1^infinity dd(rho) rho^(omega-1).
$ <eq:chapter-five-uv-radial-power-counting>

这里的下限只标记大动量区域的起点. 当 $omega=0$ 时，我们得到 $integral dd(rho)/rho$ 型的对数发散；当 $omega>0$ 时，幂次计数允许幂律发散，例如 $omega=2$ 对应二次发散；当 $omega<0$ 时，这个共同缩放区域收敛. 这些结论描述大动量幂次，具体发散在维数正规化中表现为 $epsilon$ 的极点. “表面”二字提醒我们，这一判断尚未检查只有部分圈动量变大的区域，也没有计入不同项之间可能的抵消.

接下来，我们用图的拓扑关系消去 $L$ 和 $I$. 每个四次顶点连接四个线端，一条内线占两个线端，一条外线占一个，因此 $4 V=2 I+E$. 连通图的 $V$ 个顶点给出 $V-1$ 个独立的内部动量守恒约束，余下的一个条件是整体外动量守恒；从 $I$ 个内线动量中扣去这些约束，便有 $L=I-V+1$. 两个关系合写为

$
  4 V & =2 I+E, \
    L & =I-V+1.
$ <eq:chapter-five-graph-counting-identities>

代入表面发散度的定义，得到

$
  omega=4-E.
$ <eq:chapter-five-phi-four-superficial-degree>

这一结果只取决于外线数，而与圈数无关。但表面发散度  $omega$  只描述整幅图的整体紫外行为；即使 $omega < 0$ ，图中仍可能存在发散子图，因为某一部分圈动量可以在其余动量保持有限时独自趋于无穷大。实际计算时，应先借助低阶反项逐级减去这些子发散，然后再分析剩余的整体发散。对局域量子场论而言，所有子发散被减去后，剩余的发散部分必然是外动量的局域多项式。进一步地，在大圈动量展开中，每引入一阶外动量都会使紫外幂次降低一阶，所以该多项式的最高次数不超过表面发散度  $omega$.

对于二点函数，$E=2$ 给出 $omega=2$. 发散多项式至多含外动量的二次项，Lorentz 不变性进一步把它限制为常数项与 $p^2$ 项，分别由 $delta m^2$ 和 $delta Z$ 抵消. 一圈 tadpole 图就是其中更简单的情形：它虽有 $omega=2$，却完全不依赖外动量，因而只需要质量反项.

对于四点函数，$E=4$ 给出 $omega=0$. 剩余整体发散与外动量无关，可由四次顶点的反项 $delta lambda$ 抵消. 对于 $E>=6$ 的图，$omega<0$，减去所有子发散后已无整体紫外发散，因此无需引入 $phi^6$ 或更高次相互作用的反项. $E=0$ 的真空图则在归一化关联函数中抵消，不影响这里讨论的散射振幅.

因此，无论我们把圈图算到哪一阶，归一化场关联函数的紫外发散都只需要 @eq:chapter-five-renormalized-and-counterterm-lagrangians 中已有的三类反项. 它们的系数随微扰阶次逐步确定，局域结构保持不变. 这就是四维 $phi^4$ 理论的微扰可重整化性；我们随后只需用 on-shell 条件固定这些反项的具体系数.

=== 自能与 on-shell 反项

为把极点条件用于圈图计算，我们沿用第 4.3 节的自能符号约定，将重整化 1PI 二点函数写成

$
  Gamma_R^((2)) (p)
  :=-[p^2+m^2+Pi_R (p^2)].
$ <eq:chapter-five-renormalized-self-energy-definition>

其中 $Pi_R$ 包含圈图与反项的贡献. 相应的完整传播子为

$
  G_R (p)
  =(-i)/(p^2+m^2+Pi_R (p^2)-i 0).
$ <eq:chapter-five-renormalized-full-propagator>

要使分母在物理质量壳上为零，我们要求

$
  Pi_R (-m^2)=0,
  quad m=m_"phys".
$ <eq:chapter-five-on-shell-pole-mass>

随后，我们在 $p^2=-m^2$ 附近展开分母. 单位留数条件给出

$
  Z_phi^(-1)=1+Pi'_R (-m^2)=1,
  quad Pi'_R (-m^2)=0.
$ <eq:chapter-five-on-shell-pole-residue>

撇号表示对 $p^2$ 求导. 这里的单粒子极点位于连续谱阈值以下，自能在极点附近为实函数，因而可以直接用这两个条件确定实的反项系数.

在某一给定微扰阶次，我们把尚未加入该阶二点反项的自能记为 $Pi_"loop"$；其中已包括所需的低阶反项插入. 按 @eq:chapter-five-on-shell-feynman-rules 的符号，该阶重整化自能为

$
  Pi_R (p^2)=Pi_"loop" (p^2)+delta Z p^2+delta m^2.
$ <eq:chapter-five-self-energy-counterterm-decomposition>

我们先对 $p^2$ 求导，再令 $p^2=-m^2$，由单位留数条件得到 $delta Z$. 将它代入极点位置条件，便得到质量反项：

$
    delta Z & =-Pi'_"loop" (-m^2), \
  delta m^2 & =-Pi_"loop" (-m^2)-m^2 Pi'_"loop" (-m^2).
$ <eq:chapter-five-on-shell-two-point-counterterms>

这里的 $delta m^2$ 按 @eq:chapter-five-bare-renormalized-relations 定义为 Lagrangian 中的质量反项系数，所以它也包含由场重整化带来的第二项. 两个反项都包含圈积分相应的发散部分和有限部分. 将它们代回自能，可将减除写成

$
  Pi_R (p^2)
  =Pi_"loop" (p^2)-Pi_"loop" (-m^2)
  -(p^2+m^2) Pi'_"loop" (-m^2).
$ <eq:chapter-five-on-shell-subtracted-self-energy>

这一表达式从自能中减去了质量壳处的常数项与一次项，因而同时满足上述两个 on-shell 条件. 在各阶中，我们都先合并圈图和反项，再取 $epsilon arrow.r 0$ 的极限.

接下来，我们把二点函数算到 $O(lambda^2)$. 一圈 tadpole 图确定最低阶质量反项，两圈自能进一步确定场反项；经过这些减除，极点质量始终为 $m$，重整化场的留数始终为一.

== The One-Loop Self-Energy

== The Two-Loop Self-Energy

== The Four-Point Function

== The Renormalization Group Equation

== The Beta Function of $phi^4$
