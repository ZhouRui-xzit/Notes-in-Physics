#import "../../lib.typ": *
#import "@preview/cetz:0.4.2"

= 有限温度下的自由场

有限温度场论研究热平衡态中的关联函数与热力学量. 微观作用量沿用零温理论，温度通过密度算符进入计算，并改变 Euclidean 时间方向的整体边界条件. 热迹把时间轴闭合为周长 $beta$ 的圆，周期与反周期函数空间随之产生；其离散 Fourier 频率构成 Matsubara 频率格.

本章沿着“热迹、边界条件、离散频率、Gaussian 核”这条主线展开. 先由热迹建立虚时间形式与 KMS 条件，再构造热圆上的 Fourier 分析；随后分别计算标量场、Dirac 场和光子场的泛函行列式与逆核，从中提取压强、荷密度和热传播子；最后用围道积分统一推导前文使用的 Matsubara 求和公式. 同一个二次核的迹对数给出热力学，逆核给出二点函数.

== 虚时间形式

虚时间形式要解决热迹如何转化为路径积分. 计算从热浴静止系中的密度算符出发，经由时间切片把 $e^(-beta hat(H))$ 写成 Euclidean 演化；迹要求初末场构型相同，并由场的统计性质确定周期或反周期边界条件. 这套构造同时给出热关联函数的虚时间排序和 KMS 条件.

本章始终采用自然单位制 $k_B=1$，并记

$
  beta:=1/T,
$ <eq:inverse-temperature-definition>

其中 $T>0$ 为温度. 下文的 $T_tau$ 表示虚时间排序，与温度符号 $T$ 无关.

=== 热系综与优选静止系

设 $hat(H)$ 为热浴静止系中的 Hamiltonian. 正则配分函数与归一化密度算符分别为

$
  Z_beta
  :=upright("Tr") e^(-beta hat(H)),
  quad
  hat(rho)_beta
  :=e^(-beta hat(H))/Z_beta.
$ <eq:canonical-thermal-state>

于是，算符 $hat(cal(O))$ 的热期望值为

$
  chevron.l hat(cal(O)) chevron.r_beta
  :=upright("Tr") [hat(rho)_beta hat(cal(O))]
  =1/Z_beta upright("Tr")
  [e^(-beta hat(H)) hat(cal(O))].
$ <eq:thermal-expectation-value>

热平衡态选定一个类时四速度. 在热浴静止系中，$hat(H)$ 生成的时间平移因而与空间平移具有不同地位. 均匀、各向同性的平衡态保持空间平移与转动不变性，同时破坏 Lorentz 推动不变性. 因此，即使微观作用量仍具 Lorentz 不变性，热传播子也会分别依赖时间频率与空间动量 $bold(p)$.

对于不显含时间的算符，定义其虚时间 Heisenberg 演化为

$
  hat(cal(O)) (tau)
  :=e^(tau hat(H)) hat(cal(O)) e^(-tau hat(H)),
  quad
  0<=tau<beta.
$ <eq:imaginary-time-heisenberg-evolution>

这是通常 Heisenberg 演化在 $t=-i tau$ 下的解析延拓. 虚时间演化用于组织热权重，不描述真实时间中的实验过程，因而无须满足幺正性.

=== 热迹使 Euclidean 时间闭合

先考虑实标量场. 在 @eq:canonical-thermal-state 的迹中插入完备的场本征态，得到

$
  Z_beta
  =integral cal(D) phi_0
  bra(phi_0) e^(-beta hat(H)) ket(phi_0).
$ <eq:thermal-trace-field-basis>

对矩阵元作时间切片，所得 Euclidean 构造与第一章相同；区别在于，末时间片上的场必须与初时间片上的场等同. 因此

$
  Z_beta
  =integral_(phi (beta,bold(x))=phi (0,bold(x)))
  cal(D) phi e^(-S_(E,beta) [phi]),
$ <eq:bosonic-thermal-path-integral>

对于自由标量场，其中

$
  S_(E,beta) [phi]
  :=integral_0^beta dd(tau) integral dd(x, [3])
  [
    1/2 (partial_tau phi)^2
    +1/2 (bold(nabla) phi)^2
    +1/2 m^2 phi^2
  ].
$ <eq:thermal-scalar-euclidean-action>

这里的作用量是 Euclidean 作用量：在约定的 Wick 转动 $t=-i tau$ 下，Minkowski 权重 $e^(i S_M)$ 延拓为 $e^(-S_E)$. @eq:bosonic-thermal-path-integral 的端点条件决定了有限温度玻色场所在的函数空间：

$
  cal(M)_(E,beta)=S_beta^1 times RR^3,
  quad
  phi (tau+beta,bold(x))=phi (tau,bold(x)),
$ <eq:bosonic-thermal-circle>

其中 Euclidean 时间圆 $S_beta^1$ 的周长为 $beta$. 这一紧致化源自热迹，而不能仅由 Wick 转动推出；在零温极限下，圆重新展开为无限长的 Euclidean 时间轴.

对于费米场，必须使用第一章的相干态计算热迹. 相干态迹公式中的负号给出

$
            Psi (tau+beta,bold(x)) & =-Psi (tau,bold(x)), \
  overline(Psi) (tau+beta,bold(x)) & =-overline(Psi) (tau,bold(x)).
$ <eq:fermionic-thermal-circle>

因此，玻色积分变量沿热圆满足周期边界条件，费米积分变量则满足反周期边界条件. 这一结论与 @eq:fermionic-antiperiodic-boundary 一致，由统计性质与取迹操作决定，因而在相互作用理论中仍然成立.

=== 虚时间排序与 KMS 条件

热 Euclidean 关联函数是在热圆上按虚时间排序的期望值. 对两个算符定义

$
  cal(G)_(A B,beta) (tau)
  :=chevron.l T_tau hat(A) (tau)hat(B) (0) chevron.r_beta.
$ <eq:thermal-imaginary-time-two-point-function>

排序符号把 $tau$ 较大的算符置于左侧. 每交换两个 Grassmann 奇算符都会产生一个负号，这与第二章的真空时间排序完全相同. 当 $0<tau<beta$ 时无需交换，故有

$
  cal(G)_(A B,beta) (tau)
  =1/Z_beta upright("Tr")
  [e^(-beta hat(H))hat(A) (tau)hat(B) (0)].
$ <eq:thermal-two-point-trace>

利用迹的循环性，可将 $hat(A)$ 沿热圆移动一周，从而得到

$
  chevron.l hat(A) (tau)hat(B) (0) chevron.r_beta
  =chevron.l hat(B) (0)hat(A) (tau-beta) chevron.r_beta.
$ <eq:kms-condition-imaginary-time>

这就是虚时间形式的 Kubo--Martin--Schwinger（KMS）条件. 迹恒等式本身不含统计符号；只有把算符重新排成虚时间顺序时，统计符号才会出现. 若 $hat(A)$ 与 $hat(B)$ 同为玻色算符或同为费米算符，则有序二点函数满足

$
  cal(G)_(A B,beta) (tau+beta)
  =zeta_A cal(G)_(A B,beta) (tau),
  quad
  zeta_A=+1 "玻色算符",
  quad
  zeta_A=-1 "费米算符".
$ <eq:thermal-correlator-boundary-condition>

@eq:bosonic-thermal-circle、@eq:fermionic-thermal-circle 中的路径积分边界条件与算符形式的 KMS 条件来自同一个热迹. 前者便于计算 Gaussian 积分；后者不依赖场表象，直接刻画热平衡态.

由于时间坐标位于圆上，只有模 $beta$ 意义下的时间间隔彼此独立. 可以选取 $0<=tau<beta$ 作为基本区间，再借助 @eq:thermal-correlator-boundary-condition 将关联函数延拓到区间之外. 关联函数或其虚时间导数在等时处的不连续性编码了正则对易关系或反对易关系；下文构造自由传播子时会明确看到这一点.

=== 热圆上的生成泛函

只要相应改变积分区域与边界条件，前两章的 Gaussian 方法即可直接用于有限温度. 记 $X:=(tau,bold(x))$，并为实标量场引入周期外源 $J (X)$. 归一化热生成泛函为

$
  cal(Z)_beta [J]
  :=frac(
    integral_("periodic") cal(D) phi
    exp[-S_(E,beta) [phi]
      +integral_0^beta dd(tau) integral dd(x, [3])
      J (X)phi (X)],
    integral_("periodic") cal(D) phi
    e^(-S_(E,beta) [phi])
  ).
$ <eq:normalized-thermal-generating-functional>

除去正规化测度带来的场无关归一化，分母就是未归一化配分函数 $Z_beta$. 计算热力学势时必须保留这一因子，而在归一化关联函数中它会相消. 对外源作泛函微分可生成虚时间有序热 Green 函数：

$
  G_(E,beta)^((n)) (X_1,dots,X_n)
  :=chevron.l
  T_tau phi (X_1)dots phi (X_n)
  chevron.r_beta
  =[
    (delta^n cal(Z)_beta [J])/
    (delta J (X_1)dots delta J (X_n))
  ]_(J=0).
$ <eq:thermal-correlators-from-source>

复标量场需要两个相互独立、满足周期条件的对易外源.Dirac 场则使用独立的反周期 Grassmann 外源 $eta$ 与 $overline(eta)$，并固定按 $overline(eta)Psi+overline(Psi)eta$ 的次序耦合. 除边界条件外，外源微分约定与 Gaussian 恒等式均与 @eq:euclidean-generating-functional-definition 和 @eq:free-dirac-master-functional 完全相同.

对于自由实标量场，以 $cal(K)_(E,beta)$ 表示作用在周期函数空间上的二次算符，形式上仍得到与零温情形相同的结果：

$
  cal(Z)_(0,beta) [J]
  =exp[
    1/2 integral_0^beta dd(tau_x) integral_0^beta dd(tau_y)
    integral dd(x, [3])dd(y, [3])
    J (X)G_beta (X-Y)J (Y)
  ],
  quad
  G_beta=cal(K)_(E,beta)^(-1).
$ <eq:free-thermal-scalar-master-functional>

记号 $cal(K)_(E,beta)^(-1)$ 特指该算符在周期函数空间上的逆. 函数空间本身是逆算符定义的一部分：局域微分算符虽与零温时相同，允许的边界条件改变后，Green 函数也随之改变. 下一节将利用热圆上的 Fourier 模把这一逆算符对角化.

=== 热力学量与零温极限

未归一化热迹包含平衡态的热力学信息. 对于体积为 $V$ 的均匀体系，Helmholtz 自由能、 平均能量与压强分别为

$
  F_beta & =-1/beta log Z_beta, \
  E_beta & =-(partial log Z_beta)/(partial beta), \
  p_beta & =1/(beta V) log Z_beta.
$ <eq:thermodynamic-derivatives-of-partition-function>

压强公式假定已经取热力学极限，并保持温度不变. 若 Hamiltonian 中含有加性的真空能 $E_0$，则 $Z_beta$ 会多出因子 $e^(-beta E_0)$. 该因子在归一化关联函数中相消，但在给出绝对自由能时必须将其减去，或明确说明所采用的真空能约定.

若基态唯一，则在 $beta arrow.r infinity$ 时，归一化热迹投影到该基态：

$
  lim_(beta arrow.r infinity)
  chevron.l hat(cal(O)) chevron.r_beta
  =mel(0, hat(cal(O)), 0).
$ <eq:zero-temperature-thermal-limit>

与此同时，$S_beta^1 times RR^3$ 展开为 $RR^4$，热传播子趋于 @eq:free-euclidean-propagator-summary 所列的 Euclidean 真空传播子. 有限温度保留局域自由场核，并把求逆限制在热圆上的相应函数空间；离散频率由这一限制产生.

== Matsubara 频率

上一节把有限温度运动学归结为 Euclidean 时间圆上的边值问题. 现在需要对角化沿热圆的平移. 允许的时间频率是离散的，而空间动量在热力学极限下趋于连续. 为明确所有归一化因子与 delta 函数，我们先把时间和空间两个方向都离散化，最后再取空间连续极限.

=== 有限温度盒中的 Fourier 模

暂将体系置于边长为 $L$、体积为 $V=L^3$ 的立方盒中，并施加空间周期边界条件. 选取半开基本区域

$
  0<=tau<beta,
  quad
  0<=x_i<L,
$ <eq:finite-thermal-box-domain>

即可避免重复计数端点. 空间平面波的动量为

$
  bold(p)_bold(k):=(2 pi)/L bold(k),
  quad
  bold(k) in ZZ^3.
$ <eq:finite-box-spatial-momenta>

在时间方向上，以 $s=B$ 表示周期玻色函数，以 $s=F$ 表示反周期费米函数. 两类边界条件可统一写为

$
  f_s (tau+beta,bold(x))
  =zeta_s f_s (tau,bold(x)),
  quad
  zeta_B=+1,
  quad
  zeta_F=-1.
$ <eq:unified-thermal-boundary-condition>

时间平面波 $e^(i omega tau)$ 只有在 $e^(i omega beta)=zeta_s$ 时才属于相应的函数空间. 因此

$
  omega_n^B & =(2 pi n)/beta=2 pi n T, \
  omega_n^F & =((2n+1) pi)/beta=(2n+1) pi T,
              quad n in ZZ.
$ <eq:bosonic-fermionic-matsubara-frequencies>

整数 $n$ 标记频率格点. 费米频率的最小绝对值为 $pi T$，故费米扇区没有零频模. 有限温度盒上的归一化平面波基为

$
  u_(n bold(k))^((s)) (X)
  :=1/sqrt(beta V)
  e^(i omega_n^s tau+i bold(p)_bold(k) dot bold(x)),
  quad
  X:=(tau,bold(x)).
$ <eq:normalized-thermal-plane-wave-basis>

在任一边界条件扇区内，任意两个时间频率之差都是 $2 pi/beta$ 的整数倍. 结合时间与空间正交性可得

$
  integral_0^beta dd(tau) integral_V dd(x, [3])
  [u_(n bold(k))^((s)) (X)]^*
  u_(m bold(l))^((s)) (X)
  =delta_(n m) delta_(bold(k) bold(l)).
$ <eq:finite-thermal-box-orthogonality>

玻色模与费米模分别构成周期和反周期函数空间的正交基. 因此，使用 @eq:finite-thermal-box-orthogonality 时，两个因子必须取相同的 $s$. 该扇区中的任意场均可展开为

$
          f_s (X) & =sum_(n in ZZ) sum_(bold(k) in ZZ^3)
                    u_(n bold(k))^((s)) (X) f_(n bold(k))^s, \
  f_(n bold(k))^s & =integral_0^beta dd(tau) integral_V dd(x, [3])
                    [u_(n bold(k))^((s)) (X)]^* f_s (X).
$ <eq:finite-thermal-box-fourier-transform>

这就是四个紧致方向上的普通 Fourier 级数；此时尚未出现连续 delta 函数.

=== 完备性与热 delta 函数

基的完备性意味着

$
  sum_(n in ZZ) sum_(bold(k) in ZZ^3)
  u_(n bold(k))^((s)) (X)
  [u_(n bold(k))^((s)) (Y)]^*
  =delta_beta^s (tau_x-tau_y)
  delta_V^((3)) (bold(x)-bold(y)),
$ <eq:finite-thermal-box-completeness>

其中时间核与空间核定义为

$
       delta_beta^s (tau) & :=1/beta sum_(n in ZZ) e^(i omega_n^s tau), \
  delta_V^((3)) (bold(x)) & :=1/V sum_(bold(k) in ZZ^3)
                            e^(i bold(p)_bold(k) dot bold(x)).
$ <eq:thermal-and-spatial-periodic-deltas>

空间核就是盒中的周期 delta 函数. 两个时间核可以在覆盖直线上写成镜像和：

$
  delta_beta^B (tau) & =sum_(r in ZZ) delta (tau-r beta), \
  delta_beta^F (tau) & =sum_(r in ZZ) (-1)^r delta (tau-r beta).
$ <eq:bosonic-fermionic-delta-image-sums>

于是 $delta_beta^B (tau+beta)=delta_beta^B (tau)$，而 $delta_beta^F (tau+beta)=-delta_beta^F (tau)$. 后者充当反周期函数空间上的恒等核. 对半开基本区域内的 $X$，有

$
  integral_0^beta dd(tau_y) integral_V dd(y, [3])
  delta_beta^s (tau_x-tau_y)
  delta_V^((3)) (bold(x)-bold(y)) f_s (Y)
  =f_s (X).
$ <eq:thermal-delta-reproducing-property>

@eq:finite-thermal-box-orthogonality 与 @eq:finite-thermal-box-completeness 互为补充：正交性用于提取模系数，完备性用于重构函数，并确定微分算符作用于其 Green 函数时出现的 delta 核.

=== 热力学极限与求和积分

保持 $T$ 不变并令 $L arrow.r infinity$，空间动量格点随之变得稠密，且

$
  1/V sum_(bold(k) in ZZ^3)
  arrow.r integral (dd(p, [3]))/((2 pi)^3)
  =:integral_bold(p).
$ <eq:spatial-thermodynamic-limit>

紧致的时间方向仍保持离散. 定义 Euclidean 热四动量及其与位置的缩并为

$
        P_s & :=(omega_n^s,bold(p)), \
  P_s dot X & :=omega_n^s tau+bold(p) dot bold(x), \
      P_s^2 & :=(omega_n^s)^2+bold(p)^2.
$ <eq:euclidean-thermal-four-momentum>

指标 $s$ 用来记录求和所处的频率格. 下列记号分别专用于玻色与费米求和积分：

$
  integral_(P_B) F (P_B) & :=T sum_(n in ZZ) integral_bold(p)
                           F (omega_n^B,bold(p)), \
  integral_(P_F) F (P_F) & :=T sum_(n in ZZ) integral_bold(p)
                           F (omega_n^F,bold(p)).
$ <eq:bosonic-fermionic-sum-integrals>

下标 $P_B$ 或 $P_F$ 是记号的一部分；只要边界条件扇区可能混淆，就不能省略. 按此约定，实际计算所用的 Fourier 变换为

$
    f_s (X) & =integral_(P_s) e^(i P_s dot X) f_s (P_s), \
  f_s (P_s) & =integral_0^beta dd(tau) integral dd(x, [3])
              e^(-i P_s dot X) f_s (X).
$ <eq:thermal-fourier-transform-continuum-space>

对于实周期标量场，$phi (P_B)^*=phi (-P_B)$，其中 $-P_B=(-omega_n^B,-bold(p))$ 对应于将 $n$ 替换为 $-n$. 空间连续极限下的正交关系为

$
  integral_0^beta dd(tau) integral dd(x, [3])
  e^(i (P_s-Q_s) dot X)
  =beta delta_(n m) (2 pi)^3
  delta^((3)) (bold(p)-bold(q)),
$ <eq:thermal-plane-wave-orthogonality-continuum-space>

其中 $P_s=(omega_n^s,bold(p))$ 与 $Q_s=(omega_m^s,bold(q))$ 属于同一扇区. 完备性则变为

$
  integral_(P_s) e^(i P_s dot (X-Y))
  =delta_beta^s (tau_x-tau_y)
  delta^((3)) (bold(x)-bold(y)).
$ <eq:thermal-plane-wave-completeness-continuum-space>

完备性要求求和积分包含因子 $T=1/beta$；遗漏该因子会把恒等核错误地放大为 $beta delta_beta^s$.

上述 Fourier 约定还把微分运算化为乘法：

$
                   partial_tau & arrow.r i omega_n^s, \
                   bold(nabla) & arrow.r i bold(p), \
  -partial_tau^2-bold(nabla)^2 & arrow.r P_s^2.
$ <eq:thermal-fourier-derivative-rules>

这就实现了对 Euclidean 动能算符的对角化. 第 3.3--3.5 节将分别对标量、Dirac 与规范场的具体核求逆.

=== 频率守恒与零模

热场乘积的边界符号等于各因子边界符号之积. 因此，两个玻色场或两个费米场的乘积满足周期条件，而玻色场与费米场的乘积满足反周期条件. 在频率格上，这一规则表现为

$
  omega_n^B+omega_m^B & =omega_(n+m)^B, \
  omega_n^F+omega_m^B & =omega_(n+m)^F, \
  omega_n^F-omega_m^F & =omega_(n-m)^B, \
  omega_n^F+omega_m^F & =omega_(n+m+1)^B.
$ <eq:matsubara-frequency-bookkeeping>

这些恒等式就是有限温度下的能量记账规则. 若一组平面波的乘积沿热圆满足周期条件，则其总频率必落在玻色频率格上. 定义

$
  Omega:=sum_(a=1)^r omega_a,
  quad
  N_Omega:=(beta Omega)/(2 pi) in ZZ.
$ <eq:total-matsubara-frequency-index>

在一个周期上积分得到

$
  integral_0^beta dd(tau) integral dd(x, [3])
  e^(i Omega tau+i sum_(a=1)^r bold(p)_a dot bold(x))
  =beta (2 pi)^3
  delta_(N_Omega 0)
  delta^((3)) (sum_(a=1)^r bold(p)_a).
$ <eq:thermal-frequency-momentum-conservation>

@eq:thermal-frequency-momentum-conservation 中的时间 delta 是频率整数指标上的 Kronecker delta. 入射与出射动量通过 $omega_a$ 和 $bold(p)_a$ 所带的符号区分. 局域作用量项必须为 Grassmann 偶量，因此在通常的玻色--费米理论中包含偶数个费米场；其被积函数满足周期条件，故适用上述守恒关系.

两类频率格在原点附近具有不同结构：

$
  omega_0^B=0,
  quad
  abs(omega_n^F)>=pi T>0.
$ <eq:bosonic-zero-mode-fermionic-gap>

因此，玻色场含有与时间无关的 Matsubara 模，费米场则没有. 玻色零模往往支配长距离热物理，也是后续章节中红外敏感性的来源；在本章中，它还只是基底中一个特殊的模，尚无需引入重求和或有效理论描述.

=== 连续 Euclidean 频率的恢复

两类 Matsubara 频率格的间距均为 $Delta omega=2 pi T$. 若函数足够正则并在大频率处衰减，则

$
  T sum_(n in ZZ) F (omega_n^s)
  =1/(2 pi) sum_(n in ZZ)
  Delta omega F (omega_n^s)
  arrow.r integral_( -infinity)^infinity
  (dd(p_4))/(2 pi) F (p_4)
$ <eq:zero-temperature-matsubara-limit>

当 $T arrow.r 0$（等价于 $beta arrow.r infinity$）时成立. 频率间距趋于零以后，费米频率格相对玻色格的半格偏移不再重要. 因此

$
  integral_(P_B) F (P_B) & arrow.r integral (dd(p_E, [4]))/((2 pi)^4) F (p_E), \
  integral_(P_F) F (P_F) & arrow.r integral (dd(p_E, [4]))/((2 pi)^4) F (p_E).
$ <eq:zero-temperature-sum-integral-limit>

与此同时，$delta_beta^s (tau)$ 趋于直线上的普通 delta 函数，@eq:thermal-fourier-transform-continuum-space 也退化为第二章末尾所用的零温 Euclidean Fourier 变换.

Matsubara 频率是 $-i partial_tau$ 的本征值，与可测的 Minkowski 能量属于不同概念. 要得到实时 Green 函数，应先把 Matsubara 数据组织成复频率函数，再对该函数作解析延拓；直接替换 Fourier 级数中的频率没有这一含义. 下文保留 Euclidean 标记 $P_B$ 或 $P_F$ 以示区分.

== 自由标量场的热力学

本节以自由标量气体的配分函数作为第一个完整的热场论计算. 场论起点是 $S_beta^1 times RR^3$ 上未归一化的 Euclidean 路径积分. 上一节已经建立周期 Fourier 基及相应的玻色 Matsubara 频率，余下工作就是对角化二次核并计算其泛函行列式.

我们先处理单个实标量场，分离真空贡献后求出压强. 实标量场没有受对称性保护的粒子数荷，因此化学势必须取零. 复标量场则具有守恒的 $U (1)$ 荷，可以定义真正的巨正则系综及压强 $p (T,mu)$. 最后，在同一 Gaussian 泛函中加入外源，求得热二点函数.

=== 实标量场的泛函行列式

==== Matsubara 基中的周期 Gaussian 积分

记

$
  integral_beta dd(X)
  :=integral_0^beta dd(tau) integral dd(x, [3]),
  quad
  X=(tau,bold(x)).
$ <eq:thermal-spacetime-integral-shorthand>

对周期实标量场，将 @eq:thermal-scalar-euclidean-action 分部积分可得

$
  S_(E,beta) [phi] & =1/2 integral_beta dd(X)
                     phi (X)cal(K)_0 phi (X), \
          cal(K)_0 & :=-partial_tau^2-bold(nabla)^2+m^2.
$ <eq:thermal-real-scalar-quadratic-kernel>

为在取连续极限之前严格定义行列式，暂时回到 @eq:finite-thermal-box-domain 的有限热盒. 按 @eq:normalized-thermal-plane-wave-basis 中的归一化玻色基展开，得到

$
  phi (X)
  =sum_(n in ZZ) sum_(bold(k) in ZZ^3)
  u_(n bold(k))^((B)) (X)phi_(n bold(k)),
  quad
  phi_(-n,-bold(k))=phi_(n bold(k))^*.
$ <eq:thermal-real-scalar-finite-box-expansion>

令 $E_k:=sqrt(bold(p)_bold(k)^2+m^2)$，利用 @eq:thermal-fourier-derivative-rules 的微分规则，作用量化为

$
  S_(E,beta) [phi]
  =1/2 sum_(n in ZZ) sum_(bold(k) in ZZ^3)
  phi_(-n,-bold(k))
  [(omega_n^B)^2+E_k^2]
  phi_(n bold(k)).
$ <eq:thermal-real-scalar-diagonal-action>

因此，未归一化热路径积分是普通 Gaussian 积分的正规化乘积：

$
  Z_(beta,r) & :=integral_("periodic") cal(D) phi
               e^(-S_(E,beta) [phi]) \
             & =cal(N)_r [upright("det")_B cal(K)_0]^(-1/2).
$ <eq:thermal-real-scalar-functional-determinant>

下标 $B$ 表示行列式取在周期玻色函数空间上. 幂次 $-1/2$ 来自实 Gaussian 积分；@eq:thermal-real-scalar-finite-box-expansion 中的实条件保证 $P_B$ 与 $-P_B$ 不会被误当作两个独立复场重复计数. 取对数得到

$
  log Z_(beta,r)
  =-1/2 sum_(n in ZZ) sum_(bold(k) in ZZ^3)
  log[(omega_n^B)^2+E_k^2]
  +log cal(N)_r.
$ <eq:thermal-real-scalar-trace-log>

测度归一化 $cal(N)_r$ 由第 3.1 节的时间切片构造确定. 其中与场无关的部分不会影响下文经真空减除后的热压强.

==== Matsubara 对数和与压强

引入单模 Matsubara 和

$
  cal(I)_B (E)
  :=T sum_(n in ZZ)
  log[(omega_n^B)^2+E^2].
$ <eq:bosonic-matsubara-log-sum-definition>

先微分再求和更为简便. 利用 @eq:bosonic-fermionic-matsubara-frequencies 所定义频率格上的标准玻色级数，有

$
  (partial cal(I)_B (E))/(partial E) & =2 E T sum_(n in ZZ)
                                       1/((omega_n^B)^2+E^2) \
                                     & =coth(beta E/2)
                                       =1+2 n_B (E), \
                             n_B (E) & :=1/(e^(beta E)-1).
$ <eq:bosonic-propagator-sum>

对 $E$ 积分得到

$
  cal(I)_B (E)
  =E+2 T log(1-e^(-beta E))+C (T),
$ <eq:bosonic-matsubara-log-sum>

其中 $C (T)$ 与 $E$ 无关，可吸收到正规化测度的归一化中. 将结果代入 @eq:thermal-real-scalar-trace-log，并使用 @eq:spatial-thermodynamic-limit 的热力学极限，得到

$
  T/V log Z_(beta,r)
  =-1/2 integral_bold(p) E_p
  -T integral_bold(p)
  log(1-e^(-beta E_p)),
  quad
  E_p:=sqrt(bold(p)^2+m^2).
$ <eq:thermal-real-scalar-pressure-before-subtraction>

第一项是零温真空压强 $p_("vac")=-1/2 integral_bold(p)E_p$，它具有紫外发散，必须由真空能重整化条件固定. 减去该项后，定义纯热配分函数与压强：

$
  1/V log Z_(beta,r,"th") & :=-integral_bold(p)
                            log(1-e^(-beta E_p)), \
                  p_r (T) & :=T/V log Z_(beta,r,"th") \
                          & =-T integral_bold(p)
                            log(1-e^(-beta E_p)).
$ <eq:thermal-real-scalar-pressure>

相应的热能量密度为

$
  epsilon_r (T)
  :=-1/V
  (partial log Z_(beta,r,"th"))/(partial beta)
  =integral_bold(p) E_p n_B (E_p).
$ <eq:thermal-real-scalar-energy-density>

对压强积分作分部积分，还可写成等价形式

$
  p_r (T)
  =1/3 integral_bold(p)
  (bold(p)^2)/(E_p)n_B (E_p).
$ <eq:thermal-real-scalar-pressure-kinetic-form>

对于无质量实标量场，应先正规化严格常数模，再取 $m arrow.r 0$. 于是

$
  p_r (T)=pi^2/90 T^4,
  quad
  epsilon_r (T)=pi^2/30 T^4=3 p_r (T).
$ <eq:massless-real-scalar-pressure>

该系数对应一个实玻色自由度. 整个推导只用到周期路径积分、Matsubara 频谱与真空减除，并未直接计算 Fock 空间上的迹.

化学势只能与严格守恒的荷耦合. 自由实标量场的振子数虽然偶然与自由 Hamiltonian 对易，但加入相互作用后并无局域对称性保护这一性质. 因此，热平衡实标量场必须取 $mu=0$.

=== 复标量场的巨正则系综

==== Euclidean 核中的化学势

复标量场具有 @eq:complex-scalar-charge-operator 所给的守恒荷，因而可以定义

$
  cal(Z)_(beta,mu)
  :=upright("Tr")
  e^(-beta [hat(H)-mu hat(Q)]),
  quad
  [hat(H),hat(Q)]=0.
$ <eq:complex-scalar-grand-canonical-ensemble>

在相空间中推导热路径积分时，沿 Euclidean 时间圆的生成元应改为 $hat(H)-mu hat(Q)$. 作 Wick 转动后，一阶 Euclidean 作用量为

$
  S_(E,beta,mu)^((1))
  :=integral_beta dd(X)
  [
    pi^dagger pi
    -i pi (partial_tau-mu)phi
    -i pi^dagger (partial_tau+mu)phi^dagger
    +bold(nabla)phi^dagger dot bold(nabla)phi
    +m^2 phi^dagger phi
  ].
$ <eq:complex-scalar-grand-canonical-phase-space-action>

含正则动量的各项可以配方为

$
  pi^dagger pi
  -i pi (partial_tau-mu)phi
  -i pi^dagger (partial_tau+mu)phi^dagger & =[pi^dagger-i (partial_tau-mu)phi]
                                            [pi-i (partial_tau+mu)phi^dagger] \
                                          & quad +(partial_tau+mu)phi^dagger
                                            (partial_tau-mu)phi.
$ <eq:complex-scalar-grand-canonical-momentum-square>

对 $pi$ 与 $pi^dagger$ 积分后，只留下一个与场无关的行列式，并得到位形空间泛函

$
  cal(Z)_(beta,mu)
  =integral_("periodic") cal(D) phi cal(D) phi^dagger
  e^(-S_(E,beta,mu) [phi,phi^dagger]),
$ <eq:complex-scalar-grand-canonical-path-integral>

其中

$
  S_(E,beta,mu) [phi,phi^dagger]
  :=integral_beta dd(X)
  [
    (partial_tau+mu)phi^dagger (X)
    (partial_tau-mu)phi (X)
    +bold(nabla)phi^dagger (X) dot bold(nabla)phi (X)
    +m^2 phi^dagger (X)phi (X)
  ].
$ <eq:complex-scalar-chemical-potential-action>

两个积分变量仍满足周期边界条件. 化学势表现为常数的虚 Euclidean 规范势. 通过场重定义可以把它移入扭曲边界条件，但不能同时在核中保留频率平移并施加该扭曲条件，否则会重复计入化学势.

分部积分后，作用于 $phi$ 的算符为

$
  cal(K)_mu
  :=-(partial_tau-mu)^2-bold(nabla)^2+m^2.
$ <eq:complex-scalar-chemical-potential-kernel>

使用第 3.2 节的玻色 Fourier 变换，有

$
  S_(E,beta,mu)
  =integral_(P_B)
  phi^dagger (-P_B)
  [(omega_n^B+i mu)^2+E_p^2]
  phi (P_B).
$ <eq:complex-scalar-shifted-matsubara-action>

平移后的单个模本征值一般为复数，但成对相乘后的完整行列式仍为实数. 在正常相中，其实部必须有下界. 特别地，静态均匀模的本征值为 $m^2-mu^2$，故 Gaussian 积分收敛要求

$
  abs(mu)<m.
$ <eq:complex-scalar-chemical-potential-bound>

当 $abs(mu)=m$ 时，该模成为零模，无凝聚的 Gaussian 描述随即失效. 在固定荷密度下越过这一边界，必须引入 Bose--Einstein 凝聚.

==== 行列式、巨势与荷密度

复 Gaussian 积分给出逆行列式；实场 Gaussian 积分对应逆平方根：

$
  cal(Z)_(beta,mu)
  =cal(N)_c [upright("det")_B cal(K)_mu]^(-1).
$ <eq:complex-scalar-grand-functional-determinant>

定义

$
  cal(I)_B (E,mu)
  :=T sum_(n in ZZ)
  log[(omega_n^B+i mu)^2+E^2].
$ <eq:complex-scalar-shifted-log-sum-definition>

对 $E$ 微分得到

$
  (partial cal(I)_B (E,mu))/(partial E) & =2 E T sum_(n in ZZ)
                                          1/((omega_n^B+i mu)^2+E^2) \
                                        & =1+n_B (E-mu)+n_B (E+mu).
$ <eq:complex-scalar-shifted-propagator-sum>

从而

$
  cal(I)_B (E,mu)
  =E
  +T log(1-e^(-beta (E-mu)))
  +T log(1-e^(-beta (E+mu)))
  +C (T).
$ <eq:complex-scalar-shifted-log-sum>

积分常数由条件 $cal(I)_B (E,mu)-cal(I)_B (E,0) arrow.r 0$（$E arrow.r infinity$）固定；保持荷对称性的正规化不会引入额外的 $mu$ 依赖归一化. 式中的 $E$ 项是复标量场的零点能，反映了复场含有两个实自由度. 减去这一真空项后，热巨势与压强为

$
  Omega_c (T,mu) & :=-T log cal(Z)_(beta,mu,"th"), \
      p_c (T,mu) & :=- (Omega_c (T,mu))/V \
                 & =-T integral_bold(p)
                   [
                     log(1-e^(-beta (E_p-mu)))
                     +log(1-e^(-beta (E_p+mu)))
                   ].
$ <eq:complex-scalar-grand-canonical-pressure>

两个对数分别来自粒子与反粒子. 对巨势求导即可得到荷密度：

$
  q (T,mu)
  :=(partial p_c (T,mu))/(partial mu)
  =integral_bold(p)
  [
    n_B (E_p-mu)-n_B (E_p+mu)
  ].
$ <eq:complex-scalar-grand-canonical-charge-density>

压强是 $mu$ 的偶函数，荷密度则是奇函数. 当化学势为零时，

$
  p_c (T,0)=2 p_r (T),
  quad
  q (T,0)=0.
$ <eq:complex-scalar-zero-mu-thermodynamics>

这里的因子二直接来自泛函行列式的幂次. 对 $mu=0$ 的无质量复标量场，在正规化严格常数模后有 $p_c (T,0)=pi^2 T^4/45$.

=== 由同一 Gaussian 泛函得到热传播子

==== 实标量场的逆核

在未归一化实标量泛函中引入周期外源：

$
  Z_(beta,r) [J]
  :=integral_("periodic") cal(D) phi
  exp[
    -S_(E,beta) [phi]
    +integral_beta dd(X)J (X)phi (X)
  ].
$ <eq:thermal-real-scalar-sourced-functional>

配方后得到

$
  Z_(beta,r) [J]
  =Z_(beta,r) [0]
  exp[
    1/2 integral_beta dd(X) integral_beta dd(Y)
    J (X)G_beta (X-Y)J (Y)
  ].
$ <eq:thermal-real-scalar-sourced-gaussian>

行列式保留在 $Z_(beta,r) [0]$ 中并决定压强. 除以该因子，即得到 @eq:free-thermal-scalar-master-functional 的归一化生成泛函. 相应逆核为

$
  G_beta (P_B)
  =1/(P_B^2+m^2)
  =1/((omega_n^B)^2+E_p^2).
$ <eq:thermal-real-scalar-propagator-momentum-space>

在坐标空间中，

$
  G_beta (X-Y)
  =integral_(P_B)
  (e^(i P_B dot (X-Y)))/(P_B^2+m^2),
$ <eq:thermal-real-scalar-propagator-coordinate-space>

再利用 @eq:thermal-plane-wave-completeness-continuum-space 的完备性，得到

$
  [-partial_(tau_x)^2-bold(nabla)_x^2+m^2]
  G_beta (X-Y)
  =delta_beta^B (tau_x-tau_y)
  delta^((3)) (bold(x)-bold(y)).
$ <eq:thermal-real-scalar-green-equation>

传播子关于虚时间变量满足周期条件. 当 $0<=tau<=beta$ 时，其混合表象为

$
  G_beta (tau,bold(p)) & :=T sum_(n in ZZ)
                         (e^(i omega_n^B tau))/((omega_n^B)^2+E_p^2) \
                       & =1/(2 E_p)
                         [
                           (1+n_B (E_p))e^(-E_p tau)
                           +n_B (E_p)e^(E_p tau)
                         ].
$ <eq:thermal-scalar-mixed-propagator-closed-form>

在 $tau=0$ 处，该式退化为 @eq:bosonic-propagator-sum 所用的传播子和；$tau=0$ 与 $tau=beta$ 处取值相等，正是玻色 KMS 条件. 随着 $T arrow.r 0$，占据数趋于零，且 $G_beta (tau,bold(p))$ 趋于 $e^(-E_p abs(tau))/(2 E_p)$.

==== 非零化学势下的带荷传播子

这里采用由 $hat(H)-mu hat(Q)$ 生成的虚时间演化，与 @eq:complex-scalar-grand-canonical-path-integral 中的周期变量相匹配. 若改用 $hat(H)$ 定义演化，则同一化学势会从核中转移到扭曲的 KMS 边界条件中.

通过 $integral_beta dd(X)[overline(J) (X)phi (X)+phi^dagger (X)J (X)]$ 引入两个独立的周期外源. 复 Gaussian 积分给出

$
  cal(Z)_(beta,mu) [overline(J),J]
  =cal(Z)_(beta,mu) [0,0]
  exp[
    integral_beta dd(X) integral_beta dd(Y)
    overline(J) (X)G_beta^((+)) (X-Y;mu)J (Y)
  ].
$ <eq:complex-scalar-grand-canonical-sourced-gaussian>

两种场序分别使用这一逆核及其转置. 在动量空间中定义

$
  G_beta^((+)) (P_B;mu) & :=1/((omega_n^B+i mu)^2+E_p^2), \
  G_beta^((-)) (P_B;mu) & :=1/((omega_n^B-i mu)^2+E_p^2)
                          =G_beta^((+)) (-P_B;mu).
$ <eq:complex-scalar-shifted-propagators>

其中 $G_beta^((+))$ 对应 $phi$ 与 $phi^dagger$ 的缩并，$G_beta^((-))$ 对应 $phi^dagger$ 与 $phi$ 的缩并. 当 $0<=tau<=beta$ 时，两者的混合表象为

$
  G_beta^((+)) (tau,bold(p);mu) & =1/(2 E_p)
                                  [
                                    (1+n_B (E_p-mu))e^(-(E_p-mu)tau)
                                    +n_B (E_p+mu)e^((E_p+mu)tau)
                                  ], \
  G_beta^((-)) (tau,bold(p);mu) & =1/(2 E_p)
                                  [
                                    (1+n_B (E_p+mu))e^(-(E_p+mu)tau)
                                    +n_B (E_p-mu)e^((E_p-mu)tau)
                                  ].
$ <eq:complex-scalar-shifted-mixed-propagators>

恒等式 $n_B (x)e^(beta x)=1+n_B (x)$ 保证两式均满足周期条件. 交换缩并方向会互换粒子与反粒子的权重. 当 $mu=0$ 时，两者都退化为实标量核，并由荷守恒得到

$
  chevron.l T_tau hat(phi) (X)hat(phi)^dagger (Y)
  chevron.r_(beta,mu=0) & =G_beta (X-Y), \
  chevron.l T_tau hat(phi)^dagger (X)hat(phi) (Y)
  chevron.r_(beta,mu=0) & =G_beta (Y-X), \
  chevron.l T_tau hat(phi) (X)hat(phi) (Y)
  chevron.r_(beta,mu=0) & =0.
$ <eq:thermal-complex-scalar-oriented-contractions>

这里的平移逆核同时生成 @eq:complex-scalar-shifted-propagator-sum；其迹对数决定巨正则压强，逆算符给出带荷热二点函数.
== 自由 Dirac 场的热力学

自由 Dirac 场具有第二章构造的严格整体 $U (1)$ 对称性，其守恒荷计数粒子数与反粒子数之差. 因此，化学势具有明确的物理意义，适当的研究对象是巨正则配分函数 $cal(Z)_(beta,mu)$. 与上一节相同，本节仍从场论出发：先在热圆上构造 Euclidean 二次核，计算其泛函行列式，再提取压强与荷密度；最后才把热传播子作为同一核的逆求出.

结果由费米场的两个特征决定. 第一，相干态热迹使场满足反周期边界条件，从而选出 $omega_n^F=(2n+1)pi T$；第二，Berezin 积分把行列式置于分子. 这两点共同把复标量场中的 Bose--Einstein 对数变为 Fermi--Dirac 对数，并消除了玻色情形对 $mu$ 的收敛限制.

=== 巨正则 Grassmann 泛函

==== 守恒荷与 Euclidean 核

正规序荷 @eq:dirac-normal-ordered-charge 赋予粒子电荷 $+1$、反粒子电荷 $-1$. 由于它与自由 Hamiltonian 对易，可以定义

$
  cal(Z)_(beta,mu)
  :=upright("Tr")
  e^(-beta [hat(H)-mu hat(Q)]),
  quad
  [hat(H),hat(Q)]=0.
$ <eq:dirac-grand-canonical-ensemble>

第一章的相干态构造首先给出 Euclidean 双线性作用量

$
  S_(E,beta,mu)
  =integral_beta dd(X)
  Psi^dagger (X)
  [partial_tau+cal(H)_D-mu]Psi (X),
$ <eq:dirac-grand-canonical-hamiltonian-action>

其中 $cal(H)_D$ 是 @eq:dirac-hamiltonian-equation 中的单粒子 Hamiltonian. 为在约定的转动 $t=-i tau$ 后将其写成协变形式，保留第二章的矩阵表示，并定义

$
                          tensor(gamma_E, +4) & :=tensor(gamma, +0), \
                          tensor(gamma_E, +i) & :=-i tensor(gamma, +i), \
  [tensor(gamma_E, +a),tensor(gamma_E, +b)]_+ & =2 tensor(delta, +a, +b)1_4.
$ <eq:thermal-euclidean-gamma-basis>

因此仍可使用 Minkowski gamma 矩阵，但空间分量必须带上 @eq:euclidean-gamma-continuation 所要求的因子 $-i$. 未经修改的 $tensor(gamma, +mu)$ 满足 mostly-plus Minkowski 代数，不能直接充当 Euclidean Clifford 基.

在时间切片双线性式中使用 $Psi^dagger=overline(Psi)tensor(gamma, +0)$，可将 @eq:dirac-grand-canonical-hamiltonian-action 改写为

$
  S_(E,beta,mu) [overline(Psi),Psi]
  :=integral_beta dd(X)
  overline(Psi) (X)cal(D)_(E,mu)Psi (X),
$ <eq:dirac-grand-canonical-euclidean-action>

其中

$
  cal(D)_(E,mu)
  :=tensor(gamma_E, +4)(partial_tau-mu)
  +tensor(gamma_E, +i)tensor(partial, -i)+m.
$ <eq:dirac-chemical-potential-kernel>

在随后的 Berezin 积分中，$Psi$ 与 $overline(Psi)$ 被视为相互独立的 Grassmann 变量，且都满足反周期条件：

$
            Psi (tau+beta,bold(x)) & =-Psi (tau,bold(x)), \
  overline(Psi) (tau+beta,bold(x)) & =-overline(Psi) (tau,bold(x)).
$ <eq:thermal-dirac-antiperiodic-fields>

这里的虚时间演化由 $hat(H)-mu hat(Q)$ 生成，因此 $mu$ 出现在核中，而边界条件仍为反周期. 利用非周期场重定义也可把 $mu$ 转移到扭曲的 KMS 条件中，但频率平移与边界扭曲不能同时施加. 项 $-mu overline(Psi)tensor(gamma_E, +4)Psi$ 表示化学势与守恒荷密度的耦合，也可视为与常数虚 Euclidean $U (1)$ 规范势的耦合.

==== 费米 Matsubara 行列式

对成对变量选取相反的 Fourier 相位：

$
            Psi (X) & =integral_(P_F) e^(i P_F dot X)Psi (P_F), \
  overline(Psi) (X) & =integral_(P_F) e^(-i P_F dot X)overline(Psi) (P_F).
$ <eq:thermal-dirac-fourier-expansion>

作用量于是化为

$
  S_(E,beta,mu)
  =integral_(P_F)
  overline(Psi) (P_F)
  cal(D)_(E,mu) (P_F)Psi (P_F),
$ <eq:thermal-dirac-shifted-diagonal-action>

其中

$
  cal(D)_(E,mu) (P_F) & :=i tensor(gamma_E, +4)(omega_n^F+i mu)
                        +i tensor(gamma_E, +i)tensor(p, -i)+m \
                      & =i tensor(gamma, +0)(omega_n^F+i mu)
                        +tensor(gamma, +i)tensor(p, -i)+m.
$ <eq:thermal-dirac-shifted-momentum-kernel>

第二行适用于直接使用第二章 Minkowski 矩阵的计算，其中明确保留了 Wick 转动因子和 Fourier 约定 $e^(i omega_n^F tau+i bold(p) dot bold(x))$.

正规化后的 Grassmann Gaussian 积分给出行列式：

$
  cal(Z)_(beta,mu)
  =cal(N)_D upright("det")_F cal(D)_(E,mu).
$ <eq:dirac-grand-functional-determinant>

对每个热动量，旋量行列式化为

$
  upright("det")_4 cal(D)_(E,mu) (P_F)
  =[(omega_n^F+i mu)^2+E_p^2]^2,
  quad
  E_p:=sqrt(bold(p)^2+m^2).
$ <eq:dirac-shifted-spinor-determinant>

平方来自二重自旋简并. 单个平移后的本征值虽为复数，但 $(-omega_n^F,-bold(p))$ 模提供其复共轭，因此完整行列式仍为实数. 在有限盒中，

$
  log cal(Z)_(beta,mu)
  =2 sum_(n in ZZ) sum_(bold(k) in ZZ^3)
  log[(omega_n^F+i mu)^2+E_k^2]
  +log cal(N)_D.
$ <eq:dirac-grand-canonical-trace-log>

=== 巨势、压强与荷

==== 平移后的 Matsubara 对数和

定义单模求和
$
  cal(I)_F (E,mu)
  :=T sum_(n in ZZ)
  log[(omega_n^F+i mu)^2+E^2].
$ <eq:dirac-shifted-log-sum-definition>

与标量行列式一样，先微分再求和. 费米频率格给出

$
  (partial cal(I)_F (E,mu))/(partial E) & =2 E T sum_(n in ZZ)
                                          1/((omega_n^F+i mu)^2+E^2) \
                                        & =1-n_F (E-mu)-n_F (E+mu), \
                                n_F (x) & :=1/(e^(beta x)+1).
$ <eq:dirac-shifted-propagator-sum>

对 $E$ 积分得到

$
  cal(I)_F (E,mu)
  =E
  +T log(1+e^(-beta (E-mu)))
  +T log(1+e^(-beta (E+mu)))
  +C_F (T).
$ <eq:dirac-shifted-log-sum>

积分常数由条件 $cal(I)_F (E,mu)-cal(I)_F (E,0) arrow.r 0$（$E arrow.r infinity$）固定. 保持矢量 $U (1)$ 对称性的正规化不会引入额外的 $mu$ 依赖项. 结合 @eq:dirac-grand-canonical-trace-log 中的自旋因子可知，首项产生负的 Dirac 海真空能，等价地给出正的发散真空压强 $2 integral_bold(p)E_p$. 对任意 $T$ 与 $mu$，我们都使用同一固定的真空重整化条件将其减去.

==== 热力学观测量

完成真空减除并取空间热力学极限后，定义

$
  Omega_D (T,mu) & :=-T log cal(Z)_(beta,mu,"sub"), \
      p_D (T,mu) & :=- (Omega_D (T,mu))/V \
                 & =2T integral_bold(p)
                   [
                     log(1+e^(-beta (E_p-mu)))
                     +log(1+e^(-beta (E_p+mu)))
                   ].
$ <eq:dirac-grand-canonical-pressure>

因子二计数两个自旋态；两个对数分别计数电荷为 $+1$ 的粒子与电荷为 $-1$ 的反粒子. 对压强关于化学势求导得到净荷密度

$
  q_D (T,mu)
  :=(partial p_D (T,mu))/(partial mu)
  =2 integral_bold(p)
  [
    n_F (E_p-mu)-n_F (E_p+mu)
  ].
$ <eq:dirac-grand-canonical-charge-density>

令 $s_D:=(partial p_D)/(partial T)$，经真空减除的内能密度可由 $epsilon_D=-p_D+T s_D+mu q_D$ 得到，也可直接对热迹微分：

$
  epsilon_D (T,mu)
  =2 integral_bold(p) E_p
  [
    n_F (E_p-mu)+n_F (E_p+mu)
  ].
$ <eq:dirac-grand-canonical-energy-density>

分部积分可将压强写成动理学形式

$
  p_D (T,mu)
  =2/3 integral_bold(p) (bold(p)^2)/(E_p)
  [
    n_F (E_p-mu)+n_F (E_p+mu)
  ].
$ <eq:dirac-grand-canonical-pressure-kinetic-form>

这些公式直接显示出对称性：$p_D$ 与 $epsilon_D$ 是 $mu$ 的偶函数，$q_D$ 则是奇函数. 当化学势为零时，

$
  p_D (T,0)
  =4T integral_bold(p)log(1+e^(-beta E_p)),
  quad
  q_D (T,0)=0.
$ <eq:dirac-zero-chemical-potential-thermodynamics>

此处的因子四具有直接的自由度解释：粒子支与反粒子支各有两个自旋态.

==== Fermi 面与无质量极限

Dirac 场不存在复标量场的 $abs(mu)<m$ 限制.Berezin 积分是代数运算，不要求二次型正定；Pauli 不相容原理又禁止同一模被无限占据. 在零温下，

$
  n_F (E-mu) & arrow.r theta (mu-E), \
  n_F (E+mu) & arrow.r theta (-mu-E).
$ <eq:zero-temperature-fermi-distributions>

$abs(mu)=m$ 标志密度开始出现，体系在此处保持稳定. 零温 Fermi 动量为

$
  p_F:=sqrt(mu^2-m^2)
  quad "当" quad abs(mu)>m.
$ <eq:dirac-fermi-momentum>

当 $mu>m$ 时形成粒子 Fermi 海；当 $mu < -m$ 时形成反粒子 Fermi 海. 相应荷密度为

$
  q_D (0,mu)
  =cases(
    upright("sgn") (mu)(p_F^3)/(3 pi^2) & abs(mu)>m,
    0 & abs(mu)<=m
  ).
$ <eq:zero-temperature-dirac-charge-density>

在 $abs(mu)<m$ 时，经真空减除的零温压强同样为零. 只要温度非零，Fermi--Dirac 分布的尾部就会把这一阈值平滑化.

对单个无质量 Dirac 场，动量积分可以精确完成：

$
        p_D (T,mu) & =7 pi^2/180 T^4+mu^2 T^2/6+mu^4/(12 pi^2), \
        q_D (T,mu) & =mu T^2/3+mu^3/(3 pi^2), \
  epsilon_D (T,mu) & =3 p_D (T,mu).
$ <eq:massless-dirac-grand-canonical-thermodynamics>

当 $mu=0$ 时，对每个相匹配的自由度，费米压强是无质量玻色压强的 $7/8$. 这一因子由反周期 Matsubara 频率格产生.

=== 由同一核得到热传播子

传播子现在只是热力学计算的派生结果. 按固定次序 $overline(eta)Psi+overline(Psi)eta$ 加入独立的反周期 Grassmann 外源，得到

$
  cal(Z)_(beta,mu) [overline(eta),eta]
  =cal(Z)_(beta,mu) [0,0]
  exp[
    integral_beta dd(X) integral_beta dd(Y)
    overline(eta) (X)S_(beta,mu) (X-Y)eta (Y)
  ],
$ <eq:dirac-grand-canonical-sourced-gaussian>

其中 @eq:thermal-dirac-shifted-momentum-kernel 的逆为

$
  S_(beta,mu) (P_F) & =[cal(D)_(E,mu) (P_F)]^(-1) \
                    & =[-i tensor(gamma_E, +4)(omega_n^F+i mu)
                        -i tensor(gamma_E, +i)tensor(p, -i)+m]/
                      ((omega_n^F+i mu)^2+E_p^2).
$ <eq:dirac-grand-canonical-propagator>

因此

$
  cal(D)_(E,mu,x)S_(beta,mu) (X-Y)
  =delta_beta^F (tau_x-tau_y)
  delta^((3)) (bold(x)-bold(y))1_4.
$ <eq:dirac-grand-canonical-green-equation>

为明确显示粒子与反粒子权重，引入

$
  g_(beta,mu)^F (tau,bold(p))
  :=T sum_(n in ZZ)
  (e^(i omega_n^F tau))/
  ((omega_n^F+i mu)^2+E_p^2).
$ <eq:dirac-shifted-scalar-denominator>

当 $0<tau<beta$ 时，

$
  g_(beta,mu)^F (tau,bold(p))
  =1/(2 E_p)
  [
    (1-n_F (E_p-mu))e^(-(E_p-mu)tau)
    -n_F (E_p+mu)e^((E_p+mu)tau)
  ].
$ <eq:dirac-shifted-scalar-denominator-closed-form>

再作用旋量分子，得到

$
  S_(beta,mu) (tau,bold(p)) & =((1-n_F (E_p-mu))/(2 E_p))
                              [
                                E_p tensor(gamma_E, +4)
                                -i tensor(gamma_E, +i)tensor(p, -i)+m
                              ]e^(-(E_p-mu)tau) \
                            & quad +((n_F (E_p+mu))/(2 E_p))
                              [
                                E_p tensor(gamma_E, +4)
                                +i tensor(gamma_E, +i)tensor(p, -i)-m
                              ]e^((E_p+mu)tau).
$ <eq:dirac-grand-canonical-mixed-propagator>

因此，压强与荷密度中出现的同一组占据数也控制传播. 恒等式 $n_F (x)e^(beta x)=1-n_F (x)$ 保证反周期性，并给出端点跳跃

$
  S_(beta,mu) (tau+beta,bold(p)) & =-S_(beta,mu) (tau,bold(p)), \
   S_(beta,mu) (0^+,bold(p))
   +S_(beta,mu) (beta^-,bold(p)) & =tensor(gamma_E, +4).
$ <eq:dirac-grand-canonical-propagator-checks>

这一跳跃由正则等时反对易关系固定，因而与 $T$ 和 $mu$ 均无关；平滑部分通过 $n_F (E_p-mu)$ 与 $n_F (E_p+mu)$ 保留热态信息.

== 自由光子场的热力学

自由光子是无质量自旋一粒子，物理单粒子态只有 $lambda=+1$ 与 $lambda=-1$ 两种螺旋度；有质量矢量粒子则有三种偏振. 因此，计算直接从第二章构造的物理横向场出发. 其泛函行列式给出黑体配分函数，逆核给出热横向传播子.

这一约化处理足以讨论自由光子的热力学. 系统的协变路径积分则必须先引入规范固定条件及相应行列式，再对四分量核求逆. 待后文把规范场作为动力学自由度处理时，我们再建立这一构造，并区分依赖规范选择的势传播子与规范不变观测量.

=== 物理横向模

==== 约化 Euclidean 作用量

选取 @eq:maxwell-radiation-gauge 的辐射规范代表元：

$
  tensor(A, -0)=0,
  quad
  tensor(partial, +i)tensor(A, -i)=0.
$ <eq:thermal-photon-radiation-gauge>

剩余场 $tensor(A^T, -i)$ 在热圆上满足周期条件. 按照约定的 Wick 转动 $t=-i tau$，其自由 Euclidean 作用量为

$
              S_(E,beta,gamma) [A^T] & :=1/2 integral_beta dd(X)
                                       tensor(A^T, -i) (X)
                                       cal(K)_gamma
                                       tensor(A^T, +i) (X), \
                        cal(K)_gamma & :=-partial_tau^2-bold(nabla)^2, \
  tensor(A^T, -i) (tau+beta,bold(x)) & =tensor(A^T, -i) (tau,bold(x)).
$ <eq:thermal-transverse-photon-action>

对于非零空间动量，定义横向投影算符

$
  tensor(P^T, -i, -j) (bold(p))
  :=tensor(delta, -i, -j)
  -(tensor(p, -i)tensor(p, -j))/(bold(p)^2).
$ <eq:thermal-transverse-projector>

它满足

$
          tensor(p, +i)tensor(P^T, -i, -j) (bold(p)) & =0, \
                       tensor(P^T, -i, +k) (bold(p))
                       tensor(P^T, -k, -j) (bold(p)) & =tensor(P^T, -i, -j) (bold(p)), \
  tensor(delta, +i, +j)tensor(P^T, -i, -j) (bold(p)) & =2.
$ <eq:thermal-transverse-projector-properties>

最后一行给出了场论中的自由度计数，与 @eq:maxwell-physical-polarization-space 和 @eq:maxwell-transverse-polarization-completeness 所导出的二维偏振空间相同. 等价地，可选取两个实的正交归一横向矢量 $bold(e)_a (bold(p))$，$a=1,2$. 在有限盒中，作用量对角化为

$
  S_(E,beta,gamma)
  =1/2 sum_(a=1)^2 sum_(n in ZZ) sum_(bold(k) != bold(0))
  A_(a,-n,-bold(k))
  [(omega_n^B)^2+bold(p)_bold(k)^2]
  A_(a,n,bold(k)).
$ <eq:thermal-transverse-photon-diagonal-action>

这两个线偏振的圆偏振组合正是 @eq:maxwell-transverse-mode-expansion 中螺旋度为 $plus.minus 1$ 的模. 时间振子与纵向振子都不属于物理热系综.

==== 光子化学势为何为零

由两族振子构成的自由粒子数算符虽然偶然与自由 Hamiltonian 对易，但这种守恒不受严格整体相位对称性保护. 光子的发射与吸收会改变光子数，同时保持能量、动量以及物质荷守恒. Maxwell $U (1)$ 规范变换只表示势的描述冗余，不能产生守恒的光子数荷. 因此，平衡态光子气体满足

$
  mu_gamma=0.
$ <eq:equilibrium-photon-chemical-potential>

在受驱动或近似保持粒子数的介质中，引入非零有效光子化学势可能有用；但它不适用于本节所讨论的自由平衡辐射场.

=== 横向泛函行列式

约化场上的未归一化周期路径积分为

$
  cal(Z)_(beta,gamma) & :=integral_("periodic, transverse") cal(D) A^T
                        e^(-S_(E,beta,gamma) [A^T]) \
                      & =cal(N)_gamma
                        [upright("det")'_B cal(K)_gamma]^(-1).
$ <eq:thermal-photon-functional-determinant>

每个横向偏振对应一个实 Gaussian 积分，贡献幂次 $-1/2$；投影算符的迹为二，故总幂次为 $-1$. 撇号表示暂不计有限体积中的空间均匀扇区. 严格常数的势是纯导数作用量的平坦模，而横向投影算符在 $bold(p)=bold(0)$ 处也没有定义. 空间均匀扇区只贡献 $V^0$ 阶的非广延项，因此不影响热力学极限下的压强.

对 @eq:thermal-photon-functional-determinant 取对数，得到

$
  log cal(Z)_(beta,gamma)
  =-sum_(n in ZZ) sum_(bold(k) != bold(0))
  log[(omega_n^B)^2+bold(p)_bold(k)^2]
  +log cal(N)_gamma.
$ <eq:thermal-photon-trace-log>

因此，光子迹对数是 @eq:thermal-real-scalar-trace-log 中无质量实标量迹对数的两倍. 在取空间热力学极限之前使用 @eq:bosonic-matsubara-log-sum，可得

$
  T/V log cal(Z)_(beta,gamma)
  =-integral_bold(p) abs(bold(p))
  -2T integral_bold(p)
  log(1-e^(-beta abs(bold(p)))).
$ <eq:thermal-photon-pressure-before-subtraction>

第一项是两种螺旋度的零点压强. 与标量场和 Dirac 场一样，用固定的真空能重整化条件将其减去；剩余项有限且具有广延性.

=== 黑体热力学

定义经真空减除的巨势与压强为

$
  Omega_gamma (T) & :=-T log cal(Z)_(beta,gamma,"th"), \
      p_gamma (T) & :=-(Omega_gamma (T))/V \
                  & =-2T integral_bold(p)
                    log(1-e^(-beta abs(bold(p)))).
$ <eq:thermal-photon-pressure>

同一行列式还给出能量密度

$
  epsilon_gamma (T)
  :=-1/V (partial log cal(Z)_(beta,gamma,"th"))/(partial beta)
  =2 integral_bold(p) abs(bold(p))
  n_B (abs(bold(p))).
$ <eq:thermal-photon-energy-density>

对压强积分作分部积分，得到

$
  p_gamma (T)
  =2/3 integral_bold(p) abs(bold(p))
  n_B (abs(bold(p)))
  =1/3 epsilon_gamma (T).
$ <eq:thermal-photon-equation-of-state>

因此，状态方程与无质量模构成的各向同性气体相同. 计算径向积分，得到黑体结果

$
        p_gamma (T) & =pi^2/45 T^4, \
  epsilon_gamma (T) & =pi^2/15 T^4, \
        s_gamma (T) & :=(partial p_gamma (T))/(partial T)
                      =4 pi^2/45 T^3.
$ <eq:blackbody-thermodynamics>

单位体积、单位角频率区间内的能量服从 Planck 谱：

$
  rho_gamma (omega,T)
  :=omega^3/(pi^2 [e^(beta omega)-1]),
  quad
  epsilon_gamma (T)
  =integral_0^infinity dd(omega) rho_gamma (omega,T).
$ <eq:planck-energy-spectrum>

相应的平均占据数密度为

$
  n_gamma (T)
  :=2 integral_bold(p)n_B (abs(bold(p)))
  =(2 upright("zeta") (3))/(pi^2) T^3.
$ <eq:thermal-photon-occupation-density>

这里的 $n_gamma$ 是统计观测量，不构成守恒荷密度，因而不在 @eq:thermal-photon-pressure 中引入化学势.

=== 热横向传播子

为对同一核求逆，引入周期横向外源. 配方后得到

$
  cal(Z)_(beta,gamma) [J^T]
  =cal(Z)_(beta,gamma) [0]
  exp[
    1/2 integral_beta dd(X) integral_beta dd(Y)
    tensor(J^T, +i) (X)
    tensor(D_beta^T, -i, -j) (X-Y)
    tensor(J^T, +j) (Y)
  ].
$ <eq:thermal-transverse-photon-sourced-gaussian>

当 $bold(p)!=bold(0)$ 时，物理子空间上的动量空间逆核为

$
  tensor(D_beta^T, -i, -j) (P_B)
  =(tensor(P^T, -i, -j) (bold(p)))/(P_B^2).
$ <eq:thermal-transverse-photon-propagator>

因此

$
  [-partial_(tau_x)^2-bold(nabla)_x^2]
  tensor(D_beta^T, -i, -j) (X-Y)
  =delta_beta^B (tau_x-tau_y)
  tensor(delta^T, -i, -j) (bold(x)-bold(y)),
$ <eq:thermal-transverse-photon-green-equation>

其中空间横向 delta 分布由 @eq:maxwell-transverse-delta 给出. 当 $0<=tau<=beta$ 且空间动量非零时，混合表象为

$
  tensor(D_beta^T, -i, -j) (tau,bold(p))
  =(tensor(P^T, -i, -j) (bold(p)))/(2 abs(bold(p)))
  [
    (1+n_B (abs(bold(p))))e^(-abs(bold(p))tau)
    +n_B (abs(bold(p)))e^(abs(bold(p))tau)
  ].
$ <eq:thermal-transverse-photon-mixed-propagator>

@eq:thermal-scalar-mixed-propagator-closed-form 所用的 Bose--Einstein 恒等式保证该表达式关于 $tau$ 周期. 占据因子与能量密度采用同一个 $n_B$. @eq:thermal-transverse-photon-propagator 描述辐射规范下的物理横向模，不包含规范势的其余分量.

== Matsubara 求和与围道方法

本章的热力学计算反复把泛函行列式化为单模对数和. 此前直接使用了两个尚未证明的公式：玻色传播子和 @eq:bosonic-propagator-sum，以及经化学势平移的费米传播子和 @eq:dirac-shifted-propagator-sum. 本节用统一的围道方法推导二者.

基本思想是用亚纯热核的极点表示离散频率格.Bose--Einstein 或 Fermi--Dirac 统计通过热核的选择进入，传播子的极点则给出在壳能量. 把这两类极点分开处理，在化学势非零时尤其方便.

=== 从迹对数到收敛级数

无论采用哪一种统计，行列式都会产生如下形式的求和：

$
  cal(I)_s (E,mu)
  :=T sum_(n in ZZ)
  log[(omega_n^s+i mu)^2+E^2],
  quad s=B,F.
$ <eq:unified-shifted-log-sum>

若逐项按字面理解，该和具有紫外发散，而且对数还需要指定支切. 先对 $E$ 微分，可以同时消除这两个无关困难：

$
  (partial cal(I)_s (E,mu))/(partial E)
  =2 E cal(S)_s (E,mu),
  quad
  cal(S)_s (E,mu)
  :=T sum_(n in ZZ)
  1/((omega_n^s+i mu)^2+E^2).
$ <eq:log-sum-derivative-reduction>

$cal(S)_s$ 的被求和项按 $1/n^2$ 衰减，故对称 Matsubara 和绝对收敛. 求出它以后，再对 $E$ 积分即可重建迹对数，所差仅为与 $E$ 无关的归一化常数. 第 3.3 与 3.4 节采用这一顺序，以同时避开原对数和的紫外发散与支切选择.

引入复能量变量 $z=i omega$，并定义

$
  h_mu (z;E)
  :=1/(E^2-(z-mu)^2).
$ <eq:shifted-propagator-meromorphic-function>

在 Matsubara 频率处，

$
  h_mu (i omega_n^s;E)
  =1/((omega_n^s+i mu)^2+E^2).
$ <eq:shifted-propagator-matsubara-values>

因此，化学势移动 $h_mu$ 的物理极点；Matsubara 频率格仍由热边界条件固定. 两个物理极点及其留数为

$
  z_+ & =mu+E, & quad upright("Res")_(z=z_+) h_mu (z;E) & =-1/(2 E), \
  z_- & =mu-E, & quad upright("Res")_(z=z_-) h_mu (z;E) & =+1/(2 E).
$ <eq:shifted-propagator-poles-and-residues>

=== 热核与主围道公式

定义两个亚纯热核

$
  cal(k)_B (z) & :=n_B (z)=1/(e^(beta z)-1), \
  cal(k)_F (z) & :=-n_F (z)=-1/(e^(beta z)+1).
$ <eq:bosonic-fermionic-contour-kernels>

它们的极点恰好位于各自的虚频率格上：

$
  upright("Res")_(z=i omega_n^B) cal(k)_B (z)
  =upright("Res")_(z=i omega_n^F) cal(k)_F (z)
  =T.
$ <eq:thermal-kernel-matsubara-residues>

$cal(k)_F=-n_F$ 中的负号抵消了 $n_F$ 的留数 $-T$，因而玻色与费米扇区可以采用同一个逆时针围道约定. 设 $cal(C)_s$ 包围极点 $z=i omega_n^s$，但不包含亚纯函数 $f$ 的极点. 在对称正规化下，若无穷远处衰减充分，则

$
  T sum_(n in ZZ) f (i omega_n^s) & =1/(2 pi i) integral_(cal(C)_s) dd(z)
                                    cal(k)_s (z)f (z) \
                                  & =-sum_(z_* in cal(P) (f))
                                    upright("Res")_(z=z_*) [cal(k)_s (z)f (z)].
$ <eq:matsubara-master-contour-formula>

其中 $cal(P) (f)$ 是 $f$ 的极点集合. 第二行来自围道变形：把围绕 Matsubara 极点的围道移到 $f$ 的极点附近. 新生成的小围道取向相反，因而出现式中的负号.

#figure(
  cetz.canvas(length: 0.78cm, {
    import cetz.draw: *

    let axis-color = rgb("#657b85")
    let boson-color = rgb("#36a6b6")
    let fermion-color = rgb("#e2b55b")
    let pole-color = rgb("#d86483")
    let contour-color = rgb("#317782")

    line((-3.5, 0), (3.6, 0), stroke: 0.7pt + axis-color, mark: (end: ">"))
    line((0, -2.8), (0, 2.9), stroke: 0.7pt + axis-color, mark: (end: ">"))
    content((3.72, -0.05), text(size: 8pt, fill: axis-color)[$upright("Re") z$], anchor: "west")
    content((0.08, 3.02), text(size: 8pt, fill: axis-color)[$upright("Im") z$], anchor: "south-west")

    for y in (-2, 0, 2) {
      circle((0, y), radius: 0.075, fill: boson-color, stroke: boson-color)
    }
    for y in (-1, 1) {
      circle((0, y), radius: 0.095, fill: white, stroke: 1.2pt + fermion-color)
    }

    line((-0.58, -2.5), (0.58, -2.5), stroke: 1.1pt + contour-color, mark: (end: ">"))
    line((0.58, -2.5), (0.58, 2.5), stroke: 1.1pt + contour-color)
    line((0.58, 2.5), (-0.58, 2.5), stroke: 1.1pt + contour-color, mark: (end: ">"))
    line((-0.58, 2.5), (-0.58, -2.5), stroke: 1.1pt + contour-color)
    content((0.72, 2.15), text(size: 8pt, fill: contour-color)[$cal(C)_s$], anchor: "west")

    for x in (-2.05, 2.25) {
      line((x - 0.12, -0.12), (x + 0.12, 0.12), stroke: 1.25pt + pole-color)
      line((x - 0.12, 0.12), (x + 0.12, -0.12), stroke: 1.25pt + pole-color)
      circle((x, 0), radius: 0.34, stroke: (paint: pole-color, thickness: 0.8pt, dash: "dashed"))
    }
    content((-2.05, -0.48), text(size: 8pt, fill: pole-color)[$mu-E$], anchor: "north")
    content((2.25, -0.48), text(size: 8pt, fill: pole-color)[$mu+E$], anchor: "north")

    circle((-3.08, 2.35), radius: 0.07, fill: boson-color, stroke: boson-color)
    content((-2.88, 2.35), text(size: 7.5pt, fill: axis-color)[玻色极点], anchor: "west")
    circle((-3.08, 1.93), radius: 0.09, fill: white, stroke: 1.1pt + fermion-color)
    content((-2.88, 1.93), text(size: 7.5pt, fill: axis-color)[费米极点], anchor: "west")
  }),
  caption: [
    复 $z$ 平面中的正规化 Matsubara 围道. 青色实点表示 $i omega_n^B$，金色空心点表示 $i omega_n^F$；只有由 $s$ 选定的那一族才是 $cal(k)_s$ 的极点. 叉号表示传播子极点 $mu plus.minus E$. 对 $cal(C)_s$ 作围道变形后，会在这些物理极点周围产生取向相反的小围道.
  ],
) <fig:matsubara-contour-deformation>

@fig:matsubara-contour-deformation 将两类频率格叠加显示；实际计算中只选择一个热核和相应的一族极点. 化学势使物理极点沿水平方向移动，虚轴上的频率格仍由热边界条件固定.

=== 玻色与费米传播子和

将 @eq:matsubara-master-contour-formula 应用于 $f=h_mu$，再利用 @eq:shifted-propagator-poles-and-residues，得到共同的中间结果

$
  cal(S)_s (E,mu)
  =[cal(k)_s (mu+E)-cal(k)_s (mu-E)]/(2 E).
$ <eq:shifted-propagator-contour-intermediate-result>

==== 玻色频率格

对玻色场，$cal(k)_B=n_B$. 利用恒等式

$
  n_B (-x)=-[1+n_B (x)]
$ <eq:bose-distribution-reflection-identity>

得到

$
  T sum_(n in ZZ)
  1/((omega_n^B+i mu)^2+E^2)
  =[1+n_B (E-mu)+n_B (E+mu)]/(2 E).
$ <eq:bosonic-shifted-contour-sum>

对复标量场，该公式适用于正常区域 $abs(mu)<E$. 当 $mu=0$ 时，它退化为

$
  T sum_(n in ZZ) 1/((omega_n^B)^2+E^2)
  =[1+2 n_B (E)]/(2 E)
  =1/(2 E)coth(beta E/2).
$ <eq:bosonic-unshifted-contour-sum>

将无平移结果乘以 $2E$，即恢复 @eq:bosonic-propagator-sum；对平移后的结果作同样操作，则恢复 @eq:complex-scalar-shifted-propagator-sum. 在围道图像中，凝聚边界也十分直观：当 $mu arrow.r E$ 时，极点 $z_-=mu-E$ 与 $z=0$ 处的玻色零频极点发生碰撞.

==== 费米频率格

对费米场，$cal(k)_F=-n_F$. 利用

$
  n_F (-x)=1-n_F (x)
$ <eq:fermi-distribution-reflection-identity>

可得

$
  T sum_(n in ZZ)
  1/((omega_n^F+i mu)^2+E^2)
  =[1-n_F (E-mu)-n_F (E+mu)]/(2 E).
$ <eq:fermionic-shifted-contour-sum>

乘以 $2E$ 后便恢复 @eq:dirac-shifted-propagator-sum. 当化学势为零时，

$
  T sum_(n in ZZ) 1/((omega_n^F)^2+E^2)
  =[1-2 n_F (E)]/(2 E)
  =1/(2 E)tanh(beta E/2).
$ <eq:fermionic-unshifted-contour-sum>

费米频率格没有可与 $z_-$ 碰撞的零频极点，因此 Dirac 化学势不受玻色情形的收敛界限制.

=== 积回行列式

将两类围道和代入 @eq:log-sum-derivative-reduction. 所需的原函数为

$
  (partial)/(partial E)
  [T log(1-e^(-beta (E plus.minus mu)))] & =n_B (E plus.minus mu), \
  (partial)/(partial E)
  [T log(1+e^(-beta (E plus.minus mu)))] & =-n_F (E plus.minus mu).
$ <eq:thermal-logarithm-antiderivatives>

因此

$
  cal(I)_B (E,mu) & =E
                    +T log(1-e^(-beta (E-mu)))
                    +T log(1-e^(-beta (E+mu)))
                    +C_B (T), \
  cal(I)_F (E,mu) & =E
                    +T log(1+e^(-beta (E-mu)))
                    +T log(1+e^(-beta (E+mu)))
                    +C_F (T).
$ <eq:contour-derived-bosonic-fermionic-log-sums>

所得对数和与第 3.3、3.4 节使用的公式一致. 首项是与温度无关的真空贡献. 围道积分能够确定 $E$ 依赖，却无法确定 $C_s (T)$，因为这部分信息已在微分时被消去；该常数必须由时间切片测度或等价的参考归一化固定. 保持带荷场 $U (1)$ 对称性的正规化不会引入额外的 $mu$ 依赖常数.

=== 求和后的常用热矩

完成 Matsubara 求和并显式得到 $n_B$ 或 $n_F$ 后，无质量空间积分可归结为两个标准热矩. 对 $x>0$，将分布函数展开为收敛级数：

$
  n_B (x) & =sum_(ell=1)^infinity e^(-ell x), \
  n_F (x) & =sum_(ell=1)^infinity (-1)^(ell-1)e^(-ell x),
$ <eq:thermal-distribution-geometric-series>

逐项积分后，对 $r>1$ 有

$
  integral_0^infinity dd(x) x^(r-1)n_B (x) & =Gamma (r)upright("zeta") (r), \
  integral_0^infinity dd(x) x^(r-1)n_F (x) & =(1-2^(1-r))Gamma (r)upright("zeta") (r).
$ <eq:bose-fermi-thermal-moments>

作变量代换 $x=beta abs(bold(p))$ 后，这些恒等式给出无质量标量、光子与 Dirac 气体中 $T^4$ 项的系数. 对于能量和压强所对应的 $r=4$，因子 $1-2^(1-r)$ 变为 $7/8$；这一差异源于周期场与反周期场取样于不同的 Matsubara 频率格.
