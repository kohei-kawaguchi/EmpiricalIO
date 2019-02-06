# Merger Analysis {#merger}



## Identification of conduct


### Identification of Conduct


- Consider a homogeneous good industry.
- Under what conditions can we distinguish across Bertrand competition, Cournot competition, and collusion?
- This argument is based on Bresnahan (1982).




### Marginal Revenue Function

- Consider the following marginal revenue function:
\begin{equation}
MR(Q) = \lambda Q P'(Q) + P,
\end{equation}
where $Q$ is the aggregate quantity, $P(Q)$ is the inverse demand function.
- This nests Bertrand, Cournot, and collusion:
- Bertrand: $\lambda = 0$.
- Cournot: $\lambda = s_i$, the share of the firm.
- Collusion: $\lambda = 1$.
- The identification of conduct in this context is equivalent to the identification of $\lambda$, the \textbf{conduct parameter}.



### First-Order Condition

- Given the previous general marginal revenue function, the first-order condition for profit maximization is written as:
\begin{equation}
\lambda Q P'(Q) + P = MC(Q),
\end{equation}
where $MC(Q)$ is a relevant marginal cost function.



### Linear Model

- Consider a linear inverse demand function:
\begin{equation}
P(Q_t) = \frac{\alpha_0}{\alpha_1} + \frac{1}{\alpha_1}Q_t + \frac{\alpha_2}{\alpha_1} X_t + \frac{1}{\alpha_1}u_{1t}^D,
\end{equation}
where $X_t$ is a vector of observed demand shifters.
- Consider a linear marginal cost function:
\begin{equation}
MC(Q_t) = \beta_0 + \beta_1 Q_t + \beta_2 W_t + u_{2t}^S,
\end{equation}
where $W_t$ is a vector of observed cost shifters.



### Pricing Equation

- Inserting the inverse demand function and marginal cost function to the optimality condition yields:
\begin{equation}
\frac{\lambda}{\alpha_1} Q_t + P = \beta_0 + \beta_1 Q_t + \beta_2 W_t + u_{2t}^s,
\end{equation}
which determines the pricing equation:
\begin{equation}
\begin{split}
P^S(Q_t) &= \beta_0 - \frac{\lambda}{\alpha_1} Q_t + \beta_1 Q_t + \beta_2 W_t + u_{2t}^S\\
&\equiv \beta_0 + \gamma Q_t + \beta_2 W_t + u_{2t}^S.
\end{split}
\end{equation}
- The key parameter is:
\begin{equation}
\gamma \equiv \beta_1 - \frac{\lambda}{\alpha_1}.
\end{equation}



### Identification of Inverse Demand Function and Pricing Equation

- We have two systems of reduced-form equations:
\begin{equation}
\begin{split}
&P(Q_t) = \frac{\alpha_0}{\alpha_1} - \frac{1}{\alpha_1}Q_t + \frac{\alpha_2}{\alpha_1} X_t + \frac{1}{\alpha_1}u_{1t}^D,\\
&P^S(Q_t) = \beta_0 + \gamma Q_t + \beta_2 W_t + u_{2t}^S.
\end{split}
\end{equation}
- If we had a demand shifter $X_t$, then it can be used as an instrument for $Q_t$ in the pricing equation to identify the parameters in the pricing equation.
- If we had a cost shifter $W_t$, then it can be used as an instrument for $Q_t$ in the inverse demand function to identify the parameters in the pricing equation.
- Thus, we can identify $(\alpha_0, \alpha_1, \alpha_2)$ and $(\beta_0, \gamma, \beta_2)$ if we have a demand shifter $X_t$ and a cost shifter $W_t$.
- However, this is not enough to separately identify $\beta_1$ and $\lambda$ in $\gamma$.

### The Conduct Parameter is Unidentified
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/demandshift} 

}

\end{figure}


### Identification of the Conduct Parameter: When Cost Data is Available

- If there is reliable cost data, we can directly identify the marginal cost function:
\begin{equation}
MC(Q_t) = \beta_0 + \beta_1 Q_t + \beta_2 W_t + u_{2t}^S,
\end{equation}
and so $\beta_1$.
- Then, in a combination with the identification of inverse demand function and pricing equation, $\lambda$ is identified as:
\begin{equation}
\lambda = \alpha_1 (\beta_1 - \gamma).
\end{equation}



### Identification of the Conduct Parameter: When Cost Data is Not Available

- Remember the first-order condition:
\begin{equation}
\lambda Q P'(Q) + P^S(Q) = MC(Q),
\end{equation}
where we can identify $P(Q)$ and $P^S(Q)$ if we have demand and cost shifters.
- It is clear from this expression that we need a variation in $P'(Q)$ with a fixed $Q$ and $P$ to identify $\lambda$, i.e., something that rotates the inverse demand function.
- Intuition: If demand becomes more elastic, prices will decrease and quantity will increase in a market with a high degree of market power.



### Identification of the Conduct Parameter: Demand Rotater is Available

- To identify the conduct parameter, we needed a demand rotater:
\begin{equation}
P(Q_t) = \frac{\alpha_0}{\alpha_1} + \frac{1}{\alpha_1}Q_t + \frac{\alpha_2}{\alpha_1} X_t + \underbrace{\frac{\alpha_3}{\alpha_1} Q_t Z_t}_{rotaters} +  \frac{1}{\alpha_1}u_{1t}^D.
\end{equation}
- Inserting this into the first-order condition yields:
\begin{equation}
\frac{\lambda}{\alpha_1} Q_t (1 + \alpha_3 Z_t)+ P = \beta_0 + \beta_1 Q_t + \beta_2 W_t + u_{2t}^s,
\end{equation}
which determines the pricing equation:
\begin{equation}
\begin{split}
P^S(Q_t) &= \beta_0 - \frac{\lambda}{\alpha_1} Q_t(1 + \alpha_3 Z_t) + \beta_1 Q_t + \beta_2 W_t + u_{2t}^S\\
&\equiv \beta_0 + \gamma_1 Q_t + \gamma_2 Z_t Q_t + \beta_2 W_t + u_{2t}^S,
\end{split}
\end{equation}
where:
\begin{equation}
\gamma_1 \equiv \beta_1 - \frac{\lambda}{\alpha_1}, \gamma_2 \equiv - \frac{\lambda \alpha_3}{\alpha_1}.
\end{equation}
### Identification of the Conduct Parameters: Demand Rotater is Available

- If we have cost shifters $W_t$, it can be used as instruments for $Q_t$ in the inverse demand function to identify the demand parameters $(\alpha_0, \alpha_1, \alpha_2, \alpha_3)$.
- If we have demand shifters $X_t$, it can be used as instruments for $Q_t$ in the pricing equation to identify the supply parameters $(\beta_0, \gamma_1, \gamma_2, \beta_2)$.
- Now we can identify $\alpha_1, \alpha_3$ and $\gamma_2$, so that the conduct parameter:
\begin{equation}
\lambda = - \frac{\gamma_2 \alpha_1}{\alpha_3}
\end{equation}
is also identified.



### Identification of the Marginal Cost

- If the inverse demand function, pricing equation, and the conduct parameter are identified, then we can identify the marginal cost function from the first-order condition: $(\beta_0, \beta_1, \beta_2)$ are identified.
- Note that $\beta_1$ is unidentified when demand rotators are not available.
- Kim and Knittel (2006) compare the actual cost information and the estimated cost function using the California electricity market data and find that the conduct parameter technique do a poor job.



### Identification of Conduct in Differentiated Product Market

- Suppose that there are two differentiated substitutable products and companies compete in price.
- Are the prices determined independently or jointly?
- The general first-order condition is:
\begin{equation}
\begin{split}
&(p_1 - c_1) \frac{\partial Q_1(p)}{\partial p_1} + Q_1^S(p) + \Delta_{12}(p_2 - c_2) \frac{\partial Q_2 (p)}{\partial p_1} = 0\\
&\Delta_{21}(p_1 - c_1)\frac{\partial Q_1(p)}{\partial p_2} + Q_2^S(p) + (p_2 - c_2) \frac{\partial Q_2 (p)}{\partial p_2} = 0,
\end{split}
\end{equation}
where

- $\Delta_{12} = \Delta_{21} = 0$ if prices are determined independently.
- $\Delta_{12} = \Delta_{21} = 1$ if price are determined jointly. 

- Under what conditions can we identify $\Delta_{12}$ and $\Delta_{21}$?

## Merge Simulation


### Merger Simulation

- In merger simulation, we compute the equilibrium under different ownership structure.
- This amounts to run a counterfactual simulation changing the conduct parameter $\lambda$ or $\Delta$.
- Before running the simulation, you have to be very careful about the model assumptions:

- In music industry, firms compete not in price but in advertisement.
- If technological diffusion is important, firms may set dynamic pricing.

- Keep these limitations in mind, let's see an example of merger simulation in a static differentiated product market as a benchmark case.



### Pre-merger Model

- There are $J$ products, $\mathcal{J} = \{1, \cdots, J\}$.
- Firm $f$ produces a set of products which we denote $\mathcal{J}_f \subset \mathcal{J}$.
- Let $mc_j$ be the constant marginal cost of producing good $j$.

- Thus assuming a separable cost function.

- Let $D_j(p)$ be the demand for product $j$ when the price vector is $p$.
- The problem for firm $f$ given price of other firms $p_{-f}$ is:
\begin{equation}
\max_{p_f} \sum_{j \in \mathcal{J}_f} \Pi_j(p_f, p_{-f}) = \sum_{j \in \mathcal{J}_f} (p_j - mc_j) D_j(p_f, p_{-f}),
\end{equation}
where $p_f = \{p_j\}_{j \in \mathcal{J}_f}$, $p_{-f} = \{p_j\}_{j \in \mathcal{J} \setminus \mathcal{J}_f}$.



### First-order Condition of Pre-merger Model

- The first-order condition for firm $f$ is:
\begin{equation}
D_k(p) + \sum_{j \in \mathcal{J}_f} (p_j - mc_j) \frac{\partial D_j(p)}{\partial p_k} = 0, \forall k \in \mathcal{J}_f.
\end{equation}
- Let $\Delta_{jk}$ takes 1 if same firm produces $j$ and $k$ and 0 otherwise.
- The first-order condition can be written as:
\begin{equation}
D_k(p) + \sum_{j \in \mathcal{J}} \Delta_{jk}(p_j - mc_j) \frac{\partial D_j(p)}{\partial p_k} = 0, \forall k \in \mathcal{J}_f.
\end{equation}
- Let $\Delta$ be a $J \times J$ matrix whose $(j, k)$-element is $\Delta_{jk}$.
- At the end of the day, performing a merger simulation is to recompute the equilibrium with different ownership structure encoded in $\Delta$. 




### Merger Simulation in the Ready-to-Eat Cereal Industry


- Nevo (2000).
- In 1997, the U.S. market consumed approximately 3 billion pounds of cereal, grossing roughly \$9 billion in sales.
- Actual mergers:

- In 1995, Post acquired Nabisco cereal line.
- In 1996, General Mills acquired cereal line from Ralston Purina such as Chex line and Cookie Crisp.




### Entry of New Products

- Many products enter before the two merger cases.
- These are endogenous decisions but we abstract away from this fact.
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/entry} 

}

\end{figure}


### Data for Estimation

- Brand, city, and quarter level data between 1988 and 1992 (pre-merger period).
- It covers 24 brands over 45 cities.
- The dataset covers roughly 42\% to 63\% of the city-level market share.
- The data includes market share, prices, brand characteristics, advertising, and information on the distribution of demographics.



### Demand Estimation

- The author considers a mixed-logit model with unobserved product-market specific fixed effects.
- The indirect utility for consumer $i$ to purchase product $j$ in market $t$ is:
\begin{equation}
u_{ijt} = x_{jt} \beta_i + \alpha_i p_{jt} + \xi_{j} + \xi_t + \Delta \xi_{jt} + \epsilon_{ijt},
\end{equation}
where $\epsilon_{ijt}$ is drawn from i.i.d. Type-I extreme value distribution.
- The coefficients are distributed according to:
\begin{equation}
\begin{pmatrix}
\alpha_i \\
\beta_i
\end{pmatrix}
= 
\begin{pmatrix}
\alpha\\
\beta
\end{pmatrix}
+ \Pi D_i + \Sigma \nu_i, \nu_i \sim N(0, I_{K + 1}).
\end{equation}
- The author uses BLP-type instrumental variables.
- Let $s_{jt}(p)$ be the choice share of product $j$ in market $t$.



### Demand Estimation Results
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/estimation2} 

}

\end{figure}


### Marginal Cost Estimation

- Let $\Omega_t(p)$ is a matrix whose $(j, k)$-element is:
\begin{equation}
\begin{cases}
- \frac{\partial s_{jt}(p)}{\partial p_k} &\text{   if   } \exists f, \{j, k\} \subset \mathcal{J}_f\\
0&\text{   otherwise.}
\end{cases}
\end{equation}
- Then, by the first-order condition, we have:
\begin{equation}
mc_t = p_t - \Omega_t(p_t)^{-1}s_t(p_t).
\end{equation}
- Because we identified demand function, we can compute $\Omega_t$ and $s_t$ in combination with the ownership structure information.



### Marginal Cost Estimation Result
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/marginalcost} 

}

\end{figure}


### Post-merger Simulation

- Let $\hat{mc}_t$ be the estimate of the marginal cost in market $t$.
- If we change the ownership structure, we can recompute $\Omega_t(p)$ with the new ownership structure and the estimated demand function.
- The post-merger price is given by solving:
\begin{equation}
p_t^{post} = \hat{mc}_t + \hat{\Omega}^{post}_t(p_t^{post})^{-1}\hat{s}_t(p_t^{post}).
\end{equation}
- The post-merger quantity is given by:
\begin{equation}
q_t^{post} = \hat{D}_t(p_t^{post}).
\end{equation}



### Post-merge Simulation Result
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/mergersimulation} 

}

\end{figure}


### Welfare Analysis

- If we identify demand function, we can make a welfare analysis.
- The compensating variation for consumer $i$ is shown to be:
\begin{equation}
CV_{it} = \frac{\ln (\sum_{j = 0}^J \exp(V_{ijt}^{post}) ) - \ln (\sum_{j = 0}^J \exp(V_{ijt}^{pre})) }{\alpha_i},
\end{equation}
where $V_{ijt}^{post}$ and $V_{ijt}^{pre}$ are indirect utility for consumer $i$ to purchase good $j$ at the prices after and before the merger.
- The aggregate compensating variation is:
\begin{equation}
\sum_{t} M_t\int CV_{it} dP_D(D) dP_\nu(\nu),
\end{equation}
where $M_t$ is the size of market $t$.



### Welfare Analysis Results 
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/welfare} 

}

\end{figure}





