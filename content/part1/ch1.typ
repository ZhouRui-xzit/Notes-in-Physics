#import "../../lib.typ": *

= 路径积分基础

路径积分为正则量子化所描述的量子动力学提供了另一种组织方式. 在算符语言中，演化由 Hamiltonian 和时间演化算符控制；在路径积分语言中，同一个跃迁振幅被写成对全部可能历史的求和. 后一种表述把作用量、对称性和微扰展开直接联系起来，因此尤其适合量子场论. 不过，形式上的 $integral cal(D) phi$ 很容易遮蔽它的真正含义：积分测度从何而来，振荡积分如何定义，费米场为何需要 Grassmann 变量，以及关联函数怎样从外源产生，都必须从有限维、可控制的计算中逐步说明.

本章沿着这条线索展开. 首先从量子力学的跃迁振幅推导相空间与位形空间路径积分，而不把“对所有路径求和”当作预设原理；随后整理实、复与 Grassmann 高斯积分，并由此建立 Wick 定理；接着引入外源和生成泛函，把场插入、时间排序与连通关联函数纳入同一框架；最后通过耦合振子和空间晶格说明，场论路径积分就是无限多个量子力学自由度的受控连续极限. 贯穿这些讨论的核心关系是：二次动力学算符规定自由理论，它在适当边界条件下的逆给出传播子，而相互作用则围绕这一高斯结构展开. 全书采用自然单位制 $c = hbar = k_B = 1$.

== 量子力学中的路径积分

“对所有路径求和”究竟怎样从普通量子力学中出现？最直接的入口是固定初末位置的跃迁振幅. 困难在于，有限时间演化包含 Hamiltonian 的算符指数，而动能与势能通常并不对易，不能把它们简单拆开. 本节将演化区间切成许多短时间片，在每一片之间插入位置与动量完备态，把算符乘积化为普通积分；连续极限先给出相空间路径积分，随后对动量作高斯积分，得到只含坐标与经典作用量的位形空间形式. 这套推导从跃迁振幅自然导出路径积分，无需另作直觉性的假设.

=== 位置表象与动量表象

设位置与动量算符满足正则对易关系

$
 [hat(x), hat(p)] = i.
$ <eq:canonical-commutator>

以 $q$ 标记位置本征态，则

$
 hat(x) ket(q) = q ket(q),
 quad
 integral_( -infinity)^infinity dd(q) ketbra(q) = 1.
$

在位置表象中，波函数为 $psi (q) = braket(q, psi)$，两个算符的作用分别为

$
 mel(q, hat(x), psi) = q psi (q),
 quad
 mel(q, hat(p), psi) = -i pdv(psi (q), q).
$ <eq:position-representation>

这组表示直接满足 $[q, -i partial_q] psi (q) = i psi (q)$. 严格地说，$hat(p)$ 还可多出一个只依赖 $q$ 的函数，不过它可以通过重新选择位置本征态的相位消去. 设 $ket(p)$ 为动量本征态，由 @eq:position-representation 得

$
 -i pdv(braket(q, p), q) = p braket(q, p),
 quad arrow.r quad
 braket(q, p) = e^(i p q).
$ <eq:plane-wave-overlap>

本书采用如下归一化：

$
 braket(q, q') = delta(q - q'),
 quad
 braket(p, p') = 2 pi delta(p - p'),
 quad
 integral_( -infinity)^infinity (dd(p))/(2 pi) ketbra(p) = 1.
$ <eq:completeness-relations>

因此，平面波中的相位 $e^(i p q)$ 来自正则对易关系，而动量测度 $(dd(p))/(2 pi)$ 则与所选归一化相配套. 后面的时间分片会反复用到这两点.

=== 时间演化算符的分片

令 $T = t_f - t_i > 0$. 系统从初态 $q_i$ 演化到末态 $q_f$ 的振幅为

$
 K (q_f, t_f; q_i, t_i)
 := braket(q_f comma t_f, q_i comma t_i)
 = braket(q_f, e^(-i hat(H) T), q_i).
$ <eq:transition-amplitude>

直接计算有限时间的算符指数往往并不容易，短时间演化却可以系统展开. 因此将演化区间等分为 $N$ 个时间片，每片宽度 $epsilon = T/N$，并记 $q_0 = q_i$、$q_N = q_f$. 在相邻的短时演化算符之间插入位置表象的单位分解，便有

$
 K (q_f, t_f; q_i, t_i)
 = lim_(N arrow.r infinity)
 integral product_(n=1)^(N-1) dd(q_n)
 product_(n=0)^(N-1)
 braket(q_(n+1), e^(-i epsilon hat(H)), q_n).
$ <eq:time-sliced-kernel>

取标准哈密顿量

$
 hat(H) = (hat(p)^2)/(2 m) + V (hat(x)).
$ <eq:standard-hamiltonian>

在单个时间片上，一阶 Trotter 乘积公式给出

$
 e^(-i epsilon hat(H))
 = e^(-i epsilon hat(p)^2/(2 m))
 e^(-i epsilon V (hat(x))) + O(epsilon^2).
$ <eq:trotter-step>

这里真正需要控制的是误差能否在时间片数趋于无穷时消失. @ex:trotter 将验证这一展开，并分析单步误差的累积方式.

势能在位置表象中已经对角化，动能则在动量表象中更容易处理. 因此再在每个短时矩阵元中插入 @eq:completeness-relations 的动量单位分解，并利用 @eq:plane-wave-overlap：

$
 braket(q_(n+1), e^(-i epsilon hat(H)), q_n)
 = integral_( -infinity)^infinity (dd(p_n))/(2 pi)
 e^(
 i p_n (q_(n+1) - q_n)
 - i epsilon H (p_n, q_n)
 )
  + O(epsilon^2).
$ <eq:short-time-kernel>

单步误差为 $O(epsilon^2)$，累积到 $N$ 个时间片后至多为 $N epsilon^2 = T epsilon$，因而在固定 $T$ 的连续极限中消失. 将短时矩阵元代回 @eq:time-sliced-kernel，便得到相空间形式

$
 K (q_f, t_f; q_i, t_i) & = lim_(N arrow.r infinity)
 integral product_(n=1)^(N-1) dd(q_n)
 product_(n=0)^(N-1) (dd(p_n))/(2 pi) \
 & quad
 e^(
 i sum_(n=0)^(N-1)
 [p_n (q_(n+1) - q_n) - epsilon H (p_n, q_n)]
 ).
$ <eq:phase-space-path-integral>

这一步值得特别留意：只要 $N$ 有限，上式就只是定义明确的普通多重积分，并没有预先假定某种无限维测度. $cal(D) p$ 与 $cal(D) q$ 只是有限维测度在连续极限中的简记，因此可写成

$
 K (q_f, t_f; q_i, t_i)
 = integral cal(D) p cal(D) q
 e^(
 i integral_(t_i)^(t_f) dd(t)
 [p dot(q) - H (p, q)]
 ).
$ <eq:continuum-phase-space-path-integral>

=== 消去动量变量

相空间表达式同时含有 $p$ 与 $q$，而熟悉的 Lagrangian 形式只含坐标. 对 @eq:standard-hamiltonian，各时间片的 $p_n$ 彼此独立，并且只以二次式出现，所以可以逐片完成高斯积分. 先配方：

$
 p_n (q_(n+1) - q_n) - epsilon (p_n^2)/(2 m)
 = -epsilon/(2 m)
 (p_n - (m (q_(n+1) - q_n))/epsilon)^2
  + (m (q_(n+1) - q_n)^2)/(2 epsilon).
$ <eq:momentum-square>

相应的 Fresnel 积分为

$
 integral_( -infinity)^infinity (dd(p))/(2 pi)
 e^(-i epsilon p^2/(2 m) + i p Delta q)
 = sqrt((m)/(2 pi i epsilon))
 e^(i m (Delta q)^2/(2 epsilon)).
$ <eq:fresnel-slice>

$i 0$ 处方在这里承担两项工作：它既固定平方根的分支，也给振荡积分一个明确含义. @ex:fresnel 将通过加入收敛因子具体实现这一极限. 逐片应用 @eq:fresnel-slice 后，得到

$
 K (q_f, t_f; q_i, t_i) & = lim_(N arrow.r infinity) (m/(2 pi i epsilon))^(N/2) integral product_(n=1)^(N-1) dd(q_n) \ & quad e^( i epsilon sum_(n=0)^(N-1) [ m/2 ((q_(n+1) - q_n)/epsilon)^2 - V (q_n)
 ]
 ).
$ <eq:configuration-slicing>

指数中的离散和在连续极限下趋于经典作用量，

$
 S [q] = integral_(t_i)^(t_f) dd(t) L (q (t), dot(q) (t)), quad L (q, dot(q)) = m/2 dot(q)^2 - V (q).
$ <eq:mechanical-action>

把每片产生的归一化因子以及对中间位置的积分统一记入位形空间测度 $cal(D) q$：

$
 K (q_f, t_f; q_i, t_i)
 = integral_(q (t_i) = q_i)^(q (t_f) = q_f)
 cal(D) q e^(i S [q]).
$ <eq:configuration-path-integral>

至此，原来的算符矩阵元已经改写为对全部连接端点的轨迹求和. 若边界条件已由上下文确定，例如计算迹或真空振幅，通常略去端点标记，只保留

$
 Z = integral cal(D) q e^(i S [q]).
$ <eq:partition-functional>

这个看似简洁的公式也提示了后面的计算策略：二次作用量对应可精确求解的高斯积分，相互作用则围绕这一解作系统展开. 因而，在进入场论之前，需要先把各种高斯积分及其关联函数整理清楚.

== 高斯积分与 Wick 定理

自由玻色场可解的根本原因，在于自由作用量是二次型. 一旦引入晶格或模态截断，所谓泛函积分便退化为有限维高斯积分；连续理论则由移去正规化的极限给出. 为了先把代数结构说清楚，本节从收敛的 Euclidean 高斯积分出发，随后再用 @eq:fresnel-slice 中的 $i 0$ 处方理解 Minkowski 振荡积分.

=== 实高斯积分

==== 一个实变量

对实数 $a > 0$，定义

$
 I (a) = integral_( -infinity)^infinity dd(x) e^(-a x^2/2).
$

作变量替换 $y = sqrt(a) x$，问题归结为 $I (1)$. 将积分平方并改用极坐标，

$
 I (1)^2 & = integral_(RR^2) dd(x) dd(y) e^(-(x^2+y^2)/2) \ & = integral_0^(2 pi) dd(theta) integral_0^infinity r dd(r) e^(-r^2/2)
 = 2 pi.
$

取正平方根，

$
 integral_( -infinity)^infinity dd(x) e^(-a x^2/2)
 = sqrt((2 pi)/a).
$ <eq:real-gaussian-one-dimensional>

逐次直接计算高斯矩并不高效. 更好的办法是先引入线性源，把所有矩统一装进一个生成函数. 配方得到

$
 Z_1 (j; a) & := integral_( -infinity)^infinity dd(x) e^(-a x^2/2 + j x) \ & = sqrt((2 pi)/a) e^(j^2/(2a)).
$ <eq:real-gaussian-one-source>

用 $chevron.l · chevron.r_0$ 表示对归一化高斯权重取平均. 将 $Z_1 (j;a)$ 除以 $Z_1 (0;a)$，再对 $j$ 求导，便有

$
 chevron.l x^(2n+1) chevron.r_0 & = 0, \ chevron.l x^(2n) chevron.r_0 & = (2n - 1)!! a^(-n).
$ <eq:real-gaussian-moments>

若 $a$ 为复数，只需 $upright("Re") a>0$ 即可保证收敛. 积分值由正实轴解析延拓而来，同时固定 $sqrt(a)$ 的分支.

==== $N$ 个实变量与二次型矩阵

单变量公式已经包含了主要思想，但场论正规化后会出现许多彼此耦合的变量. 令 $x = (x_1, dots, x_N)^T$，取实源 $J$ 与实对称正定矩阵 $A$. 相应的有限维生成积分为

$
 Z_N (J; A) := integral_(RR^N) dd(x, [N]) e^(-1/2 x^T A x + J^T x).
$ <eq:real-gaussian-N-definition>

取正交矩阵 $O$，使 $A = O^T Lambda O$，其中 $Lambda = upright(diag)(lambda_1, dots, lambda_N)$ 且 $lambda_i>0$. 变量变换 $y = O x$ 的 Jacobian 行列式绝对值为一，积分分解为 $N$ 个 @eq:real-gaussian-one-dimensional. 平移 $x arrow.r x + A^(-1) J$ 后：

$
 Z_N (J; A)
 = (2 pi)^(N/2) (det A)^(-1/2)
 e^(1/2 J^T A^(-1) J).
$ <eq:real-gaussian-N-source>

实矩阵只有对称部分进入 $x^T A x$. 正定性保证积分绝对收敛；一旦 $A$ 出现零本征值，对应方向就不受高斯因子抑制，积分随之发散.

实际计算中通常先除去与源无关的归一化因子：

$
 cal(Z)_N (J; A) := (Z_N (J; A))/(Z_N (0; A))
 = e^(1/2 J^T A^(-1) J).
$ <eq:normalized-real-gaussian>

对任意可积函数 $F$，其高斯期望值及相应的 $n$ 点关联函数定义为

$
 chevron.l F (x) chevron.r_0 & := 1/(Z_N (0; A)) integral_(RR^N) dd(x, [N]) F (x) e^(-x^T A x/2), \ G^((n))_(i_1 dots i_n) & := chevron.l x_(i_1) dots x_(i_n) chevron.r_0 \ & = [ (partial^n)/(partial J_(i_1) dots partial J_(i_n)) cal(Z)_N (J; A)
 ]_(J=0).
$ <eq:real-gaussian-correlation-definition>

下标 $0$ 表示以原点为中心并已归一化的高斯平均. 上式第二行源于一个简单事实：每对 $J_i$ 求一次导数，积分中就多出一个 $x_i$.

例如，

$
 chevron.l x_i x_j chevron.r_0 & = (A^(-1))_(i j), \ chevron.l x_i x_j x_k x_l chevron.r_0 & = (A^(-1))_(i j) (A^(-1))_(k l) + (A^(-1))_(i k) (A^(-1))_(j l) + (A^(-1))_(i l) (A^(-1))_(j k).
$ <eq:real-gaussian-two-and-four-point>

这里出现了第一个重要结论：二次型矩阵本身决定动力学，而它的逆直接给出二点函数. 推广到场论后，这句话变成贯穿全书的原则：自由传播子就是二次动力学算符在指定边界条件下的逆.

==== 从有限矩阵到实泛函积分

要把上述矩阵公式用于场，最稳妥的做法是先保留有限晶格，再取连续极限. 设晶格含 $M$ 个格点，并将实场在各点的取值排成向量 $phi = (phi_1, dots, phi_M)^T$. 把晶格体积因子并入矩阵与源后，Euclidean 二次作用量为

$
 S_(E,M) [phi; J]
 = 1/2 phi^T K_M phi - J^T phi.
$ <eq:lattice-real-action>

只要 $M$ 有限，所谓“场积分”仍是普通的多重积分：

$
 Z_M (J) & = integral product_(r=1)^M dd(phi_r) e^(-S_(E,M) [phi; J]) \ & = (2 pi)^(M/2) (det K_M)^(-1/2) e^(1/2 J^T K_M^(-1) J).
$ <eq:lattice-real-gaussian>

晶格间距、有限体积和边界条件共同规定了矩阵及积分测度. 保持物理体积不变并令格距趋于零时，$M arrow.r infinity$，离散指标 $r$ 过渡为连续坐标 $x$：

$
 1/2 phi^T K_M phi & arrow.r 1/2 integral dd(x, [d]) dd(y, [d]) phi (x) cal(K) (x,y) phi (y), \ J^T phi & arrow.r integral dd(x, [d]) J (x) phi (x).
$ <eq:real-quadratic-continuum-limit>

逆矩阵则趋于满足下式的 Green 函数 $G$：

$
 integral dd(z, [d]) cal(K) (x,z) G (z,y)
 = delta^(d) (x-y).
$ <eq:green-function-inverse>

由此得到归一化的连续生成泛函

$
 cal(Z)_0 (J) := (Z_0 (J))/(Z_0 (0))
 = exp[
 1/2 integral dd(x, [d]) dd(y, [d]) J (x) G (x,y) J (y)
 ].
$ <eq:real-gaussian-functional>

通常将它简记为

$
 Z_0 (J)
 = integral cal(D) phi
 exp[ -1/2 integral phi cal(K) phi + integral J phi
 ]
$ <eq:formal-real-functional-integral>

因此，@eq:formal-real-functional-integral 只是有限维公式在连续极限中的简写，其定义始终以正规化为基础. 式中省略了时空积分与函数宗量；下文没有歧义时也沿用这一惯例.

=== 复高斯积分

复标量场当然可以拆成两个实场，但那样会掩盖它原有的线性结构. 因此更方便的做法是把复变量及其共轭作为一对变量直接积分. 一个复变量等价于两个实变量，这也解释了行列式幂次与实高斯积分的差别.

==== 一个复变量

写成 $z = x + i y$，并定义 $dd(z, 2) := dd(x) dd(y)$. 对正实数 $a$，

$
 integral_CC (dd(z, 2))/pi e^(-a overline(z) z)
 = 1/a.
$ <eq:complex-gaussian-one-dimensional>

测度中的 $1/pi$ 是归一化约定，用来消去后续公式中多余的 $pi$ 因子. 加入源 $eta$ 与 $overline(eta)$ 并配方，得到

$
 integral_CC (dd(z, 2))/pi e^(-a overline(z) z + overline(eta) z + overline(z) eta)
 = 1/a e^(1/a overline(eta) eta).
$ <eq:complex-gaussian-one-source>

生成关联函数时，先把 $eta$ 与 $overline(eta)$ 视为独立变量；若物理问题要求二者互为共轭，可在求导结束后再施加这一条件.

==== $N$ 个复变量

令 $z$ 为 $N$ 分量复列向量，$A$ 为 Hermitian 正定矩阵. 酉变换不改变积分测度，故可逐个本征方向应用单变量公式：

$
 Z_N^CC (overline(eta), eta; A) & := integral product_(i=1)^N (dd(z_i, 2))/pi e^(-z^dagger A z + overline(eta)^T z + z^dagger eta) \ & = 1/(det A) e^(overline(eta)^T A^(-1) eta).
$ <eq:complex-gaussian-N-source>

由于 $N$ 个复变量包含 $2N$ 个实自由度，行列式的幂次是 $-1$，实高斯积分中则为
$-1/2$. 归一化后的二点函数为

$
 chevron.l z_i overline(z_j) chevron.r_0
 = (A^(-1))_(i j),
 quad chevron.l z_i z_j chevron.r_0
 = chevron.l overline(z_i) overline(z_j) chevron.r_0 = 0.
$ <eq:complex-gaussian-two-point>

即使 $A$ 非 Hermitian，绝对收敛也只要求它的 Hermitian 部分正定. 场论中的 Euclidean 二次作用量通常直接给出 Hermitian 算符.

==== 复场

将上述有限维结果用于二次算符为 $cal(K)$ 的 Euclidean 复场，可得

$
 Z_0 (overline(J), J) & = integral cal(D) overline(phi) cal(D) phi exp[ - integral overline(phi) cal(K) phi + integral (overline(J) phi + overline(phi) J)
 ], \
 (Z_0 (overline(J), J))/(Z_0 (0,0)) & = exp[ integral dd(x, [d]) dd(y, [d]) overline(J) (x) G (x,y) J (y)
 ],
$ <eq:complex-gaussian-functional>

其中 $G = cal(K)^(-1)$. 由此可见，归一化前的实场与复场分别带有

$
 Z_(0, "real") ∝ [upright("Det") cal(K)]^(-1/2), quad Z_(0, "complex") ∝ [upright("Det") cal(K)]^(-1).
$ <eq:real-complex-functional-determinants>

=== 泛函测度究竟表示什么？

记号 $cal(D) phi = product_x dd(phi (x))$ 很容易造成误解，仿佛泛函积分只是对每个时空点各作一次 Lebesgue 积分. 但无限维函数空间上并不存在同时具有非零、局部有限和平移不变等有限维性质的 Lebesgue 测度. 还要区分时空点的数目与独立模态的数目：时空点集虽然不可数，有限体积中常用的函数空间通常可分，因而可以选取可数的 Fourier 基或本征函数基，再由正规化把保留的模态截到有限个.

因此，计算必须从一种明确的正规化出发，再以移去正规化的极限解释连续记号：

+ *晶格正规化：*先对有限多个格点变量积分，再令晶格间距趋于零.

+ *模态截断：*按本征函数或 Fourier 模态展开，只保留有限多个系数，最后移去截断.

+ *Euclidean 高斯测度：*归一化以后，由协方差 $G$ 在适当的广义函数空间上定义概率测度. 典型的量子场属于广义函数，通常无法逐点定义.

第三种表述尤其说明，真正具有概率意义的是归一化后的测度

$
 dd(mu_G) [phi] := 1/(Z_0 (0)) cal(D) phi e^(-1/2 integral phi cal(K) phi), quad integral dd(mu_G) [phi] = 1.
$ <eq:normalized-gaussian-measure>

相互作用理论则可写成关于该高斯测度的加权平均：

$
 Z/Z_0
 = integral dd(mu_G) [phi] e^(-S_("int") [phi]).
$ <eq:interaction-relative-to-gaussian-measure>

连续记号不仅掩盖了正规化，也容易把来源不同的发散混在一起. 设 $lambda_n$ 为 $cal(K)$ 的本征值，则

$
 log upright("Det") cal(K)
 = upright("Tr") log cal(K)
 = sum_n log lambda_n.
$ <eq:functional-determinant-trace-log>

无限多个高频模态通常造成紫外发散；若同时取无限体积，还会出现与体积成正比的广延发散. 采用 Fourier 约定 $integral dd(p, [d])/(2 pi)^d e^(i p x)$ 时，后一因素表现为动量空间 delta 函数在零宗量处的取值

$
 delta^(d) (0) = V/(2 pi)^d,
$ <eq:delta-zero-volume>

这条等式必须放在有限盒子中理解. $Z_0 (0)$ 一类与场无关的因子会在归一化关联函数中抵消，但行列式之比、真空能以及重合点传播子仍需正规化和重整化. 零本征值对应的则是红外问题：二次型在该方向上没有约束. 此时应引入红外正规化，或单独处理零模；若零模来自规范冗余，则应先固定规范.

还要强调，权重为 $e^(i S)$ 的 Minkowski 路径积分没有概率测度的解释. 其定义依赖时间分片与 $i 0$ 处方，等价地也可由 Euclidean 高斯积分解析延拓得到. 下文对 $cal(D) phi$ 的任何形式操作，都默认先在正规化后的有限维系统中成立，再取受控极限.

=== Wick 定理

直接计算高阶高斯矩会迅速陷入繁琐的组合计数，但生成泛函已经把答案完整编码其中. 对 @eq:normalized-real-gaussian 连续求导可知，中心实高斯分布的奇数阶矩为零，偶数阶矩则由所有可能的两两配对组成：

$
 chevron.l x_(i_1) dots x_(i_(2n)) chevron.r_0
 = sum_("pairings " P)
 product_((r,s) in P) (A^(-1))_(i_r i_s).
$ <eq:finite-real-wick-theorem>

进入连续理论后，离散指标由时空点取代，矩阵逆 $A^(-1)$ 由传播子取代：

$
 chevron.l phi (x_1) dots phi (x_(2n)) chevron.r_0
 = sum_("pairings " P)
 product_((r,s) in P) G (x_r,x_s).
$ <eq:functional-real-wick-theorem>

对复高斯分布，非零收缩只能发生在场与共轭场之间. $phi$ 与 $overline(phi)$ 数目不等的关联函数为零；数目相等时：

$
 chevron.l product_(i=1)^n phi (x_i) product_(j=1)^n overline(phi) (y_j) chevron.r_0
 = sum_(sigma in S_n)
 product_(i=1)^n G (x_i,y_(sigma(i))).
$ <eq:functional-complex-wick-theorem>

@eq:functional-real-wick-theorem 与 @eq:functional-complex-wick-theorem 合称 Wick 定理. 微扰展开的组合结构，正是由反复应用这些高斯收缩产生的.

== Grassmann 变量与费米路径积分

玻色路径积分使用普通对易变量，而费米产生、湮灭算符满足反对易关系. 如果仍以普通复数作为积分变量，这种代数结构便无从体现. 解决办法是让费米场取值于 Grassmann 代数. Grassmann 积分本质上是有限的代数运算，却有一套与玻色高斯积分平行的公式，因此费米关联函数同样可以由生成泛函统一生成.

=== Grassmann 代数与 Berezin 积分

==== 反对易生成元

设 $theta_1, dots, theta_N$ 为 Grassmann 生成元. 根据定义，

$
 theta_i theta_j = -theta_j theta_i, quad theta_i^2 = 0.
$ <eq:grassmann-algebra>

当系数域的特征不为二时，第二式由第一式立即推出. 由于生成元幂零，有限个生成元构成的幂级数必在有限阶截断. 例如，对单个生成元，

$
 F (theta) = F_0 + F_1 theta, quad e^(a theta) = 1 + a theta.
$ <eq:one-grassmann-expansion>

齐次单项式所含生成元数目为偶数或奇数时，分别称为*偶*或*奇*. 若 $F$ 与 $G$ 具有确定的 Grassmann 奇偶性 $abs(F), abs(G) in {0,1}$，则

$
 F G = (-1)^(abs(F) abs(G)) G F
$ <eq:graded-commutation>

若 $F$ 与 $G$ 所含的生成元相互独立，便有 @eq:graded-commutation. 偶量与任意元素对易，两个奇量则反对易；后文出现的费米负号都可追溯到这一分次交换律.

==== 微分与积分

对奇变量，左导数定义为

$
 partial^L_theta 1 = 0, quad partial^L_theta theta = 1, quad partial^L_theta (F G)
 = (partial^L_theta F) G
  + (-1)^(abs(F)) F (partial^L_theta G).
$ <eq:left-grassmann-derivative>

例如，若 $theta$ 与 $chi$ 相互独立， $partial^L_theta (theta chi) = chi$，而 $partial^L_chi (theta chi) = -theta$. 也可以定义右导数，但左右导数的互换会引入由奇偶性决定的符号，使用时必须始终注明导数的作用方向.

Berezin 积分由两条规则确定：

$
 integral dd(theta) 1 = 0, quad integral dd(theta) theta = 1.
$ <eq:berezin-one-variable>

可见，Berezin 积分与左求导遵循同一套代数规则. 它不涉及收敛性，也没有通常意义下的积分区间. 对多个变量，微分的排列次序属于测度定义的一部分. 此外，固定约定

$
 integral dd(theta_N) dots dd(theta_1) theta_1 dots theta_N = 1.
$ <eq:berezin-measure-order>

交换任意两个微分都会改变符号. 若奇常量 $eta$ 与 $theta$ 独立，则积分还满足平移不变性

$
 integral dd(theta) F (theta + eta)
 = integral dd(theta) F (theta).
$ <eq:berezin-translation>

Grassmann 变量的变量替换公式与对易变量恰好相反. 若 $theta'_i = M_(i j) theta_j$，则

$
 dd(theta'_N) dots dd(theta'_1)
 = (det M)^(-1)
 dd(theta_N) dots dd(theta_1).
$ <eq:berezin-jacobian>

单变量情形已经足以说明这个逆行列式. 若 $theta' = a theta$，归一化要求
$1 = integral dd(theta') theta' = a integral dd(theta') theta$，故 $dd(theta') = a^(-1) dd(theta)$. @eq:berezin-jacobian 是 Berezinian 最简单的例子； Berezinian 是 Jacobian 的分次对应物.

=== 费米高斯积分

==== 一对共轭变量

先从最小的非平凡例子开始. 引入相互独立的奇变量 $psi$ 与 $overline(psi)$. 横线只表示二者配对，并不要求在积分过程中把 $overline(psi)$ 解释为 $psi$ 的通常复共轭. 测度定向由下式固定：

$
 integral dd(overline(psi)) dd(psi) e^(-overline(psi) a psi) = a.
$ <eq:one-pair-fermionic-gaussian>

由于奇变量幂零，指数在一阶便截断. 再引入独立奇源 $eta$ 与 $overline(eta)$，利用平移不变性可作如下配方：

$
 -overline(psi) a psi + overline(eta) psi + overline(psi) eta
 = -(overline(psi) - overline(eta) a^(-1))
 a (psi - a^(-1) eta) + overline(eta) a^(-1) eta.
$ <eq:fermionic-completing-square>

因此，

$
 integral dd(overline(psi)) dd(psi) e^( -overline(psi) a psi + overline(eta) psi + overline(psi) eta )
 = a e^(overline(eta) a^(-1) eta).
$ <eq:one-pair-fermionic-source>

这与 @eq:complex-gaussian-one-source 恰好相反：对易复变量给出 $a^(-1)$，一对反对易变量却给出 $a$. 因而，玻色行列式出现在分母，费米行列式出现在分子；这一差别源于变量的代数性质，与记号约定无关.

==== 多变量与行列式

令 $psi_i$ 与 $overline(psi)_i$（$i=1,dots,N$）为独立 Grassmann 生成元，并为所有微分固定一个一致的顺序. 对可逆的 $N times N$ 矩阵 $A$，

$
 Z_F (overline(eta), eta; A) & := integral product_(i=1)^N dd(overline(psi)_i) dd(psi_i) \ & quad times e^( -overline(psi)_i A_(i j) psi_j + overline(eta)_i psi_i + overline(psi)_i eta_i ) \ & = det A e^(overline(eta)_i (A^(-1))_(i j) eta_j).
$ <eq:fermionic-matrix-gaussian>

本小节约定重复指标求和. 展开指数后，只有同时含有全部 $psi_i$ 和 $overline(psi)_i$ 的最高阶单项式能通过积分；其矩阵指标的完全反对称化正是 $det A$. 也可以先对角化 $A$，再逐模应用 @eq:one-pair-fermionic-gaussian；变量替换产生的因子则由 @eq:berezin-jacobian 给出.

除以 $Z_F (0,0;A)$ 后，与源无关的行列式消失：

$
 cal(Z)_F (overline(eta), eta; A)
 = e^(overline(eta)_i (A^(-1))_(i j) eta_j).
$ <eq:normalized-fermionic-gaussian>

指定源导数的排列次序与作用方向后，对源求导便可插入相应的场. 按上述约定，基本收缩为

$
 chevron.l psi_i overline(psi)_j chevron.r_0
 = (A^(-1))_(i j).
$ <eq:fermionic-two-point>

带横线与不带横线的变量数目若不相等，关联函数必为零. 反对易性产生的相对负号首次出现在四点函数中：

$
 chevron.l psi_i overline(psi)_j psi_k overline(psi)_l chevron.r_0
 = (A^(-1))_(i j) (A^(-1))_(k l)
 - (A^(-1))_(i l) (A^(-1))_(k j).
$ <eq:fermionic-four-point>

一般情形下，Wick 定理仍对所有配对求和，每一项还要乘以相应置换的符号；这个置换把每对奇变量移到相邻位置. 当两类场数目相等时，求和可合并成行列式：

$
 chevron.l psi_(i_1) dots psi_(i_n) overline(psi)_(j_n) dots overline(psi)_(j_1) chevron.r_0
 = det[(A^(-1))_(i_r j_s)]_(r,s=1)^n.
$ <eq:fermionic-wick-determinant>

左边将带横线变量反序排列，是我们符号约定的一部分. 真正与约定无关的是交换规则：保持原算符序列，每交换一次奇对象就乘以 $-1$.

==== 实 Grassmann 变量与 Pfaffian

对一组实 Grassmann 变量 $chi_i$，矩阵只有反对称部分对 $chi_i A_(i j) chi_j$ 有贡献. 若 $A^T=-A$ 且 $N$ 为偶数，则可选取定向测度，使得

$
 integral dd(chi_N) dots dd(chi_1) e^(-1/2 chi^T A chi)
 = upright("Pf") (A),
 quad upright("Pf") (A)^2 = det A.
$ <eq:grassmann-pfaffian>

上述 Pfaffian 结构是 Majorana 费米子泛函积分的有限维原型. Dirac 费米子给出行列式， Majorana 费米子则形式上给出 Pfaffian；后者相当于带定向信息的行列式平方根.

=== 从费米算符到路径积分

==== 费米相干态

对单个模态，令 $hat(a)$ 与 $hat(a)^dagger$ 满足

$
 hat(a)^2 = (hat(a)^dagger)^2 = 0, quad hat(a) hat(a)^dagger + hat(a)^dagger hat(a) = 1.
$ <eq:fermionic-oscillator-algebra>

费米相干态由 Grassmann 数标记：

$
 ket(psi) := e^(-psi hat(a)^dagger) ket(0), quad bra(overline(psi)) := bra(0) e^(-hat(a) overline(psi)).
$ <eq:fermionic-coherent-states>

约定 Grassmann 标记越过奇算符时的符号后，相干态满足

$
 hat(a) ket(psi) = psi ket(psi), quad bra(overline(psi)) hat(a)^dagger
 = bra(overline(psi)) overline(psi),
 quad braket(overline(psi), psi') = e^(overline(psi) psi').
$ <eq:fermionic-coherent-properties>

相应的单位分解为

$
 1 = integral dd(overline(psi)) dd(psi) e^(-overline(psi) psi) ket(psi) bra(overline(psi)).
$ <eq:fermionic-coherent-completeness>

它在费米时间分片中的作用，与 @eq:time-sliced-kernel 里位置本征态的单位分解完全对应. 有了这条公式，算符迹和演化振幅便可逐片改写成 Grassmann 积分.

==== 时间分片与动能项

考虑正规序哈密顿量 $hat(H) = H (hat(a)^dagger, hat(a))$. 在一个 Euclidean 时间片上，

$
 bra(overline(psi)_(n+1)) e^(-epsilon hat(H)) ket(psi_n)
 = e^(
 overline(psi)_(n+1) psi_n - epsilon H (overline(psi)_(n+1), psi_n) ) + O(epsilon^2).
$ <eq:fermionic-short-time-kernel>

在每个时间片插入 @eq:fermionic-coherent-completeness 后，单位分解中的高斯权重会与相邻相干态的重叠结合，产生离散项

$
 sum_n overline(psi)_(n+1) (psi_(n+1) - psi_n),
$ <eq:discrete-fermionic-kinetic-term>

其连续极限为 $integral dd(tau) overline(psi) partial_tau psi$. 有限多个费米模态的 Euclidean 作用量必然是一阶形式

$
 S_E [overline(psi), psi]
 = integral_0^beta dd(tau)
 [overline(psi)_i partial_tau psi_i + H (overline(psi), psi)].
$ <eq:fermionic-euclidean-action>

$psi$ 与 $overline(psi)$ 在路径积分中彼此独立. 作用量中的一阶导数来自相干态重叠的连续极限，不能视作低阶近似.

计算热配分函数 $Z (beta)=upright("Tr") e^(-beta hat(H))$ 时，迹的相干态表示要求末端标记等于初端标记的负值，故

$
 psi (beta) = -psi (0), quad overline(psi) (beta) = -overline(psi) (0).
$ <eq:fermionic-antiperiodic-boundary>

反周期性给出费米 Matsubara 频率 $omega_n = (2n+1) pi/beta$；玻色场满足周期边界条件，对应 $omega_n = 2n pi/beta$. 两套频率的差别由热迹与量子统计决定，与运动方程无关.

在实时形式中，同样的分片步骤给出相空间作用量

$
 S [overline(psi), psi]
 = integral dd(t)
 [i overline(psi)_i dot(psi)_i - H (overline(psi), psi)], quad Z = integral cal(D) overline(psi) cal(D) psi e^(i S).
$ <eq:fermionic-real-time-action>

与玻色情形一样，振荡积分及真空边界条件须由 $i 0$ 处方规定，或通过 Euclidean 时间的解析延拓来定义.

=== 自由费米场

在有限 Euclidean 晶格上，将 Dirac 场的格点指标和旋量指标合并为复合指标 $I$. 其二次作用量可写为

$
 S_(E,M) [overline(psi), psi]
 = overline(psi)_I D_(I J) psi_J.
$ <eq:lattice-dirac-action>

应用 @eq:fermionic-matrix-gaussian 得到

$
 Z_(F,M) (overline(eta), eta)
 = det D
 e^(overline(eta)_I (D^(-1))_(I J) eta_J).
$ <eq:lattice-dirac-generating-integral>

这正是有限维费米高斯积分可以直接用于场论的地方：@eq:fermionic-matrix-gaussian 立即给出有限晶格上的生成积分，而连续理论的形式记号则定义为移去正规化后的极限. 令

$
 cal(D)_E = tensor(gamma_E, +mu) tensor(partial, -mu) + m, quad S_E = integral dd(x, [d]) overline(psi) (x) cal(D)_E psi (x),
$ <eq:euclidean-dirac-operator>

则归一化生成泛函为

$
 cal(Z)_0 (overline(eta), eta)
 = exp[
 integral dd(x, [d]) dd(y, [d]) overline(eta) (x) S_E (x,y) eta (y)
 ],
$ <eq:free-fermion-generating-functional>

其中 Euclidean 传播子是 Dirac 算符的逆：

$
 cal(D)_(E,x) S_E (x,y) = delta^(d) (x-y), quad S_E (p)
 = (-i tensor(gamma_E, +mu) tensor(p, -mu) + m)/(p^2 + m^2).
$ <eq:euclidean-fermion-propagator>

特别地，

$
 chevron.l psi_alpha (x) overline(psi)_beta (y) chevron.r_0
 = (S_E (x,y))_(alpha beta).
$ <eq:free-fermion-two-point>

归一化前，Dirac 场积分产生 $upright("Det") cal(D)_E$，实玻色场积分则产生
$[upright("Det") cal(K)]^(-1/2)$. 检查行列式位于分子还是分母，常能迅速发现统计符号错误. 不过两者在连续理论中都是无穷乘积，仍须按 @eq:functional-determinant-trace-log 后的讨论加以正规化.

费米 Wick 收缩把置换符号原封不动地带入微扰展开. 将一条开费米链闭合时，会比开链多一次奇对象交换，所以每个闭合费米圈都附带 $-1$. 这个负号是 Grassmann 反对易关系的图示记录.

== 生成泛函与源

高斯积分中引入线性源，原本只是为了方便地生成各阶矩. 到了场论，这个技巧获得了更普遍的意义：对外源作一次泛函微分，就等于在路径积分中插入一个场. 因而，即使相互作用路径积分无法精确求出，一个生成泛函仍能统一编码全部时间有序关联函数；对它取对数后，又会自动留下连通部分. 本节把这些关系逐一建立起来.

=== 泛函导数

==== 定义与基本恒等式

泛函导数沿用有限维微分，只把变量的离散指标换成连续坐标. 有限维函数的变分写作 $delta F = delta x_i (partial F)/(partial x_i)$. 将指标 $i$ 换成连续坐标 $x$，便得到

$
 delta F [phi]
 = integral dd(x, [d]) delta phi_a (x)
 (delta F [phi])/(delta phi_a (x)) + O(delta phi^2).
$ <eq:functional-derivative-definition>

指标 $a$ 可代表任意内部自由度，重复的离散指标默认求和. 由定义立即得到

$
 (delta phi_a (x))/(delta phi_b (y))
 = delta_(a b) delta^(d) (x-y).
$ <eq:functional-derivative-field>

这正是 $(partial x_i)/(partial x_j) = delta_(i j)$ 的连续版本. 因而，对线性源项有

$
 (delta)/(delta J_a (x)) integral dd(y, [d]) J_b (y) phi_b (y)
 = phi_a (x).
$ <eq:functional-derivative-linear-source>

若局域泛函 $F [phi]=integral dd(x, [d]) f (phi (x))$ 不含场的导数，则

$
 (delta F)/(delta phi (x)) = (dif f)/(dif phi) (phi (x)).
$ <eq:functional-derivative-local-potential>

若泛函还含场的导数，则先对变分作分部积分，将导数移到其系数上. 例如，在 Euclidean 表述中取边界项为零，

$
 (delta)/(delta phi (x)) integral dd(y, [d]) 1/2 tensor(partial, -mu) phi (y) tensor(partial, +mu) phi (y)
 = -partial^2 phi (x).
$ <eq:functional-derivative-kinetic-term>

对易场的泛函导数仍满足通常的链式法则和乘积法则，因此玻色源导数相互对易. 对 Grassmann 源求导时则必须同时规定作用方向和排列次序，其分次乘积法则正是 @eq:left-grassmann-derivative.

=== 源与场插入

设实玻色场具有 Euclidean 作用量 $S_E [phi]$. 引入对易源 $J (x)$，并定义

$
 Z_E [J] & := integral cal(D) phi exp[-S_E [phi] + integral dd(x, [d]) J (x) phi (x)], \ cal(Z)_E [J] & := (Z_E [J])/(Z_E [0]).
$ <eq:euclidean-generating-functional-definition>

源的作用现在变得清楚了. 由于归一化分母不含 $J$，每作一次源导数，指数中的线性源项就贡献一个场，因此

$
 (delta^n cal(Z)_E [J])/ (delta J (x_1) dots delta J (x_n))
 = 1/(Z_E [0])
 integral cal(D) phi phi (x_1) dots phi (x_n) e^(-S_E [phi] + integral J phi).
$ <eq:source-derivatives-insert-fields>

时空积分和内部指标明确时简写为 $integral J phi$. 完成求导后令 $J=0$，就得到 Euclidean $n$ 点函数

$
 G_E^((n)) (x_1,dots,x_n) := chevron.l phi (x_1) dots phi (x_n) chevron.r
 = [
 (delta^n cal(Z)_E [J])/ (delta J (x_1) dots delta J (x_n))
 ]_(J=0).
$ <eq:euclidean-correlators-from-source>

归一化条件 $cal(Z)_E [0]=1$ 将零阶关联函数固定为一. 若作用量与测度都在 $phi arrow.r -phi$ 下不变，则生成泛函是 $J$ 的偶泛函，故 $J=0$ 处的奇数阶导数全部为零.

多分量场需要为每个分量配上相应的源. 复标量使用相互独立的对易源 $J$ 与 $overline(J)$，源项为 $integral (overline(J) phi + overline(phi) J)$；Dirac 场使用相互独立的 Grassmann 奇源 $eta$ 与 $overline(eta)$，源项为 $integral (overline(eta) psi + overline(psi) eta)$. 源与场的配对关系决定求导时插入哪一个场；费米情形还必须保留导数的顺序.

=== 算符含义与时间排序

Minkowski 生成泛函可直接写成算符矩阵元. 以通常的 $i 0$ 处方选定相互作用真空，定义归一化的真空到真空振幅

$
 cal(Z)_M [J] := chevron.l Omega | T exp[i integral dd(x, [d]) J (x) hat(phi)_H (x)] | Omega chevron.r.
$ <eq:minkowski-operator-generating-functional>

下标 $H$ 表示 Heisenberg 绘景的场. 展开时间有序指数，得到

$
 cal(Z)_M [J]
 = sum_(n=0)^infinity i^n/(n!)
 integral product_(r=1)^n dd(x_r, [d]) J (x_1) dots J (x_n) chevron.l Omega | T hat(phi)_H (x_1) dots hat(phi)_H (x_n) | Omega chevron.r.
$ <eq:minkowski-source-expansion>

因此

$
 G_M^((n)) (x_1,dots,x_n) & := chevron.l Omega | T hat(phi)_H (x_1) dots hat(phi)_H (x_n) | Omega chevron.r \ & = [ 1/i^n (delta^n cal(Z)_M [J])/ (delta J (x_1) dots delta J (x_n))
 ]_(J=0).
$ <eq:minkowski-correlators-from-source>

时间排序已经由真空振幅的展开产生，无需在完成路径积分后另行补入. @eq:euclidean-generating-functional-definition 可由解析延拓得到，其源导数不含额外的 $i$，见 @eq:euclidean-correlators-from-source. 因此，计算中必须始终注明采用 Euclidean 还是 Minkowski 约定，否则源导数中的 $i$ 因子很容易混淆.

=== 自由场生成泛函的统一公式

有了源与场插入的对应关系，第 1.2、1.3 节的结果就可以压缩成三条主公式. 对二次算符为 $cal(K)$、逆为 $G=cal(K)^(-1)$ 的实 Euclidean 玻色场，

$
 cal(Z)_(0,E) [J]
 = exp[
 1/2 integral dd(x, [d]) dd(y, [d]) J (x) G (x,y) J (y)
 ].
$ <eq:free-real-boson-master-functional>

对于复 Euclidean 玻色场，

$
 cal(Z)_(0,E) [overline(J),J]
 = exp[
 integral dd(x, [d]) dd(y, [d]) overline(J) (x) G (x,y) J (y)
 ].
$ <eq:free-complex-boson-master-functional>

对于传播子为 $S_E=cal(D)_E^(-1)$ 的 Euclidean Dirac 场，

$
 cal(Z)_(0,E) [overline(eta),eta]
 = exp[
 integral dd(x, [d]) dd(y, [d]) overline(eta) (x) S_E (x,y) eta (y)
 ].
$ <eq:free-dirac-master-functional>

三条公式已经包含各自理论的全部自由关联函数. 指数中的二次核就是基本收缩，源的代数性质编码了统计：$J$、$overline(J)$ 对易，$eta$、$overline(eta)$ 反对易. 玻色源导数对配对作无符号求和，费米源导数则自动产生 @eq:fermionic-wick-determinant 的置换符号.

作为比较，设实 Minkowski 作用量为 $S_0 [phi]=1/2 integral phi K phi$，并用 Feynman $i 0$ 处方固定 $K$ 的逆. 完成振荡高斯积分，得到

$
 cal(Z)_(0,M) [J]
 = exp[-i/2 integral J K^(-1) J].
$ <eq:free-minkowski-boson-master-functional>

按 @eq:minkowski-correlators-from-source 作两次源导数，得到 Feynman 传播子 $G_M^((2))=i K^(-1)$. 因此应清楚区分二者：$K^(-1)$ 只是二次算符的逆，本约定下的时间有序二点函数还多一个 $i$.

=== 连通生成泛函

完整关联函数会同时包含真正连通的贡献和若干低阶关联函数的乘积. 如果目标是提取相互关联而不能进一步分解的部分，就需要去掉后者. 生成泛函的对数恰好完成这项组合学筛选. 在 Euclidean 表述中定义

$
 W_E [J] := log cal(Z)_E [J], quad cal(Z)_E [J] = e^(W_E [J]).
$ <eq:euclidean-connected-generator>

前两阶导数说明了这一点：

$
 (delta W_E)/(delta J_1) & = 1/(cal(Z)_E) (delta cal(Z)_E)/(delta J_1), \ (delta^2 W_E)/(delta J_1 delta J_2) & = 1/(cal(Z)_E) (delta^2 cal(Z)_E)/(delta J_1 delta J_2) - 1/(cal(Z)_E^2) (delta cal(Z)_E)/(delta J_1) (delta cal(Z)_E)/(delta J_2),
$ <eq:first-two-connected-derivatives>

其中 $J_r$ 是 $J (x_r)$ 的简写. 在 $J=0$ 处，

$
 G_(E,c)^((1)) (x_1) & = chevron.l phi_1 chevron.r, \ G_(E,c)^((2)) (x_1,x_2) & = chevron.l phi_1 phi_2 chevron.r - chevron.l phi_1 chevron.r chevron.l phi_2 chevron.r.
$ <eq:connected-one-and-two-point>

一般地，

$
 G_(E,c)^((n)) (x_1,dots,x_n)
 = [
 (delta^n W_E [J])/ (delta J (x_1) dots delta J (x_n))
 ]_(J=0).
$ <eq:euclidean-connected-correlators>

反之，将外点集合按所有可能方式划分为连通块，并把每个划分中的连通函数相乘，即可重构完整关联函数：

$
 G_E^((n)) (x_1,dots,x_n)
 = sum_(P in cal(P)_n)
 product_(B in P) G_(E,c)^((abs(B))) ({x_r : r in B}).
$ <eq:full-correlator-partition-formula>

这里 $cal(P)_n$ 是 ${1,dots,n}$ 的所有划分组成的集合. 对中心场，四点情形化为

$
 G_E^((4)) (1,2,3,4) & = G_(E,c)^((4)) (1,2,3,4) + G_(E,c)^((2)) (1,2) G_(E,c)^((2)) (3,4) \ & quad + G_(E,c)^((2)) (1,3) G_(E,c)^((2)) (2,4) + G_(E,c)^((2)) (1,4) G_(E,c)^((2)) (2,3).
$ <eq:connected-four-point-decomposition>

自由理论的 $W_E$ 关于源至多二次，故二阶以上的连通关联函数全部为零， @eq:connected-four-point-decomposition 随即退化为四点 Wick 公式. 一般情形下，不连通分量连同其不可分辨组合因子一起指数化；对数正好逆转这一过程，只留下单个连通分量.

在 Minkowski 度规下，通常写成

$
 W_M [J] := -i log cal(Z)_M [J], quad cal(Z)_M [J] = e^(i W_M [J]).
$ <eq:minkowski-connected-generator>

按此定义，连通时间有序函数为

$
 G_(M,c)^((n)) (x_1,dots,x_n)
 = [
 1/i^(n-1) (delta^n W_M [J])/ (delta J (x_1) dots delta J (x_n))
 ]_(J=0).
$ <eq:minkowski-connected-correlators>

两种表述的连通性具有相同的组合意义； @eq:euclidean-connected-correlators 与 @eq:minkowski-connected-correlators 的差别仅在于 Minkowski 约定带来的 $i$ 因子.

=== 作为泛函微分算符的相互作用

生成泛函的用途并不限于整理自由理论. 把 Euclidean 作用量分成二次部分与相互作用部分：

$
 S_E [phi] = S_(0,E) [phi] + S_("int",E) [phi].
$ <eq:euclidean-action-split>

由于

$
 phi (x) e^(integral J phi)
 = (delta)/(delta J (x)) e^(integral J phi),
$ <eq:euclidean-field-source-identity>

@eq:euclidean-field-source-identity 表明，相互作用中的每个场都可替换为对源的泛函导数. 将相互作用指数展开，把源导数移到自由高斯积分之外，再把级数重新写成指数，得

$
 Z_E [J]
 = exp[
 -S_("int",E) [(delta)/(delta J)]
 ] Z_(0,E) [J].
$ <eq:euclidean-interaction-differential-operator>

归一化时还要除去含相互作用的无源真空振幅：

$
 cal(Z)_E [J]
 =
 (exp[-S_("int",E) [(delta)/(delta J)]] Z_(0,E) [J])/ ([exp[-S_("int",E) [(delta)/(delta J)]] Z_(0,E) [J]]_(J=0)).
$ <eq:normalized-interacting-generating-functional>

在 Minkowski 度规下，

$
 phi (x) e^(i integral J phi)
 = 1/i (delta)/(delta J (x)) e^(i integral J phi),
$ <eq:minkowski-field-source-identity>

因此相应的未归一化公式为

$
 Z_M [J]
 = exp[
 i S_("int",M) [1/i (delta)/(delta J)]
 ] Z_(0,M) [J].
$ <eq:minkowski-interaction-differential-operator>

费米理论具有完全相同的结构，只需按既定源次序把场替换为关于 $overline(eta)$、$eta$ 的左导数或右导数. 所有符号都由这种次序决定. 上述公式首先是有限正规化下普通幂级数之间的恒等式；移去正规化后，它们构成后文微扰展开的代数起点.

== 从量子力学到场论

从形式上看，场只是把量子力学坐标 $q (t)$ 换成了还带空间标签的 $phi (t,x)$. 但如果直接把 $x$ 当作连续指标，路径积分测度和无穷多个自由度都会显得含混. 更可靠的路线是从有限多个耦合振子开始，把它们安置在空间晶格上，最后再取连续极限. 这样既能说明场的路径积分从何而来，也能看清自由粒子为何对应简正模的量子.

=== 多个耦合自由度

考虑 $N$ 个实坐标 $q_i (t)$，其二次作用量为

$
 S_N [q]
 = integral_(t_i)^(t_f) dd(t)
 [ 1/2 dot(q)_i dot(q)_i - 1/2 q_i Omega^2_(i j) q_j
 ].
$ <eq:coupled-oscillator-action>

实对称矩阵 $Omega^2$ 同时包含各坐标自身的回复力和坐标之间的耦合. 若它正定，则存在正交矩阵 $O$ 将其对角化：

$
 O Omega^2 O^T
 = upright("diag") (omega_1^2,dots,omega_N^2),
 quad Q_alpha (t) = O_(alpha i) q_i (t).
$ <eq:coupled-oscillator-diagonalization>

作用量于是变成相互独立的谐振子作用量之和：

$
 S_N [Q]
 = sum_(alpha=1)^N integral dd(t)
 [ 1/2 dot(Q)_alpha^2 - 1/2 omega_alpha^2 Q_alpha^2
 ].
$ <eq:normal-mode-oscillator-action>

这里尚未出现本质上的无限维对象. 含源路径积分只是有限多重积分的普通连续时间极限：

$
 Z_N [J]
 = integral product_(i=1)^N cal(D) q_i
 exp[ i S_N [q] + i integral dd(t) J_i (t) q_i (t)
 ].
$ <eq:coupled-oscillator-generating-functional>

因此，第 1.1 至 1.4 节建立的代数并不局限于单个自由度. 对正规化后的场论而言，真正新增的步骤只是让有限的坐标标签 $i$ 逐渐过渡为空间标签.

=== 空间晶格与连续场

设空间维数为 $d_s$，时空维数为 $D=d_s+1$. 在间距为 $a$ 的周期空间晶格上，每个格点 $n$ 放置一个实变量 $phi_n (t)$. 若 $e_r$ 表示沿 $r$ 方向跨越一个晶格步长，则最近邻标量作用量为

$
 S_a [phi]
 = integral dd(t) a^(d_s) sum_n
 [ 1/2 dot(phi)_n^2 - 1/2 sum_(r=1)^(d_s) ((phi_(n+e_r) - phi_n)/a)^2 - 1/2 m^2 phi_n^2
 ].
$ <eq:lattice-scalar-action>

在固定晶格间距与有限体积下，这正是 @eq:coupled-oscillator-action 的耦合系统. 当场在尺度 $a$ 上变化平缓时，空间差分与求和趋于

$
 (phi_(n+e_r) - phi_n)/a & arrow.r partial_r phi (t,x), \ a^(d_s) sum_n & arrow.r integral dd(x, [d_s])
$ <eq:lattice-continuum-replacements>

我们采用 mostly-plus Minkowski 约定

$
 tensor(eta, -mu, -nu) = upright("diag") (-1,+1,dots,+1), quad tensor(partial, -mu) phi tensor(partial, +mu) phi
 = -dot(phi)^2 + sum_(r=1)^(d_s) (partial_r phi)^2.
$ <eq:mostly-plus-metric>

因此，连续作用量为

$
 S [phi]
 = integral dd(x, [D])
 [ -1/2 tensor(partial, -mu) phi (x) tensor(partial, +mu) phi (x) - 1/2 m^2 phi (x)^2
 ].
$ <eq:continuum-real-scalar-action>

动能缩并前的负号是必需的，它保证复现 @eq:lattice-scalar-action 中正的 $dot(phi)^2/2$ 项. 作 Wick 转动 $t=-i tau$ 后，Minkowski 权重 $e^(i S)$ 变成 Euclidean 权重 $e^(-S_E)$，而 Euclidean 作用量具有正的动能项与质量项.

空间 Dirac delta 同样起源于有限晶格. 恒等式

$
 a^(d_s) sum_m (delta_(n m))/(a^(d_s)) f_m = f_n
$ <eq:lattice-delta-identity>

说明

$
 (delta_(n m))/(a^(d_s)) arrow.r delta^((d_s)) (x-y).
$ <eq:lattice-delta-continuum-limit>

同样，时间分片之后，正规化的位形空间测度只是普通的有限乘积：

$
 cal(D)_a phi := product_(ell,n) dd(phi_(ell,n)).
$ <eq:lattice-field-measure>

形式记号 $cal(D) phi$ 表示：物理量先用这个有限测度计算，再研究移去时间步长、晶格间距和有限盒子正规化后的极限.

=== 简正模与粒子诠释

晶格上的变量以空间位置为标签，但粒子诠释在动量空间中最清楚. 空间平移不变性保证不同 Fourier 模态彼此解耦，而这些模态正是耦合振子系统的简正坐标. 在体积为 $V$ 的周期盒子中，取归一化

$
 phi_n (t)
 = 1/sqrt(V) sum_k
 e^(i k dot x_n) tilde(phi)_k (t), quad tilde(phi)_(-k) = overline(tilde(phi)_k),
$ <eq:lattice-field-fourier-transform>

第二个关系来自实场条件. 将展开式代入 @eq:lattice-scalar-action，空间指标被对角化，

$
 S_a [phi]
 = 1/2 integral dd(t) sum_k
 [ dot(tilde(phi))_k dot(tilde(phi))_(-k) - omega_a (k)^2 tilde(phi)_k tilde(phi)_(-k)
 ],
$ <eq:lattice-field-mode-action>

其中晶格色散关系为

$
 omega_a (k)^2
 = m^2 + 4/a^2 sum_(r=1)^(d_s)
 sin^2((k_r a)/2).
$ <eq:lattice-scalar-dispersion>

当动量远小于晶格截断 $pi/a$ 时，

$
 omega_a (k)^2 arrow.r k^2 + m^2.
$ <eq:continuum-scalar-dispersion>

在连续记号下，同一 Fourier 展开写成

$
 phi (t,x)
 = integral (dd(k, [d_s]))/((2 pi)^(d_s))
 e^(i k dot x) tilde(phi) (t,k),
$ <eq:continuum-spatial-fourier-transform>

自由场作用量则化为连续多个谐振子作用量之和：

$
 S [phi]
 = 1/2 integral dd(t)
 integral (dd(k, [d_s]))/((2 pi)^(d_s)) [ dot(tilde(phi)) (t,k) dot(tilde(phi)) (t,-k) - omega_k^2 tilde(phi) (t,k) tilde(phi) (t,-k)
 ],
 quad omega_k = sqrt(k^2 + m^2).
$ <eq:continuum-field-mode-action>

每个独立简正模量子化后都是一个谐振子，能级为 $E_k=(n_k+1/2) omega_k$. 将占据数 $n_k$ 增加一，相当于产生一个空间动量为 $k$、能量为 $omega_k$ 的量子. 自由场的粒子诠释由此产生，无需额外附加. 产生湮灭算符、态的归一化以及 Fock 空间结构将在下一章系统建立.

=== 正则结构与场的路径积分

对于局域 Lagrangian 密度 $cal(L) (phi_a,tensor(partial, -mu) phi_a)$，场的共轭动量定义为

$
 pi_a (t,x) := (partial cal(L))/(partial dot(phi)_a) (t,x).
$ <eq:field-canonical-momentum>

有限维正则对易关系 $[hat(q)_i,hat(p)_j]=i delta_(i j)$ 在连续极限中变为等时场对易关系

$
 [ hat(phi)_a (t,x), hat(pi)_b (t,y)
 ]
 = i delta_(a b) delta^((d_s)) (x-y).
$ <eq:field-equal-time-commutator>

对晶格标量场，格点 $n$ 的正则动量为 $p_n=a^(d_s) dot(phi)_n$，因此

$
 [hat(phi)_n,hat(p)_m] & = i delta_(n m), \ [hat(phi)_n,dot(hat(phi))_m] & = i (delta_(n m))/(a^(d_s)),
$ <eq:lattice-field-commutators>

结合 @eq:lattice-delta-continuum-limit，连续极限正是 @eq:field-equal-time-commutator.

设 $cal(H) (pi,phi)$ 为 Hamiltonian 密度. 在每个格点重复第 1.1 节的时间分片，即得相空间形式的场积分

$
 Z
 = integral cal(D) pi cal(D) phi
 exp[ i integral dd(x, [D]) (pi_a dot(phi)_a - cal(H) (pi,phi))
 ].
$ <eq:field-phase-space-path-integral>

若 $cal(H)$ 关于 $pi$ 为二次型，逐点动量积分都是高斯积分，消去 $pi$ 后得到

$
 Z [J]
 = integral cal(D) phi
 exp[ i S [phi] + i integral dd(x, [D]) J_a (x) phi_a (x)
 ].
$ <eq:field-configuration-generating-functional>

这也给第 1.4 节的外源一个直观解释：先给耦合振子系统的每个坐标施加独立驱动力，再把坐标标签连续化为空间坐标，便得到场的外源 $J (x)$.

=== 局域性、Lorentz 不变性与质量量纲

从耦合振子过渡到连续场，只说明了自由度如何连续化，还没有回答哪些相互作用可以写入作用量. 相对论性场论通常从局域作用量出发：

$
 S [phi]
 = integral dd(x, [D])
 cal(L) (phi (x),tensor(partial, -mu) phi (x)).
$ <eq:local-field-action>

局域性要求 $x$ 点的 Lagrangian 密度只依赖同一点的场及其有限阶导数；Lorentz 不变性则要求所有时空指标缩并成 Lorentz 标量. 这两项条件在计算路径积分之前，便已显著限制作用量中允许出现的结构.

自然单位制提供了一项快捷的一致性检验. 赋予各量如下质量量纲：

$
 [x] = -1, quad [tensor(partial, -mu)] = 1, quad [S] = 0, quad [cal(L)] = D.
$ <eq:basic-mass-dimensions>

由 @eq:continuum-real-scalar-action 的标量动能项可得

$
 2 + 2 [phi] = D, quad arrow.r quad [phi] = (D-2)/2.
$ <eq:scalar-field-mass-dimension>

源项 $integral dd(x, [D]) J (x) phi (x)$ 必须无量纲，故标量源满足

$
 [J] = D - [phi] = (D+2)/2.
$ <eq:scalar-source-mass-dimension>

更一般地，若 $g_n$ 是 $phi^n$ 的系数，则

$
 [g_n] = D - n (D-2)/2.
$ <eq:scalar-coupling-mass-dimension>

目前 @eq:scalar-coupling-mass-dimension 只是量纲计数. 它与紫外行为之间的关系，要到引入重整化之后才会显现.

=== 不同类型的场

晶格正规化与简正模分析并不依赖场一定是实标量. 换用其他类型的场时，真正改变的是局域变量的代数性质以及二次算符的结构.

+ *实标量场*在每个格点上对应一个对易实变量，其二次算符含二阶导数.

+ *复标量场*包含两个对易实自由度. 路径积分中把 $phi$ 与 $overline(phi)$ 视为独立变量，并分别引入外源.

+ *Dirac 场*由 Grassmann 变量表示. 其动能算符为一阶，场积分产生行列式；由动能项 $overline(psi) tensor(gamma, +mu) tensor(partial, -mu) psi$ 可得 $[psi]=(D-1)/2$.

+ *矢量场*带有 Lorentz 指标. 规范场还含有冗余变量；在固定规范之前，二次算符存在零方向，因而不能直接求逆.

下一章将逐一量子化这些自由场. 无论场的类型如何，计算都沿着同一条主线展开：先在正规化理论中确定二次算符，再按正确的边界处方求逆，最后利用外源生成所需的关联函数.

#pagebreak(weak: true)

== 习题

#exercise(
 title: "Trotter 乘积公式与连续极限",
 label: <ex:trotter>,
)[
  设算符 $A$、$B$ 具有共同的不变定义域，以下形式展开均在该定义域上成立.
  + 将等式两边展开至 $epsilon^2$ 阶，证明
    $
      e^(epsilon (A + B))
      = e^(epsilon A) e^(epsilon B)
      - epsilon^2/2 [A, B] + O(epsilon^3).
    $
    并由此验证 @eq:trotter-step 中的 $O(epsilon^2)$ 估计.
  + 取 $A = -i hat(p)^2/(2m)$、$B = -i V (hat(x))$. 说明 $N$ 个时间片的总误差为 $N epsilon^2 = T epsilon$；在固定 $T = N epsilon$ 时，它随 $N arrow.r infinity$ 而消失.
  + 证明对称分解
    $
      e^(epsilon (A + B))
      = e^(epsilon A/2) e^(epsilon B) e^(epsilon A/2)
      + O(epsilon^3)
    $
    将累积误差改善为 $O(T epsilon^2)$.

]

#exercise(
 title: "带正规化的 Fresnel 积分",
 label: <ex:fresnel>,
)[
  对 $epsilon > 0$，引入保证收敛的正规化参数 $eta$：

  $
    I_eta (Delta q)
    = integral_( -infinity)^infinity (dd(p))/(2 pi)
    e^(-[eta + i epsilon/(2m)] p^2 + i p Delta q), quad eta > 0.
  $
  + 对指数配方，并利用二次项系数实部为正的复高斯积分求出 $I_eta$.
  + 从 $eta>0$ 作解析延拓并取 $eta arrow.r 0^+$，证明
    $
      lim_(eta arrow.r 0^+) I_eta (Delta q)
      = sqrt(m/(2 pi i epsilon))
      e^(i m (Delta q)^2/(2 epsilon)),
    $
    从而导出 @eq:fresnel-slice，并固定平方根的分支.
  + 验证所得核满足正确的复合律，并证明当 $epsilon arrow.r 0^+$ 时，它在广义函数意义下趋于 $delta(Delta q)$.

]

#exercise(
 title: "实矩阵高斯积分及其矩",
 label: <ex:real-matrix-gaussian>,
)[
  设 $A$ 为 $N times N$ 实对称正定矩阵.
  + 用正交变换对角化 $A$，推导 @eq:real-gaussian-N-source，并逐项核对 Jacobian 以及所有 $2 pi$ 因子.
  + 对归一化生成函数 @eq:normalized-real-gaussian 求导，复现 @eq:real-gaussian-two-and-four-point 中的二点与四点函数.
  + 令 $A$ 的一个本征值趋于零. 求 $Z_N (0;A)$ 的主导发散，并说明为何它可解释为平坦方向的体积.

]

#exercise(
 title: "复变量与泛函行列式",
 label: <ex:complex-gaussian-determinant>,
)[
  将每个复变量写成 $z_i = x_i + i y_i$.
  + 从 $2N$ 维实高斯积分出发推导 @eq:complex-gaussian-N-source，并解释行列式指数为何由 $-1/2$ 变为 $-1$.
  + 利用源导数，在有限变量情形下证明复场 Wick 公式 @eq:functional-complex-wick-theorem.
  + 将平移不变的二次理论置于周期盒子中，并施加动量截断. 证明 $log upright("Det") cal(K) = sum_p log cal(K) (p)$，找出其中正比于时空体积的因子；再保持体积有限并移去截断，说明此时仍保留哪一种发散.

]

#exercise(
 title: "Grassmann 高斯积分与自由费米子",
 label: <ex:grassmann-gaussian>,
)[
  设 $psi_i$ 与 $overline(psi)_i$（$i=1,dots,N$）为相互独立的 Grassmann 变量，并采用 @eq:fermionic-matrix-gaussian 的测度定向.
  + 对一对共轭变量，把 @eq:one-pair-fermionic-source 中的指数完全展开，逐次完成两个 Berezin 积分，并核对每个符号以及因子 $a$.
  + 对一般 $N$，直接证明 $e^(-overline(psi)_i A_(i j) psi_j)$ 中同时含全部 $psi_i$ 与 $overline(psi)_i$ 的单项式系数，在所选定向下等于 $det A$；随后配方并推导 @eq:fermionic-matrix-gaussian.
  + 固定左右导数约定，对 @eq:normalized-fermionic-gaussian 求导，复现 @eq:fermionic-two-point 与 @eq:fermionic-four-point；指出四点函数相对负号对应哪一次奇变量交换.
  + 对自由费米振子 $hat(H) = omega hat(a)^dagger hat(a)$，先在占据数表象中直接计算 $upright("Tr") e^(-beta hat(H))$；再利用 @eq:fermionic-euclidean-action 的反周期频率计算同一量，证明两种方法都给出 $Z (beta) = 1 + e^(-beta omega)$.

]

#exercise(
 title: "泛函导数与场插入",
 label: <ex:functional-source-insertions>,
)[
  设 $J_a (x)$ 为实多分量场的对易源.
  + 从 @eq:functional-derivative-definition 出发，推导 @eq:functional-derivative-field 与 @eq:functional-derivative-linear-source. 注意区分时空中的 Dirac delta 与内部指标空间中的 Kronecker delta.
  + 考虑 Euclidean 泛函 $F [phi]=integral dd(x, [d]) [1/2 tensor(partial, -mu) phi tensor(partial, +mu) phi + V (phi)]$. 计算 $(delta F)/(delta phi (x))$，明确说明分部积分所用的边界条件，并与 @eq:functional-derivative-kinetic-term 对照.
  + 将 @eq:minkowski-operator-generating-functional 展开到 $J$ 的三阶，再对源求导，核对 @eq:minkowski-correlators-from-source 中的每一个 $i$ 因子.
  + 分别对三条自由场生成泛函 @eq:free-real-boson-master-functional、 @eq:free-complex-boson-master-functional 与 @eq:free-dirac-master-functional 作源导数. 列出各理论中为零的二点插入，并从源的代数类型解释这些零值.

]

#exercise(
 title: "完整与连通关联函数",
 label: <ex:connected-correlators>,
)[
  设 $cal(Z)_E [J]=e^(W_E [J])$，且 $cal(Z)_E [0]=1$.
  + 分别对该关系求二阶和三阶导数，将完整关联函数表示成连通关联函数与一点函数的组合.
  + 对中心场求四阶导数，推导 @eq:connected-four-point-decomposition，并写全三种二二配对.
  + 对自由实玻色泛函 @eq:free-real-boson-master-functional，证明所有 $n>2$ 的连通函数均为零；再将二次型 $W_E [J]$ 代入 @eq:full-correlator-partition-formula，恢复一般的玻色 Wick 公式.
  + 从 $cal(Z)_M=e^(i W_M)$ 出发推导 @eq:minkowski-connected-correlators，并在 $n=1,2,3$ 时逐一核对 $i$ 的幂次.

]

#exercise(
 title: "从振子链到标量场",
 label: <ex:oscillator-chain-continuum>,
)[
  考虑格距为 $a$ 的一维周期链. 格点坐标为 $q_n (t)$，作用量取为

 $
 S_a [q]
 = integral dd(t) a sum_n
 [ 1/2 dot(q)_n^2 - v^2/2 ((q_(n+1)-q_n)/a)^2 - m^2/2 q_n^2
 ].
 $
  + 把 $q_n (t)$ 视为光滑场 $phi (t,x)$ 在格点上的取样. 在固定物理长度下令 $a arrow.r 0$，推导连续作用量.
  + 推导晶格上的 Euler--Lagrange 方程，并证明其连续极限为 $(partial_t^2-v^2 partial_x^2+m^2) phi (t,x)=0$.
  + 求 $q_n$ 的共轭动量，并推导与 @eq:lattice-field-commutators 对应的晶格等时对易关系.

]

#exercise(
 title: "晶格简正模与色散关系",
 label: <ex:lattice-normal-modes>,
)[
  以下均使用周期晶格作用量 @eq:lattice-scalar-action.
  + 代入 @eq:lattice-field-fourier-transform，证明将格点指标对角化所需的正交关系.
  + 保留显式格距 $a$，推导 @eq:lattice-scalar-dispersion.
  + 在固定动量下将 $omega_a (k)^2$ 展开至 $a^2$ 阶，找出它相对于相对论性连续色散关系的首项偏差，并说明为何 $pi/a$ 附近的模态不适用该展开.
  + 直接由模态作用量说明，实场条件把 $k$ 与 $-k$ 的系数配对，因此不能把二者计作互不相关的复振子.

]

#exercise(
 title: "场与外源的质量量纲",
 label: <ex:field-source-dimensions>,
)[
  在 $D$ 维时空和自然单位制下完成以下计算.
  + 从标量动能项出发，推导 @eq:scalar-field-mass-dimension 与 @eq:scalar-source-mass-dimension.
  + 由 Dirac 动能项推导 $[psi]=(D-1)/2$，并求通过 $integral dd(x, [D]) overline(eta) psi$ 耦合的 Grassmann 源 $overline(eta)$ 的质量量纲.
  + 分别求 $phi^3$、$phi^4$、$overline(psi) psi phi$ 与
 $(overline(psi) tensor(gamma, +mu) psi)
 (overline(psi) tensor(gamma, -mu) psi)$ 各项系数的质量量纲，并在 $D=4$ 时逐项检查结果.

]
