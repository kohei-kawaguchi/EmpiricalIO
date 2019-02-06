# Dynamic Game {#dynamicgame}

## Dynamic Game

### Dynamic Game

- There are multiple players in an industry.
- There is a strategic interaction across players.



### Setting
- There is $i = 1, \cdots, N$ players.
- Time is discrete $t = 1, \cdots, \infty$.
- There are $K + 1$ actions for each player $A_i = \{0, 1, \cdots, K\}$.
- $A = \prod_{i = 1}^N A_i$. $m_a = (K + 1)^N$.
- There are $L$ states for each player $S_i = \{1, \cdots, L\}$.
- $S = \prod_{i = 1}^N S_i$. $m_s = L^N$.


### Timing of the Model

- At period $t$:

- State $s^t = (s^t_1, \cdots, s^t_N)' \in S$ is publicly observed.
- Choice-specific profitability shocks $\epsilon^t_i \in \mathbb{R}^{K + 1}$ are drawn from $F(\cdot|s^t_i, s^t_{-i})$ i.i.d. and privately observed by player $i$ for each $i = 1, \cdots, N$.
- Actions $a^t_i \in A_i, i = 1, \cdots, N$ are chosen simultaneously.
- The state evolves according to a transition probability:
\begin{equation}
g(a, s, s') \equiv \mathbb{P}\{s^{t + 1} = s'|s^t = s, a^t = a\},
\end{equation}

\begin{equation}
G \equiv 
\begin{pmatrix}
g(0, 1, 1) & \cdots & g(0, 1, m_s)\\
\vdots & & \vdots \\
g(0, m_s, 1) & \cdots & g(0, m_s, m_s)\\
&\vdots& \\
g(m_a, 1, 1) & \cdots & g(m_a, 1, m_s)\\
\vdots & & \vdots \\
g(m_a, m_s, 1) & \cdots & g(m_a, m_s, m_s)\\
\end{pmatrix}.
\end{equation}




### Period Profit

- When the state is $s^t$, action profile is $a^t$, and the profitability shocks are $\epsilon^t$, the period payoff of player $i$ is:
\begin{equation}
\pi_i(a^t, s^t) + \sum_{k = 0}^K \epsilon_i^{tk}1\{a_i^t = k\}, i = 1, \cdots, N,
\end{equation}
where $\pi_i(a^t, s^t)$ is the mean period profit of player $i$.



### Period Profit

- Let $\Pi_i$ be:
\begin{equation}
\Pi_i \equiv
\begin{pmatrix}
\pi_i(0, 1)\\
\vdots\\
\pi_i(0, m_s)\\
\vdots\\
\pi_i(m_a, 1)\\
\vdots\\
\pi_i(m_a, m_s)
\end{pmatrix}.
\end{equation}
- The profit of player $i$ is the discounted sum of future payoffs with discount factor $\beta < 1$.



### Markov Perfect Equilibrium

- We focus on pure-strategy Markov perfect equilibrium.
- A collection $(a, \sigma) = (a_1, \cdots, a_N, \sigma_1, \cdots, \sigma_N)$ is a Markov perfect equilibrium if:

- for all $i$, $a_i$ is a best response to $a_{-i}$ given the belief $\sigma_i$ at all state $s \in S$;
- all players use Markovian strategies;
- for all $i$, the belief $\sigma_i$ is consistent with the strategy $a$.




### Ex-ante Value Function

- When the belief of player $i$ about the future behavior is $\sigma_i$, then the ex-ante value function associated with this belief is:
\begin{equation}
\begin{split}
V_i(\sigma_i, s) &= \sum_{a \in A} \sigma_i(a|s)[\pi_i(a, s) + \beta \sum_{s' \in S} g(a, s, s') V_i(\sigma_i, s')]\\
& + \sum_{k = 0}^K \mathbb{E}\{\epsilon_i^k|a_i = k\}\sigma_i(a_i = k|s).
\end{split}
\end{equation}



### Ex-ante Value Function

- By stacking up over the state, it summarizes to:
\begin{equation}
\begin{split}
V_i(\sigma_i) &= \sigma_i \Pi_i + D_i(\sigma_i) + \beta \sigma_i G V_i(\sigma_i)\\
& = [I_{m_s} - \beta \sigma_i G]^{-1}[\sigma_i \Pi_i + D_i(\sigma_i)].
\end{split}
\end{equation}
where
\begin{equation}
\begin{split}
D_i(\sigma_i) &= (\sum_{k = 0}^K \mathbb{E}\{\epsilon_i^k|a_i = k\}\sigma_i(a_i = k|1), \cdots,\\
& \sum_{k = 0}^K \mathbb{E}\{\epsilon_i^k|a_i = k\}\sigma_i(a_i = k|m_s))'
\end{split}
\end{equation}
and $m_s \times (m_a m_s)$-dimensional matrix $\sigma_i$ contains $\sigma_i(a|s)$ in row $s$, column $(a, s)$ and zeros in row $s$ and column $(a, s'), s' \neq s$.



### Choice-specific Value Function

- When the state is $s$ and the belief of player $i$ is $\sigma_i$, then the mean value of choosing action $a_i$ is:
\begin{equation}
\begin{split}
v_i(\sigma_i, a_i, s) &= \sum_{a_{-i} \in A_{-i}} \sigma_i(a_{-i}|s)[ \pi_i(a_i, a_{-i}, s) \\
&+ \beta \sum_{s' \in S} g(a_i, a_{-i}, s, s') V_i(\sigma_i, s')].
\end{split}
\end{equation}
- This is the choice-specific mean value function given belief $\sigma_i$.



### Optimality Condition

- When the state is $s$ and profitability shock is $\epsilon_i$, $a_i$ is optimal for player $i$ under belief $\sigma_i$ if and only if:
\begin{equation}
v_i(\sigma_i, a_i, s) + \epsilon_i^{a_i} \ge  v_i(\sigma_i, a_i', s) + \epsilon_i^{a_i'}, \forall a_i' \in A_i.
\end{equation} 
- This condition is similar to the optimality condition in single-agent dynamic models.
- Only difference is that the belief is now about the others' actions in addition to about the future behaviors.



### Optimal Conditional Choice Probability

- Therefore, the optimal conditional choice probability of player $i$ with belief $\sigma_i$ is:
\begin{equation}
\begin{split}
p(a_i|s, \sigma_i) &= \mathbb{P}\{v_i(\sigma_i, a_i, s) + \epsilon_i^{a_i} \ge  v_i(\sigma_i, a_i', s) + \epsilon_i^{a_i'}, \forall a_i' \in A_i\}\\
&=\int \prod_{a_i' \neq a_i}1\{v_i(\sigma_i, a_i, s) + \epsilon_i^{a_i} \ge  v_i(\sigma_i, a_i', s) + \epsilon_i^{a_i'}\} d F\\
&\equiv \Psi_i(a_i, s, \sigma_i).
\end{split}
\end{equation}



### Optimal Conditional Choice Probability

- Letting $p$ and $\sigma$ as:
\begin{equation}
\begin{split}
&p = (p_1', \cdots, p_N')',\\
&p_i = (p(0|1), \cdots, p(K|1), \cdots, p(0|m_s), \cdots, p(K|m_s))',
\end{split}
\end{equation}
\begin{equation}
\begin{split}
&\sigma = (\sigma_1', \cdots, \sigma_N')',\\
&p_i = (\sigma_i(0|1), \cdots, \sigma_i(K|1), \cdots, \sigma_i(0|m_s), \cdots, \sigma_i(K|m_s))',
\end{split}
\end{equation}
and stacking up the optimality condition, we obtain:
\begin{equation}
p = \Psi(\sigma),
\end{equation}
as the optimality condition of players.



### Equilibrium Condition

- Under Markov perfect equilibrium, it has to hold:
\begin{equation}
p = \Psi(p).
\end{equation}
- In any Markov perfect equilibrium, the optimal conditional choice probability vector $p$ satisfies the equality. 
- Conversely, any $p$ that satisfies the equilibrium condition above can be derived as the optimal conditional choice probability of a Markov perfect equilibrium strategy profile.




### Equilibrium Condition

- By Brouwer's fixed-point theorem, a Markov perfect equilibrium exists. But Markov perfect equilibria need not be unique.

- You may not be able to derive the likelihood.

- If the payoff function and transition probability is symmetric across players, then symmetric Markov perfect equilibrium exists.

- This significantly reduces the dimensionality of the problem.





### Single Path of Play

- The estimation of dynamic games is mostly based on time series data of an industry.
- We often assume that the data is generated from a single path of play.
- Under Markov perfect equilibrium assumption, this means that players make same choices over time at the same state $(s, \epsilon_i)$.
- This assumption rules out equilibrium switches over time.



### Single Path of Play

- If you use cross-sectional data, you have to keep this point in your mind, because then you observe data generated from multiple paths across markets. 
- The assumption that the same equilibrium is played across markets needs further justification.



### Identification

- The parameters of the model is $(\Pi_1, \cdots, \Pi_N, F, \beta, G)$.
- $G$ is directly identified from data
- $\beta$ and $F$ are fixed.
- $(\Pi_1, \cdots, \Pi_N)$ contains $m_a \times m_s \times N$ unknown parameters.
- On the other hand, the equilibrium condition only has $K \times m_s \times N$ restrictions.



### Identification

- This time, the normalization $\pi_i(0, a_{-i}|s) = 0$ is not sufficient. 
- It is often assumed that the payoff of a player $i$ is not directly influence by the state of other players:
\begin{equation}
\pi_i(a, s_i, s_{-i}) = \pi_i(a, s_i, s_{-i}'), \forall a \in A, s_i \in S_i, s_{-i}, s_{-i}' \in S_{-i}.
\end{equation}
- Under these restrictions, the number of unknown parameters is $K (K + 1)^{N - 1} \times L \times N$.
- So, if $L \ge K + 1$, i.e., the number of states is larger than the number of actions, the order condition is satisfied.



### Estimation: CCP Approach

- Because dynamic games often have multiple equilibria, nested-fixed point algorithm fails to pin down the likelihood of data.
- Instead we use CCP approach exploiting the equilibrium condition:
\begin{equation}
p = \Psi^\theta(p) = \Psi^{(\theta_1, \theta_2)}(p),
\end{equation}
where $\theta_1$ is the parameters in the mean profit function, and $\theta_2$ is the parameters in the transition law.
- In the first step, we estimate $\theta_2$ and $p$ directly from the data. Let $\hat{\theta}_2$ and $\hat{p}$ be the estimates.
- Then, we can estimate $\theta_1$ by solving:
\begin{equation}
\min_{\theta_1} [\hat{p} - \Psi^{(\theta_1, \hat{\theta}_2)}(\hat{p})]' W [\hat{p} - \Psi^{(\theta_1, \hat{\theta}_2)}(\hat{p})],
\end{equation}
where $W$ is some weighting matrix.



### Computing $\Psi$

- Mapping from conditional choice probabilities to ex-ante value function:
\begin{equation}
\begin{split}
V_i(s) &= \varphi_i^{\theta}(p, s)\\
&= [I_{m_s} - \beta \tilde{p} G]^{-1}[\tilde{p} \Pi_i + D_i(\tilde{p})],
\end{split}
\end{equation}
where $\tilde{p}$ is an arrangement of $p$ such that:
\begin{equation}
\tilde{p}(a|s) \equiv \prod_{i = 1}^N p_i(a_i|s). 
\end{equation}



### Computing $\Psi$

- Mapping from ex-ante value function \textit{and conditional choice probabilities} to conditional choice probability:
\begin{equation}
p_i(a_i|s) =  \mathbb{P}\{v_i(\tilde{p}, a_i, s) + \epsilon_i^{a_i} \ge  v_i(\tilde{p}, a_i', s) + \epsilon_i^{a_i'}, \forall a_i' \in A_i\},
\end{equation}
where
\begin{equation}
v_i(\tilde{p}, a_i, s) = \sum_{a_{-i} \in A_{-i}} \tilde{p}(a_{-i}|s) [\pi_i(a_i, a_{-i}, s) + \beta \sum_{s' \in S} g(a_i, a_{-i}, s, s') V_i(\sigma_i, s')].
\end{equation}



### Bajari, Benkard, and Levine (2007)

- There are several variants of the CCP approach.
- The most popular variants is BBL (Bajari, Benkard, and Levine).
- Given a strategy profile ($\leftrightarrow$ conditional choice probability), we can compute the ex-ante value function analytically or numerically.
- Let $V_i^{(a_i, a_{-i})}(s)$ be the ex-ante value function associated with strategy profile $(a_i, a_{-i})$.



### Bajari, Benkard, and Levine (2007)

- The observed $(a_i^*, a_{-i}^*)$ is an equilibrium if:
\begin{equation}
V_i^{(a_i^*, a_{-i}^*)}(s) \ge V_i^{(a_i', a_{-i}^*)}(s), \forall a_i' \in A_i,
\end{equation}
for all $s \in S, i = 1, \cdots, N$.
- Then, we can consider an objective function such that:
\begin{equation}
Q(\theta) = \sum_{s = 1}^{m_s} \sum_{i = 1}^N \sum_{a_i'} \min\{V_i^{(a_i^*, a_{-i}^*)}(s) - V_i^{(a_i', a_{-i}^*)}(s), 0\}^2,
\end{equation}
which penalizes the parameter violating the inequality condition of the equilibrium.
- There is a discretion over the choice of alternative strategies to construct the objective function.



### Continuous Control

- So far we have assumed that players' actions are discrete.
- However, continuous controls such as investment prevails in the real world.
- One way to address this issues is to discretize the data and model everything in a discrete way.
- How to model continuous controls without discretization?
- This argument applies to the single-agent models as well.



### Continuous Control

- Let $a_i^t = (a_{id}^t, a_{ic}^t) \in A_i = A_{id} \times A_{ic}$ be a generic action of player $i$ in period $t$, where $A_{id} = \{0, 1, \cdots, K\}$ and $A_{ic} \subset \mathbb{R}$.
- Let $s_{i}^t \in S_i$ be a generic state of player $i$ in period $t$, where $S_i \subset \mathbb{R}^L$.
- Let $\nu_{i}^t \in \mathbb{R}^M$ be profitability shocks for player $i$ in period $t$, which are independent across players.



### Period Payoff

- Let $\pi_i(a, s, \nu_{i}^t)$ be the period payoff of player $i$ in period $t$ including the profitability shocks when the action profile is $a$, the state is $s$, and the profitability shocks are $\nu_i^t$.
- In the discrete choice framework, we assumed additive separability:
\begin{equation}
\pi_i(a, s, \nu_{i}^t) = \pi_i(a, s) + \sum_{k = 0}^K \nu_i^{kt}1\{a_i^t = k\}.
\end{equation}
- For continuous control, we may want to impose a restriction that ensures the monotonicity of the policy function in the profitability shocks, say:
\begin{equation}
\pi_i(a, s, \nu_{i}^t) = \pi_i(a, s) + \sum_{k = 0}^K \nu_{id}^{kt}1\{a_{id}^t = k\} + \nu_{ic} a_{ic}.
\end{equation}



### Policy Function Estimation with Continuous Control

- Let $a_{ic}(s, \nu_{i}) = a_{ic}(s, \nu_{ic})$ be the policy function of firm $i$ and suppose that it is increasing in $\nu_{ic}$.
- Moreover, assume that we know the distribution of $\nu_{ic}^t$, say, $F_c(\cdot|s)$.
- We can identify the distribution of continuous control $a$ conditional on $s$ directly from the data. Let $F(a|s)$ be the identified distribution function of $a$ conditional on $s$.



### Policy Function Estimation with Continuous Control

- Then, we can identify the policy function because:
\begin{equation}
\begin{split}
F(a|s) &= \mathbb{P}\{a_{ic} \le a|s\}\\
&= \mathbb{P}\{a_{ic}(s, \nu_{ic}) \le a\}\\
&=\mathbb{P}\{\nu_{ic} \le a_{ic}^{-1}(s, a)\}\\
&=F_c[a_{ic}^{-1}(s, a)|s]\\
&\Leftrightarrow a = F^{-1}\{F_c[a_{ic}^{-1}(s, a)|s]|s\}
\end{split}
\end{equation}
and can insert $a = a_{ic}(s, \nu_{ic})$ to obtain:
\begin{equation}
\begin{split}
a_{ic}(s, \nu_{ic}) &= F^{-1}\{F_c[\underbrace{a_{ic}^{-1}(s, a_{ic}(s, \nu_{ic}))}_{\nu_{ic}}|s]|s\}\\
& = F^{-1}[F_c^{-1}(\nu_{ic}|s)|s].
\end{split}
\end{equation}



### Policy Function Estimation with Continuous Control

- Inserting the identified policy for the continuous controls, we have:
\begin{equation}
\begin{split}
&\pi_i[a_{id}, a_{ic}(s, \nu_{ic}), a_{-i}, s, \nu_{d}^t] \\
&= \pi_i[a_{id}, a_{ic}(s, \nu_{ic}), a_{-i}, s] +\sum_{k = 0}^K \nu_{id}^{kt}1\{a_{id}^t = k\} + \nu_{ic} a_{ic}(s, \nu_{ic})
\end{split}
\end{equation}
- Then, we can consider a choice-specific mean value function w.r.t. the discrete control $a_{id}$ by integrating out $\nu_{ic}^t$ and others strategies and future behaviors.
- Therefore, we can identify the optimal conditional choice probability in a reduced-form and from which we can identify the policy function for the discrete choice as well.
- Then, we can apply the CCP approach to estimate the structural parameters.



### Ex-ante Value Function Computation

- Once we obtain the equilibrium policy functions, then in principle, we can compute the associated ex-ante value function, $V_i^{(a_i, a_{-i})}$, in the equilibrium.
- We often use a numerical method to compute the ex-ante value function when continuous controls are relevant.

- Draw forward profitability shocks $\nu_{i}^{t(r)}$ for $t = \cdots, \tau$ for $r = 1, \cdots, R$.
- At each period, let $a_{i}^{t(r)} = a_i(s, \nu_i^{t(r)})$ be the chosen action.
- Draw next period states $s^{t + 1(r)}$ from $g(a^{t(r)}, s^{t(r)}, s')$.
- Continue this until $t = \tau$.
- Compute:
\begin{equation}
V_i^{(a_i, a_{-i})}(s) = \frac{1}{R}\sum_{r = 1}^R \sum_{t = 1}^\tau \beta^t \pi_i[a^{(r)}, s^{(r)}, \nu_i^{(r)}].
\end{equation}

- It is a $\tau$-period forward simulation of the ex-ante value functions.
- We can conduct the same simulation under a policy that is different from the identified equilibrium policy functions as well to use in BBL.



### Application: Ryan (2012)

- In 1990, the U.S. congress passed Amendments to the Clean Air act, adding new categories of regulated $SO_2$ and $NO_x$ emissions and requiring plants to undergo an environmental certification process.
- How costly is this regulation to the economy?
- The cost analysis is typically an engineering estimates of the expenditures on control and monitoring equipment necessary to bring a plant into compliance with the new regulation.



### Application: Ryan (2012)

- However, the regulation changes both the sunk cost of entry as well as the investment cost. If the sunk cost is higher, the less firm will be active in the market, which reinforces the market power of active firms.
- This affects the equilibrium market structure.
- The engineering based cost analysis misses this important welfare loss from the changes in the market structure. 
- This paper quantifies the welfare cost based on an empirical dynamic oligopoly model.



### Model

- There are several regional cement markets in the U.S.
- Each market is described by $\overline{N} \times 1$ state vector $s_t$, where $s_{it}$ is the capacity of the $i$th firm at time $t$, and $\overline{N}$ is an exogenously imposed maximal number of active firms.
- $s_{it} = 0$ means the firm is inactive.



### Model

- Timing of the game:

- Incumbent firms ($s_{it} > 0$) receives a private draw from the distribution of scrap values.
- Incumbent firms decide whether to exit.
- Potential entrants receive a private draw of both investment and entry costs, while incumbent firms receive a private draw of both investment and disinvestment costs.
- All firms simultaneously make entry and investment decisions.
- Incumbent firms compete in the product market.
- Firms entry, exit, and investment are realized.
- The economy moves to the next period.




### Demand Function

- In each market $m$, firms face a constant elasticity of demand curves:
\begin{equation}
\ln Q_m(\alpha) = \alpha_{0m} + \alpha_1 \ln P_m,
\end{equation}
where $Q_m$ is the aggregate market quantity, $P_m$ is price, $\alpha_{0m}$ is market-specific intercept, and $\alpha_1$ is the elasticity of demand.



### Production Cost Function

- The cost of output, $q_i$, is given by:
\begin{equation}
C_i(q_i; \delta) = \delta_0 + \delta_1 q_1 + \delta_2 1\{q_i > \nu s_i\}(q_i - \nu s_i)^2,
\end{equation}
where $q_i$ is the output of firm $i$, $\delta_0$ is the fixed cost of production, $\delta_1$ is the linear variable cost, and the last term is a quadratic cost that matters only when the output is sufficiently close to the capacity.



### Investment Cost

- The cost of investment and disinvestment is:
\begin{equation}
\begin{split}
\Gamma(x_i; \gamma) &= 1\{x_i > 0\}(\gamma_{i1} + \gamma_2 x_i + \gamma_3 x_i^2)\\
& + 1\{x_i < 0\}(\gamma_{i4} + \gamma_{5} x_i + \gamma_6 x_i^2),
\end{split}
\end{equation}
where $x_i$ is the investment of firm $i$, and fixed investment and disinvestment costs $\gamma_{i1}$ and $\gamma_{i4}$ are drawn from distributions $F_{\gamma}$ and $G_{\gamma}$.
- Let $\mu_\gamma^+$ and $\sigma_\gamma^+$ be the mean and standard deviation of $F_\gamma$ and $\mu_\gamma^-$ and $\sigma_\gamma^-$ be the mean and standard deviation of $G_\gamma$.



### Entry and Exit Costs

- If the firm is a new entrant, it draws entry cost $-\kappa_i$ from $F_\kappa$.
- IF the firm is an incumbent, it draws scrap values $\phi_i$ from $F_\phi$.
- Then entry and exit cost is:
\begin{equation}
\Phi_i(a_i, \kappa_i, \phi_i) =
\begin{cases}
- \kappa_i &\text{   if the firm enters}\\
\phi_i &\text{   if the firm exits}.
\end{cases}
\end{equation}



### Period Profit Function

- As a consequence, the period profit function of firm $i$ is:
\begin{equation}
\pi_i(s, a; \alpha, \delta, \gamma_i, \kappa_i, \phi_i) = \tilde{\pi}_i(s; \alpha, \delta) - \Gamma(x_i; \gamma_i) + \Phi_i(a_i; \kappa_i, \phi_i).
\end{equation}
- Let $\theta$ summarize the parameter regarding the period profit.



### Transition

- The transition is deterministic.
- The investment changes the capacity $s_i$.
- As a firm exits, the capacity moves to 0.
- As a firm enters, the capacity moves to the initial investment level. 



### Equilibrium

- Let $\epsilon_i$ represent the firm's private information about the cost of entry, exit, investment, and disinvestment.
- Each firm's Markovian strategy $\sigma_i(s, \epsilon_i)$ is a mapping from states and shocks to actions.



### Value Function for Incumbents

- The value function for a firm with $s_i > 0$ at the time of the exit decision under strategy profile $\sigma$ is:
\begin{equation}
\begin{split}
&V_i(s; \sigma(s), \theta, \epsilon_i)\\
&=\tilde{\pi}_i(s; \theta) + \max\Bigg\{\phi_i,\\
& \mathbb{E}_{\epsilon_i}\max_{x_i^* \ge 0}  \Bigg[ - \gamma_{i1} - \gamma_{2} x_i^* - \gamma_3 x_i^{*2} + \beta \int \mathbb{E}_{\epsilon_i} V_i(s'; \sigma(s'), \theta, \epsilon_i) dP(s_i + x^*, s'_{-i}; s, \sigma(s))\Bigg],\\
&\max_{x_i^* < 0} \Bigg[- \gamma_{i4} - \gamma_5 x_i^* - \gamma_6 x_i^{*2} + \beta \int \mathbb{E}_{\epsilon_i} V_i(s'; \sigma(s'), \theta, \epsilon_i) dP(s_i + x^*, s'_{-i}; s, \sigma(s))  \Bigg]\Bigg\},
\end{split}
\end{equation}
where each term in the blanket represents the value of exit, staying and making investment, and staying and making disinvestment.
- At this timing the incumbent only observes $\phi_i$, although it is a bit confusing because the value function is written as a function of $\epsilon_i$.



### Value Function for Entrants

- The value function for a firm with $s_i = 0$ at the time of entry decision under strategy profile $\sigma$ at the time of entry and investment decisions are:
\begin{equation}
\begin{split}
&V_i(s; \sigma(s), \theta, \epsilon_i)\\
&=\max\Bigg\{0, \\
&\max_{x_i^* > 0} \Bigg[ - \gamma_{1i} - \gamma_2 x_i^* - \gamma_3 x_i^2 + \beta \int \mathbb{E}_{\epsilon_i} V_i(s'; \sigma(s'), \theta, \epsilon_i) dP(s_i + x_i^*, s'_{-i}; s, \sigma(s))\Bigg] - \kappa_i\Bigg\}.
\end{split}
\end{equation}



### Markov Perfect Equilibrium

- The strategy profile $\sigma^*$ is a Markov perfect equilibrium if:
\begin{equation}
V_i(s; \sigma_i^*(s), \sigma_{-i}^*(s), \theta, \epsilon_i) \ge V_i(s; \sigma_i'(s), \sigma_{-i}^*(s), \theta, \epsilon_i), \forall \sigma_i',
\end{equation}
for all $s, \epsilon_i$, and $i$.
- Doraszelski and Satterthwaite (2010) discuss the property of MPE in a general setting.



### Estimation

- To apply BBL, we first have to assume that the same equilibrium is played across markets.

- This assumption is not innocuous as I stated.
- Otsu, Pesendorfer, and Takahashi (2014) suggest a test for this assumption.

- It is also important to notice that we have to fix the expectation about the regulation regime by firms. 
- We assume that firms assume that the regulatory environment is permanent.



### Demand and Production Cost Estimation

- To estimate the demand function, Ryan uses supply-side cost shifters as the instrumental variables: coal prices, gas prices, electricity rates, and wage rates.
- Given the demand function, Ryan estimate the cost function from the FOC for the quantity competition.
- You should already know how to do this.



### Investment Policy Function Estimation

- With fixed costs of investment and disinvestment, investment policy function follows a so-called $(s, S)$ rule, in which firms investment only when the current capacity is below a certain lower bound and makes disinvestment only when the current capacity is above a certain upper bound.
- The lower and upper bounds, and the adjustment level are chosen optimal as a function of the state.



### Investment Policy Function Estimation

- Let $s_{it}^*$ be the target level of capacity, which is parametrized as:
\begin{equation}
\ln s_{it}^* = \lambda_1' bs(s_{it}) + \lambda_2' bs \Bigg(\sum_{j \neq i} s_{jt}\Bigg) + u_{it}^*,
\end{equation}
where $bs(\cdot)$ is finite-dimensional piecewise cubic b-splines.
- The upper and lower bounds are parametrized as:
\begin{equation}
\begin{split}
&\overline{s}_{it} = s_{it}^* + \exp\Bigg(\lambda_3' bs_1(s_{it}) + \lambda_4' bs_2\Bigg(\sum_{j \neq i} s_{jt} \Bigg) + \overline{u}_{it}^b \Bigg),\\
&\underline{s}_{it} = s_{it}^* - \exp\Bigg(\lambda_3' bs_1(s_{it}) + \lambda_4' bs_2\Bigg(\sum_{j \neq i} s_{jt} \Bigg) + \underline{u}_{it}^b \Bigg).
\end{split}
\end{equation}



### Entry and Exit Policy Functions

- The probability of entry is parametrized as:
\begin{equation}
\mathbb{P}\{\chi_i = 1; s_i = 0, s\} = \Phi\Bigg(\psi_1 + \psi_2\Bigg(\sum_{j \neq i}\Bigg) + \psi_3 1(t > 1990) \Bigg),
\end{equation}
and the probability of exit is parameterized as:
\begin{equation}
\mathbb{P}\{\chi_i = 0; s_i > 0, s\} = \Phi\Bigg(\psi_4 + \psi_5 s_{it} + \psi_6 \Bigg(\sum_{j \neq i}\Bigg) + \psi_7 1(t > 1990) \Bigg),
\end{equation}
where $\Psi$ is the cumulative distribution function of the standard normal random variable.



### BBL Estimation

- Now by comparing the value function under the identified policies with value functions under alternative policies, one can estimate the structural parameters.
- Alternative policies can be obtained by perturbing the upper and lower bounds and the target level of investment and the thresholds for entry and exit around the equilibrium policies.
- How much to perturb is a practical issue.
- Then, Ryan finds structural parameters that minimizes the BBL objective function.



### Structural Parameters Estimation Results
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/dynamic} 

}

\end{figure}


### Counterfactual Simulation

- To asses the welfare cost of the amendment, Ryan solves the model under two sets of parameters: the actual parameters and the parameters before the regulation.
- In the simulation, we can set whatever initial state.
- Ryan consider two types of initial state:

- No incumbent firms and 4 potential entrants.
- Two incumbent firms and two potential entrants.




### Counterfactual Simulation Results
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/denovo} 

}

\end{figure}



### Counterfactual Simulation Estimation Results
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/mature} 

}

\end{figure}

