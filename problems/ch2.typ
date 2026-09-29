#import "../lib.typ": *

#exercise(
  title: "Lorentz 与 Poincare 代数",
  label: <ex:lorentz-poincare-algebra>,
)[
  采用 @eq:lorentz-representation-generators 与 @eq:rotation-and-boost-generators 的约定.

  + 展开连续两次无穷小 Lorentz 变换的表示律，推导

    $
      [tensor(Sigma, +mu, +nu),tensor(Sigma, +rho, +sigma)]
      = i [
        tensor(eta, +mu, +sigma) tensor(Sigma, +nu, +rho)
        + tensor(eta, +nu, +rho) tensor(Sigma, +mu, +sigma)
        - tensor(eta, +mu, +rho) tensor(Sigma, +nu, +sigma)
        - tensor(eta, +nu, +sigma) tensor(Sigma, +mu, +rho)
      ].
    $

  + 利用 @eq:rotation-and-boost-generators 证明

    $
      [tensor(J, -i),tensor(J, -j)] & = i tensor(epsilon, -i, -j, +k) tensor(J, -k), \
      [tensor(J, -i),tensor(K, -j)] & = i tensor(epsilon, -i, -j, +k) tensor(K, -k), \
      [tensor(K, -i),tensor(K, -j)] & = -i tensor(epsilon, -i, -j, +k) tensor(J, -k).
    $

    说明最后一个负号为何表明 boost 不生成紧转动群.

  + 从 @eq:translation-generator-on-fields 与 @eq:orbital-lorentz-generator 出发，计算微分算符对易子并验证

    $
            [tensor(P, +mu),tensor(P, +nu)] & = 0, \
      [tensor(L, +mu, +nu),tensor(P, +rho)] & = i [
                                                tensor(eta, +nu, +rho) tensor(P, +mu)
                                                - tensor(eta, +mu, +rho) tensor(P, +nu)
                                              ].
    $
]

#pagebreak()

#exercise(
  title: "由指数映射得到有限转动与 boost",
  label: <ex:finite-lorentz-transformations>,
)[
  在矢量表示 @eq:vector-lorentz-generators 中计算，令 $b=0$，并保持被动约定 $tensor(x', +mu)=tensor(Lambda, +mu, -nu) tensor(x, +nu)$.

  + 对 $x^1$--$x^2$ 平面内的坐标轴转动，取 $tensor(omega, -1, -2)=theta$；对沿 $x^1$ 方向的 boost，取 $tensor(omega, -0, -1)=chi$. 从 @eq:lorentz-representation-generators 与 @eq:rotation-and-boost-generators 出发，证明相应指数映射为

    $
      Lambda_R (theta) = e^(i theta tensor(J, -3)),
      quad
      Lambda_B (chi) = e^(-i chi tensor(K, -1)).
    $

    说明两个指数中的符号如何由 $tensor(J, -i)=-1/2 tensor(epsilon, -i, -j, -k) tensor(Sigma, +j, +k)$ 确定，并排除主动变换约定的影响.

  + 在有序基 $(x^0,x^1,x^2,x^3)$ 中计算指数，导出

    $
      Lambda_R (theta) & = mat(
                           1, 0, 0, 0;
                           0, cos theta, sin theta, 0;
                           0, -sin theta, cos theta, 0;
                           0, 0, 0, 1
                         ), \
        Lambda_B (chi) & = mat(
                           cosh chi, -sinh chi, 0, 0;
                           -sinh chi, cosh chi, 0, 0;
                           0, 0, 1, 0;
                           0, 0, 0, 1
                         ).
    $

    直接验证两个矩阵均满足 $Lambda^T eta Lambda=eta$，并说明复合变换的参数相加. 对 boost，令 $v=tanh chi$、$gamma_v=cosh chi=1/sqrt(1-v^2)$，再恢复 $x'^0=gamma_v (x^0-v x^1)$ 与 $x'^1=gamma_v (x^1-v x^0)$.

  + 令 $Lambda$ 表示 $Lambda_R (theta)$ 或 $Lambda_B (chi)$. 写出固定坐标自变量处标量与矢量的被动变换：

    $
                 phi' (x) & = phi (Lambda^(-1) x), \
      tensor(A', +mu) (x) & = tensor(Lambda, +mu, -nu)
                            tensor(A, +nu) (Lambda^(-1) x).
    $

    再把同一变换律写在变换后的点 $x'=Lambda x$ 处. 随后利用 @eq:quantum-field-covariance 对量子场重复计算，注意保持 $U (Lambda)^(-1) tensor(hat(Psi), -a) U (Lambda)$ 的算符次序.

  + 分别把两个有限变换展开到 $theta$ 或 $chi$ 的一阶. 检验结果与 @eq:fixed-argument-field-transformation 的无穷小被动变换一致，并为 @ex:infinitesimal-field-action 的计算做好准备.
]

#exercise(
  title: "场上的无穷小作用",
  label: <ex:infinitesimal-field-action>,
)[
  令 $tensor(Lambda, +mu, -nu)=tensor(delta, +mu, -nu)+tensor(omega, +mu, -nu)$，把 @eq:fixed-argument-field-transformation 展开到 $tensor(omega, -mu, -nu)$ 与 $tensor(b, +mu)$ 的一阶.

  + 推导

    $
      tensor(delta Psi, -a) (x)
      = -tensor(b, +mu) tensor(partial, -mu) tensor(Psi, -a) (x)
      - i/2 tensor(omega, -mu, -nu)
      tensor(cal(M), +mu, +nu, -a, +b)
      tensor(Psi, -b) (x).
    $

  + 分别对标量与矢量检验结果. 对矢量场，验证内禀项确实重现 $tensor(Lambda, +mu, -nu)$ 的矩阵乘法.
]

#exercise(
  title: "两个 Weyl 表示",
  label: <ex:weyl-representation-properties>,
)[
  采用 @eq:rotation-and-boost-generators 的被动 Lorentz 约定.

  + 把 @eq:weyl-su2-generators 代入转动—boost 代数，导出 @eq:complex-lorentz-algebra-split 的三条对易关系. 反解定义，用 $tensor(cal(A), -i)$ 与 $tensor(cal(B), -i)$ 表示 $tensor(J, -i)$、$tensor(K, -i)$，并说明有限维不可约表示为何可由两个自旋 $(j_A,j_B)$ 标记.

  + 只从 Pauli 恒等式 @eq:pauli-matrix-algebra 出发，验证 @eq:left-right-weyl-generators 的两行生成元均满足

    $
      [tensor(J, -i),tensor(J, -j)] & =i tensor(epsilon, -i, -j, +k)tensor(J, -k), \
      [tensor(J, -i),tensor(K, -j)] & =i tensor(epsilon, -i, -j, +k)tensor(K, -k), \
      [tensor(K, -i),tensor(K, -j)] & =-i tensor(epsilon, -i, -j, +k)tensor(J, -k).
    $

    显式证明左手分块满足 $tensor(cal(A), -i)=tensor(sigma, -i)/2$ 且 $tensor(cal(B), -i)=0$，而右手分块中的分配恰好相反.

  + 分别指数化绕第三轴的转动与沿第三轴的 boost，恢复 @eq:finite-weyl-transformations，并求出矩阵的闭式形式. 验证

    $
      D_L (R (theta))^dagger D_L (R (theta))=1_2,
      quad
      D_L (B (chi))^dagger D_L (B (chi))
      =e^(chi tensor(sigma, -3)) != 1_2
    $

    在 $chi!=0$ 时成立. 对右手分块重复计算，并解释有限维 boost 的非幺正性为何与量子理论中的幺正时间演化相容.

  + 证明矩阵恒等式 @eq:weyl-invariant-epsilon. 若 $psi_L'=D_L (Lambda)psi_L$，分别对转动与 boost 证明

    $
      epsilon_s (psi_L')^*
      =D_R (Lambda)epsilon_s psi_L^*.
    $

    引入无点指标 $a,b=1,2$ 与有点指标 $dot(a),dot(b)=1,2$，用 $epsilon_s$ 和 $epsilon_s^(-1)$ 升降指标，并说明复共轭为何把无点指标变为有点指标. 由此写出 @eq:weyl-conjugate-spinor 后共轭关系的详细形式.

  + 最后在任一 Weyl 表示中计算 $2 pi$ 转动，证明其结果为 $-1_2$，而 $4 pi$ 转动给出 $+1_2$，并把这一结果与双覆盖 $upright("Spin")^+ (1,3)$ 联系起来.
]

#pagebreak()

#exercise(
  title: "由 Weyl 旋量构造 Dirac 与矢量表示",
  label: <ex:dirac-vector-from-weyl>,
)[
  本题比较组合 Weyl 表示的两种不同方式：直和产生 Dirac 旋量，张量积产生 Lorentz 矢量.

  + 构造分块直和

    $
      tensor(J_D, -i)=tensor(J_L, -i) "⊕" tensor(J_R, -i),
      quad
      tensor(K_D, -i)=tensor(K_L, -i) "⊕" tensor(K_R, -i).
    $

    恢复 @eq:dirac-block-generators 与 @eq:dirac-generators-from-blocks. 通过分块乘法验证转动—boost 代数，再导出协变对易关系 @eq:dirac-generator-lorentz-algebra，从而证明直和生成元的指数给出 Dirac 表示.

  + 代入手征 gamma 矩阵 @eq:chiral-gamma-matrices，验证 @eq:gamma-matrices-recover-dirac-generators 的两行. 从 Clifford 代数出发导出 @eq:dirac-gamma-generator-commutator；再把 $D (Lambda)$ 展开到 $tensor(omega, -mu, -nu)$ 的一阶，得到 @eq:dirac-gamma-covariance，并说明结果为何可推广到与恒等元连通的有限变换.

  + 接着构造张量积空间

    $
      V_(1/2,1/2)
      :=V_(1/2,0) "⊗" V_(0,1/2),
    $

    其生成元为

    $
      tensor(Sigma_(L R), +mu, +nu)
      :=tensor(Sigma_L, +mu, +nu) "⊗" 1_2
      +1_2 "⊗" tensor(Sigma_R, +mu, +nu).
    $

    直接证明这些生成元满足 Lorentz 代数. 注意，这个四维空间取 Weyl 表示的张量积；Dirac 旋量则采用直和.

  + 为把上述张量积识别为经典矢量表示，定义四个矩阵

    $
      tensor(tau, +mu):=tensor(sigma, +mu)epsilon_s,
      quad
      V_(a dot(b)):=tensor(V, -mu)tensor(tau, +mu)_(a dot(b)).
    $

    两个旋量指标分别按 $D_L (Lambda)$ 与 $D_R (Lambda)$ 变换. 把它们简记为 $D_L$、$D_R$，则矩阵记号下

    $
      V'=D_L V D_R^T.
    $

    利用 $epsilon_s tensor(sigma, -i)^T=-tensor(sigma, -i)epsilon_s$ 计算无穷小转动与 boost，证明在 $tensor(V, +rho)$ 上诱导出的矩阵为

    $
      tensor(Sigma_V, +mu, +nu, +rho, -sigma)
      =i [
        tensor(eta, +mu, +rho)tensor(delta, +nu, -sigma)
        -tensor(eta, +nu, +rho)tensor(delta, +mu, -sigma)
      ],
    $

    它正是 @eq:vector-lorentz-generators 的经典矢量生成元. 最后把沿第一轴的 boost 指数化，恢复 @ex:finite-lorentz-transformations 中的矢量矩阵.
]

#pagebreak()

#exercise(
  title: "Dirac 伴随与守恒流",
  label: <ex:dirac-adjoint-and-currents>,
)[
  使用手征 gamma 矩阵 @eq:chiral-gamma-matrices 与被动场变换 @eq:passive-dirac-field-transformation.

  + 直接验证 $tensor(gamma, +0)$ 是 Hermitian 的，而每个 $tensor(gamma, +i)$ 都是反 Hermitian 的. 导出 @eq:dirac-gamma-generator-hermiticity 中的两个恒等式，再证明

    $
      D (Lambda)^dagger tensor(gamma, +0)D (Lambda)
      =tensor(gamma, +0)
    $

    先在无穷小层面证明，再推广到指数表示. 不假设 $D (Lambda)$ 幺正，利用该式得到 @eq:dirac-adjoint-transformation.

  + 从 @eq:dirac-gamma-covariance 与 $[gamma^5,tensor(Sigma_D, +mu, +nu)]=0$ 出发，导出 @eq:dirac-bilinear-list 中每个双线性量在连通 Lorentz 群下的变换. 特别证明

    $
      overline(Psi')tensor(Sigma_D, +mu, +nu)Psi'
      =tensor(Lambda, +mu, -rho)tensor(Lambda, +nu, -sigma)
      overline(Psi)tensor(Sigma_D, +rho, +sigma)Psi.
    $

    若宇称表示为 $Psi' (t,-bold(x))=eta_P tensor(gamma, +0)Psi (t,bold(x))$，其中 $abs(eta_P)=1$，判断各双线性量的宇称奇偶性.

  + 分别对 $Psi$ 与 $overline(Psi)$ 变分 @eq:free-dirac-action，导出两条 Dirac 方程. 以共轭算符左乘第一条方程，显式保留 mostly-plus Clifford 符号并验证 @eq:dirac-operator-square. 说明从 Klein--Gordon 方程反推 Dirac 方程为何不成立.

  + 对 @eq:dirac-global-phase-symmetry 应用 Noether 定理，导出 @eq:dirac-noether-current；再直接计算

    $
      tensor(partial, -mu)
      [overline(Psi)tensor(gamma, +mu)gamma^5 Psi]
      =2i m overline(Psi)gamma^5 Psi.
    $

    当 $m=0$ 时，构造 $P_L Psi$ 与 $P_R Psi$ 各自的守恒流，并把它们表示为 $tensor(j, +mu)$ 与 $tensor(j_5, +mu)$ 的线性组合.

  + 在相差一个空间全导数的意义下，把 Lagrangian 改写为

    $
      cal(L)_D
      =i Psi^dagger partial_t Psi
      -Psi^dagger cal(H)_D Psi
    $

    导出 @eq:dirac-first-order-canonical-momenta，并说明这些方程为何构成约束、无法决定速度. 采用标准空间内积及适当边界条件，验证 @eq:dirac-hamiltonian-equation 中的 $cal(H)_D$ 是 Hermitian 的.
]

#exercise(
  title: "boost 后的 Dirac 旋量与自旋求和",
  label: <ex:boosted-dirac-spinors-and-spin-sums>,
)[
  本题从静止系推导平面波公式，避免直接猜测任意动量处的四分量解.

  + 把 $u (p)e^(i p dot x)$ 与 $v (p)e^(-i p dot x)$ 代入自由 Dirac 方程，恢复 @eq:dirac-momentum-space-equations. 在 $p=p_*$ 处求解 @eq:rest-dirac-spinor-eigenvalue-equations 的两条本征值方程，证明一般归一化解具有 @eq:rest-dirac-spinors 的形式.

  + 从 @eq:finite-dirac-rotations-and-boosts 的 boost 指数出发，利用

    $
      cosh (chi_p/2) & =sqrt((E_p+m)/(2m)), \
      sinh (chi_p/2) & =(abs(bold(p)))/sqrt(2m(E_p+m))
    $

    导出 @eq:massive-standard-spinor-boost. 直接验证相应矢量 boost 把 $p_*$ 映到 $p$；这一检验固定 @eq:massive-standard-boost 中的被动符号.

  + 把 boost 作用于静止旋量，导出 @eq:explicit-boosted-dirac-spinors. 利用 $(bold(sigma) dot bold(p))^2=bold(p)^2 1_2$，直接检验它们满足 @eq:dirac-momentum-space-equations 与 @eq:dirac-equal-time-spinor-normalization.

  + 从二分量旋量完备关系 @eq:two-spinor-basis-completeness 出发，计算下列两个矩阵的四个分块：

    $
      sum_s u_s (p)overline(u)_s (p),
      quad
      sum_s v_s (p)overline(v)_s (p).
    $

    逐一保留符号，导出 @eq:dirac-spin-sums. 用动量空间方程从左右两侧检验结果，再取矩阵迹核对秩，并证明 @eq:dirac-energy-projectors 中完整的投影代数.

  + 固定 $tensor(p, +mu)=(E,0,0,E)$ 并取 $m arrow.r 0$. 利用 $tensor(sigma, -3)$ 的本征矢量求极限旋量，验证 @eq:massless-dirac-helicity-components 与 @eq:massless-chirality-helicity-relation. 说明为什么静止系推导本身不能用于 $m=0$，尽管 boost 后的公式在固定动量下具有良好极限.
]

#pagebreak()

#exercise(
  title: "Dirac 模与可观测量",
  label: <ex:dirac-mode-algebra-and-observables>,
)[
  本题从场展开推导振子代数与可加可观测量，而不把它们视为彼此独立的量子化约定.

  + 在 $t=0$，利用单粒子 Hamiltonian $cal(H)_D (bold(p))$ 的 Hermiticity 证明

    $
      u_s (p)^dagger v_r (-p)=0,
      quad
      v_s (p)^dagger u_r (-p)=0.
    $

    随后反演 @eq:quantized-dirac-mode-expansion，得到

    $
             hat(b)_s (p) & =integral dd(x, [3]) e^(-i bold(p) dot bold(x))
                            u_s (p)^dagger hat(Psi) (0,bold(x)), \
      hat(d)_s^dagger (p) & =integral dd(x, [3]) e^(+i bold(p) dot bold(x))
                            v_s (p)^dagger hat(Psi) (0,bold(x)).
    $

    取 Hermitian 共轭得到另外两个投影. 利用 @eq:dirac-equal-time-canonical-anticommutator 导出 @eq:dirac-ladder-anticommutators 中的全部因子，并验证混合反对易子为零.

  + 反向完成计算：从阶梯算符代数出发，把模展开代入等时场反对易子. 由 @eq:dirac-spin-sums 导出恒等式

    $
      sum_(s=1)^2 [
        u_s (p)u_s (p)^dagger
        +v_s (-p)v_s (-p)^dagger
      ]=2E_p 1_4,
    $

    再在反粒子项中作 $bold(p) arrow.r -bold(p)$，恢复 @eq:dirac-equal-time-canonical-anticommutator. 由此显式验证不变测度、旋量归一化与阶梯算符归一化构成同一套相容约定.

  + 把模展开代入

    $
      hat(H)=integral dd(x, [3])
      hat(Psi)^dagger cal(H)_D hat(Psi),
      quad
      hat(Q)=integral dd(x, [3])hat(Psi)^dagger hat(Psi).
    $

    证明所有粒子—反粒子混合项均为零，并在正规序之前得到

    $
      hat(H) & =sum_s integral tilde(dd(p)) E_p
               [hat(b)_s^dagger hat(b)_s-hat(d)_s hat(d)_s^dagger], \
      hat(Q) & =sum_s integral tilde(dd(p))
               [hat(b)_s^dagger hat(b)_s+hat(d)_s hat(d)_s^dagger],
    $

    右端所有算符都带共同自变量 $p$. 重排 $hat(d)$ 算符，识别真空 c-number，并恢复 @eq:dirac-normal-ordered-four-momentum 与 @eq:dirac-normal-ordered-charge. 导出 @eq:dirac-charge-commutators 中的荷对易关系，包括直接由模展开得到的场对易子.

  + 利用阶梯算符代数计算 @eq:dirac-one-particle-states 的范数与本征值，并证明反对称关系 @eq:dirac-fock-antisymmetry. 最后改用玻色对易关系重复 Hamiltonian 重排，准确说明为什么此时不能同时保留正的单反粒子范数与有下界的 Hamiltonian.
]

#pagebreak()

#exercise(
  title: "费米约束与局域性",
  label: <ex:dirac-constraints-and-locality>,
)[
  本题先把一阶经典作用量与等时量子代数联系起来，再把该代数推广到任意时空点.

  + 把 $Psi_alpha$ 与 $Psi_alpha^dagger$ 视为独立的 Grassmann 奇坐标，其动量分别记为 $Pi_alpha$ 与 $Pi_alpha^dagger$，并采用对称的基本分次括号

    $
      [Psi_alpha (bold(x)),Pi_beta (bold(y))]_g & =[Pi_beta (bold(y)),Psi_alpha (bold(x))]_g \
                                                & =delta_(alpha beta)delta^((3)) (bold(x)-bold(y)),
    $

    以及完全类似的带 dagger 关系. 从 $cal(L)_D=i Psi^dagger dot(Psi)-Psi^dagger cal(H)_D Psi$ 出发，导出约束

    $
      chi_(1 alpha)=Pi_alpha-i Psi_alpha^dagger approx 0,
      quad
      chi_(2 alpha)=Pi_alpha^dagger approx 0.
    $

    证明它们是二类约束，且仅有的非零约束括号为

    $
      C_(1 alpha,2 beta)=C_(2 beta,1 alpha)
      =-i delta_(alpha beta)delta^((3)) (bold(x)-bold(y)).
    $

    求该核的逆并构造分次 Dirac 括号，验证

    $
      [Psi_alpha (bold(x)),Psi_beta^dagger (bold(y))]_(D,g)
      =-i delta_(alpha beta)delta^((3)) (bold(x)-bold(y)).
    $

    在费米量子化规则 $i[A,B]_(D,g) arrow.r [hat(A),hat(B)]_+$ 下恢复 @eq:dirac-equal-time-canonical-anticommutator. 若改用另一套内部自洽的左、右 Grassmann 微分约定，追踪中间符号变化，并证明最终算符 CAR 不变.

  + 从 @eq:quantized-dirac-mode-expansion 与 @eq:dirac-ladder-anticommutators 出发，不预设协变形式，计算 $[hat(Psi)_alpha (x),overline(hat(Psi))_beta (y)]_+$. 代入 @eq:dirac-spin-sums，证明粒子项与反粒子项恰好具有 @eq:dirac-covariant-field-anticommutator 显示的两个符号. 再让 Dirac 算符作用于 @eq:massive-pauli-jordan-distribution，证明该式第二行.

  + 取等时极限，恢复 @eq:dirac-equal-time-covariant-anticommutator，包括 $tensor(gamma, +0)$ 因子. 分别证明 $[hat(Psi)_alpha (x),hat(Psi)_beta (y)]_+=0$ 以及对应伴随场反对易子为零. 利用 Pauli--Jordan 分布的 Lorentz 不变性，对任意类空间隔建立 @eq:dirac-fermionic-microcausality.

  + 在互异类空点，把 $overline(hat(Psi))Gamma_1 hat(Psi)$ 与 $overline(hat(Psi))Gamma_2 hat(Psi)$ 中的四个费米因子逐一交换，证明 @eq:dirac-even-observable-locality. 最后导出 @eq:dirac-wightman-function，并说明它在类空间隔可能非零，为何仍与反对易子消失及局域测量的因果性相容.
]

#exercise(
  title: "标量模与二次量子化 Hamiltonian",
  label: <ex:scalar-hamiltonian-from-modes>,
)[
  使用不变测度 @eq:lorentz-invariant-mass-shell-measure 与模展开 @eq:real-scalar-mode-expansion.

  + 在 $t=0$ 反演模展开，证明

    $
      hat(a) (k)
      = integral dd(x, [3]) e^(-i bold(k) dot bold(x))
      [
        omega_k hat(phi) (0,bold(x))
        + i hat(pi) (0,bold(x))
      ].
    $

    利用 @eq:real-scalar-canonical-commutators 导出 @eq:real-scalar-ladder-commutators，完整保留 $2 omega_k$ 与 $2 pi$ 的所有因子.

  + 把 $hat(phi)$ 与 $hat(pi)$ 的模展开代入

    $
      hat(H)
      = 1/2 integral dd(x, [3])
      [
        hat(pi)^2
        + bold(nabla) hat(phi) dot bold(nabla) hat(phi)
        + m^2 hat(phi)^2
      ].
    $

    显式证明含两个产生算符或两个湮灭算符的项相消，并得到

    $
      hat(H)
      = integral tilde(dd(k))
      omega_k hat(a)^dagger (k) hat(a) (k)
      + E_0,
      quad
      E_0
      = 1/2 (2 pi)^3 delta^((3)) (0)
      integral (dd(k, [3]))/((2 pi)^3) omega_k.
    $

    把 $(2 pi)^3 delta^((3)) (0)$ 解释为空间体积，在有限周期盒中重复计算，并说明正规序如何给出 @eq:second-quantized-scalar-observables 的第一行.

  + 从 $tensor(T, +mu, +nu)=tensor(partial, +mu) phi tensor(partial, +nu) phi+tensor(eta, +mu, +nu) cal(L)_0$ 出发计算空间动量，恢复 @eq:second-quantized-scalar-observables 中的四矢量表达式. 最后直接由阶梯算符代数验证 @eq:additive-fock-space-four-momentum.
]

#pagebreak()

#exercise(
  title: "复标量模与守恒荷",
  label: <ex:complex-scalar-charge>,
)[
  采用 @eq:complex-scalar-mode-expansion 的协变归一化.

  + 在 $t=0$ 反演两条模展开，导出

    $
      hat(a) (k) & =integral dd(x, [3]) e^(-i bold(k) dot bold(x))
                   [
                     omega_k hat(phi) (0,bold(x))
                     +i hat(pi)^dagger (0,bold(x))
                   ], \
      hat(b) (k) & =integral dd(x, [3]) e^(-i bold(k) dot bold(x))
                   [
                     omega_k hat(phi)^dagger (0,bold(x))
                     +i hat(pi) (0,bold(x))
                   ].
    $

    利用 @eq:complex-scalar-canonical-commutators 得到 @eq:complex-scalar-ladder-commutators，并证明所有 $a$--$b$ 混合对易子均为零.

  + 从正则 Hamiltonian 密度

    $
      cal(H)_0
      =pi^dagger pi
      +bold(nabla) phi^dagger dot bold(nabla) phi
      +m^2 phi^dagger phi,
    $

    出发导出 @eq:complex-scalar-second-quantized-momentum. 把真空项保留到最后，并证明两类量子贡献相同的零点能.

  + 对 @eq:complex-scalar-global-u1 应用 Noether 定理，导出 @eq:complex-scalar-noether-current. 把模展开代入 $hat(Q)=integral dd(x, [3]) tensor(hat(j), +0)$，恢复 @eq:complex-scalar-charge-operator. 再直接由阶梯算符代数验证 @eq:complex-scalar-charge-eigenstates 与 @eq:charge-generates-global-u1.

  + 施加实条件 $hat(phi)^dagger=hat(phi)$，证明它迫使 $hat(b) (k)=hat(a) (k)$，并消去非平凡 $U (1)$ 荷. 解释实标量为何是自身的反粒子.
]

#exercise(
  title: "复标量相位对称性的规范化",
  label: <ex:gauging-complex-scalar>,
)[
  从局域相位变换 $phi' (x)=e^(-i q alpha (x))phi (x)$ 出发.

  + 计算 $tensor(partial, -mu)phi'$，显式说明 @eq:free-complex-scalar-action 的自由动能项为何仅在 $alpha$ 为常数时不变.

  + 设 $tensor(D, -mu)=tensor(partial, -mu)+i q tensor(A, -mu)$，并要求

    $
      tensor(D', -mu)phi'
      =e^(-i q alpha)tensor(D, -mu)phi
    $

    对任意 $phi$ 成立. 导出 $tensor(A', -mu)=tensor(A, -mu)+tensor(partial, -mu)alpha$，再直接代入验证，并逐项检查所有正比于 $tensor(partial, -mu)alpha$ 的贡献确实相消.

  + 证明

    $
      [tensor(D, -mu),tensor(D, -nu)]phi
      =i q tensor(F, -mu, -nu)phi,
    $

    并利用该恒等式证明 @eq:scalar-gauge-invariant-building-blocks. 逐项说明 @eq:scalar-electrodynamics-preview 既是 Lorentz 标量，也具有局域 $U (1)$ 不变性.

  + 展开协变动能项，证明

    $
      cal(L)_("scalar QED")
      =cal(L)_0
      -q tensor(A, -mu)tensor(j, +mu)
      -q^2 tensor(A, -mu)tensor(A, +mu)phi^dagger phi
      -1/4 tensor(F, -mu, -nu)tensor(F, +mu, +nu),
    $

    其中 $tensor(j, +mu)$ 是 @eq:complex-scalar-noether-current 的单位荷流. 辨认关于 $tensor(A, -mu)$ 的线性项和二次 seagull 项.

  + 比较 $tensor(F, -mu, -nu)tensor(F, +mu, +nu)$ 与 $m_A^2 tensor(A, -mu)tensor(A, +mu)$ 的规范变换，验证前者不变、后者发生变化. 说明局域协变性为何能确定联络如何耦合物质，却不能单独要求联络具有 Maxwell 动能项.
]

#exercise(
  title: "经典规范冗余与 Maxwell 自由度",
  label: <ex:maxwell-gauge-redundancy>,
)[
  从自由 Maxwell 作用量 @eq:free-maxwell-action 出发，假设各场在空间无穷远充分迅速地衰减.

  + 施加 $tensor(A, -mu) arrow.r tensor(A, -mu)+tensor(partial, -mu)alpha$，直接验证 $tensor(F, -mu, -nu)$、Maxwell 作用量以及两组 Maxwell 方程均不变. 反过来，设两个势具有相同场强；证明二者之差为闭一形式，再用 Poincare 引理说明它们在 Minkowski 时空上局域规范等价.

  + 展开 @eq:free-maxwell-action 中的场强并分部积分，导出二次型 @eq:maxwell-degenerate-kinetic-operator. 把其中的微分算符记为

    $
      tensor(K, +mu, +nu)
      :=tensor(eta, +mu, +nu)partial^2
      -tensor(partial, +mu)tensor(partial, +nu).
    $

    直接证明

    $
      tensor(K, +mu, +nu)tensor(partial, -nu)alpha=0.
    $

    在动量空间导出

    $
      tensor(K, +mu, +nu) (k)
      =-k^2 tensor(eta, +mu, +nu)
      +tensor(k, +mu)tensor(k, +nu),
      quad
      tensor(K, +mu, +nu) (k)tensor(k, -nu)=0.
    $

    对满足 $k^2 != 0$ 的动量，把矢量分解为横向与纵向部分. 降低一个指标形成 $tensor(K, +mu, -nu) (k)$，求其四个本征值，并说明纵向零本征值为何使未固定规范的动能算符不可逆. 把这一零模与 @eq:maxwell-gauge-equivalence 联系起来，而不要把它误认为物理零质量极点.

  + 定义空间场

    $
      tensor(E, -i):=tensor(F, -0, -i),
      quad
      tensor(B, -i):=1/2 tensor(epsilon, -i, -j, -k)
      tensor(F, -j, -k).
    $

    在 mostly-plus 度规下验证

    $
      cal(L)_M=1/2 [bold(E)^2-bold(B)^2].
    $

    导出 @eq:maxwell-canonical-momenta，并根据 Lagrangian 中不含 $tensor(partial, -0)tensor(A, -0)$ 显式证明 $tensor(Pi, +0)=0$. 完成 Legendre 变换并作一次空间分部积分，得到

    $
      H_M=integral dd(x, [3]) [
        1/2 tensor(Pi, -i)tensor(Pi, +i)
        +1/4 tensor(F, -i, -j)tensor(F, +i, +j)
        -tensor(A, -0)tensor(partial, -i)tensor(Pi, +i)
      ].
    $

    说明对 $tensor(A, -0)$ 变分为何给出 Gauss 定律，且不产生新的演化方程.

  + #block(breakable: false)[
      对空间正则变量规定

      $
        {tensor(A, -i) (bold(x)),tensor(Pi, +j) (bold(y))}_"P.B."
        =tensor(delta, -i, +j)delta^((3)) (bold(x)-bold(y)).
      $
    ]

    证明 smeared Gauss 约束

    $
      G [alpha]
      :=-integral dd(x, [3])
      alpha (bold(x))tensor(partial, -i)tensor(Pi, +i) (bold(x))
    $

    生成 $delta tensor(A, -i)=tensor(partial, -i)alpha$ 且 $delta tensor(Pi, +i)=0$. 计算 $tensor(Pi, +0)=0$ 与 Gauss 定律从相空间中移去的维数，恢复每个空间点上的两个物理位形自由度.
]

#exercise(
  title: "光子偏振与横向正则代数",
  label: <ex:maxwell-polarizations-and-canonical-algebra>,
)[
  本题先显式构造偏振矢量，再检验约化量子理论的归一化.

  + 从标准正能量零矢量动量与两个实线偏振出发：

    $
      tensor(k_*, +mu) & =(kappa,0,0,kappa), \
      tensor(e_1, +mu) & =(0,1,0,0), \
      tensor(e_2, +mu) & =(0,0,1,0),
                         quad kappa>0.
    $

    先不施加规范条件，求解 $k_* dot epsilon=0$. 证明等价关系 $tensor(epsilon, +mu) "∼" tensor(epsilon, +mu)+beta tensor(k_*, +mu)$ 允许选择辐射规范代表元 $tensor(epsilon, +0)=tensor(epsilon, +3)=0$，并验证上面两个矢量构成剩余平面的正交归一基.

    定义

    $
      tensor(epsilon, +mu) (k_*,lambda)
      :=1/sqrt(2) [
        tensor(e_1, +mu)+i lambda tensor(e_2, +mu)
      ],
      quad lambda=plus.minus 1.
    $

    利用 $tensor(J, -3)=-tensor(Sigma_V, +1, +2)$ 与 @eq:vector-lorentz-generators，验证它们是本征值 $lambda=plus.minus 1$ 的螺旋度本征矢量. 检验其正交归一性，并显式证明空间完备性求和为 $upright("diag") (1,1,0)$，即沿第三轴动量的横向投影算符.

  + 令

    $
      tensor(k, +mu)
      =(omega_k,omega_k hat(bold(k))),
      quad omega_k>0,
    $

    并选择把第三轴映到 $hat(bold(k))$ 的空间转动 $R (hat(bold(k)))$. 采用 @ex:finite-lorentz-transformations 的被动 boost 约定，选取 $chi_k$ 使

    $
      L (k)
      :=R (hat(bold(k))) B_3 (chi_k),
      quad
      L (k)k_*=k.
    $

    证明 $chi_k=-ln (omega_k/kappa)$，并定义

    $
      tensor(epsilon, +mu) (k,lambda)
      :=tensor(L (k), +mu, -nu)
      tensor(epsilon, +nu) (k_*,lambda).
    $

    对所得任意零矢量动量验证 @eq:maxwell-polarization-conditions 与 @eq:maxwell-transverse-polarization-completeness. 说明若用绕 $hat(bold(k))$ 的转动改变 $R (hat(bold(k)))$，圆偏振为何只多出螺旋度相位.

  + #block(breakable: false)[
      一般 Lorentz 变换未必保持辐射规范代表元. 令

      $
                     tensor(k', +mu) & =tensor(Lambda, +mu, -nu)tensor(k, +nu), \
        tensor(tilde(epsilon)', +mu) & =tensor(Lambda, +mu, -nu)
                                       tensor(epsilon, +nu) (k,lambda).
      $

      选择

      $
        beta
        :=-(tensor(tilde(epsilon)', +0))/(tensor(k', +0)),
        quad
        tensor(epsilon', +mu)
        :=tensor(tilde(epsilon)', +mu)+beta tensor(k', +mu).
      $
    ]

    证明 $tensor(epsilon', +0)=0$、$k' dot epsilon'=0$，且附加项不改变平面波场强. 这就是回到选定辐射规范代表元所需的补偿规范变换.

  + 从 @eq:maxwell-transverse-mode-expansion 出发，在辐射规范下使用 $tensor(hat(Pi), -i)=tensor(partial, -0)tensor(hat(A), -i)$ 以及阶梯算符代数 @eq:maxwell-ladder-commutators，计算 $tensor(hat(A), -i)$ 与 $tensor(hat(Pi), -j)$ 的等时对易子. 保留 $2 omega_k$ 与 $2 pi$ 的每个因子，并利用 @eq:maxwell-transverse-polarization-completeness 精确导出带分布 @eq:maxwell-transverse-delta 的 @eq:maxwell-transverse-canonical-commutator.

  + 证明反向推导. 在 $t=0$ 导出反演公式

    $
      hat(a)_lambda (k)
      =integral dd(x, [3]) e^(-i bold(k) dot bold(x))
      tensor(epsilon, +i)^* (k,lambda)
      [
        omega_k tensor(hat(A), -i) (0,bold(x))
        +i tensor(hat(Pi), -i) (0,bold(x))
      ].
    $

    代入 @eq:maxwell-transverse-canonical-commutator，并利用横向投影对每个偏振矢量作用为恒等映射这一事实，恢复 @eq:maxwell-ladder-commutators，包括协变因子 $2 omega_k (2 pi)^3$. 由此双向验证 @eq:maxwell-transverse-canonical-commutator、@eq:maxwell-transverse-delta 与 @eq:maxwell-ladder-commutators 的一致性.
]

#pagebreak()

#exercise(
  title: "标量与 Dirac 围道传播子",
  label: <ex:scalar-dirac-contour-propagators>,
)[
  全程采用 Fourier 约定 @eq:chapter-two-fourier-convention. 不变质量壳积分中的动量标签均取正能量.

  + 从 @eq:real-scalar-quadratic-operator 出发，把场正规化为有限个实变量，并在外源 $J$ 存在时配方. 除以零源积分后恢复 @eq:scalar-feynman-generating-functional. 作两次微分，追踪得到算符关联函数所需的两个 $1/i$ 因子，并验证 @eq:scalar-feynman-green-equation 的两条等式.

  + 在复 $tensor(p, +0)$ 平面定位 @eq:scalar-feynman-propagator 的两个极点. 对正、负 $tensor(z, +0)$ 分别在正确半平面闭合围道，导出 @eq:scalar-feynman-time-ordering. 跨过 $tensor(z, +0)=0$ 积分 Green 方程，证明跳跃条件

    $
      [tensor(partial, -0) Delta_F (z)]_(0^-)^(0^+)
      =-i delta^((3)) (bold(z)).
    $

    直接证明两个质量壳项恰好具有这一跳跃. 对复标量场重复 Gaussian 计算，并从外源微分说明 @eq:complex-scalar-feynman-propagators 中两个同荷关联函数为何为零.

  + 在有限正规化下，把 $Psi$、$overline(Psi)$、$eta$ 与 $overline(eta)$ 视为独立奇变量. 不隐式交换任何两个奇量，验证 @eq:dirac-source-completion. 对 $overline(eta)$ 作左微分、对 $eta$ 作右微分，导出 @eq:dirac-propagator-as-inverse，包括整体因子 $i$.

  + 在动量空间中，用 $-slashed(p)-m$ 左乘 @eq:dirac-feynman-propagator 给出的逆，恢复单位矩阵. 完成 $tensor(p, +0)$ 围道积分，利用 @eq:dirac-spin-sums 导出 @eq:dirac-time-ordered-mode-form. 显式证明负时间留数因费米时间排序多出一个负号. 最后作用 $i tensor(gamma, +mu)tensor(partial, -mu)-m$，验证 @eq:dirac-feynman-green-equation，包括等时接触项.
]

#pagebreak()

#exercise(
  title: "协变光子传播子与规范无关性",
  label: <ex:covariant-photon-propagator>,
)[
  从退化 Maxwell 核 @eq:maxwell-degenerate-kinetic-operator 出发，并在最后一步之前始终保留 $xi!=0$.

  + 加入 @eq:covariant-gauge-fixed-maxwell-action 的规范固定项并分部积分，导出 @eq:gauge-fixed-maxwell-kernel. 降低一个指标，代入投影算符 @eq:covariant-photon-projectors，证明其幂等性、正交性与完备性. 利用本征值直接求核的逆，在不猜测张量拟设的前提下恢复 @eq:gauge-fixed-maxwell-inverse.

  + 引入外源 $tensor(J, +mu)$，完成正规化 Gaussian 积分，再作两次微分导出 @eq:covariant-photon-propagator. 直接相乘验证

    $
      tensor(cal(K)_xi, +mu, +rho) (p)
      tensor(D_F, -rho, -nu) (p)
      =i tensor(delta, +mu, -nu)
    $

    其中极点处方按定义理解. 只有完成这一检验后才令 $xi=1$，恢复 @eq:feynman-gauge-photon-propagator.

  + 设外部源守恒，即 $tensor(p, -mu)tensor(J, +mu) (p)=0$. 证明 $tensor(J, +mu)tensor(D_F, -mu, -nu)tensor(J, +nu)$ 与 $xi$ 无关. 再在势关联函数两端分别作反对称微分，导出

    $
      mel(
        0, T tensor(hat(F), -mu, -nu) (p)
        tensor(hat(F), -rho, -sigma) (-p), 0
      )
      =-i/(p^2-i 0) [
        tensor(p, -mu)tensor(p, -rho)tensor(eta, -nu, -sigma)
        -tensor(p, -mu)tensor(p, -sigma)tensor(eta, -nu, -rho)
        -tensor(p, -nu)tensor(p, -rho)tensor(eta, -mu, -sigma)
        +tensor(p, -nu)tensor(p, -sigma)tensor(eta, -mu, -rho)
      ].
    $

    在把 $xi$ 取为任何特定值之前，显式证明所有纵向贡献均相消.

  + 在 $tensor(A, -mu) arrow.r tensor(A, -mu)+tensor(partial, -mu)alpha$ 下计算协变规范条件的变分. 证明所得 Faddeev--Popov 算符为 $partial^2$，且与 $A$ 无关. 解释其行列式为何在归一化自由 Abelian 关联函数中约掉，而规范固定项本身对定义势传播子仍不可或缺.
]

