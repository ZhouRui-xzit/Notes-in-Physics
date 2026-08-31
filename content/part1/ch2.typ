#import "../../lib.typ": *

= 自由量子场

第 1 章说明了自由理论如何归结为 Gaussian 积分：给定二次型算符和边界条件，它的逆便给出传播子. 但在真正计算之前，还有一个更基本的问题没有回答：二次型算符为何具有那些形式，场又为何分别带有标量、矢量或旋量指标？时空对称性、局域性、实条件以及可能存在的规范冗余共同限制了这些结构. 本章从这些要求出发构造自由相对论性场，并把局域场的变换性质与粒子态的质量、自旋或螺旋度联系起来.

讨论始终沿着一条共同主线推进. 先确定场分量所承载的有限维 Lorentz 表示，再构造相容的局域二次作用量；随后求解自由方程，把独立的正、负频模提升为阶梯算符，并由此建立 Fock 空间；最后通过二点函数和类空对易关系检验传播与因果性. 实标量场给出这套程序的最简模板，复标量场增加内禀荷，零质量矢量场迫使我们处理规范等价类，Dirac 场则引入 Weyl 表示、反粒子和费米统计. 章末再回到路径积分，验证各二次型算符的 Feynman 逆与算符量子化得到的时间序传播子完全一致. 贯穿本章需要反复区分两类表示：场分量承载的有限维 Lorentz 表示通常不幺正，而物理单粒子态承载的 Poincare 表示必须幺正.

== Lorentz 对称性与相对论性场

在逐类量子化之前，必须先说明“相对论性场”究竟意味着什么. 场不只是附带若干指标的函数；当惯性观察者更换坐标时，它的自变量与分量必须以彼此相容的方式变换. 本节从 Minkowski 时空的几何不变量出发，建立被动 Lorentz 与 Poincare 变换，继而区分轨道作用、内禀分量表示以及 Hilbert 空间上的幺正表示. 这些区分随后会直接限制自由二次作用量，并解释为何同一套时空对称性可以容纳标量、矢量和旋量等不同类型的场.

=== Minkowski 时空与 Poincare 群

沿用 @eq:mostly-plus-metric 中固定的 mostly-plus 约定. 对任意两个四维矢量，

$
  tensor(eta, -mu, -nu) = upright("diag") (-1,+1,+1,+1),
  quad
  x dot y := tensor(eta, -mu, -nu) tensor(x, +mu) tensor(y, +nu),
  quad
  x^2 = -t^2 + bold(x)^2.
$ <eq:chapter-two-minkowski-convention>

Lorentz 变换是实线性映射

$
  tensor(x', +mu) = tensor(Lambda, +mu, -nu) tensor(x, +nu)
$ <eq:lorentz-coordinate-transformation>

并保持上述内积不变. 用分量和矩阵分别表示，这一条件为

$
  tensor(eta, -rho, -sigma)
  tensor(Lambda, +rho, -mu)
  tensor(Lambda, +sigma, -nu)
  = tensor(eta, -mu, -nu),
  quad arrow.l.r quad
  Lambda^T eta Lambda = eta.
$ <eq:lorentz-metric-condition>

取行列式可知 $det Lambda = plus.minus 1$. Lorentz 群还包含反转空间取向或时间方向的变换. 本章考察从恒等元连续生成的变换，因而限于正定向、正时向分支 $upright("SO")^+ (1,3)$，其特征是 $det Lambda=1$ 且 $tensor(Lambda, +0, -0) >= 1$. 宇称与时间反演属于离散对称性，暂不参与下文的计算.

狭义相对论不仅具有 Lorentz 不变性，也具有平移不变性. 因此，一个 Poincare 变换由二元组 $g=(Lambda,b)$ 给出，其作用为

$
  tensor(x', +mu)
  = tensor(Lambda, +mu, -nu) tensor(x, +nu) + tensor(b, +mu).
$ <eq:poincare-coordinate-transformation>

相应的复合律是

$
  (Lambda_2,b_2) (Lambda_1,b_1)
  = (Lambda_2 Lambda_1,
    b_2 + Lambda_2 b_1).
$ <eq:poincare-composition-law>

第二个分量体现了 Lorentz 变换对平移矢量的作用，因此 Poincare 群具有半直积结构.

=== 无穷小变换与生成元

将恒等元附近的 Lorentz 变换写成

$
  tensor(Lambda, +mu, -nu)
  = tensor(delta, +mu, -nu)
  + tensor(omega, +mu, -nu)
  + O (omega^2).
$ <eq:infinitesimal-lorentz-transformation>

代入 @eq:lorentz-metric-condition，得到

$
  tensor(omega, -mu, -nu)
  := tensor(eta, -mu, -rho) tensor(omega, +rho, -nu),
  quad
  tensor(omega, -mu, -nu) = -tensor(omega, -nu, -mu).
$ <eq:antisymmetric-lorentz-parameters>

因此只有六个独立参数. 在任意有限维表示 $D$ 中，以 $tensor(Sigma, +mu, +nu)=-tensor(Sigma, +nu, +mu)$ 定义生成元：

$
  D (Lambda)
  = 1 - i/2
  tensor(omega, -mu, -nu) tensor(Sigma, +mu, +nu)
  + O (omega^2).
$ <eq:lorentz-representation-generators>

在 @eq:lorentz-representation-generators 的指数约定下，三个转动生成元与三个 boost 生成元定义为

$
  tensor(J, -i)
  := -1/2 tensor(epsilon, -i, -j, -k) tensor(Sigma, +j, +k),
  quad
  tensor(K, -i) := tensor(Sigma, +0, +i).
$ <eq:rotation-and-boost-generators>

平移还引入四个生成元 $tensor(P, +mu)$. 它们同 Lorentz 生成元的对易关系以及转动—boost 代数将在 @ex:lorentz-poincare-algebra 中导出. 此处只需把握一点：这些生成元对对易运算封闭，连续施加两次无穷小时空变换，所得仍是无穷小 Poincare 变换. @ex:finite-lorentz-transformations 则把同一组生成元指数化，得到有限的被动转动与被动 boost.

在 mostly-plus 约定下，平移生成元的二次不变量在有质量壳上取值

$
  P^2
  = tensor(eta, -mu, -nu) tensor(P, +mu) tensor(P, +nu)
  = -m^2.
$ <eq:mostly-plus-mass-casimir>

这已经表明，质量是与参考系无关的 Poincare 表示标签.

=== 作为 Lorentz 表示的场

设 $V$ 是连通 Lorentz 群的一个有限维表示空间. 类型为 $V$ 的经典场就是取值于该表示空间的函数：

$
  Psi: RR^(1,3) arrow.r V,
  quad
  x arrow.r Psi (x) = {tensor(Psi, -a) (x)}.
$ <eq:representation-valued-field>

指标 $a$ 是 $V$ 的基指标. 更准确地说，在被动坐标变换 $x'=Lambda x+b$ 下，协变性要求

$
  tensor(Psi', -a) (x')
  = tensor(D (Lambda), -a, +b) tensor(Psi, -b) (x).
$ <eq:covariant-field-transformation>

若把等式两边都写在同一个坐标自变量 $x$ 处，则有

$
  tensor(Psi', -a) (x)
  = tensor(D (Lambda), -a, +b)
  tensor(Psi, -b) (Lambda^(-1) (x-b)).
$ <eq:fixed-argument-field-transformation>

式 @eq:fixed-argument-field-transformation 清楚地区分了 Lorentz 变换的两重作用：它既改变场的自变量，也混合场分量. 单点处的场值 $Psi (x)$ 属于 $V$；全体这类函数构成的函数空间才承载完整的 Poincare 作用.

本章会用到以下三类基本表示.

+ *标量场*满足 $V=RR$、$D (Lambda)=1$ 以及 $tensor(Sigma, +mu, +nu)=0$，因而

  $
    phi' (x') = phi (x).
  $ <eq:lorentz-scalar-transformation>

  复标量场仍承载这一平凡 Lorentz 表示，同时具有内禀 $U (1)$ 对称性；其时空变换规律不变.

+ *矢量场*满足 $V=RR^(1,3)$ 且 $tensor(D (Lambda), +mu, -nu)=tensor(Lambda, +mu, -nu)$，其内禀生成元为

  $
    tensor(Sigma_V, +mu, +nu, +rho, -sigma)
    = i [
      tensor(eta, +mu, +rho) tensor(delta, +nu, -sigma)
      - tensor(eta, +nu, +rho) tensor(delta, +mu, -sigma)
    ].
  $ <eq:vector-lorentz-generators>

+ *Dirac 场*按旋量表示变换. 严格地说，旋量承载双覆盖群 $upright("Spin")^+ (1,3)$ 的表示；投影到 $upright("SO")^+ (1,3)$ 后，该表示成为双值表示. 满足

  $
    [tensor(gamma, +mu),tensor(gamma, +nu)]_+
    = -2 tensor(eta, +mu, +nu)
  $ <eq:mostly-plus-clifford-algebra>

  的 gamma 矩阵给出旋量生成元

  $
    tensor(Sigma_D, +mu, +nu)
    = -i/4 [tensor(gamma, +mu),tensor(gamma, +nu)].
  $ <eq:dirac-lorentz-generators>

  这一 Clifford 约定在保持时空度规为 mostly-plus 的同时，给出 $(tensor(gamma, +0))^2=1$ 与 $(tensor(gamma, +i))^2=-1$，并保留熟悉的 Dirac 算符 $i tensor(gamma, +mu) tensor(partial, -mu)-m$. @eq:dirac-gamma-generator-commutator 和 @eq:dirac-gamma-covariance 将显式验证 @eq:dirac-lorentz-generators 与 Lorentz 协变性的相容性.

这些标量、矢量与旋量公式会在后文逐一推导或检验. 此处可以先把它们视为一部字典：场所携带的指标类型，恰好说明该指标实现了哪一种 Lorentz 变换.

=== 轨道生成元与内禀生成元

固定自变量处的变换律也可以直接写成微分算符. 平移对任意场的作用均由

$
  tensor(P, +mu) = -i tensor(partial, +mu),
$ <eq:translation-generator-on-fields>

给出；时空自变量的改变则对应轨道 Lorentz 生成元

$
  tensor(L, +mu, +nu)
  = i [
    tensor(x, +mu) tensor(partial, +nu)
    - tensor(x, +nu) tensor(partial, +mu)
  ].
$ <eq:orbital-lorentz-generator>

作用于场的总 Lorentz 生成元是二者之和：

$
  tensor(cal(M), +mu, +nu, -a, +b)
  = tensor(L, +mu, +nu) tensor(delta, -a, +b)
  + tensor(Sigma, +mu, +nu, -a, +b).
$ <eq:total-lorentz-generator-on-fields>

展开 @eq:fixed-argument-field-transformation 即可验证：@eq:translation-generator-on-fields 与 @eq:total-lorentz-generator-on-fields 分别生成变换的两个组成部分. 完整展开及其符号检查留给 @ex:infinitesimal-field-action.

对标量场，内禀项为零，只剩轨道项；对矢量场和旋量场，矩阵 $tensor(Sigma, +mu, +nu)$ 正是“场带有矢量或旋量指标”这一说法的严格数学含义.

量子化后，$tensor(Psi, -a) (x)$ 成为算符值分布. 仍采用同一被动约定，并以 Hilbert 空间上的幺正 Poincare 表示定义变换后的算符场：

$
  tensor(hat(Psi'), -a) (x) & := U (Lambda,b)^(-1)
                              tensor(hat(Psi), -a) (x)
                              U (Lambda,b) \
                            & = tensor(D (Lambda), -a, +b)
                              tensor(hat(Psi), -b) (Lambda^(-1) (x-b)).
$ <eq:quantum-field-covariance>

在 $x'=Lambda x+b$ 处计算 @eq:quantum-field-covariance，得到 $tensor(hat(Psi'), -a) (x')=tensor(D (Lambda), -a, +b) tensor(hat(Psi), -b) (x)$，这正是 @eq:covariant-field-transformation 的算符值版本.

必须区分 @eq:quantum-field-covariance 中的两种表示. 由于 Lorentz 群非紧，有限维分量表示 $D (Lambda)$ 通常并不幺正；作用于物理态的 $U (Lambda,b)$ 则必须是幺正表示. 其不可约单粒子子空间由质量和自旋标记；零质量情形则由螺旋度标记. 例如，矢势有四个 Lorentz 分量，而零质量自旋一粒子只有两个物理螺旋度，二者之差正由规范冗余解释.

=== 由对称性确定自由作用量

对实玻色多重态，局域自由作用量的一般二次型结构为

$
  S_0 [Psi]
  = 1/2 integral dd(x, [4])
  tensor(Psi, -a) (x)
  tensor(K (partial), +a, +b)
  tensor(Psi, -b) (x).
$ <eq:general-quadratic-free-action>

复场与 Dirac 场需要以相应的对偶场取代第二个 $Psi$. Lorentz 协变性要求 $K (partial)$ 把 $Psi$ 所承载的表示映到其对偶表示，使所有自由指标都能收缩；局域性要求 $K$ 是微分算符；二次性则保证不同动量模彼此独立演化.

对标量场，二次阶唯一需要的不变量是数 $1$ 与度规 $tensor(eta, -mu, -nu)$. 若再限制导数不超过二阶，便得到 @eq:continuum-real-scalar-action 已给出的作用量：

$
  S_0 [phi] & = -1/2 integral dd(x, [4])
              [tensor(partial, -mu) phi (x) tensor(partial, +mu) phi (x)
                + m^2 phi (x)^2] \
            & = 1/2 integral dd(x, [4])
              phi (x) (partial^2-m^2) phi (x),
$ <eq:scalar-quadratic-kernel-mostly-plus>

第二行由分部积分得到. 因此场方程与动量空间质量壳分别为

$
  (partial^2-m^2) phi (x) = 0,
  quad
  p^2 = -m^2.
$ <eq:scalar-equation-and-mass-shell>

对旋量场，gamma 矩阵提供一个带一个 Lorentz 指标和两个旋量指标的不变对象，因而允许一阶动能算符. 对矢势，反对称组合 $tensor(F, -mu, -nu)=tensor(partial, -mu) tensor(A, -nu)-tensor(partial, -nu) tensor(A, -mu)$ 按张量变换，而规范对称性负责消去冗余分量. 这些构造受同一组条件支配：每个动能算符的形式都由表示、局域性、导数阶数、实条件以及可能存在的规范冗余共同决定.

实标量场的内禀 Lorentz 生成元为零，是最简洁的起点. 下面完整完成其模展开、正则量子化与因果性分析.

== 实标量场

实标量场没有内禀 Lorentz 指标，因此最适合用来建立自由场量子化的基本模板. “标量”只意味着 $D (Lambda)=1$，并不意味着理论没有非平凡内容：场的时空自变量仍会变换，正能量模仍携带四动量，量子 Hilbert 空间仍包含任意数目的全同自旋零粒子. 本节从经典正则数据出发，在不变质量壳上展开场，利用等时对易关系确定阶梯算符代数，再构造 Fock 空间与四动量算符；最后计算场对易子，说明局域因果性如何从正、负频部分的精确配合中产生. 整条推导可概括为

$
  upright("正则对易关系")
  arrow.r upright("简正模")
  arrow.r upright("阶梯算符")
  arrow.r upright("Fock 空间").
$

这条链条将在后面反复出现，其他自由场的差别主要体现在独立模的类型、统计代数以及内禀指标结构.

=== 经典场与正则数据

对平凡 Lorentz 表示，作用量 @eq:scalar-quadratic-kernel-mostly-plus 化为

$
  S_0 [phi]
  = integral dd(x, [4]) cal(L)_0,
  quad
  cal(L)_0
  = 1/2 dot(phi)^2
  - 1/2 bold(nabla) phi dot bold(nabla) phi
  - 1/2 m^2 phi^2.
$ <eq:real-scalar-lagrangian>

由此得到共轭动量与 Hamiltonian 密度

$
  pi (t,bold(x)) & = (partial cal(L)_0)/(partial dot(phi))
                   = dot(phi) (t,bold(x)), \
        cal(H)_0 & = pi dot(phi)-cal(L)_0
                   = 1/2 pi^2
                   + 1/2 bold(nabla) phi dot bold(nabla) phi
                   + 1/2 m^2 phi^2.
$ <eq:real-scalar-canonical-data>

这里的符号值得专门核对：当 $eta=(-,+,+,+)$ 时，协变方程 $(partial^2-m^2) phi=0$ 等价于通常的 Klein--Gordon 方程

$
  [partial_t^2-bold(nabla)^2+m^2] phi (t,bold(x))=0.
$ <eq:klein-gordon-time-space-form>

正则量子化把一个等时面上的经典数据提升为算符值分布，并施加

$
   [hat(phi) (t,bold(x)),hat(pi) (t,bold(y))] & = i delta^((3)) (bold(x)-bold(y)), \
  [hat(phi) (t,bold(x)),hat(phi) (t,bold(y))] & = 0, \
    [hat(pi) (t,bold(x)),hat(pi) (t,bold(y))] & = 0.
$ <eq:real-scalar-canonical-commutators>

这些关系是 @eq:lattice-field-commutators 中正规化振子对易关系的连续极限. 下文若出现同点算符乘积或 $delta^((3)) (0)$，均应理解为先置于有限体积并引入空间正规化，最后再取极限.

=== 不变质量壳上的模展开

记

$
  tensor(k, +mu)=(omega_k,bold(k)),
  quad
  omega_k:=sqrt(bold(k)^2+m^2),
  quad
  k dot x
  := tensor(k, -mu) tensor(x, +mu)
  = -omega_k t+bold(k) dot bold(x).
$ <eq:scalar-positive-energy-shell>

正能量质量壳测度记为

$
  tilde(dd(k)) & := (dd(k, [3]))/((2 pi)^3 2 omega_k) \
               & = (dd(k, [4]))/((2 pi)^3)
                 theta (tensor(k, +0)) delta (k^2+m^2).
$ <eq:lorentz-invariant-mass-shell-measure>

尽管第一行显式选出了空间动量，第二行仍表明 $tilde(dd(k))$ 具有 Lorentz 不变性. 以下所有动量积分均在该正能量质量壳上进行.

Hermitian 场的协变归一化展开为

$
  hat(phi) (x)
  = integral tilde(dd(k))
  [
    hat(a) (k) e^(i k dot x)
    + hat(a)^dagger (k) e^(-i k dot x)
  ].
$ <eq:real-scalar-mode-expansion>

正频部分的系数湮灭一个量子，负频部分的系数产生一个量子. Hermiticity 把两部分联系起来，因此实标量场不需要独立的反粒子算符. 等时关系 @eq:real-scalar-canonical-commutators 等价于

$
  [hat(a) (k),hat(a)^dagger (q)] & = 2 omega_k (2 pi)^3
                                   delta^((3)) (bold(k)-bold(q)), \
         [hat(a) (k),hat(a) (q)] & = 0,
                                   quad
                                   [hat(a)^dagger (k),hat(a)^dagger (q)]
                                   = 0.
$ <eq:real-scalar-ladder-commutators>

模收缩时，对易子中的 $2 omega_k$ 与测度中的 $1/(2 omega_k)$ 恰好抵消. 因此，正则场代数、不变测度和阶梯算符归一化必须配套选取. 具体推导见 @ex:scalar-hamiltonian-from-modes.

=== 四动量与二次量子化

把真空能选为零后，正规序 Hamiltonian、粒子数算符和四动量分别为

$
             hat(H)_0 & = integral tilde(dd(k))
                        omega_k hat(a)^dagger (k) hat(a) (k), \
               hat(N) & = integral tilde(dd(k))
                        hat(a)^dagger (k) hat(a) (k), \
  tensor(hat(P), +mu) & = integral tilde(dd(k))
                        tensor(k, +mu) hat(a)^dagger (k) hat(a) (k),
                        quad
                        tensor(hat(P), +0)=hat(H)_0.
$ <eq:second-quantized-scalar-observables>

这就是*二次量子化*在动量空间中的具体形式：单粒子算符 $omega_k$,$1$ 和 $tensor(k, +mu)$ 被提升为变粒子数 Hilbert 空间上的可加算符. 具体而言，

$
  ket((k_1,dots,k_n))
  := hat(a)^dagger (k_1) dots
  hat(a)^dagger (k_n) ket(0)
$ <eq:scalar-fock-states>

于是

$
  tensor(hat(P), +mu) ket((k_1,dots,k_n))
  = [sum_(r=1)^n tensor(k_r, +mu)]
  ket((k_1,dots,k_n)).
$ <eq:additive-fock-space-four-momentum>

@ex:scalar-hamiltonian-from-modes 将完整推导 @eq:second-quantized-scalar-observables，并保留正规序之前的零点项. 由于产生算符彼此对易，Fock 态在粒子交换下自动对称.

=== Lorentz 不变归一化的单粒子态

设不变真空满足 $hat(a) (k) ket(0)=0$，并直接定义单粒子动量本征态

$
  ket(k):=hat(a)^dagger (k) ket(0),
  quad
  braket(k, q)
  = 2 omega_k (2 pi)^3
  delta^((3)) (bold(k)-bold(q)).
$ <eq:invariant-one-particle-normalization>

与这一归一化相配套，单粒子子空间上的单位算符分解为

$
  cal(I)_1
  = integral tilde(dd(k)) ketbra(k).
$ <eq:one-particle-invariant-completeness>

因此，可归一化的单粒子波包可写成

$
  ket(f)=integral tilde(dd(k)) f (k) ket(k),
  quad
  braket(f, f)=integral tilde(dd(k)) abs(f (k))^2.
$ <eq:one-particle-invariant-wave-packet>

当 $b=0$ 时，比较 @eq:real-scalar-mode-expansion 与被动算符变换律 @eq:quantum-field-covariance，可得

$
  U (Lambda)^(-1) hat(a) (k) U (Lambda)
  = hat(a) (Lambda^(-1) k).
$ <eq:passive-scalar-mode-transformation>

若真空不变，便有 $U (Lambda) ket(k)=ket(Lambda k)$. 场算符本身仍遵守 @eq:quantum-field-covariance 的被动约定；上式则说明单粒子子空间承载 Poincare 群的正能量、质量 $m$、自旋零表示.

场—态矩阵元正是正频 Klein--Gordon 波函数：

$
  mel(0, hat(phi) (x), k)=e^(i k dot x),
  quad
  (partial^2-m^2) mel(0, hat(phi) (x), k)=0.
$ <eq:scalar-one-particle-wavefunction>

对波包 $ket(f)$，相应矩阵元按同一不变测度叠加. 场算符同时含有产生与湮灭部分，并在不同粒子数子空间之间映射，因此不能等同于单粒子波函数.

=== 场对易子与相对论因果性

等时对易关系不足以单独保证相对论性，因为不同观察者对“同时”并无一致判断. 利用 @eq:real-scalar-mode-expansion，可得任意两点处的对易子

$
  [hat(phi) (x),hat(phi) (y)] & = i Delta (x-y) \
                              & = integral tilde(dd(k))
                                [
                                  e^(i k dot (x-y))-e^(-i k dot (x-y))
                                ].
$ <eq:pauli-jordan-commutator>

右端是只依赖间隔的 Lorentz 标量. 若 $z=x-y$ 是类空间隔，则在 mostly-plus 约定下 $z^2>0$，并且总能找到一个满足 $z^0=0$ 的 Lorentz 参考系. 在该参考系中作 $bold(k) arrow.r -bold(k)$，@eq:pauli-jordan-commutator 的两项相消，故

$
  [hat(phi) (x),hat(phi) (y)]=0
  quad "当" quad
  (x-y)^2>0.
$ <eq:scalar-microcausality>

这就是*微观因果性*：类空间隔的局域测量彼此相容，不能借此传递超光速信号. 因果性要求对易子在类空间隔消失；关联函数本身仍可非零. 真空二点函数

$
  mel(0, hat(phi) (x) hat(phi) (y), 0)
  = integral tilde(dd(k)) e^(i k dot (x-y))
$ <eq:scalar-wightman-function>

在类空间隔通常并不为零. 真空涨落可以存在关联，却不产生可控的类空影响；两种算符次序在该区域给出相同结果，正是因为它们之差满足 @eq:scalar-microcausality.

== 复标量场

复标量场并没有引入新的 Lorentz 自旋，真正改变的是实条件被解除：正、负频系数不再互为共轭，于是量子化后出现两族彼此独立的激发. 怎样解释这两族量子，又用什么可观测量区分它们？答案来自复场的整体 $U (1)$ 相位对称性. 本节先把复场视为两个平凡 Lorentz 表示的直和，建立两族阶梯算符及其粒子、反粒子态；随后由 Noether 流构造荷算符，并检验局域性；最后把整体相位推广为位置依赖的变换，由协变微分的要求引出规范联络. 这一步为下一节的 Maxwell 场提供动力学入口.

=== 两个平凡 Lorentz 表示

先把复场写成两个实场：

$
  phi (x)=1/sqrt(2) [phi_1 (x)+i phi_2 (x)],
  quad
  phi^dagger (x)=1/sqrt(2) [phi_1 (x)-i phi_2 (x)].
$ <eq:complex-field-real-components>

两个实分量都是 Lorentz 标量. 等价地，引入二分量对象

$
  Phi (x):=mat(phi (x); phi^dagger (x))
$

其被动变换律为

$
  Phi' (x)
  = Phi (Lambda^(-1) x),
  quad
  D_L (Lambda)
  = mat(1, 0; 0, 1)
  = bold(1) "⊕" bold(1).
$ <eq:complex-scalar-lorentz-representation>

因此，复标量场是两个一维平凡 Lorentz 表示的直和. @eq:complex-scalar-lorentz-representation 中的二维空间只是内禀重数空间，不承载旋量或矢量表示.

自由作用量为

$
  S_0 [phi,phi^dagger] & = -integral dd(x, [4])
                         [
                           tensor(partial, -mu) phi^dagger
                           tensor(partial, +mu) phi
                           +m^2 phi^dagger phi
                         ] \
                       & = -1/2 integral dd(x, [4])
                         sum_(A=1)^2
                         [
                           tensor(partial, -mu) phi_A
                           tensor(partial, +mu) phi_A
                           +m^2 phi_A^2
                         ].
$ <eq:free-complex-scalar-action>

第二行显式展示了直和结构. 把 $phi$ 与 $phi^dagger$ 视为独立变量分别变分，得到

$
  (partial^2-m^2) phi (x)=0,
  quad
  (partial^2-m^2) phi^dagger (x)=0.
$ <eq:complex-scalar-equations-of-motion>

=== 正则数据与两族振子

按时间与空间分解后，Lagrangian 密度为

$
  cal(L)_0
  = dot(phi)^dagger dot(phi)
  -bold(nabla) phi^dagger dot bold(nabla) phi
  -m^2 phi^dagger phi.
$

把 $phi$ 与 $phi^dagger$ 作为独立的正则坐标，可得

$
  pi
  := (partial cal(L)_0)/(partial dot(phi))
  = dot(phi)^dagger,
  quad
  pi^dagger
  := (partial cal(L)_0)/(partial dot(phi)^dagger)
  = dot(phi).
$ <eq:complex-scalar-canonical-momenta>

非零的等时对易子为

$
                [hat(phi) (t,bold(x)),hat(pi) (t,bold(y))] & = i delta^((3)) (bold(x)-bold(y)), \
  [hat(phi)^dagger (t,bold(x)),hat(pi)^dagger (t,bold(y))] & = i delta^((3)) (bold(x)-bold(y)).
$ <eq:complex-scalar-canonical-commutators>

其余等时对易子均为零. 采用 @eq:lorentz-invariant-mass-shell-measure 的不变测度，场展开为

$
         hat(phi) (x) & = integral tilde(dd(k))
                        [
                          hat(a) (k)e^(i k dot x)
                          +hat(b)^dagger (k)e^(-i k dot x)
                        ], \
  hat(phi)^dagger (x) & = integral tilde(dd(k))
                        [
                          hat(b) (k)e^(i k dot x)
                          +hat(a)^dagger (k)e^(-i k dot x)
                        ].
$ <eq:complex-scalar-mode-expansion>

Hermitian 共轭把上述两个场联系起来，却不会令 $hat(a)$ 与 $hat(b)$ 相同；这正是复场与实标量场的关键差别. 正则代数要求

$
  [hat(a) (k),hat(a)^dagger (q)] & =[hat(b) (k),hat(b)^dagger (q)] \
                                 & =2 omega_k (2 pi)^3
                                   delta^((3)) (bold(k)-bold(q)),
$ <eq:complex-scalar-ladder-commutators>

所有混合对易子以及两个湮灭算符之间的对易子均为零. 若事后施加实条件，则两族算符被识别为 $hat(b) (k)=hat(a) (k)$，从而回到 @eq:real-scalar-mode-expansion.

正规序后的能量与四动量为

$
             hat(H)_0 & = integral tilde(dd(k)) omega_k
                        [
                          hat(a)^dagger (k)hat(a) (k)
                          +hat(b)^dagger (k)hat(b) (k)
                        ], \
  tensor(hat(P), +mu) & = integral tilde(dd(k)) tensor(k, +mu)
                        [
                          hat(a)^dagger (k)hat(a) (k)
                          +hat(b)^dagger (k)hat(b) (k)
                        ].
$ <eq:complex-scalar-second-quantized-momentum>

因此，两类量子具有相同的色散关系，并以相同符号贡献能量和动量. Hamiltonian 与荷算符的完整推导见 @ex:complex-scalar-charge.

=== 粒子、反粒子与不变态

令两类湮灭算符都湮灭 Poincare 不变真空，并定义

$
  ket((k,+)):=hat(a)^dagger (k)ket(0),
  quad
  ket((k,-)):=hat(b)^dagger (k)ket(0).
$ <eq:complex-scalar-one-particle-states>

它们的不变归一化为

$
  braket((k,+), (q,+)) & =braket((k,-), (q,-)) \
                       & =2 omega_k (2 pi)^3
                         delta^((3)) (bold(k)-bold(q)), \
  braket((k,+), (q,-)) & =0.
$ <eq:complex-scalar-one-particle-normalization>

两个态都属于同一个质量为 $m$、自旋为零的 Poincare 表示；区分它们的是附加的内禀量子数. 下列场矩阵元清楚显示了两个产生算符的角色：

$
         mel(0, hat(phi) (x), (k,+)) & =e^(i k dot x), \
  mel(0, hat(phi)^dagger (x), (k,-)) & =e^(i k dot x).
$ <eq:complex-scalar-one-particle-wavefunctions>

因此，$hat(phi)$ 湮灭 $+$ 粒子并产生 $-$ 粒子，$hat(phi)^dagger$ 则正好相反. 把两个子空间称为粒子与反粒子，是因为下面的守恒荷会以相反符号区分它们.

=== 整体 $U (1)$ 对称性与荷算符

自由作用量在常数内禀变换

$
  phi' (x)=e^(-i alpha)phi (x),
  quad
  phi'^dagger (x)=e^(i alpha)phi^dagger (x).
$ <eq:complex-scalar-global-u1>

下保持不变. 在 $Phi$ 上，这是内禀表示 $R (alpha)=upright("diag") (e^(-i alpha),e^(i alpha))$；在实基 $(phi_1,phi_2)$ 中，它就是普通的 $upright("SO") (2)$ 转动. 不要把这一变换与 @eq:complex-scalar-lorentz-representation 的 Lorentz 表示混淆：Lorentz 变换作用于时空自变量，$U (1)$ 则转动内禀重数空间.

按照 @eq:complex-scalar-global-u1 的相位约定，守恒 Noether 流为

$
  tensor(j, +mu)
  =-i [
    phi^dagger tensor(partial, +mu) phi
    -(tensor(partial, +mu) phi^dagger)phi
  ],
  quad
  tensor(partial, -mu) tensor(j, +mu)=0.
$ <eq:complex-scalar-noether-current>

由于 mostly-plus 约定下 $tensor(partial, +0)=-partial_t$，荷密度与守恒荷为

$
  tensor(j, +0) & =i [phi^dagger pi^dagger-pi phi], \
         hat(Q) & :=integral dd(x, [3]) tensor(hat(j), +0) \
                & =integral tilde(dd(k))
                  [
                    hat(a)^dagger (k)hat(a) (k)
                    -hat(b)^dagger (k)hat(b) (k)
                  ].
$ <eq:complex-scalar-charge-operator>

两类量子的真空贡献彼此抵消. 粒子与反粒子具有相同的质量和能量，由荷算符中的相对负号加以区分. 特别地，

$
  hat(Q)ket((k,+))=+ket((k,+)),
  quad
  hat(Q)ket((k,-))=-ket((k,-)).
$ <eq:complex-scalar-charge-eigenstates>

在算符层面，

$
  [hat(Q),hat(phi) (x)]=-hat(phi) (x),
  quad
  U (alpha):=e^(-i alpha hat(Q)),
  quad
  U (alpha)^(-1)hat(phi) (x)U (alpha)
  =e^(-i alpha)hat(phi) (x).
$ <eq:charge-generates-global-u1>

这里沿用了时空被动变换的 $U^(-1)hat(phi)U$ 次序，不过当前变换是内禀变换，不移动自变量 $x$.

=== 微观因果性与荷流

分离点之间唯一非平凡的场对易子为

$
  [hat(phi) (x),hat(phi)^dagger (y)] & =i Delta (x-y) \
                                     & =integral tilde(dd(k))
                                       [e^(i k dot (x-y))-e^(-i k dot (x-y))].
$ <eq:complex-scalar-field-commutator>

因此

$
  [hat(phi) (x),hat(phi)^dagger (y)]=0
  quad "当" quad
  (x-y)^2>0,
$ <eq:complex-scalar-microcausality>

而 $[hat(phi) (x),hat(phi) (y)]=0$ 恒成立. 带荷场本身不是 Hermitian 的，但局域性仍要求它在类空间隔与其共轭场对易.

=== 从整体相位到规范联络

常数相位对称性对应一个守恒 Noether 荷. 若进一步令相位参数依赖位置，则

$
  phi' (x)=e^(-i q alpha (x))phi (x)
  quad arrow.r quad
  tensor(partial, -mu)phi' (x)
  =e^(-i q alpha (x))
  [
    tensor(partial, -mu)phi (x)
    -i q tensor(partial, -mu)alpha (x)phi (x)
  ].
$ <eq:local-phase-derivative-obstruction>

$alpha$ 的额外导数使自由动能项不再具有局域不变性. 为补偿这一项，引入联络 $tensor(A, -mu)$ 并定义

$
       tensor(D, -mu) & :=tensor(partial, -mu)+i q tensor(A, -mu), \
      tensor(A', -mu) & :=tensor(A, -mu)+tensor(partial, -mu)alpha, \
  tensor(D', -mu)phi' & =e^(-i q alpha)tensor(D, -mu)phi.
$ <eq:scalar-gauge-covariant-derivative>

再定义

$
  tensor(F, -mu, -nu)
  :=tensor(partial, -mu)tensor(A, -nu)
  -tensor(partial, -nu)tensor(A, -mu).
$

于是

$
                              tensor(F', -mu, -nu) & =tensor(F, -mu, -nu), \
  (tensor(D', -mu)phi')^dagger tensor(D', +mu)phi' & =(tensor(D, -mu)phi)^dagger tensor(D, +mu)phi.
$ <eq:scalar-gauge-invariant-building-blocks>

协变导数由此给出局域 $U (1)$ 不变的 Lorentz 标量. 若联络本身也具有动力学，最简单的局域 Lagrangian 为

$
  cal(L)_("scalar QED")
  =-(tensor(D, -mu)phi)^dagger tensor(D, +mu)phi
  -m^2 phi^dagger phi
  -1/4 tensor(F, -mu, -nu)tensor(F, +mu, +nu).
$ <eq:scalar-electrodynamics-preview>

Maxwell 项赋予联络动力学；局域协变性本身并不会做到这一点. 质量项 $m_A^2 tensor(A, -mu)tensor(A, +mu)$ 在 @eq:scalar-gauge-covariant-derivative 下不变性破缺，因此，在没有额外补偿场时，未破缺规范联络自然是无质量的. 这一观察把带荷标量物质引向零质量矢量场；后者的规范冗余和两个物理螺旋度必须独立分析. 详细验证以及协变导数中隐含的相互作用项见 @ex:gauging-complex-scalar.

== 零质量矢量场

第 2.3 节为了比较不同位置的相位而引入联络，但协变微分只确定了联络如何变换，并没有说明它自身怎样传播. 更棘手的是，$tensor(A, -mu)$ 的四个分量并不都代表独立物理自由度：规范变换会把不同势联系为同一物理构型. 本节把联络提升为动力学变量，先以曲率 $tensor(F, -mu, -nu)$ 分离规范不变内容，再从 Maxwell 作用量的约束结构识别横向模；随后在辐射规范中完成正则量子化，构造螺旋度为 $plus.minus 1$ 的单粒子态，并用场强对易子检验微观因果性. 这条路线会明确区分势的 Lorentz 矢量表示、场强的反对称张量表示和物理光子态的零质量 Poincare 表示.

=== 从联络到规范不变曲率

在被动 Lorentz 变换 $x'=Lambda x+b$ 下，联络是 Lorentz 协变矢量：

$
  tensor(A', -mu) (x')
  = tensor(Lambda, -mu, +nu) tensor(A, -nu) (x).
$ <eq:maxwell-potential-lorentz-transformation>

其复化分量空间承载矢量表示 $(1/2,1/2)$. 这一时空变换不同于 @eq:scalar-gauge-covariant-derivative 继承下来的局域 $U (1)$ 规范变换：

$
  tensor(A, -mu) (x)
  arrow.r
  tensor(A, -mu) (x)+tensor(partial, -mu) alpha (x).
$ <eq:maxwell-gauge-equivalence>

规范变换并不联系不同参考系中的观察结果；它联系的是描述同一局域物理构型的不同联络变量. 特别地，反对称曲率

$
  tensor(F, -mu, -nu)
  :=tensor(partial, -mu) tensor(A, -nu)
  -tensor(partial, -nu) tensor(A, -mu)
$ <eq:maxwell-field-strength>

在 @eq:maxwell-gauge-equivalence 下保持不变. 在 Minkowski 时空及通常边界条件下，若两个势具有相同场强，则它们局域地只相差一个纯规范项. 因此，$tensor(F, -mu, -nu)$ 承载局域规范不变信息；$tensor(A, -mu)$ 则仍是处理耦合、正则量子化与微扰论的便利联络变量.

以下三个表示论层次必须区分：

$
       tensor(A, -mu) & in (1/2,1/2), \
  tensor(F, -mu, -nu) & in (1,0) "⊕" (0,1), \
  cal(H)_"1 particle" & =cal(H)_(lambda=+1) "⊕" cal(H)_(lambda=-1).
$ <eq:maxwell-three-representation-layers>

前两行是局域场分量承载的有限维 Lorentz 表示，最后一行则是物理态承载的幺正零质量 Poincare 表示. 要从前两种描述归约到最后一种，必须同时使用规范等价关系与场方程.

=== 场强的 Lorentz 表示

反对称张量表示来自两个矢量表示张量积的反对称部分. 复化后有

$
  "∧"^2 (1/2,1/2)
  = (1,0) "⊕" (0,1).
$ <eq:two-form-lorentz-decomposition>

为显式分离两个不可约部分，先以 $tensor(epsilon, +0, +1, +2, +3)=+1$ 固定取向，再定义 Lorentzian Hodge 对偶

$
  tensor(tilde(F), -mu, -nu)
  :=1/2 tensor(epsilon, -mu, -nu, -rho, -sigma)
  tensor(F, +rho, +sigma).
$ <eq:maxwell-hodge-dual>

在二形式上，mostly-plus Lorentzian 度规给出 $tilde(tilde(F))=-F$. 因此引入复组合

$
  tensor(F^(plus.minus), -mu, -nu)
  :=1/2 [
    tensor(F, -mu, -nu)
    minus.plus i tensor(tilde(F), -mu, -nu)
  ]
$ <eq:maxwell-self-dual-field-strengths>

便有

$
  tensor(tilde(F^(plus.minus)), -mu, -nu)
  = plus.minus i tensor(F^(plus.minus), -mu, -nu).
$ <eq:maxwell-self-duality-eigenvalues>

两个本征空间分别按 $(1,0)$ 与 $(0,1)$ 变换. 对实 Maxwell 场，它们互为复共轭，共同描述一个实场. 这个六分量 Lorentz 表示仍不等于二维物理偏振空间；还必须施加 Bianchi 恒等式与 Maxwell 方程.

=== Maxwell 动力学与经典约束

含两个导数的最简单局域规范不变作用量为

$
  S_M [A]
  =-1/4 integral dd(x, [4])
  tensor(F, -mu, -nu) tensor(F, +mu, +nu).
$ <eq:free-maxwell-action>

整体符号由正横向模动能的要求固定. 对联络变分并分部积分，得到

$
  tensor(partial, -mu) tensor(F, +mu, +nu)=0.
$ <eq:vacuum-maxwell-equation>

由于场强被定义为势的旋度，它还自动满足 Bianchi 恒等式

$
  tensor(partial, -rho) tensor(F, -mu, -nu)
  +tensor(partial, -mu) tensor(F, -nu, -rho)
  +tensor(partial, -nu) tensor(F, -rho, -mu)
  =0,
$ <eq:maxwell-bianchi-identity>

等价地，$tensor(partial, -mu) tensor(tilde(F), +mu, +nu)=0$. 运动方程与 Bianchi 恒等式以对称方式作用于 @eq:maxwell-self-dual-field-strengths 的两个部分.

规范冗余已经显现在二次动能算符中. 忽略边界项，

$
  S_M [A]
  =1/2 integral dd(x, [4])
  tensor(A, -mu)
  [
    tensor(eta, +mu, +nu) partial^2
    -tensor(partial, +mu) tensor(partial, +nu)
  ]
  tensor(A, -nu).
$ <eq:maxwell-degenerate-kinetic-operator>

方括号中的算符作用于 $tensor(partial, -nu)alpha$ 时恒为零. 因此 Maxwell 动能算符存在规范*零模*，在选定规范条件之前无法*求逆*.

同一事实也体现在正则数据中. 以协变分量 $tensor(A, -mu)$ 为坐标，其共轭动量为

$
  tensor(Pi, +mu)
  :=(partial cal(L)_M)/
  (partial (tensor(partial, -0) tensor(A, -mu)))
  =-tensor(F, +0, +mu).
$ <eq:maxwell-canonical-momenta>

反对称性立即给出初级约束 $tensor(Pi, +0)=0$. 时间分量 $tensor(A, -0)$ 没有独立速度，只充当 Lagrange 乘子. 要求初级约束随时间保持，则得到 Gauss 定律

$
  tensor(partial, -i) tensor(Pi, +i)=0.
$ <eq:maxwell-gauss-constraint>

所以 $tensor(A, -mu)$ 的四个分量受到约束，不能视为四个独立振子. 两个一类约束连同它们生成的规范方向，共同移去两对正则变量，留下两个物理位形自由度. 详细的经典计算见 @ex:maxwell-gauge-redundancy.

=== 横向模与正则量子化

对自由场施加辐射规范

$
  tensor(A, -0)=0,
  quad
  tensor(partial, +i) tensor(A, -i)=0.
$ <eq:maxwell-radiation-gauge>

在适当的无穷远衰减条件下，这固定了与传播辐射有关的规范自由度. 剩余空间场为横向场，并满足

$
  partial^2 tensor(A, -i) (x)=0.
$ <eq:transverse-maxwell-wave-equation>

取 $omega_k=abs(bold(k))$，并使用 @eq:lorentz-invariant-mass-shell-measure 的零质量形式. 在选择偏振矢量之前，应先区分哪些结论来自场方程，哪些只是基的约定. 对固定的非零零矢量动量，Maxwell 方程与规范等价关系要求

$
  k dot epsilon=0,
  quad
  tensor(epsilon, -mu)
  "∼"
  tensor(epsilon, -mu)+beta tensor(k, -mu).
$ <eq:maxwell-polarization-quotient-data>

由于 $k^2=0$，规范方向 $tensor(k, -mu)$ 自身也位于横向四矢量构成的三维空间 $k^perp$ 中. 因此，动量 $k$ 处的物理偏振空间是商空间

$
  cal(P)_k
  :=k^perp/(upright("span") (k)),
  quad
  upright("dim") cal(P)_k=3-1=2.
$ <eq:maxwell-physical-polarization-space>

取商移去了零范数方向，并诱导出正定内积. 辐射规范代表元最能直观说明这一点：$tensor(epsilon, -0)=0$ 把 $k dot epsilon=0$ 化为 $bold(k) dot bold(epsilon)=0$，于是代表元恰好构成垂直于 $bold(k)$ 的普通二维 Euclidean 平面.

在该平面中任选一组实正交归一基 $bold(e)_1 (k),bold(e)_2 (k)$：

$
        bold(k) dot bold(e)_a (k) & =0, \
  bold(e)_a (k) dot bold(e)_b (k) & =delta_(a b),
                                    quad a,b=1,2.
$ <eq:maxwell-linear-polarization-basis>

再作幺正换基，得到圆偏振基

$
  bold(epsilon) (k,plus.minus 1)
  :=1/sqrt(2) [
    bold(e)_1 (k) plus.minus i bold(e)_2 (k)
  ],
$ <eq:maxwell-circular-polarization-basis>

符号的选择使 $lambda$ 与 @eq:maxwell-momentum-and-helicity-eigenvalues 中的螺旋度本征值一致. 相应的四矢量代表元满足

$
                tensor(epsilon, -0) (k,lambda) & =0, \
  tensor(k, +i) tensor(epsilon, -i) (k,lambda) & =0, \
              tensor(epsilon, +i)^* (k,lambda)
              tensor(epsilon, -i) (k,lambda')  & =delta_(lambda lambda'),
                                                 quad lambda,lambda'=plus.minus 1.
$ <eq:maxwell-polarization-conditions>

@eq:maxwell-polarization-conditions 的第一条选定辐射规范代表元，第二条表示横向性，第三条仅固定基的归一化，与运动方程无关. 若重新缩放 $tensor(epsilon, -i) (k,lambda)$，可用 $hat(a)_lambda (k)$ 的反向缩放补偿；二者的相对归一化由正则对易子固定.

此时，完备性由上述条件直接推出，无需另作假设. 任意空间矢量 $tensor(v, -i)$ 的横向投影既可用几何投影算符表示，也可在正交归一偏振基中展开：

$
  tensor(v^T, -i) & =[
                      tensor(delta, -i, -j)
                      -(tensor(k, -i) tensor(k, -j))/(bold(k)^2)
                    ]tensor(v, +j) \
                  & =sum_(lambda=plus.minus 1)
                    tensor(epsilon, -i) (k,lambda)
                    tensor(epsilon, -j)^* (k,lambda)
                    tensor(v, +j).
$ <eq:maxwell-two-forms-of-transverse-projection>

由于等式对任意 $tensor(v, -i)$ 成立，两种核必然相等，故

$
  sum_(lambda=plus.minus 1)
  tensor(epsilon, -i) (k,lambda)
  tensor(epsilon, -j)^* (k,lambda)
  =tensor(delta, -i, -j)
  -(tensor(k, -i) tensor(k, -j))/(bold(k)^2).
$ <eq:maxwell-transverse-polarization-completeness>

这一空间公式依赖辐射规范. 若要为同一物理投影构造协变代表元，需要引入满足 $k dot n != 0$ 的参考矢量 $tensor(n, +mu)$. 选择 $n dot epsilon=0$ 后得到

$
  sum_(lambda=plus.minus 1)
  tensor(epsilon, -mu) (k,lambda)
  tensor(epsilon, -nu)^* (k,lambda)
  =tensor(eta, -mu, -nu)
  -(
  tensor(k, -mu) tensor(n, -nu)
  +tensor(n, -mu) tensor(k, -nu)
  )/(k dot n)
  +(n^2 tensor(k, -mu) tensor(k, -nu))/((k dot n)^2).
$ <eq:maxwell-covariant-polarization-projector>

改变 $tensor(n, +mu)$ 只会改变含 $tensor(k, -mu)$ 或 $tensor(k, -nu)$ 的项. 这些项依赖规范，在构造 $tensor(F, -mu, -nu)$ 或与守恒流收缩时自动消失. 若取辐射规范采用的时间方向，@eq:maxwell-covariant-polarization-projector 即退化为 @eq:maxwell-transverse-polarization-completeness.

算符场的模展开为

$
  tensor(hat(A), -i) (x)
  =sum_(lambda=plus.minus 1) integral tilde(dd(k))
  [
    tensor(epsilon, -i) (k,lambda)
    hat(a)_lambda (k)e^(i k dot x)
    +tensor(epsilon, -i)^* (k,lambda)
    hat(a)^dagger_lambda (k)e^(-i k dot x)
  ].
$ <eq:maxwell-transverse-mode-expansion>

这与标量展开 @eq:real-scalar-mode-expansion 的结构相同，但多出一个关键对象：偏振矢量把协变场指标与振子的螺旋度标签联系起来. 每个动量处包含两个横向偏振振子，比标量场多出一支物理模.

约化后的等时正则代数为

$
  [tensor(hat(A), -i) (t,bold(x)),
    tensor(hat(Pi), -j) (t,bold(y))]
  =i tensor(delta^T, -i, -j) (bold(x)-bold(y)),
$ <eq:maxwell-transverse-canonical-commutator>

其中横向 delta 分布定义为

$
  tensor(delta^T, -i, -j) (bold(x))
  :=integral (dd(k, [3]))/((2 pi)^3)
  [
    tensor(delta, -i, -j)
    -(tensor(k, -i) tensor(k, -j))/(bold(k)^2)
  ]e^(i bold(k) dot bold(x)).
$ <eq:maxwell-transverse-delta>

这个投影算符是求解 Gauss 定律并消去纵向规范方向后留下的正则结构. @eq:maxwell-transverse-mode-expansion 与 @eq:maxwell-transverse-canonical-commutator 等价于

$
  [hat(a)_lambda (k),hat(a)^dagger_(lambda') (q)]
  =2 omega_k (2 pi)^3 delta_(lambda lambda')
  delta^((3)) (bold(k)-bold(q)),
$ <eq:maxwell-ladder-commutators>

所有湮灭—湮灭和产生—产生对易子均为零. 偏振矢量的显式构造以及上述等价关系的双向验证见 @ex:maxwell-polarizations-and-canonical-algebra. 正规序后，四动量为

$
  tensor(hat(P), +mu)
  =sum_(lambda=plus.minus 1) integral tilde(dd(k))
  tensor(k, +mu)
  hat(a)^dagger_lambda (k)hat(a)_lambda (k).
$ <eq:maxwell-second-quantized-momentum>

两个物理偏振均具有正能量 $tensor(k, +0)=omega_k=abs(bold(k))$.

=== 单粒子态与螺旋度

定义单粒子态

$
  ket((k,lambda))
  :=hat(a)^dagger_lambda (k)ket(0),
  quad lambda=plus.minus 1.
$ <eq:maxwell-one-particle-states>

其不变归一化为

$
  braket((k,lambda), (q,lambda'))
  =2 omega_k (2 pi)^3 delta_(lambda lambda')
  delta^((3)) (bold(k)-bold(q)),
$ <eq:maxwell-one-particle-normalization>

并满足

$
         tensor(hat(P), +mu) ket((k,lambda)) & =tensor(k, +mu) ket((k,lambda)), \
  (hat(bold(k)) dot bold(J)) ket((k,lambda)) & =lambda ket((k,lambda)),
$ <eq:maxwell-momentum-and-helicity-eigenvalues>

其中 $hat(bold(k)):=bold(k)/abs(bold(k))$. 因此，物理单粒子空间由两个零质量螺旋度表示直和构成；势的四维矢量表示还包含规范冗余.

平面波也直接体现了这一差别. 其规范不变振幅为

$
  tensor(f, -mu, -nu) (k,lambda)
  =i [
    tensor(k, -mu) tensor(epsilon, -nu) (k,lambda)
    -tensor(k, -nu) tensor(epsilon, -mu) (k,lambda)
  ].
$ <eq:maxwell-plane-wave-field-strength>

作 $tensor(epsilon, -mu) arrow.r tensor(epsilon, -mu)+beta tensor(k, -mu)$ 不会改变 @eq:maxwell-plane-wave-field-strength. 在 Lorentz 变换下，选定的横向偏振一般会变为变换后动量处的标准偏振，再加上一个正比于 $tensor(k, -mu)$ 的项. 附加项是规范变换，余下的小群相位才是螺旋度变换. 因此，场强的变换没有规范歧义，其两个自对偶部分在壳上分别给出两种螺旋度.

=== 规范不变局域性

辐射规范使正定物理 Hilbert 空间清晰可见，但 @eq:maxwell-transverse-delta 中的横向投影在空间上是非局域的. 因此，依赖规范的势并不适合用来表述规范无关的局域性；局域可观测量应由 $tensor(F, -mu, -nu)$ 构造.

令 $Delta_0 (x-y)$ 表示零质量 Pauli--Jordan 分布，其归一化取 @eq:pauli-jordan-commutator 中 $m=0$ 的形式. 直接代入横向模展开，得到

$
  [tensor(hat(F), -mu, -nu) (x),
    tensor(hat(F), -rho, -sigma) (y)]
  =i [
    tensor(eta, -nu, -rho)
    tensor(partial, -mu) tensor(partial, -sigma)
    +tensor(eta, -mu, -sigma)
    tensor(partial, -nu) tensor(partial, -rho)
    -tensor(eta, -nu, -sigma)
    tensor(partial, -mu) tensor(partial, -rho)
    -tensor(eta, -mu, -rho)
    tensor(partial, -nu) tensor(partial, -sigma)
  ] Delta_0 (x-y),
$ <eq:maxwell-field-strength-commutator>

其中所有导数均作用于 $x-y$. 由于 Pauli--Jordan 分布及其各阶导数在类空间隔均为零，

$
  [tensor(hat(F), -mu, -nu) (x),
    tensor(hat(F), -rho, -sigma) (y)]
  =0
  quad "当" quad (x-y)^2>0.
$ <eq:maxwell-field-strength-microcausality>

所以，即使特定规范下的势含有非局域投影，局域曲率仍满足微观因果性. 至此完成了第 2.3 节开启的逻辑链：局域相位协变性要求引入联络，曲率提供局域规范不变量，而量子化最终只留下零质量自旋一粒子的两个螺旋度.

== Weyl 与 Dirac 旋量表示

Maxwell 势有四个分量，是因为它承载 Lorentz 矢量表示；Dirac 旋量也有四个分量，来源却完全不同. 旋量不能由普通张量指标构造，而应当承载正定向、正时向 Lorentz 群双覆盖 $upright("Spin")^+ (1,3)$ 的表示. 本节从复化 Lorentz 代数的两个 $upright("su") (2)$ 因子出发，构造彼此不等价的左、右 Weyl 表示，再将它们直和为 Dirac 表示，并求出有限转动与 boost. 最后才引入 gamma 矩阵、Clifford 代数和手征投影. 这样的次序把逻辑关系说清楚：旋量表示先由两个 Weyl 空间构造，gamma 矩阵随后充当实现 Lorentz 协变性的交织工具. 四个 Dirac 分量也没有 Maxwell 场那样的规范等价关系.

=== 两个 Weyl 表示

从 @ex:lorentz-poincare-algebra 得到的转动—boost 代数出发，在复数域上定义

$
  tensor(cal(A), -i)
  :=1/2 [tensor(J, -i)-i tensor(K, -i)],
  quad
  tensor(cal(B), -i)
  :=1/2 [tensor(J, -i)+i tensor(K, -i)].
$ <eq:weyl-su2-generators>

代入 Lorentz 对易关系，得到

$
  [tensor(cal(A), -i),tensor(cal(A), -j)] & =i tensor(epsilon, -i, -j, +k) tensor(cal(A), -k), \
  [tensor(cal(B), -i),tensor(cal(B), -j)] & =i tensor(epsilon, -i, -j, +k) tensor(cal(B), -k), \
  [tensor(cal(A), -i),tensor(cal(B), -j)] & =0.
$ <eq:complex-lorentz-algebra-split>

所以，复化 Lorentz 代数分解为两个彼此对易的 $upright("su") (2)$. 其有限维不可约表示可用一对量子数 $(j_A,j_B)$ 标记. 基本二维表示由 Pauli 矩阵实现：

$
                   tensor(sigma, -1) & =mat(0, 1; 1, 0),
                                       quad
                                       tensor(sigma, -2)=mat(0, -i; i, 0),
                                       quad
                                       tensor(sigma, -3)=mat(1, 0; 0, -1), \
  tensor(sigma, -i)tensor(sigma, -j) & =tensor(delta, -i, -j)1_2
                                       +i tensor(epsilon, -i, -j, +k)tensor(sigma, -k).
$ <eq:pauli-matrix-algebra>

只让两个 $upright("su") (2)$ 因子中的一个作用，有两种不等价方式. 按本章的被动约定，它们分别为

$
  tensor(J_L, -i) & =1/2 tensor(sigma, -i), & tensor(K_L, -i) & =+i/2 tensor(sigma, -i), & quad (1/2,0), \
  tensor(J_R, -i) & =1/2 tensor(sigma, -i), & tensor(K_R, -i) & =-i/2 tensor(sigma, -i), & quad (0,1/2).
$ <eq:left-right-weyl-generators>

第一行对应 $tensor(cal(A), -i)=tensor(sigma, -i)/2$、$tensor(cal(B), -i)=0$，第二行则恰好对调. 两类旋量在空间转动下的变换相同，但 boost 生成元符号相反. 对角矢量为 $bold(theta)$ 的被动转动和快度矢量为 $bold(chi)$ 的被动 boost，

$
  D_L (R (bold(theta)))
  &=D_R (R (bold(theta)))
  =e^(i bold(theta) dot bold(sigma)/2), \
  D_L (B (bold(chi)))
  &=e^(+bold(chi) dot bold(sigma)/2),
  &D_R (B (bold(chi)))
  &=e^(-bold(chi) dot bold(sigma)/2).
$ <eq:finite-weyl-transformations>

boost 矩阵满足 Hermitian 条件，却不幺正. 这是非紧 Lorentz 群有限维表示的结构性质；幺正性属于 Poincare 变换在量子 Hilbert 空间上的作用.

借助不变反对称矩阵转换旋量指标后，两个 Weyl 表示互为复共轭：

$
  epsilon_s:=i tensor(sigma, -2)=mat(0, 1; -1, 0),
  quad
  epsilon_s tensor(sigma, -i)^* epsilon_s^(-1)
  =-tensor(sigma, -i).
$ <eq:weyl-invariant-epsilon>

因此，若 $psi_L$ 是左手 Weyl 旋量，则

$
  psi_L^c:=epsilon_s psi_L^*
$ <eq:weyl-conjugate-spinor>

按右手表示变换；反之亦然. 包含有点与无点指标的详细指标形式见 @ex:weyl-representation-properties.

=== 作为直和的 Dirac 表示

正定向、正时向 Lorentz 变换不会混合两个 Weyl 空间. 若同时保留二者，可按手征次序排列为

$
  Psi:=mat(psi_L; psi_R),
  quad
  V_D=(1/2,0) "⊕" (0,1/2).
$ <eq:dirac-spinor-direct-sum>

这个四维空间上的转动与 boost 生成元是分块直和

$
  tensor(J_D, -i) & =mat(
                      tensor(sigma, -i)/2, 0;
                      0, tensor(sigma, -i)/2
                    ), \
  tensor(K_D, -i) & =mat(
                      +i tensor(sigma, -i)/2, 0;
                      0, -i tensor(sigma, -i)/2
                    ).
$ <eq:dirac-block-generators>

等价地，定义六个反对称矩阵

$
  tensor(Sigma_D, +0, +i):=tensor(K_D, -i),
  quad
  tensor(Sigma_D, +i, +j)
  :=-tensor(epsilon, +i, +j, +k)tensor(J_D, -k).
$ <eq:dirac-generators-from-blocks>

由于分块对角矩阵的对易子可逐块计算，Weyl 代数立即给出

$
  [tensor(Sigma_D, +mu, +nu),tensor(Sigma_D, +rho, +sigma)]
  =i [
    tensor(eta, +mu, +sigma)tensor(Sigma_D, +nu, +rho)
    +tensor(eta, +nu, +rho)tensor(Sigma_D, +mu, +sigma)
    -tensor(eta, +mu, +rho)tensor(Sigma_D, +nu, +sigma)
    -tensor(eta, +nu, +sigma)tensor(Sigma_D, +mu, +rho)
  ].
$ <eq:dirac-generator-lorentz-algebra>

因此，这一直和确实构成 Lorentz 代数的表示. 四个分量只是表示坐标；每种频率符号在壳上只留下两个自旋态. 这一动力学归约将由下一节的 Dirac 方程给出.

这一直和还是容纳宇称作用的最小旋量空间：空间反演交换左手与右手直和分量. 这个观察解释了 Dirac 旋量的自然性，不过宇称本身不属于 $upright("SO")^+ (1,3)$，也未参与上面的构造.

=== 有限 Dirac 变换

将 @eq:dirac-generators-from-blocks 中的矩阵指数化，定义有限 Dirac 表示

$
  D (Lambda)
  :=e^(-i/2 tensor(omega, -mu, -nu)
  tensor(Sigma_D, +mu, +nu))
  =mat(D_L (Lambda), 0; 0, D_R (Lambda)).
$ <eq:finite-dirac-representation>

对转动与 boost，分别有

$
  D (R (bold(theta))) & =mat(
                          e^(i bold(theta) dot bold(sigma)/2), 0;
                          0, e^(i bold(theta) dot bold(sigma)/2)
                        ), \
    D (B (bold(chi))) & =mat(
                          e^(+bold(chi) dot bold(sigma)/2), 0;
                          0, e^(-bold(chi) dot bold(sigma)/2)
                        ).
$ <eq:finite-dirac-rotations-and-boosts>

经典 Dirac 场与 @eq:covariant-field-transformation 中所有其他场遵守同一被动变换律：

$
  Psi' (x')=D (Lambda)Psi (x),
  quad
  Psi' (x)=D (Lambda)
  Psi (Lambda^(-1) (x-b)).
$ <eq:passive-dirac-field-transformation>

代数关系 @eq:dirac-generator-lorentz-algebra 保证这些矩阵在恒等元附近正确实现群复合. 然而，从整体结构看，$2 pi$ 空间转动给出

$
  D (R (2 pi hat(bold(n))))=-1_4,
  quad
  D (R (4 pi hat(bold(n))))=1_4.
$ <eq:spinor-double-cover-rotation>

转满一周后出现的负号说明：$D$ 是 $upright("Spin")^+ (1,3)$ 的单值表示，却只能给出 $upright("SO")^+ (1,3)$ 的双值表示. 经典 Lorentz 矢量看不到这一符号；它是本构造中第一个真正属于旋量的特征.

=== Gamma 矩阵与手征投影

直和生成元已经足以规定旋量的变换. 若要写出一阶 Lorentz 协变微分方程，还需要带一个矢量指标、并在两个 Weyl 直和分量之间映射的数值矩阵. 依照 Srednicki 约定，引入

$
  tensor(sigma, +mu):=(1_2,tensor(sigma, -i)),
  quad
  tensor(overline(sigma), +mu):=(1_2,-tensor(sigma, -i)).
$ <eq:srednicki-sigma-four-vectors>

Pauli 代数蕴含

$
  tensor(sigma, +mu)tensor(overline(sigma), +nu)
  +tensor(sigma, +nu)tensor(overline(sigma), +mu)
  =-2 tensor(eta, +mu, +nu)1_2,
$ <eq:sigma-bar-sigma-identity>

交换 $sigma$ 与 $overline(sigma)$ 后同一恒等式仍成立. 在适配 @eq:dirac-spinor-direct-sum 的手征基中，定义

$
  tensor(gamma, +mu)
  :=mat(
    0, tensor(sigma, +mu);
    tensor(overline(sigma), +mu), 0
  ).
$ <eq:chiral-gamma-matrices>

分块相乘并利用 @eq:sigma-bar-sigma-identity，得到

$
  [tensor(gamma, +mu),tensor(gamma, +nu)]_+
  =-2 tensor(eta, +mu, +nu)1_4.
$ <eq:chiral-clifford-algebra>

这实现了 @eq:mostly-plus-clifford-algebra 预先规定的 mostly-plus Clifford 约定. 特别地，$(tensor(gamma, +0))^2=1_4$ 且 $(tensor(gamma, +i))^2=-1_4$.

Gamma 矩阵以等价形式重现由两个 Weyl 表示构造的生成元. 直接计算并与 @eq:dirac-block-generators 比较可得

$
  -i/4 [tensor(gamma, +0),tensor(gamma, +i)] & =tensor(K_D, -i)
                                               =tensor(Sigma_D, +0, +i), \
  -i/4 [tensor(gamma, +i),tensor(gamma, +j)] & =-tensor(epsilon, +i, +j, +k)tensor(J_D, -k)
                                               =tensor(Sigma_D, +i, +j).
$ <eq:gamma-matrices-recover-dirac-generators>

因此，用协变记号可写成

$
  tensor(Sigma_D, +mu, +nu)
  =-i/4 [tensor(gamma, +mu),tensor(gamma, +nu)],
$

这正是 @eq:dirac-lorentz-generators. 再次利用 Clifford 代数，得到无穷小交织关系

$
  [tensor(Sigma_D, +mu, +nu),tensor(gamma, +rho)]
  =i [
    tensor(eta, +nu, +rho)tensor(gamma, +mu)
    -tensor(eta, +mu, +rho)tensor(gamma, +nu)
  ].
$ <eq:dirac-gamma-generator-commutator>

将该关系指数化，得到有限形式

$
  D (Lambda)^(-1)tensor(gamma, +rho)D (Lambda)
  =tensor(Lambda, +rho, -sigma)tensor(gamma, +sigma).
$ <eq:dirac-gamma-covariance>

所以 gamma 矩阵是固定的交织算符，把 $tensor(partial, -mu)$ 承载的矢量表示与 $Psi$ 承载的 Dirac 表示联系起来.

区分两个不变 Weyl 直和分量的矩阵为

$
  gamma^5
  :=i tensor(gamma, +0)tensor(gamma, +1)
  tensor(gamma, +2)tensor(gamma, +3)
  =mat(-1_2, 0; 0, +1_2).
$ <eq:gamma-five-chiral-basis>

它满足 $(gamma^5)^2=1_4$、$[gamma^5,tensor(gamma, +mu)]_+=0$ 以及 $[gamma^5,tensor(Sigma_D, +mu, +nu)]=0$. 因此

$
  P_L:=1/2 (1_4-gamma^5),
  quad
  P_R:=1/2 (1_4+gamma^5),
  quad
  psi_L=P_L Psi,
  quad
  psi_R=P_R Psi
$ <eq:chiral-projectors>

是 Lorentz 不变投影. $tensor(gamma, +mu)$ 的非对角分块结构等价地表明：gamma 矩阵会翻转手征性.

最后固定下文使用的 Srednicki 动量斜线约定：

$
  slashed(a):=tensor(a, -mu)tensor(gamma, +mu),
  quad
  slashed(a)^2=-a^2 1_4.
$ <eq:srednicki-slash-convention>

$slashed(a)$ 的定义中不另加负号. 结合 $p^2=-m^2$，上式在有质量壳上给出 $slashed(p)^2=m^2$.

== Dirac 方程及其解

表示论只规定 Dirac 旋量在更换惯性系时如何变换，并没有决定哪些旋量构型能够传播. 要写出 Lorentz 标量作用量，首先还需要一个在非幺正 boost 下变换正确的对偶旋量；这正是 Dirac 伴随出现的原因. 本节由伪幺正关系构造 Dirac 伴随与双线性量，再写下一阶自由作用量并导出场方程与守恒流. 求解时先在静止系区分正、负频旋量，再用标准 boost 生成任意动量解，最后固定归一化、自旋求和与能量投影算符，并考察零质量极限中的手征—螺旋度关系. 这样可以始终分清：表示论控制分量怎样变换，场方程控制哪些分量组合位于质量壳上.

=== Dirac 伴随与双线性量

普通 Hermitian 范数 $Psi^dagger Psi$ 会随有限 boost 改变，因而不构成 Lorentz 标量. 手征 gamma 矩阵满足另一组关系：

$
         (tensor(gamma, +mu))^dagger & =tensor(gamma, +0)tensor(gamma, +mu)tensor(gamma, +0), \
  (tensor(Sigma_D, +mu, +nu))^dagger & =tensor(gamma, +0)tensor(Sigma_D, +mu, +nu)
                                       tensor(gamma, +0).
$ <eq:dirac-gamma-generator-hermiticity>

第二个恒等式结合 $D (Lambda)$ 的指数定义，给出伪幺正关系

$
  D (Lambda)^dagger tensor(gamma, +0)D (Lambda)
  =tensor(gamma, +0).
$ <eq:dirac-pseudo-unitarity>

这确定了不变对偶. 定义 *Dirac 伴随*

$
  overline(Psi) (x)
  :=Psi (x)^dagger tensor(gamma, +0).
$ <eq:dirac-adjoint-definition>

利用 @eq:passive-dirac-field-transformation 与 @eq:dirac-pseudo-unitarity，得到

$
  overline(Psi') (x')
  =overline(Psi) (x)D (Lambda)^(-1).
$ <eq:dirac-adjoint-transformation>

所以 $overline(Psi)Psi$ 是 Lorentz 标量. 在手征基中，

$
  overline(Psi)=(psi_R^dagger,psi_L^dagger),
  quad
  overline(Psi)Psi
  =psi_R^dagger psi_L+psi_L^dagger psi_R.
$ <eq:dirac-scalar-in-chiral-components>

这个标量把相反手征性的分量配对. 因而从表示论看，Lorentz 不变的 Dirac 质量项必然耦合两条 Weyl 方程.

同一变换律还把标准双线性量组织为

$
                           overline(Psi)Psi, & quad i overline(Psi)gamma^5 Psi, \
         overline(Psi)tensor(gamma, +mu)Psi, & quad overline(Psi)tensor(gamma, +mu)gamma^5 Psi, \
  overline(Psi)tensor(Sigma_D, +mu, +nu)Psi. &
$ <eq:dirac-bilinear-list>

在连通 Lorentz 群下，它们依次按两个标量、两个矢量以及一个二阶反对称张量变换. 若再加入宇称，则可进一步区分赝标量与轴矢量. 以矢量双线性量为例，@eq:dirac-gamma-covariance 给出

$
  overline(Psi')tensor(gamma, +mu)Psi'
  =tensor(Lambda, +mu, -nu)
  overline(Psi)tensor(gamma, +nu)Psi.
$ <eq:dirac-vector-bilinear-transformation>

特别地，时间分量具有正定的经典形式

$
  overline(Psi)tensor(gamma, +0)Psi=Psi^dagger Psi.
$ <eq:dirac-density-positive-form>

Dirac 伴随以及五类双线性量的变换性质将在 @ex:dirac-adjoint-and-currents 中逐项验证.

=== 自由作用量、场方程与守恒流

含一个导数的局域二次 Minkowski 作用量为

$
  S_D [overline(Psi),Psi]
  :=integral dd(x, [4]) cal(L)_D,
  quad
  cal(L)_D
  :=overline(Psi)
  [i tensor(gamma, +mu)tensor(partial, -mu)-m]Psi.
$ <eq:free-dirac-action>

其 Lorentz 不变性由 @eq:dirac-adjoint-transformation、@eq:dirac-gamma-covariance 以及 $dd(x, [4])$ 的不变性保证. 在通常边界条件下，作用量为实数：动能项作 Hermitian 共轭后只相差全导数 $-i tensor(partial, -mu)[overline(Psi)tensor(gamma, +mu)Psi]$.

变分时把 $Psi$ 与 $overline(Psi)$ 视为独立变量. 对 $overline(Psi)$ 变分，得到 Dirac 方程

$
  [i tensor(gamma, +mu)tensor(partial, -mu)-m]Psi (x)=0,
$ <eq:free-dirac-equation>

对 $Psi$ 变分并作一次分部积分，则得到伴随方程

$
  i [tensor(partial, -mu)overline(Psi) (x)]
  tensor(gamma, +mu)
  +m overline(Psi) (x)=0.
$ <eq:adjoint-dirac-equation>

把 @eq:free-dirac-equation 写成两个 Weyl 分块，质量的作用便一目了然：

$
            i tensor(sigma, +mu)tensor(partial, -mu)psi_R-m psi_L & =0, \
  i tensor(overline(sigma), +mu)tensor(partial, -mu)psi_L-m psi_R & =0.
$ <eq:coupled-weyl-equations>

当 $m=0$ 时，两条方程解耦；当 $m!=0$ 时，传播不断混合两个手征直和分量，所以一般的有质量 Dirac 解不具有确定手征性.

用共轭的一阶算符左乘 @eq:free-dirac-equation，得到

$
  [i tensor(gamma, +mu)tensor(partial, -mu)+m]
  [i tensor(gamma, +nu)tensor(partial, -nu)-m]
  =partial^2-m^2.
$ <eq:dirac-operator-square>

因而每个分量都满足

$
  (partial^2-m^2)Psi (x)=0.
$ <eq:dirac-implies-klein-gordon>

但一阶方程包含比 Klein--Gordon 方程更多的信息：对每个动量，它还筛选四个分量之间允许的关系.

该作用量还具有整体相位对称性

$
  Psi (x) arrow.r e^(-i alpha)Psi (x),
  quad
  overline(Psi) (x) arrow.r
  overline(Psi) (x)e^(+i alpha).
$ <eq:dirac-global-phase-symmetry>

Noether 定理给出

$
  tensor(j, +mu)
  :=overline(Psi)tensor(gamma, +mu)Psi,
  quad
  tensor(partial, -mu)tensor(j, +mu)=0.
$ <eq:dirac-noether-current>

联立 @eq:free-dirac-equation 与 @eq:adjoint-dirac-equation 也可立即得到守恒律. 对经典解，@eq:dirac-density-positive-form 表明 $tensor(j, +0)=Psi^dagger Psi$. 量子化后，该流空间积分的正规序形式测量粒子数减反粒子数，详见第 2.7 节.

为写出时间演化，定义

$
  tensor(alpha, +i)
  :=tensor(gamma, +0)tensor(gamma, +i),
  quad
  beta:=tensor(gamma, +0).
$ <eq:dirac-alpha-beta-matrices>

用 $tensor(gamma, +0)$ 左乘 Dirac 方程，得到

$
  i partial_t Psi
  =cal(H)_D Psi,
  quad
  cal(H)_D
  :=-i tensor(alpha, +i)tensor(partial, -i)+beta m,
$ <eq:dirac-hamiltonian-equation>

相应的 Hamiltonian 密度是 $cal(H)=Psi^dagger cal(H)_D Psi$. 由于 Lagrangian 对 $partial_t Psi$ 仅为一阶，其正则动量具有示意形式

$
  Pi_Psi=i Psi^dagger,
  quad
  Pi_(overline(Psi))=0.
$ <eq:dirac-first-order-canonical-momenta>

它们构成约束，不能用来定义两个独立速度. 求解经典方程无需完整的分次正则分析；其量子后果就是第 2.7 节将引入的费米等时反对易关系.

=== 平面波与标准 boost

记

$
  tensor(p, +mu)=(E_p,bold(p)),
  quad
  E_p:=sqrt(bold(p)^2+m^2),
  quad
  p dot x=-E_p t+bold(p) dot bold(x).
$ <eq:dirac-positive-energy-shell>

按照 @eq:srednicki-slash-convention 的 Srednicki 斜线约定，取两类平面波

$
  Psi_p^((+)) (x) & =u (p)e^(i p dot x), \
  Psi_p^((-)) (x) & =v (p)e^(-i p dot x).
$ <eq:dirac-positive-negative-frequency-waves>

代入 @eq:free-dirac-equation，得到

$
   [slashed(p)+m]u (p) & =0, \
  [-slashed(p)+m]v (p) & =0.
$ <eq:dirac-momentum-space-equations>

相对符号由两个指数函数的导数确定，无需额外约定. 在壳上，

$
  [slashed(p)-m][slashed(p)+m]
  =[-slashed(p)-m][-slashed(p)+m]=0,
$ <eq:dirac-on-shell-factorization>

因为 $slashed(p)^2=m^2$. @eq:dirac-momentum-space-equations 中两个矩阵的核都是二维的. 因此，对固定正能量动量标签 $p$，两个 $u$ 解与两个 $v$ 解恰好穷尽四个独立平面波解.

在静止系中这一点最清楚. 取 $tensor(p_*, +mu)=(m,bold(0))$，则 $slashed(p_*)=-m tensor(gamma, +0)$，从而

$
  tensor(gamma, +0)u_s (p_*) & =+u_s (p_*), \
  tensor(gamma, +0)v_s (p_*) & =-v_s (p_*),
                               quad s=1,2.
$ <eq:rest-dirac-spinor-eigenvalue-equations>

为二分量旋量分别选择正交归一基：

$
    xi_s^dagger xi_(s')=delta_(s s'), & quad sum_(s=1)^2 xi_s xi_s^dagger=1_2, \
  eta_s^dagger eta_(s')=delta_(s s'), & quad sum_(s=1)^2 eta_s eta_s^dagger=1_2.
$ <eq:two-spinor-basis-completeness>

一种方便的静止系归一化是

$
  u_s (p_*)=sqrt(m)mat(xi_s; xi_s),
  quad
  v_s (p_*)=sqrt(m)mat(eta_s; -eta_s).
$ <eq:rest-dirac-spinors>

在经典层面，整体相位以及 $xi_s$、$eta_s$ 两组基之间的关系仍属约定；第 2.7 节会把它们与粒子、反粒子算符协调起来.

接下来无需重新求解另一个四阶矩阵核，便可得到任意动量解. 令 $chi_p>=0$ 满足

$
  cosh chi_p=(E_p)/m,
  quad
  sinh chi_p=(abs(bold(p)))/m,
$ <eq:massive-standard-rapidity>

并选择被动标准 boost

$
  L (p):=B (-chi_p hat(bold(p))),
  quad
  L (p)p_*=p.
$ <eq:massive-standard-boost>

其中负号与 @ex:finite-lorentz-transformations 的被动 boost 符号一致. 由 @eq:finite-dirac-rotations-and-boosts，

$
  D (L (p))
  =1/sqrt(2m(E_p+m))
  mat(
    (E_p+m)1_2-bold(sigma) dot bold(p), 0;
    0, (E_p+m)1_2+bold(sigma) dot bold(p)
  ).
$ <eq:massive-standard-spinor-boost>

Gamma 协变性保证

$
  u_s (p):=D (L (p))u_s (p_*),
  quad
  v_s (p):=D (L (p))v_s (p_*)
$ <eq:boosted-dirac-spinor-definition>

满足 @eq:dirac-momentum-space-equations. 逐块相乘得到手征基中的显式旋量

$
  u_s (p) & =1/sqrt(2(E_p+m))
            mat(
              [(E_p+m)1_2-bold(sigma) dot bold(p)]xi_s;
              [(E_p+m)1_2+bold(sigma) dot bold(p)]xi_s
            ), \
  v_s (p) & =1/sqrt(2(E_p+m))
            mat(
              [(E_p+m)1_2-bold(sigma) dot bold(p)]eta_s;
              -[(E_p+m)1_2+bold(sigma) dot bold(p)]eta_s
            ).
$ <eq:explicit-boosted-dirac-spinors>

因此，一般经典解可展开为

$
  Psi (x)
  =sum_(s=1)^2 integral tilde(dd(p)) [
    c_s (p)u_s (p)e^(i p dot x)
    +d_s (p)v_s (p)e^(-i p dot x)
  ],
$ <eq:classical-dirac-mode-expansion>

其中 $tilde(dd(p))$ 是 @eq:lorentz-invariant-mass-shell-measure 定义的不变测度. 此时 $c_s$ 与 $d_s$ 仍是普通模系数；把它们提升为费米湮灭、产生算符，是第 2.7 节要完成的独立步骤.

=== 归一化、自旋求和与零质量极限

伪幺正性 @eq:dirac-pseudo-unitarity 表明，共同标准 boost 不改变 Dirac 内积. 因此静止旋量给出

$
  overline(u)_s (p)u_(s') (p) & =+2m delta_(s s'), \
  overline(v)_s (p)v_(s') (p) & =-2m delta_(s s'), \
  overline(u)_s (p)v_(s') (p) & =overline(v)_s (p)u_(s') (p)=0.
$ <eq:dirac-covariant-spinor-normalization>

正密度 @eq:dirac-density-positive-form 则给出

$
  u_s (p)^dagger u_(s') (p)
  =v_s (p)^dagger v_(s') (p)
  =2E_p delta_(s s').
$ <eq:dirac-equal-time-spinor-normalization>

等价地，矢量双线性量为

$
  overline(u)_s (p)tensor(gamma, +mu)u_(s') (p)
  =overline(v)_s (p)tensor(gamma, +mu)v_(s') (p)
  =2 tensor(p, +mu)delta_(s s').
$ <eq:dirac-spinor-vector-bilinears>

与基选择无关的完备关系即自旋求和

$
  sum_(s=1)^2 u_s (p)overline(u)_s (p) & =-slashed(p)+m, \
  sum_(s=1)^2 v_s (p)overline(v)_s (p) & =-slashed(p)-m.
$ <eq:dirac-spin-sums>

这些符号由 mostly-plus Clifford 代数以及 $slashed(p)=tensor(p, -mu)tensor(gamma, +mu)$ 的定义共同固定. 例如，在静止系中第一行化为 $m(1_4+tensor(gamma, +0))$，恰好等于由 @eq:rest-dirac-spinors 构造的求和. 相应的秩二投影算符为

$
  Lambda_u (p) & :=(-slashed(p)+m)/(2m), \
  Lambda_v (p) & :=(slashed(p)+m)/(2m), \
    Lambda_u^2 & =Lambda_u,
                 quad Lambda_v^2=Lambda_v,
                 quad Lambda_u Lambda_v=0,
                 quad Lambda_u+Lambda_v=1_4.
$ <eq:dirac-energy-projectors>

注意，$v$ 的协变范数在 @eq:dirac-covariant-spinor-normalization 中为负，所以其自旋求和是 $-2m Lambda_v$；普通范数 $v^dagger v$ 仍然为正.

零质量粒子没有静止系，因此 $m arrow.r 0$ 必须在固定零矢量动量下取极限. 此时 @eq:coupled-weyl-equations 的两条 Weyl 方程解耦，矢量流与轴矢量流

$
    tensor(j, +mu) & =overline(Psi)tensor(gamma, +mu)Psi, \
  tensor(j_5, +mu) & =overline(Psi)tensor(gamma, +mu)gamma^5 Psi
$

满足

$
    tensor(partial, -mu)tensor(j, +mu) & =0, \
  tensor(partial, -mu)tensor(j_5, +mu) & =2i m overline(Psi)gamma^5 Psi.
$ <eq:classical-dirac-vector-axial-divergences>

所以在零质量自由理论中，$P_L Psi$ 与 $P_R Psi$ 各自具有独立守恒流.

为比较手征性与螺旋度，取正频零矢量动量 $tensor(p, +mu)=(E,0,0,E)$. 方程 $slashed(p)u (p)=0$ 化为

$
  tensor(sigma, -3)u_R=+u_R,
  quad
  tensor(sigma, -3)u_L=-u_L.
$ <eq:massless-dirac-helicity-components>

引入自旋二分之一的螺旋度算符

$
  h:=hat(bold(p)) dot bold(J)_D
  =1/2 mat(
    hat(bold(p)) dot bold(sigma), 0;
    0, hat(bold(p)) dot bold(sigma)
  ),
$ <eq:dirac-helicity-operator>

则对正频零质量解有

$
  gamma^5 u (p)=2h u (p).
$ <eq:massless-chirality-helicity-relation>

因此右手手征对应螺旋度 $+1/2$，左手手征对应螺旋度 $-1/2$；空间转动把结论推广到任意零矢量动量. 对有质量旋量，两种手征成分同时存在，螺旋度也可由更换惯性系而翻转；零质量理论中这两点都不成立. 负频解的反粒子解释要等到第 2.7 节量子化后才完全确定.

== Dirac 场的量子化

经典 Dirac 方程同时具有正频与负频解，但负频解不能直接解释为具有负能量的粒子，否则 Hamiltonian 将没有下界. 量子化必须同时解决能量正定、Hilbert 空间正范数和相对论局域性三个问题. 本节把正频系数提升为粒子湮灭算符，把负频系数提升为反粒子产生算符，并采用费米反对易关系；随后由正规序的四动量和荷算符检验粒子、反粒子的能量与荷，再构造反对称 Fock 空间和单粒子态，最后通过分次类空反对易关系验证局域性. 费米统计正是同时避免负能量与负范数的关键结构.

=== 模展开与正则反对易关系

一阶动量 @eq:dirac-first-order-canonical-momenta 是约束. 若把经典旋量分量视为 Grassmann 奇变量，先用分次 Dirac 括号消去约束，再量子化，便得到下面的等时代数. 正文直接把它作为正则量子化规则；显式的约束矩阵计算留给 @ex:dirac-constraints-and-locality.

对任意两个费米算符，定义

$
  [hat(A),hat(B)]_+
  :=hat(A)hat(B)+hat(B)hat(A).
$ <eq:fermionic-anticommutator-definition>

非零等时反对易子为

$
  [hat(Psi)_alpha (t,bold(x)),
    hat(Psi)_beta^dagger (t,bold(y))]_+
  =delta_(alpha beta)delta^((3)) (bold(x)-bold(y)),
$ <eq:dirac-equal-time-canonical-anticommutator>

两个场之间以及两个伴随场之间的反对易子均为零. 自由 Dirac 方程的算符解为

$
            hat(Psi) (x) & =sum_(s=1)^2 integral tilde(dd(p)) [
                             hat(b)_s (p)u_s (p)e^(i p dot x)
                             +hat(d)_s^dagger (p)v_s (p)e^(-i p dot x)
                           ], \
  overline(hat(Psi)) (x) & =sum_(s=1)^2 integral tilde(dd(p)) [
                             hat(b)_s^dagger (p)overline(u)_s (p)e^(-i p dot x)
                             +hat(d)_s (p)overline(v)_s (p)e^(i p dot x)
                           ].
$ <eq:quantized-dirac-mode-expansion>

其中 $hat(b)_s$ 湮灭粒子，$hat(d)_s^dagger$ 产生反粒子. 第二行由 Hermitian 共轭确定；两族算符彼此独立，并不由共轭相互决定. 旋量归一化 @eq:dirac-equal-time-spinor-normalization 与不变测度共同要求

$
  [hat(b)_s (p),hat(b)_r^dagger (q)]_+ & =[hat(d)_s (p),hat(d)_r^dagger (q)]_+ \
                                       & =2E_p (2 pi)^3 delta_(s r)
                                         delta^((3)) (bold(p)-bold(q)),
$ <eq:dirac-ladder-anticommutators>

其余阶梯算符反对易子均为零. 这些因子由正则场代数唯一固定：把 @eq:quantized-dirac-mode-expansion 代入 @eq:dirac-equal-time-canonical-anticommutator，并使用自旋求和，恰好得到旋量空间的单位矩阵. 等价地，在 $t=0$ 用模投影反演场展开，也会直接导出 @eq:dirac-ladder-anticommutators. 两种推导均见 @ex:dirac-mode-algebra-and-observables.

=== Hamiltonian、荷与反粒子

单粒子 Dirac Hamiltonian 在 $u_s (p)e^(i p dot x)$ 上的本征值为 $+E_p$，在 $v_s (p)e^(-i p dot x)$ 上为 $-E_p$. 因此，在重排算符之前，

$
  hat(H)
  =sum_(s=1)^2 integral tilde(dd(p)) E_p [
    hat(b)_s^dagger (p)hat(b)_s (p)
    -hat(d)_s (p)hat(d)_s^dagger (p)
  ].
$ <eq:dirac-hamiltonian-before-normal-ordering>

第二项正是统计性质发挥作用之处. 费米代数给出 $-hat(d)hat(d)^dagger=hat(d)^dagger hat(d)$，外加与算符无关的真空贡献. 正规序去掉发散的 c-number 后，留下

$
               hat(H) & =sum_(s=1)^2 integral tilde(dd(p)) E_p [
                          hat(b)_s^dagger (p)hat(b)_s (p)
                          +hat(d)_s^dagger (p)hat(d)_s (p)
                        ], \
  tensor(hat(P), +mu) & =sum_(s=1)^2 integral tilde(dd(p)) tensor(p, +mu) [
                          hat(b)_s^dagger (p)hat(b)_s (p)
                          +hat(d)_s^dagger (p)hat(d)_s (p)
                        ].
$ <eq:dirac-normal-ordered-four-momentum>

所以粒子与反粒子都具有正能量和相同质量. 若改用玻色对易关系并要求范数为正，$hat(d)^dagger hat(d)$ 项会保留负号，使能量无下界；若反转该对易子的符号来修复能量，则 $hat(d)^dagger ket(0)$ 会具有负范数. 反对易关系同时避免了这两种失败. 这个计算只展示自旋—统计联系在自由场中的后果，尚不足以证明一般的自旋—统计定理.

相位对称性 @eq:dirac-global-phase-symmetry 还给出另一个可加算符. 对 $tensor(j, +0)$ 的空间积分作正规序，得到

$
  hat(Q)
  =sum_(s=1)^2 integral tilde(dd(p)) [
    hat(b)_s^dagger (p)hat(b)_s (p)
    -hat(d)_s^dagger (p)hat(d)_s (p)
  ].
$ <eq:dirac-normal-ordered-charge>

能量把两类占据数相加，荷则把它们相减. 特别地，

$
  [hat(Q),hat(b)_s^dagger (p)] & =+hat(b)_s^dagger (p), \
  [hat(Q),hat(d)_s^dagger (p)] & =-hat(d)_s^dagger (p), \
         [hat(Q),hat(Psi) (x)] & =-hat(Psi) (x).
$ <eq:dirac-charge-commutators>

至此，负频解被重新解释为带相反荷的正能量量子. 取 $U (alpha):=e^(-i alpha hat(Q))$，最后一式给出

$
  U (alpha)^(-1)hat(Psi) (x)U (alpha)
  =e^(-i alpha)hat(Psi) (x),
$ <eq:dirac-quantum-global-phase>

其算符次序仍是本章一贯采用的被动次序.

=== 费米 Fock 空间与单粒子态

令 Poincare 不变真空满足

$
  hat(b)_s (p)ket(0)=0,
  quad
  hat(d)_s (p)ket(0)=0
  quad "任意" quad (p,s),
$ <eq:dirac-fock-vacuum>

并把其正规序能量与荷取为零. 粒子态与反粒子态定义为

$
  ket((p,s))
  :=hat(b)_s^dagger (p)ket(0),
  quad
  ket((overline(p),s))
  :=hat(d)_s^dagger (p)ket(0).
$ <eq:dirac-one-particle-states>

非零内积为

$
  braket((p,s), (q,r)) & =braket((overline(p),s), (overline(q),r)) \
                       & =2E_p (2 pi)^3 delta_(s r)
                         delta^((3)) (bold(p)-bold(q)),
$ <eq:dirac-one-particle-normalization>

粒子态与反粒子态彼此正交，且两个子空间上的 Hilbert 空间范数都为正. 协变旋量收缩 $overline(v)_s v_s=-2m$ 则是非正定的 Lorentz 不变双线性量，不能解释为态范数.

反对易关系还蕴含

$
  hat(b)_s^dagger (p)hat(b)_r^dagger (q) & =-hat(b)_r^dagger (q)hat(b)_s^dagger (p), \
                 [hat(b)_s^dagger (p)]^2 & =0,
                                           quad
                                           [hat(d)_s^dagger (p)]^2=0,
$ <eq:dirac-fock-antisymmetry>

混合多粒子态也满足类似关系. 因此费米 Fock 态在交换下反对称，同一单粒子模最多只能占据一次. 上述可观测量的作用为

$
            tensor(hat(P), +mu)ket((p,s)) & =tensor(p, +mu)ket((p,s)), \
  tensor(hat(P), +mu)ket((overline(p),s)) & =tensor(p, +mu)ket((overline(p),s)), \
                         hat(Q)ket((p,s)) & =+ket((p,s)), \
               hat(Q)ket((overline(p),s)) & =-ket((overline(p),s)).
$ <eq:dirac-one-particle-observables>

相应的场—态矩阵元重新给出经典旋量波函数：

$
            mel(0, hat(Psi) (x), (p,s)) & =u_s (p)e^(i p dot x), \
  mel((overline(p),s), hat(Psi) (x), 0) & =v_s (p)e^(-i p dot x).
$ <eq:dirac-one-particle-wavefunctions>

正定向、正时向 Poincare 变换通过有质量小群表示混合两个自旋标签，却不会混合粒子与反粒子子空间. 因此，单粒子空间是两个正能量、质量 $m$、自旋二分之一表示的直和，二者由守恒荷区分.

=== 费米局域性

等时反对易关系还必须推出协变的局域性陈述. 令 $z:=x-y$，把质量为 $m$ 的 Pauli--Jordan 分布写成

$
  i Delta_m (z)
  :=integral tilde(dd(p)) [e^(i p dot z)-e^(-i p dot z)].
$ <eq:massive-pauli-jordan-distribution>

利用 @eq:dirac-ladder-anticommutators 及两条自旋求和公式，得到

$
  [hat(Psi)_alpha (x),overline(hat(Psi))_beta (y)]_+ & =integral tilde(dd(p)) [
                                                         (-slashed(p)+m)_(alpha beta)e^(i p dot z)
                                                         +(-slashed(p)-m)_(alpha beta)e^(-i p dot z)
                                                       ] \
                                                     & =[i tensor(gamma, +mu)tensor(partial, -mu)+m]_(alpha beta)
                                                       i Delta_m (z),
$ <eq:dirac-covariant-field-anticommutator>

其中导数作用于 $z=x-y$. 在等时极限，

$
  [hat(Psi)_alpha (t,bold(x)),
    overline(hat(Psi))_beta (t,bold(y))]_+
  =tensor(gamma, +0)_(alpha beta)
  delta^((3)) (bold(x)-bold(y)),
$ <eq:dirac-equal-time-covariant-anticommutator>

它等价于 @eq:dirac-equal-time-canonical-anticommutator. 若 $z^2>0$ 为类空间隔，Pauli--Jordan 分布及其所有导数均为零，因此

$
  [hat(Psi)_alpha (x),overline(hat(Psi))_beta (y)]_+=0
  quad "当" quad (x-y)^2>0.
$ <eq:dirac-fermionic-microcausality>

基本旋量场是 Grassmann 奇的，所以局域性条件由反对易子表述. 适当定义的物理局域可观测量，例如自由理论中的正规序双线性量，具有偶费米宇称. 对常数旋量矩阵 $Gamma_1,Gamma_2$ 以及互异类空点，

$
  [overline(hat(Psi)) (x)Gamma_1 hat(Psi) (x),
    overline(hat(Psi)) (y)Gamma_2 hat(Psi) (y)]=0.
$ <eq:dirac-even-observable-locality>

把一个双线性量移过另一个需要两次费米交换，两个负号相消. 因此，可测局域密度在类空间隔彼此对易，与标量理论完全一致. 相反，Wightman 函数

$
  mel(
    0, hat(Psi)_alpha (x)
    overline(hat(Psi))_beta (y), 0
  )
  =integral tilde(dd(p))
  (-slashed(p)+m)_(alpha beta)e^(i p dot (x-y))
$ <eq:dirac-wightman-function>

在光锥外通常并不为零. 因果性关心的仍是依赖次序的差或分次差，而不要求真空关联消失. 对旋量场作时间排序还会引入一个费米负号；这一结构留到第 2.8 节处理.

== 从路径积分导出传播子

前几节沿着“求解场方程—量子化独立模”的路线构造了自由场，第 1 章则给出另一条路线：对带正规化的二次路径积分作 Gaussian 积分，二次型核在指定边界条件下的逆就是二点函数. 两种构造若描述同一理论，就必须得到相同的时间序传播子. 本节逐一完成这项核对：实、复标量场直接求逆二次核；Maxwell 场先固定规范以消除零方向；Dirac 场则用 Grassmann 外源处理费米符号. 最后作 Euclidean 延拓，把收敛的协方差与 Minkowski 的 Feynman $i 0$ 处方对应起来.

以下路径积分均以零源值归一化，泛函测度仍按第 1 章理解为有限正规化的连续极限. Minkowski 振荡积分由 Euclidean Gaussian 的解析延拓定义，等价地也可由 Feynman $i 0$ 处方指定. 为使所有符号与前面的正频模展开一致，固定 Fourier 约定

$
  F (x)
  =integral (dd(p, [4]))/((2 pi)^4)
  e^(i p dot x) F (p),
  quad
  p dot x=-tensor(p, +0) t+bold(p) dot bold(x),
$ <eq:chapter-two-fourier-convention>

于是动量空间中的 $tensor(partial, -mu)$ 作用为 $i tensor(p, -mu)$. 这一选择与上文所有正频模展开一致，并把 mostly-plus 符号显式保留下来，避免被另一套 Fourier 约定掩盖.

=== 标量核与 Feynman 边界条件

忽略边界项，实标量作用量 @eq:real-scalar-lagrangian 可写成

$
  S_0 [phi]
  =1/2 integral dd(x, [4])
  phi (x) cal(K)_x phi (x),
  quad
  cal(K):=partial^2-m^2.
$ <eq:real-scalar-quadratic-operator>

引入实的对易外源，并把真空泛函归一化为

$
  cal(Z)_(0,M) [J]
  :=frac(
    integral cal(D) phi
    e^(i S_0 [phi]+i integral J phi),
    integral cal(D) phi e^(i S_0 [phi])
  ).
$ <eq:normalized-minkowski-scalar-functional>

于是正规化 Gaussian 公式 @eq:free-minkowski-boson-master-functional 给出

$
  cal(Z)_(0,M) [J]
  =exp[-i/2 integral dd(x, [4])dd(y, [4])
    J (x) cal(K)_F^(-1) (x-y) J (y)],
$ <eq:scalar-feynman-generating-functional>

下标 $F$ 表示求逆时采用 Feynman 边界条件. 根据 @eq:chapter-two-fourier-convention，

$
         cal(K) (p) & =-(p^2+m^2), \
  cal(K)_F^(-1) (p) & =-1/(p^2+m^2-i 0), \
        Delta_F (p) & :=i cal(K)_F^(-1) (p)
                      =(-i)/(p^2+m^2-i 0).
$ <eq:scalar-feynman-propagator>

所以两次外源微分生成

$
  Delta_F (x-y)
  =mel(0, T hat(phi) (x)hat(phi) (y), 0),
  quad
  (partial_x^2-m^2)Delta_F (x-y)
  =i delta^((4)) (x-y).
$ <eq:scalar-feynman-green-equation>

@eq:scalar-feynman-propagator 分子中的符号，是熟悉的标量传播子在 mostly-plus 约定下的形式. 令 $z:=x-y$，并根据时间符号闭合 $tensor(p, +0)$ 围道、拾取两个移位后的质量壳极点，得到

$
  Delta_F (z) & =theta (tensor(z, +0))
                integral tilde(dd(p)) e^(i p dot z) \
              & quad +theta (-tensor(z, +0))
                integral tilde(dd(p)) e^(-i p dot z).
$ <eq:scalar-feynman-time-ordering>

第一项就是由标量模展开得到的 Wightman 函数，第二项则交换了算符次序. 因此，路径积分中的极点处方准确重现了算符时间排序，并未引入另一种二点函数.

对复标量场，分部积分给出 $S_0 [phi,phi^dagger]=integral phi^dagger cal(K)phi$. 把 $phi$ 与 $phi^dagger$ 作为独立积分变量，并通过 $integral (overline(J) phi+phi^dagger J)$ 引入独立对易外源 $J$ 与 $overline(J)$. 复 Gaussian 公式给出

$
  cal(Z)_(0,M) [overline(J),J]
  =exp[-i integral dd(x, [4])dd(y, [4])
    overline(J) (x)cal(K)_F^(-1) (x-y)J (y)].
$ <eq:complex-scalar-feynman-functional>

因此，

$
         mel(0, T hat(phi) (x)hat(phi)^dagger (y), 0) & =Delta_F (x-y), \
                mel(0, T hat(phi) (x)hat(phi) (y), 0) & =0, \
  mel(0, T hat(phi)^dagger (x)hat(phi)^dagger (y), 0) & =0.
$ <eq:complex-scalar-feynman-propagators>

所以非零复标量收缩总把场与其共轭场相连. 这是荷流在传播子中的体现：粒子与反粒子模彼此独立，但带方向的标量线保持整体 $U (1)$ 荷.

=== 规范固定与光子传播子

Maxwell 二次型算符 @eq:maxwell-degenerate-kinetic-operator 会湮灭纯规范方向，因而在完整矢量空间上不可逆. 这一不可逆性源于第 2.4 节已经识别的规范冗余，与紫外发散和质量壳奇点无关. 加入协变规范固定项

$
  S_(M,xi) [A]
  :=S_M [A]
  -1/(2 xi) integral dd(x, [4])
  [tensor(partial, +mu)tensor(A, -mu)]^2,
  quad xi!=0.
$ <eq:covariant-gauge-fixed-maxwell-action>

分部积分一次后，

$
  S_(M,xi) [A]
  =1/2 integral dd(x, [4])
  tensor(A, -mu)
  tensor(cal(K)_xi, +mu, +nu)
  tensor(A, -nu),
$

其中

$
  tensor(cal(K)_xi, +mu, +nu)
  =tensor(eta, +mu, +nu)partial^2
  -(1-1/xi)
  tensor(partial, +mu)tensor(partial, +nu).
$ <eq:gauge-fixed-maxwell-kernel>

对 $p^2!=0$，引入混合指标的动量投影算符

$
  tensor(P_T, +mu, -nu) & :=tensor(delta, +mu, -nu)
                          -(tensor(p, +mu)tensor(p, -nu))/(p^2), \
  tensor(P_L, +mu, -nu) & :=(tensor(p, +mu)tensor(p, -nu))/(p^2).
$ <eq:covariant-photon-projectors>

它们满足 $P_T^2=P_T$、$P_L^2=P_L$ 以及 $P_T P_L=0$. 因此，规范固定后的核及其 Feynman 逆在这一分解下对角化：

$
           tensor(cal(K)_xi, +mu, -nu) (p) & =-p^2 tensor(P_T, +mu, -nu)
                                             -(p^2/xi)tensor(P_L, +mu, -nu), \
  tensor((cal(K)_xi)_F^(-1), -mu, -nu) (p) & =-1/(p^2-i 0)
                                             [tensor(P_T, -mu, -nu)+xi tensor(P_L, -mu, -nu)].
$ <eq:gauge-fixed-maxwell-inverse>

再加入外源耦合 $integral tensor(J, +mu)tensor(A, -mu)$，归一化 Gaussian 积分给出

$
  tensor(D_F, -mu, -nu) (p) & :=mel(
                                0, T tensor(hat(A), -mu) (x)
                                tensor(hat(A), -nu) (y), 0
                              )_p \
                            & =-i/(p^2-i 0)
                              [
                                tensor(eta, -mu, -nu)
                                -(1-xi)(tensor(p, -mu)tensor(p, -nu))/(p^2)
                              ].
$ <eq:covariant-photon-propagator>

这里下标 $p$ 表示关于 $x-y$ 的 Fourier 核. 在 Feynman 规范 $xi=1$ 下，它化为

$
  tensor(D_F, -mu, -nu) (p)
  =(-i tensor(eta, -mu, -nu))/(p^2-i 0).
$ <eq:feynman-gauge-photon-propagator>

纵向项依赖规范，这是势关联函数所允许的. 若外部流守恒，即 $tensor(p, -mu)tensor(J, +mu) (p)=0$，纵向投影便从 $tensor(J, +mu)tensor(D_F, -mu, -nu)tensor(J, +nu)$ 中消失. 若把每个外部势替换为反对称场强，该项同样消失. 因此，流交换振幅与场强关联函数均与 $xi$ 无关. 对自由 Abelian 理论，规范固定产生的行列式与场无关，会在归一化关联函数中约掉；更一般地说，ghost 场在 Abelian 理论中解耦.

=== Grassmann 外源与 Dirac 传播子

对 Dirac 场，$Psi$ 与 $overline(Psi)$ 是独立的 Grassmann 奇积分变量；相应的独立奇外源 $eta$ 与 $overline(eta)$ 按 $overline(eta)Psi+overline(Psi)eta$ 的次序耦合. 定义

$
  cal(Z)_(D,M) [overline(eta),eta]
  :=frac(
    integral cal(D)overline(Psi)cal(D)Psi
    e^(i S_D+i integral [overline(eta)Psi+overline(Psi)eta]),
    integral cal(D)overline(Psi)cal(D)Psi e^(i S_D)
  ).
$ <eq:dirac-minkowski-generating-functional>

与 @eq:fermionic-matrix-gaussian 一样，测度和所有乘积都先在有限个 Grassmann 生成元上定义. 记

$
  cal(D):=i tensor(gamma, +mu)tensor(partial, -mu)-m.
$

配方在这里表现为代数平移：

$
  overline(Psi)cal(D)Psi
  +overline(eta)Psi+overline(Psi)eta & =[overline(Psi)+overline(eta)cal(D)_F^(-1)]
                                       cal(D)[Psi+cal(D)_F^(-1)eta] \
                                     & quad -overline(eta)cal(D)_F^(-1)eta.
$ <eq:dirac-source-completion>

Berezin 测度的平移不变性使配方后只剩最后一项；与外源无关的行列式在分子、分母之间约掉，因此

$
  cal(Z)_(D,M) [overline(eta),eta]
  =exp[-i integral dd(x, [4])dd(y, [4])
    overline(eta) (x)cal(D)_F^(-1) (x-y)eta (y)].
$ <eq:dirac-feynman-generating-functional>

对 $overline(eta)$ 作左外源微分以插入 $Psi$，对 $eta$ 作右外源微分以插入 $overline(Psi)$. 这一约定保持两个奇场的显示次序. 对 @eq:dirac-feynman-generating-functional 求导，得到

$
  tensor(S_F, -alpha, -beta) (x-y)
  :=mel(
    0, T hat(Psi)_alpha (x)
    overline(hat(Psi))_beta (y), 0
  )
  =i tensor((cal(D)_F^(-1)), -alpha, -beta) (x-y).
$ <eq:dirac-propagator-as-inverse>

在 @eq:chapter-two-fourier-convention 的 Fourier 约定下，

$
  cal(D) (p)=-slashed(p)-m.
$

利用 $slashed(p)^2=-p^2 1_4$，可得显式逆与传播子

$
  cal(D)_F^(-1) (p) & =(slashed(p)-m)/(p^2+m^2-i 0), \
            S_F (p) & =i (slashed(p)-m)/(p^2+m^2-i 0).
$ <eq:dirac-feynman-propagator>

这些符号彼此关联：同一 Fourier 约定对标量给出 $cal(K) (p)=-(p^2+m^2)$，对旋量给出 $cal(D) (p)=-slashed(p)-m$. 直接相乘即可验证

$
  cal(D)_x S_F (x-y)=i delta^((4)) (x-y)1_4.
$ <eq:dirac-feynman-green-equation>

因子分解 @eq:dirac-operator-square 还把旋量传播子与标量传播子联系起来：

$
  S_F (x-y)
  =[i tensor(gamma, +mu)tensor(partial, -mu)+m]_x
  Delta_F (x-y).
$ <eq:dirac-propagator-from-scalar>

为与正则量子化比较，令 $z:=x-y$ 并完成 $tensor(p, +0)$ 围道积分，得到

$
  S_F (z) & =theta (tensor(z, +0))
            integral tilde(dd(p))
            [-slashed(p)+m]e^(i p dot z) \
          & quad -theta (-tensor(z, +0))
            integral tilde(dd(p))
            [-slashed(p)-m]e^(-i p dot z).
$ <eq:dirac-time-ordered-mode-form>

第一行就是 @eq:dirac-wightman-function；第二行出现反粒子自旋求和，其前方负号正是时间排序交换两个奇场时所需的费米符号. 因此，路径积分、模展开与正则反对易关系选择了同一个 Green 函数.

=== Euclidean 延拓与小结

Feynman 处方可由第 1 章固定的 Wick 转动 $t=-i tau$ 定义. 对 mostly-plus Minkowski gamma 矩阵，取

$
                          tensor(gamma_E, +4) & :=tensor(gamma, +0),
                                                quad
                                                tensor(gamma_E, +i):=-i tensor(gamma, +i), \
  [tensor(gamma_E, +a),tensor(gamma_E, +b)]_+ & =2 tensor(delta, +a, +b)1_4.
$ <eq:euclidean-gamma-continuation>

于是 $e^(i S_M)$ 延拓为 $e^(-S_E)$，Euclidean Dirac 算符为 $cal(D)_E=tensor(gamma_E, +a)tensor(partial, -a)+m$. 自由 Euclidean 逆核分别为

$
                          G_E (p_E) & =1/(p_E^2+m^2), \
  tensor(D_E, -a, -b) (p_E)|_(xi=1) & =tensor(delta, -a, -b)/(p_E^2), \
                          S_E (p_E) & =[-i tensor(gamma_E, +a)tensor(p_E, -a)+m]/(p_E^2+m^2).
$ <eq:free-euclidean-propagator-summary>

离开零模后，它们都是普通的衰减 Gaussian 协方差；解析延拓分别返回 @eq:scalar-feynman-propagator、@eq:feynman-gauge-photon-propagator 与 @eq:dirac-feynman-propagator. 四类自由场背后的计算结构完全一致：若存在规范零模，先将其移除；再按指定边界处方对二次型算符求逆；最后由外源的类型记录场是实的、复的、矢量值的，还是 Grassmann 奇的.

== 习题

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
