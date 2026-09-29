#import "../lib.typ": *

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

