#import "../lib.typ": *

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

