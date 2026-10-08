#import "../lib.typ": *
#import "../fig/feynman/ch5-yukawa-loops.typ": yukawa-loops
#import "../fig/feynman/ch5-effective-potential.typ": effective-potential-loops

#exercise(
  title: "有效势：以实标量场为例",
  label: <ex:chapter-five-effective-potential>,
)[
  #let varphi = math.phi.alt
  要研究量子涨落如何改变真空，可以先计算恒定平均场 $phi_"cl" (x)=varphi_0$ 下的能量密度. 它称为有效势，由 $Gamma_M [varphi_0]=-cal(V)_4 V_"eff" (varphi_0)$ 定义，其中 $cal(V)_4$ 是时空体积. 撤去外源后，均匀真空满足 $V'_"eff" (varphi_0)=0$；有效势在该处的形状决定均匀方向上的稳定性.

  考虑树级势 $V_0 (varphi_0)=m^2 varphi_0^2/2+lambda varphi_0^4/(4!)$，取 $m^2>0$、$lambda>0$. 本题只计算单圈有效势中随背景变化的对数项，不预先把 $m$、$lambda$ 解释为极点质量和阈值耦合常数，最后通过多项式系数定义重整化参数.

  + 在恒定背景附近写 $phi=varphi_0+eta$，展开作用量，求涨落的质量平方 $M^2 (varphi_0)=m^2+lambda varphi_0^2/2$. 计算有效作用量时，线性项由维持平均场的外源处理；单圈贡献只需对二次涨落作 Gaussian 积分. 利用这一事实，在 Euclidean 动量空间证明

    $
      V_1 (varphi_0)=cal(J) (M^2 (varphi_0)), quad
      cal(J) (X)=1/2 integral (dd(k_E, [4]))/((2 pi)^4)
      ln ((k_E^2+X)/(kappa^2)).
    $

    这里 $X>0$，$kappa$ 是使对数无量纲的固定质量尺度；积分暂时保留紫外正规化. 解释因子 $1/2$ 的来源.

  + 不直接计算发散的对数积分. 先对 $X$ 求三次导数，再撤去正规化，利用四维球坐标证明

    $
      cal(J)''' (X)=integral (dd(k_E, [4]))/((2 pi)^4)
      1/((k_E^2+X)^3)=1/(32 pi^2 X).
    $

    对 $X$ 积分三次，得到

    $
      cal(J) (X)=X^2/(64 pi^2) ln (X/(kappa^2))+A+B X+C X^2.
    $

    为什么这一步不能确定常数 $A$、$B$、$C$？

  + 将 $X=M^2 (varphi_0)$ 代回，证明未确定的部分只含常数、$varphi_0^2$ 和 $varphi_0^4$，可以分别归入真空能、质量项和四次项的系数. 将多项式记为 $a+b varphi_0^2+c varphi_0^4$，取 $a=0$、$b=m_R^2/2$、$c=lambda_R/(4!)$，用重整化参数写出单圈有效势. 最后求 $lambda varphi_0^2 >> m^2$ 时 $varphi_0^4 ln (varphi_0^2/kappa^2)$ 的系数，判断这个对数项使势向上还是向下弯曲.
]

#pagebreak(weak: true)
#sol[
  #let varphi = math.phi.alt
  + #block(breakable: false)[
    *背景展开与单圈行列式.* 将场分成恒定背景与涨落，$phi=varphi_0+eta$. 树级势展开为

    $
      V_0 (varphi_0+eta) & =V_0 (varphi_0)
                           +(m^2 varphi_0+lambda/(3!) varphi_0^3) eta \
                         & quad +1/2 (m^2+lambda/2 varphi_0^2) eta^2
                           +lambda/(3!) varphi_0 eta^3+lambda/(4!) eta^4.
    $

    #figure(
      effective-potential-loops(),
      caption: [有效势的圈数展开. 孤立点表示经典势，无顶点圆圈表示 Gaussian 行列式. 两圈的两个 1PI 真空图分别含一个四次顶点和两个三次顶点.],
    ) <fig:chapter-five-effective-potential-loops>
    ]

    两圈图的实线采用背景质量 $M^2 (varphi_0)$，顶点由上式的三次项和四次项给出. 图中只列出拓扑结构，未标出积分、符号和对称因子.

    常数项给出树级有效势. 线性项由维持背景的外源处理：在树级取 $J_0=V'_0 (varphi_0)$，便可抵消作用量加源项中的线性涨落. 因而这里允许任意恒定背景；只有撤去外源后，背景才须满足完整有效势的驻点条件.

    二次项决定涨落的质量平方

    $
      M^2 (varphi_0)=m^2+lambda/2 varphi_0^2.
    $

    单圈近似保留二次涨落作 Gaussian 积分. 三次和四次涨落顶点对有效势的贡献从两圈开始：三次顶点至少需两个才能缩并成真空图，四次顶点则可将四条腿两两缩并成两个圈.

    作 Wick 转动并分部积分，Euclidean 二次涨落作用量为

    $
      S_E^((2)) [eta;varphi_0]
      =1/2 integral dd(x_E, [4]) eta K_E eta,
      quad K_E=-partial_E^2+M^2 (varphi_0).
    $

    它是尚未积分的涨落作用量. 将涨落积分掉以后，Gaussian 行列式才给出有效作用量的单圈贡献：

    $
      integral cal(D) eta exp (-S_E^((2)) [eta;varphi_0])
      ∝ (det K_E)^(-1/2),
      quad Gamma_(E,1) [varphi_0]=1/2 op("Tr") ln (K_E/(kappa^2)).
    $

    此处省略与背景无关的归一化常数. 在恒定背景下，平面波是 $K_E$ 的本征函数，本征值为 $k_E^2+M^2 (varphi_0)$. 取迹产生 Euclidean 四维体积 $cal(V)_(E,4)$，除去这一体积便得到

    $
      V_1 (varphi_0) & =(Gamma_(E,1) [varphi_0])/(cal(V)_(E,4)) \
                     & =1/2 integral (dd(k_E, [4]))/((2 pi)^4)
                       ln ((k_E^2+M^2 (varphi_0))/(kappa^2))
                       =cal(J) (M^2 (varphi_0)).
    $

    因子 $1/2$ 来自实标量 Gaussian 积分的行列式幂次. 这里 $Gamma_E=cal(V)_(E,4) V_"eff"$，与 Minkowski 定义 $Gamma_M=-cal(V)_4 V_"eff"$ 的符号相容.

  + *对质量平方求导.* 将 $X>0$ 视为独立变量. 对正规化后的积分求三次导数，分母变成三次幂，积分已经紫外收敛，可以撤去正规化. 四维单位球面的面积为 $2 pi^2$，因此

    $
      cal(J)''' (X) & =integral (dd(k_E, [4]))/((2 pi)^4) 1/((k_E^2+X)^3) \
                    & =(2 pi^2)/((2 pi)^4)
                      integral_0^infinity dd(k) k^3/((k^2+X)^3) \
                    & =1/(16 pi^2) integral_0^infinity dd(y) y/((y+X)^3)
                      =1/(32 pi^2 X),
                      quad y=k^2.
    $

    由于 $X^2 ln (X/(kappa^2))$ 的三阶导数是 $2/X$，积分三次得到

    $
      cal(J) (X)=X^2/(64 pi^2) ln (X/(kappa^2))+A+B X+C X^2.
    $

    三阶导数消去了所有不超过二次的多项式，所以收敛积分不能确定 $A$、$B$、$C$. 它们记录原积分中依赖正规化及归一化选择的部分；改变 $kappa$ 也只会改变 $C$.

  + *代回背景质量.* 令 $X=m^2+lambda varphi_0^2/2$，多项式部分展开为

    $
      A+B X+C X^2 & =(A+B m^2+C m^4) \
                  & quad +(lambda B/2+lambda C m^2) varphi_0^2
                    +(C lambda^2)/4 varphi_0^4.
    $

    它只改变真空能、质量项和四次项的系数. 将树级势一并计入，单圈近似下的有效势可写成

    $
      V_"eff" (varphi_0)
      =a+b varphi_0^2+c varphi_0^4
      +([M^2 (varphi_0)]^2)/(64 pi^2)
      ln ((M^2 (varphi_0))/(kappa^2)),
    $

    其中 $a=A+B m^2+C m^4$，$b=m^2/2+lambda B/2+lambda C m^2$，$c=lambda/(4!)+C lambda^2/4$. 现在选择常数项为零，并用质量项与四次项的系数定义重整化参数：

    $
      a=0, quad b=m_R^2/2, quad c=lambda_R/(4!).
    $

    因为质量项和四次项分别约定带有 $1/2$ 与 $1/(4!)$，这两个因子也要包含在 $b$、$c$ 的定义中. 对数项已经是单圈贡献，其中的 $m$、$lambda$ 可换成 $m_R$、$lambda_R$，差别属于更高圈阶. 记 $M_R^2 (varphi_0)=m_R^2+lambda_R varphi_0^2/2$，得到

    $
      V_"eff" (varphi_0)
      =1/2 m_R^2 varphi_0^2+lambda_R/(4!) varphi_0^4
      +([M_R^2 (varphi_0)]^2)/(64 pi^2)
      ln ((M_R^2 (varphi_0))/(kappa^2)).
    $

    这些条件固定的是多项式部分. 对数项仍贡献原点处的常数、二阶和四阶导数，因此 $m_R$、$lambda_R$ 是按上述方式定义的参数. 同样，$a=0$ 后仍有 $V_"eff" (0)=(m_R^4)/(64 pi^2) ln (m_R^2/kappa^2)$；若要把完整真空能也设为零，可再减去这一与场无关的常数.

    当 $lambda_R varphi_0^2 >> m_R^2$ 时，$M_R^2 (varphi_0) approx lambda_R varphi_0^2/2$，对数项的主导大场行为为

    $
      V_(1,"log") (varphi_0)
      approx (lambda_R^2)/(256 pi^2) varphi_0^4
      [ln (varphi_0^2/(kappa^2))+ln (lambda_R/2)].
    $

    因而 $varphi_0^4 ln (varphi_0^2/(kappa^2))$ 的系数为 $lambda_R^2/(256 pi^2)>0$. 在单圈表达式的大场极限中，标量涨落产生的这一对数项使势向上增长.
]






#pagebreak(weak: true)
#exercise(
  title: "Yukawa 理论：Feynman 规则与有效势",
  label: <ex:chapter-five-yukawa-potential>,
)[
  #let varphi = math.phi.alt
  在上一题的实标量理论中加入一个 Dirac 场，取 Minkowski Lagrangian

  $
    cal(L)_M & =-1/2 tensor(partial, +mu) phi tensor(partial, -mu) phi
               -1/2 m^2 phi^2-lambda/(4!) phi^4 \
             & quad +overline(psi) (i tensor(gamma, +mu) tensor(partial, -mu)-m_psi) psi
               +g phi overline(psi) i gamma^5 psi.
  $

  其中 $g$ 为实数，$m^2>0$、$m_psi>0$、$lambda>0$. 令 $phi$ 为赝标量，使 Yukawa 相互作用保持宇称. 以下取恒定背景 $phi=varphi$，费米子平均场为零；沿用上一题对多项式部分的处理，不要求引入反项或指定重整化条件.

  + 验证 $overline(psi) i gamma^5 psi$ 的 Hermitian 性. 从 $exp (i S_"int")$ 出发，写出两种内线、四标量顶点和 Yukawa 顶点的 Feynman 规则，保留旋量指标并标明费米子箭头. 核对本题 Yukawa 顶点的矩阵因子为 $-g gamma^5$. 用 Wick 缩并解释每个闭合费米子圈为何多一个负号，以及沿圈相乘的旋量矩阵为何要取迹. 画出带两个零动量标量外腿的费米子圈，写出其积分表达式.

  + 恒定背景相当于在费米子线上插入任意多个零动量的 $varphi$. 将这些单圈图与费米子 Gaussian 积分联系起来，说明它们由 Euclidean 有效作用量中的 $-op("Tr") ln D_E (varphi)$ 生成，其中 $D_E$ 是背景下的 Dirac 算符. 提示：展开 $-op("Tr") ln [1+D_E (0)^(-1)(D_E (varphi)-D_E (0))]$，观察各项的 $1/n$ 与沿圈的循环排列. 利用 $gamma^5$ 与 $tensor(gamma, +mu)$ 的反对易关系，证明

    $
      det D_E (k_E;varphi)=[k_E^2+M_F^2 (varphi)]^2,
      quad M_F^2 (varphi)=m_psi^2+g^2 varphi^2.
    $

    这里行列式只对四个旋量分量取值. 由此证明单个 Dirac 场对有效势的贡献为 $V_(1,F) (varphi)=-4 cal(J) (M_F^2 (varphi))$，其中 $cal(J)$ 已在上一题算出. 分别解释负号与因子四的来源，并核对对数展开的二次项与前一问的圈图一致；有效势中二次项还含外部背景场的 $1/(2!)$.

  + 加上标量圈贡献，写出单圈有效势中随背景变化的对数部分，其余部分记为 $a+b varphi^2+c varphi^4$. 在 $lambda varphi^2 >> m^2$、$g^2 varphi^2 >> m_psi^2$ 时，求 $varphi^4 ln (varphi^2/kappa^2)$ 的总系数，并确定它为负的耦合条件. 解释费米子涨落为什么可能使势在大场方向下降，以及为何这个趋势不取决于 $g$ 的整体符号. 判断稳定性时，仍须检查单圈近似是否可控.
]

#exercise(
  title: "从自旋求和到矩阵迹",
  label: <ex:chapter-five-spin-traces>,
)[
  未观测自旋的散射概率需要对末态自旋求和、对初态自旋平均. 自旋完备关系可以把这些求和化成 gamma 矩阵的迹，无须选定每个外线旋量. 本题在四维中工作，采用本书的 $[tensor(gamma, +mu),tensor(gamma, +nu)]_+=-2 tensor(eta, +mu, +nu)$ 与 $slashed(p)=tensor(p, -mu) tensor(gamma, +mu)$.

  + 利用迹的循环性和 Clifford 代数，证明奇数个 gamma 矩阵的迹为零，并推导

    $
      op("tr") 1_4&=4, quad
      op("tr") [tensor(gamma, +mu) tensor(gamma, +nu)]=-4 tensor(eta, +mu, +nu), \
      op("tr") [slashed(a) slashed(b) slashed(c) slashed(d)]
      &=4[(a dot b)(c dot d)-(a dot c)(b dot d)+(a dot d)(b dot c)].
    $

    将第一个 gamma 矩阵依次移过其余矩阵，写出偶数个 gamma 矩阵的迹降为少两个矩阵的递推式. 再利用 $gamma^5 slashed(a)=-slashed(a) gamma^5$ 和 $(gamma^5)^2=1$，说明如何消去迹中成对出现的 $gamma^5$.

  + 对任意旋量矩阵 $A$ 定义 $overline(A)=tensor(gamma, +0) A^dagger tensor(gamma, +0)$. 证明 $(overline(u)_3 A u_1)^*=overline(u)_1 overline(A) u_3$ 和 $overline(A B)=overline(B) overline(A)$，并求 $overline(gamma^5)$、$overline(i gamma^5)$. 使用

    $
      R_u (p):=sum_r u_r (p) overline(u)_r (p)=-slashed(p)+m_psi,
      quad R_v (p):=sum_r v_r (p) overline(v)_r (p)=-slashed(p)-m_psi,
    $

    推导可同时处理模方和干涉项的公式

    $
      sum_(r_1,r_3) (overline(u)_3 A u_1)
      (overline(u)_3 B u_1)^*
      =op("tr") [A R_u (p_1) overline(B) R_u (p_3)].
    $

    将其中一条或两条外线换成反费米子，写出对应公式. 说明这里形成的矩阵迹为何不附加闭合费米子圈的负号.

  + 设 $T_t=(overline(u)_3 A u_1)(overline(u)_4 B u_2)$、$T_u=(overline(u)_4 C u_1)(overline(u)_3 D u_2)$. 将 $sum_("spins") abs(T_t)^2$ 写成两个迹的乘积，将 $sum_("spins") T_t T_u^*$ 写成一个迹，并标明矩阵次序. 用这一结果说明：交换图的模方可以由重标号得到，干涉项却仍须保留. 以 $A=i gamma^5$ 为例，计算 $sum_(r_1,r_3) abs(overline(u)_3 A u_1)^2$，检查它在 $p_3=p_1$ 时的值以及物理区域内的非负性.
]

以下用 $n^+$、$n^-$ 分别表示核子和反核子，用 $"m"$ 表示介子；上标正负号标记费米子数，直立的 $"m"$ 是粒子名称，质量参数仍记为斜体 $m$. 树图题均采用 @ex:chapter-five-yukawa-potential 的理论，取 $0<m<2m_psi$，使作为外线的标量不能衰变为费米子对. 对 $1+2 arrow.r 3+4$ 记 $s=-(p_1+p_2)^2$、$t=-(p_1-p_3)^2$、$u=-(p_1-p_4)^2$，所有 $p_i$ 都是相应物理粒子的正能动量. 每题须列出最低非零阶的全部连通树图，先相加振幅，再作自旋求和与初态平均；将结果化为 $s,t,u$ 和质量的函数，并给出质心系微分截面. 对全同末态，在整个立体角上计数时包含 $1/(2!)$，或只取不重复的角域，注明所用办法. 无须计算总截面的角积分.

#exercise(
  title: "n⁺n⁺ → n⁺n⁺",
  label: <ex:chapter-five-yukawa-identical-scattering>,
)[
  考虑 $n^+ (p_1)+n^+ (p_2) arrow.r n^+ (p_3)+n^+ (p_4)$.

  + 画出全部树图，固定外部费米态的排列次序，推导各图之间的相对符号. 说明如何由一幅图交换 $p_3,r_3$ 与 $p_4,r_4$ 得到另一幅图，并检查完整振幅在该交换下的反对称性.

  + 用上一题的方法求非偏振振幅模方. 只独立计算一个通道的模方，再由 $t arrow.l.r u$ 得到另一项，另行计算干涉项. 检查最终结果在 $t arrow.l.r u$ 下不变，并写出微分截面. 初态自旋平均与全同末态计数分别带来什么因子？
]

#exercise(
  title: "n⁺n⁻ → n⁺n⁻",
  label: <ex:chapter-five-yukawa-fermion-antifermion>,
)[
  考虑 $n^+ (p_1)+n^- (p_2) arrow.r n^+ (p_3)+n^- (p_4)$.

  + 列出全部树图，写出交换与湮灭两类贡献及其相对符号. 将上一题的一条入射费米子与一条出射费米子交叉到另一侧，明确写出动量和外线旋量的替换，用所得振幅核对直接计算.

  + 求非偏振振幅模方和微分截面，保留两类图的干涉. 解释为什么此处没有全同末态的 $1/(2!)$，以及为什么不能把上一题的物理区域和末态计数因子一起照搬过来.
]

#exercise(
  title: "n⁺n⁻ → mm",
  label: <ex:chapter-five-yukawa-annihilation>,
)[
  考虑 $n^+ (p_1)+n^- (p_2) arrow.r "m" (p_3)+"m" (p_4)$，取 $s>4 max(m_psi^2, m^2)$.

  + 列出全部树图，沿费米子线保持旋量矩阵的次序，写出振幅. 用两个出射标量的交换关系减少重复计算，并检查振幅的对称性. 为什么交换两个标量不会产生全同费米子交换时的负号？四次标量顶点能否在这一阶贡献？

  + 求非偏振振幅模方和微分截面，并写出逆过程 $"m" "m" arrow.r n^+ n^-$ 的结果. 比较两个过程的自旋平均、末态计数和质心动量因子，说明为何相同的自旋求和振幅模方并不意味着相同的截面.
]

#exercise(
  title: "n⁺m → n⁺m",
  label: <ex:chapter-five-yukawa-compton>,
)[
  考虑 $n^+ (p_1)+"m" (p_2) arrow.r n^+ (p_3)+"m" (p_4)$.

  + 列出全部树图并写出振幅. 从上一题的湮灭振幅出发，把一个标量和反费米子交叉到另一侧，明确列出动量替换，核对所得表达式. 计算两图之和的非偏振模方与微分截面，注意本题只有一个初态自旋需要平均.

  + 不再逐一作迹计算，说明如何由这些题得到反费米子与标量、两个反费米子的弹性散射结果. 再列出 $"m" "m" arrow.r "m" "m"$ 的全部树图，解释 Yukawa 顶点为何只能通过含圈图修正这一过程. 利用费米子数守恒和上述交叉关系，检查是否已经覆盖本理论所有允许的两粒子到两粒子树级过程.
]

以下习题把树级计算推进到单圈阶. 所有参数改用重整化参数，取 $0<m<m_psi$，从而介子散射阈值也低于核子对产生阈值. 仍用 $d=4-2 epsilon$，并保持本章的 on-shell 质量与留数条件. 本组单圈图的闭合旋量迹含偶数个 $gamma^5$；可用反对易的 $gamma^5$ 将它们成对消去，再在 $d$ 维作指标缩并，取 $op("tr") 1=4$. 不要在消去紫外极点以前把所有 $d$ 都换成四.

#exercise(
  title: "Yukawa 理论的重整化 Lagrangian",
  label: <ex:chapter-five-yukawa-renormalized-lagrangian>,
)[
  将裸理论写成 $cal(L)_0=cal(L)_"ren"+cal(L)_"ct"$，其中

  $
    cal(L)_"ren" & =-1/2 tensor(partial, +mu) phi tensor(partial, -mu) phi
                   -1/2 m^2 phi^2-(mu^(2 epsilon) lambda)/(4!) phi^4 \
                 & quad +overline(psi) (i tensor(gamma, +mu) tensor(partial, -mu)-m_psi) psi
                   +mu^epsilon g phi overline(psi) i gamma^5 psi, \
     cal(L)_"ct" & =-1/2 delta Z_phi tensor(partial, +mu) phi tensor(partial, -mu) phi
                   -1/2 delta m^2 phi^2-(mu^(2 epsilon) delta lambda)/(4!) phi^4 \
                 & quad +overline(psi) (i delta Z_psi tensor(gamma, +mu) tensor(partial, -mu)
                     -delta m_psi) psi+mu^epsilon delta g phi overline(psi) i gamma^5 psi.
  $ <eq:exercise-yukawa-renormalized-lagrangian>

  这里 $delta Z_phi$、$delta Z_psi$ 表示动能反项系数，不是完整传播子的极点留数. 只考虑带外腿的关联函数，省略真空能常数.

  + 令 $phi_0=sqrt(1+delta Z_phi) phi$、$psi_0=sqrt(1+delta Z_psi) psi$，写出裸质量、裸耦合常数与上式参数的关系. 由作用量量纲说明两个顶点为何分别带 $mu^epsilon$ 和 $mu^(2 epsilon)$. 推导四种反项顶点，核对介子二点插入为 $-i(delta Z_phi p^2+delta m^2)$，核子二点插入为 $-i(delta Z_psi slashed(p)+delta m_psi)$.

  + 推导四维表面发散度 $omega=4-E_phi-3 E_psi/2$，其中 $E_psi$ 计入核子与反核子外腿. 结合宇称和费米子数守恒，找出需要重整化的 1PI 二点、三点和四点函数. 解释为什么不需要 $phi$、$phi^3$ 或 $phi overline(psi) psi$ 反项，以及四次标量项为何不能在 $g != 0$ 时始终省去.

  + 根据下图核对各反项首次出现的耦合阶数. 区分“单圈”与“耦合常数的一次项”，说明为什么重整化图中的单圈阶反项无需再插入单圈内部. 四点图只画一个外腿排列，补全其余排列；比较反向绕行的核子圈时，保留原有的计数因子.
]

#figure(
  yukawa-loops(),
  caption: [Yukawa 理论中需要局域反项的六类单圈图. 虚线为介子，带箭头的实线为核子传播子. 四介子图需补全外腿排列；对应的反项图由习题给出. 有限的四核子和两核子两介子 1PI 图留待最后一题检查.],
) <fig:chapter-five-yukawa-one-loop-families>

#exercise(
  title: "m：单圈自能与传播子",
  label: <ex:chapter-five-yukawa-meson-self-energy>,
)[
  将介子 1PI 二点插入定义为 $-i Pi_R (p^2)$，其中

  $
    Pi_R (p^2)=Pi_"tad" + Pi_(n) (p^2)+delta Z_phi p^2+delta m^2.
  $

  + 分别写出 tadpole 与核子闭圈的积分，明确对称因子、闭圈负号和旋量迹. tadpole 可直接使用第 5.2 节的结果；核子圈先求迹，再引入 Feynman 参数. 分离 $1/epsilon$ 极点，证明发散部分至多是 $p^2$ 的一次多项式.

  + 要求 $Pi_R (-m^2)=Pi'_R (-m^2)=0$，求 $delta Z_phi$ 与 $delta m^2$，保留满足条件所需的有限项. 将有限自能写成减除后的参数积分. 为什么纯标量 tadpole 被全部消去，而核子圈仍留下动量依赖？

  + 将结果代入完整传播子，核对极点与留数. 找出核子圈随 $p^2$ 解析延拓时的两粒子阈值，说明所选质量范围为何保证介子极点处的反项为实数.
]

#exercise(
  title: "n⁺：单圈自能与传播子",
  label: <ex:chapter-five-yukawa-nucleon-self-energy>,
)[
  核子自能图含一条内部核子线和一条内部介子线. 定义 1PI 插入为 $-i Sigma_R (p)$，从而

  $
    S_R (p)=i[-slashed(p)-m_psi-Sigma_R (p)]^(-1), quad
    Sigma_R (p)=Sigma_"loop" (p)+delta Z_psi slashed(p)+delta m_psi.
  $

  + 写出圈积分，保持两个 $gamma^5$ 的矩阵次序，说明此图为何没有闭合费米子圈的额外负号. 完成分母合并和圈动量积分，将结果写成 $Sigma_"loop" (p)=A (p^2) slashed(p)+m_psi B (p^2)$，分别给出 $A$、$B$ 的极点项和有限参数积分.

  + 要求质量为 $m_psi$ 且极点留数为一，即

    $
      S_R (p)=(i(slashed(p)-m_psi))/(p^2+m_psi^2-i 0)+"正则项",
      quad p^2 arrow.r -m_psi^2.
    $

    展开逆传播子，推导两个 on-shell 条件，求 $delta Z_psi$、$delta m_psi$. 先利用壳上 Dirac 方程处理矩阵结构，再取导数；不能对 $Sigma_R$ 生搬标量自能的两条条件.

  + 检查所得核子自能的首个阈值. 说明如何从同一个矩阵传播子读出反核子的极点，以及为什么不需要再为 $n^-$ 引入一组独立质量反项.
]

#pagebreak(weak: true)
#exercise(
  title: "n⁺n⁻m：Yukawa 顶点的单圈修正",
  label: <ex:chapter-five-yukawa-vertex-renormalization>,
)[
  两点条件尚未确定 $g$. 将两条核子外腿取到质量壳上，以 $q=p'-p$ 表示介子动量. 把截肢顶点夹在壳上旋量之间，定义赝标量形状因子

  $
    overline(u) (p') cal(V)_R (p',p) u (p)
    =-mu^epsilon g F_5 (q^2) overline(u) (p') gamma^5 u (p).
  $

  用 $F_5 (-m^2)=1$ 定义本组习题的 $g$，并在反项与圈图相加后取四维极限. 该条件在解析延拓的壳上三点函数上施加；所选质量范围内不存在三个实外粒子同时满足此条件的衰变过程.

  + 写出含两条内部核子线和一条介子线的顶点图，以及 $delta g$ 反项图. 说明为何不存在这一阶的 $g lambda$ 型 1PI 顶点图，并区分顶点修正与附着在外腿上的自能修正.

  + 引入 Feynman 参数计算三角图，先保留一般外动量的矩阵结构. 证明紫外极点与 $gamma^5$ 成正比，再利用两条壳上 Dirac 方程提取 $F_5$. 求满足归一化条件的 $delta g$，并给出有限的 $F_5 (q^2)-F_5 (-m^2)$ 参数积分.

  + 比较 $delta g$ 与裸耦合常数的改变. 解释裸量关系中为何还含两个核子场和一个介子场的归一化因子，以及为什么不能把这些因子重复计入截肢顶点反项.
]

#exercise(
  title: "mm → mm：四介子顶点的单圈修正",
  label: <ex:chapter-five-yukawa-four-meson-renormalization>,
)[
  沿用本章的阈值条件 $cal(M) (4m^2,0,0)=-lambda$. 此处的 $lambda$ 属于完整 Yukawa 理论，反项还需包含核子圈的贡献.

  + 列全三个介子 fish 通道、核子 box 的不同外腿排列及四介子反项图. 标记四个外腿后，先按沿有向核子圈的循环次序计数，再利用反向绕行关系减少独立积分. 说明为什么不能把这个关系当作删去一半图的理由.

  + 介子圈可复用第 5.3 节的积分. 对核子 box 求旋量迹，分离局域的紫外极点，将有限部分写为参数积分. 证明全部通道的发散可以由一个 $delta lambda$ 抵消，且该系数必须在所有外动量下相同.

  + 在阈值处确定 $delta lambda$ 的有限部分，写出一般 $s,t,u$ 下的重整化振幅，并检查交叉对称性. 在零外动量处，把核子圈的四点贡献与 @ex:chapter-five-yukawa-potential 中费米子有效势的四阶导数比较. 核对圈图的计数，并说明为什么最终阈值定义的 $lambda$ 不等于有效势在原点的四阶导数.
]

#exercise(
  title: "n⁺n⁻ → n⁺n⁻：组装单圈振幅",
  label: <ex:chapter-five-yukawa-one-loop-scattering>,
)[
  两点和顶点修正可以复用，但它们还不能生成散射振幅的全部单圈图.

  + 在树图中加入介子自能、Yukawa 顶点修正及相应反项，再列出不能由这些插入得到的全部 box 图，标明各图的耦合阶数和相对符号. 用 $omega=4-E_phi-3E_psi/2$ 检查四核子 box 的紫外收敛性. 已有修正可直接用前几题的有限函数表示，box 可保留为参数积分.

  + 按 LSZ 公式处理外线，说明留数归一为一时如何避免重复计入外腿修正. 检查完整单圈振幅的极点抵消，并解释介子 tadpole 所产生的 $g^2 lambda$ 项与质量反项的关系. 写出截面所需的树图与单圈干涉项，不把单圈振幅模方当作这一阶的截面修正.

  + 将外腿交叉，说明如何得到 $n^+ n^+ arrow.r n^+ n^+$ 的单圈修正. 对 $n^+ n^- arrow.r "m" "m"$ 和 $n^+ "m" arrow.r n^+ "m"$，仅列出尚需补充的两核子两介子 1PI 单圈图，标记 $g^4$ 与 $g^2 lambda$ 阶并检查紫外收敛性. 结合四介子题，说明这组自能、顶点和有限四点图如何覆盖前面全部两体散射题.
]
