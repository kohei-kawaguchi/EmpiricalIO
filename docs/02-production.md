# Production and Cost Function Estimation {#production}

- There are several levels of parameters that govern the behavior of firms:

- __Production function__

    - Add factor market structure.
    - Add cost minimization.

- $\rightarrow$ __Cost function__

    - Add product market structure.
    - Add profit maximization.

- $\rightarrow$ __Supply function (Pricing function)__
    
    - Combine cost and supply (pricing) functions.

- $\rightarrow$ __Profit function__


- Which parameter to identify depends on your research question and whether you can identify the parameter depends on your data.

## Production Function Estimation

### Cobb-Douglas Specification as a Benchmark

- Most of the following argument carries over to a general model.
- For firm $j = 1, \cdots, J$ and time $t = 1, \cdots, T$, we observe output $Y_{jt}$, labor $L_{jt}$, and capital $K_{jt}$.
- Assume Cobb-Douglas production function:
\begin{equation}
Y_{jt} = A_{jt}  L_{jt}^{\beta_l} K_{jt}^{\beta_k},
\end{equation}
where $A_{jt}$ is an unobserved heterogeneity in the model.
- Taking the logarithm gives:
\begin{equation}
y_{jt} = \beta_0 + \beta_l l_{jt} + \beta_k k_{jt} + \epsilon_{jt},
\end{equation}
where lowercase symbols represent natural logs of variables and $\ln(A_{jt}) = \beta_0 + \epsilon_{jt}$.
- This can be regarded as a first-order log-linear approximation of a production function.
- Linear regression model! May OLS work?


### Potential Bias I: Endogeneity

- $\epsilon_{jt}$ contains everything that cannot be explained by the observed inputs: better capital may be employed, a worker may have obtained better skills, etc.
- When the manager of a firm makes an input choice, she should have some information about the realization of $\epsilon_{jt}$.
- Thus, the input choice can be correlated with $\epsilon_{jt}$, because:
\begin{equation}
L_{jt} = \Bigg[\frac{p_{jt}}{w_{jt}} \beta_l \exp^{\beta_0 + \epsilon_{jt}} K_{jt}^{\beta_k}\Bigg]^{\frac{1}{1 - \beta_l}}.
\end{equation}
- In this case, OLS estimator for $\beta_l$ is \textit{positively} biased, because when $\epsilon_{jt}$ is high, $l_{jt}$ is high and thus the increase in output caused by $\epsilon_{jt}$ is captured as if caused by the increase in labor input.

### Potential Bias II: Selection

- Firms freely enter and exit market. 
- Therefore, a firm that had low $\epsilon_{jt}$ is likely to exit.
- However, if firms have high capital $K_{jt}$, it can stay in the market even if the realization of $\epsilon_{jt}$ is very low.
- Therefore, conditional on being in the market, there is a \textit{negative} correlation between the capital $K_{jt}$ and $\epsilon_{jt}$.
- This problem occurs even if the choice of $K_{jt}$ itself is not a function of $\epsilon_{jt}$.

### How to Resolve Endogeneity Bias?

- Temporarily abstract away from entry and exit.
- The data is balanced. 


- Instrumental variable.
- Unobserved fixed effects.
- Olley-Pakes approach. 

### Instrumental Variable

- If we have instrumental variables that affect inputs but are uncorrelated with errors $\epsilon_{jt}$, then we can identify the parameter by an instrumental variable method.

- One candidate for the instrumental variables: input prices.
- Input price affect input decision.
- Input price is not correlated with $\epsilon_{jt}$ if the factor product market is competitive and $\epsilon_{jt}$ is an idiosyncratic shock to a firm.
- Problems:
    - Input prices often lack cross-sectional variation.
    - Cross-sectional variation is often due to unobserved input quality.

- Anothor candidate for the instrumental variables: lagged inputs.
- If $\epsilon_{jt}$ does not have autocorrelation, lagged inputs are not correlated with the current shock.
- If there are adjustment costs for inputs, then lagged inputs are correlated with the current inputs.
- Problem:
    - If $\epsilon_{jt}$ has auto-correlation, all lagged inputs are correlated with the errors: For example, if $\epsilon_{jt}$ is AR(1), $\epsilon_{jt} = \alpha \epsilon_{j, t - 1} + \nu_{j, t - 1} = \cdots \alpha^l \epsilon_{j, t - l} + \nu_{j, t - 1} + \cdots, \alpha^{l - 1} \nu_{j, t - l}$ for any $l$.





### Unobserved Fixed-effect

- Assume that $\epsilon_{jt} = \mu_j + \eta_{jt}$, where $\eta_{jt}$ is uncorrelated with input choices up to period $t$:
\begin{equation}
y_{jt} = \beta_0 + \beta_l l_{jt} + \beta_k k_{jt} + \mu_j + \eta_{jt}.
\end{equation}
- Then, by differencing period $t$ and $t - 1$ equations, we get:
\begin{equation}
y_{jt} - y_{j, t - 1}= \beta_l (l_{jt} - l_{j, t - 1}) + \beta_k (k_{jt} - k_{j, t - 1}) + (\eta_{jt} - \eta_{j, t - 1}).
\end{equation}
- Then, because $\eta_{jt} - \eta_{j, t - 1}$ is uncorrelated either with $l_{jt} - l_{j, t - 1}$ or $k_{jt} - k_{j, t - 1}$, we can identify the parameter.
- Problem:
    - Too restrictive.
    - When there are measurement errors, fixed-effect estimator can generate higher biases than OLS estimator, because measurement errors more likely to survive first-differencing and within-transformation.

### Olley-Pakes Approach

- Write $\epsilon_{jt} = \omega_{jt} + \eta_{jt}$, where $\omega_{jt}$ is an anticipated shock and $\eta_{jt}$ is an ex-post shock.
- Inputs are correlated with $\omega_{jt}$ but not with $\eta_{jt}$
- The model is written as:
\begin{equation}
y_{jt} = \beta_0 + \beta_l l_{jt} + \beta_k k_{jt} + \omega_{jt} + \eta_{jt}.
\end{equation}
- OP use economic theory to derive a valid proxy for the anticipated shock $\omega_{jt}$.
 
### Assumption I: Shocks

- The ex-post shock $\eta_{jt}$ is i.i.d. and independent of past and future input decisions.
- The anticipated shock $\omega_{jt}$ follows a Markov process with transition probability $p(\omega_{jt}|\omega_{j, t - 1})$.

- For exposition simplicity, assume that $\omega_{jt} = g(\omega_{j, t - 1}) + \nu_{jt}$, and $\nu_{jt}$ is i.i.d.


### Assumption II: Decision Timing

- Capitals are assumed to be accumulated by firms through:
\begin{equation}
k_{j, t + 1} = (1 - \delta) k_{jt} + i_{jt}. 
\end{equation} 
- At the beginning of period $t$, firm $j$ observes anticipated shock $\omega_{jt}$.
- Then it makes labor input and \textit{investment} decisions.
\item[$\rightarrow$] $k_{jt}$ is uncorrelated with $\omega_{jt}$ conditional on $\omega_{j, t - 1}$.

### Assumption III: Invertibility

- Investment decision of firm $j$:
\begin{equation}
i_{jt} = i(k_{jt}, \omega_{jt}, x_{jt}). 
\end{equation}
- We assume it is strictly increasing in the anticipated shock $\omega_{jt}$ for any capital $k_{jt}$ and other state variables $x_{jt}$.
- For expositional simplicity, we assume:
\begin{equation}
i_{jt} = i(k_{jt}, \omega_{jt}).
\end{equation}
- If $\omega_{jt}$ is a scalar, it is invertible with $i_{jt}$:
\begin{equation}
\omega_{jt} = i^{-1}(k_{jt}, i_{jt}) \equiv h(k_{jt}, i_{jt}).
\end{equation}
 

### Two-step Approach: The First Step

- Insert $\omega_{jt} = h(k_{jt}, i_{jt})$ to the original equation to get:
\begin{equation}
\begin{split}
y_{jt} &= \beta_l l_{jt} + \underbrace{\beta_0 + \beta_k k_{jt} + h(k_{jt}, i_{jt})}_{\text{unkown function of $k_{jt}$ and $i_{jt}$}} + \eta_{jt}\\
& \equiv \beta_l l_{jt} + \phi(k_{jt}, i_{jt}) + \eta_{jt}.
\end{split}
\end{equation}
- This is a partially linear model.
- Because $l_{jt}, k_{jt}$ and $i_{jt}$ are uncorrelated with $\eta_{jt}$, we can identify $\beta_l$ and $\phi(\cdot)$:
\begin{equation}
\mathbb{E}\{y_{jt}|l_{jt}, k_{jt}, i_{jt}\} = \beta_l l_{jt} + \phi(k_{jt}, i_{jt})
\end{equation}
if there is enough variation in $l_{jt}, k_{jt}$ and $i_{jt}$.
- Let $\beta_l^0$ and $\phi^0$ be the identified true parameters.
 



### Two-step Approach: The Second Step

- Note that:
\begin{equation}
\omega_{jt} \equiv \phi(k_{jt}, i_{jt}) - \beta_0 - \beta_k k_{jt}.
\end{equation}
- Therefore, we have:
\begin{equation}
\begin{split}
&y_{jt} - \beta_l^0 l_{jt} \\
&= \beta_0 + \beta_k k_{jt} + \omega_{jt} + \eta_{jt}\\
&= \beta_0 + \beta_k k_{jt} + g(\omega_{j, t - 1}) + \nu_{jt} + \eta_{jt}\\
&= \beta_0 + \beta_k k_{jt} + g[\phi^0(k_{j, t - 1}, i_{j, t - 1}) - (\beta_0 + \beta_k k_{j, t - 1})] + \nu_{jt} + \eta_{jt}.
\end{split}
\end{equation}
- This is a single-index model with index $\beta_0 + \beta_l k_{jt}$.
- We can identify $\beta_0, \beta_k$ and $g$.
 

### How to Resolve Selection Bias

- At the beginning of period $t$, after observing $\omega_{jt}$, firm $j$ decides whether to continue the business ($\chi_{jt} = 1$) or exit ($\chi_{jt} = 0)$.
- Assume that the difference between continuation and exit values is strictly increasing in $\omega_{jt}$.
- Then, there is a threshold $\underline{\omega}(k_{jt})$ such that:
\begin{equation}
\chi_{jt} = 
\begin{cases}
1 &\text{   if   } \omega_{jt} \ge \underline{\omega}(k_{jt})\\
0 &\text{   otherwise.}
\end{cases}
\end{equation}
- We can only observe firms that satisfy $\chi_{jt} = 1$.

### Correction in the First Step

- In the first step, we need no correction because:
\begin{equation}
\begin{split}
&\mathbb{E}\{y_{jt}|l_{jt}, k_{jt}, i_{jt}, \chi_{jt} = 1 \}\\
&=\beta_l l_{jt} + \phi(k_{jt}, i_{jt}) + \mathbb{E}\{\eta_{jt}|\chi_{jt} = 1\}\\
&= \beta_l l_{jt} + \phi(k_{jt}, i_{jt}).
\end{split}
\end{equation}
- Ex-post shock $\eta_{jt}$ is independent of continuation/exit decision.
Therefore, we can identify $\beta_l$ and $\phi(\cdot)$ as in the previous case.


### Correction in the Second Step I: The Source of Bias

- One the other hand, we need correction in the second step, because:
\begin{equation}
\begin{split}
&\mathbb{E}\{y_{jt} - \beta_l^0 l_{jt}|k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1}, \chi_{jt} = 1\} \\
&= \beta_0 + \beta_k k_{jt} + g[\phi^0(k_{jt}, i_{jt}) - (\beta_0 + \beta_k k_{jt})]\\
& + \mathbb{E}\{\nu_{jt} + \eta_{jt}| k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1}, \chi_{jt} = 1\}\\
&= \beta_0 + \beta_k k_{jt} + g[\phi^0(k_{j, t - 1}, i_{j, t - 1}) - (\beta_0 + \beta_k k_{j, t - 1})]\\
& + \mathbb{E}\{\nu_{jt}| k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1} , \chi_{jt} = 1\}.
\end{split}
\end{equation}
and
\begin{equation}
\mathbb{E}\{\nu_{jt}| k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1}, \chi_{jt} = 1 \} \neq 0,
\end{equation}
since anticipated shock matters continuation/exit decision in period $t$.
 



### Correction in the Second Step II: Conditional Exit Probability

- Let's see that the conditional expectation:
\begin{equation}
\begin{split}
&\mathbb{E}\{\omega_{jt}| k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1}, \chi_{jt} = 1 \}\\
&=\mathbb{E}\{\omega_{jt}| k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1}, \omega_{jt} \ge \underline{\omega}(k_{jt}) \}\\
&=\int_{\underline{\omega}(k_{jt})} \omega_{jt} \frac{p(\omega_{jt}|\omega_{j, t - 1})}{\int_{\underline{\omega}(k_{jt})} p(\omega|\omega_{j, t - 1}) d\omega } d \omega_{jt}\\
&\equiv \tilde{g}(\omega_{j, t - 1}, \underline{\omega}(k_{jt})),
\end{split}
\end{equation}
is a function of $\omega_{j, t - 1}$ and $\underline{\omega}(k_{jt})$.
 



### Correction in the Second Step III: Invertibility in Threshold

- The probability of continuation conditional on observed information up to period $t - 1$:
\begin{equation}
\begin{split}
P_{jt} &\equiv \mathbb{P}\{\chi_{jt} = 1|\mathcal{I}_{j, t - 1}\}\\
&= \mathbb{P}\{\omega_{jt} \ge \underline{\omega}(k_{jt}) |\mathcal{I}_{j, t - 1}\}\\
&= \mathbb{P}\{g(\omega_{j, t - 1}) + \nu_{jt} \ge \underline{\omega}[(1 - \delta) k_{j, t - 1} + i_{j, t - 1}]|\mathcal{I}_{j, t - 1} \}\\
&= \mathbb{P}\{ \chi_{jt} = 1| i_{j, t - 1}, k_{j, t - 1}\}.
\end{split}
\end{equation}
\item[$\rightarrow$] It suffices to condition on $i_{j, t - 1}, k_{j, t - 1}$.
- We also have:
\begin{equation}
P_{jt} = \mathbb{P}\{\chi_{jt} = 1| \omega_{j, t - 1}, \underline{\omega}(k_{jt})\},
\end{equation}
and it is invertible in $\underline{\omega}(k_{jt})$, that is,
\begin{equation}
\underline{\omega}(k_{jt}) \equiv \psi(P_{jt}, \omega_{j, t - 1}).
\end{equation}
 



### Correction in the Second Step IV: Controlling the Threshold

- Now, he have:
\begin{equation}
\begin{split}
&\mathbb{E}\{y_{jt} - \beta_l^0 l_{jt}|k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1}, \chi_{jt} = 1\} \\
&= \beta_0 + \beta_k k_{jt} + \mathbb{E}\{\omega_{jt}| k_{jt}, i_{jt}, k_{j, t - 1}, l_{j, t - 1} , \chi_{jt} = 1\}\\
&= \beta_0 + \beta_k k_{jt} + \tilde{g}(\omega_{j, t - 1}, \underline{\omega}(k_{jt}))\\
&= \beta_0 + \beta_k k_{jt} + \tilde{g}(\omega_{j, t - 1}, \psi(P_{jt}, \omega_{j, t - 1}))\\
&\equiv \beta_0 + \beta_k k_{jt} + \tilde{\tilde{g}}(\omega_{j, t - 1}, P_{jt})\\
&= \beta_0 + \beta_k k_{jt} + \tilde{\tilde{g}}[\phi(k_{j, t - 1}, i_{j, t - 1}) - (\beta_0 + \beta_k k_{j, t - 1}), P_{jt}].
\end{split}
\end{equation}
- At the end, the only difference is to include $P_{jt}$ as a covariate.


### The Limitation and Extension of Olley-Pakes Approach

- Zero investment problem.
- Multicollinearity problem.
- Scalar unobservable problem.




### Zero Investment Problem

- One of the key assumptions in OP method was invertibility between anticipated shock and investment:
\begin{equation}
\omega_{jt} = i^{-1}(k_{jt}, i_{jt}) \equiv h(k_{jt}, i_{jt}).
\end{equation}
- However, in micro data, zero investment is a rule rather than exceptions.
- Then, the invertibility does not hold globally: there are some region of the anticipated shock in which the investment takes value zero. 
 



### Tackle Zero Investment Problem I: Discard Some Data

- Discard a data $(j, t)$ such that $i_{j, t - 1} = 0$.
- Use a data $(j, t)$ such that $i_{j, t - 1} > 0$.
- Then, invertibility recovers on this selected sample.
- This \textbf{does not} cause bias in the estimator because $\nu_{jt}$ in :
\begin{equation}
\beta_0 + \beta_l k_{jt} + g[\phi^0(k_{j, t - 1}, i_{j, t - 1}) - (\beta_0 + \beta_k k_{j, t - 1})] + \nu_{jt} + \eta_{jt},
\end{equation}
is independent of the event up to $t - 1$, including $i_{j, t - 1}$. 
- However, this \textbf{does} cause information loss. The loss is high if the proportion of the sample such that $i_{j, t - 1} = 0$ is high.
 



### Tackle Zero Investment Problem II: Use Another Proxy

- Investment is just a possible proxy for the anticipated shock.
- Labor or material inputs can be used as proxies as well.
- Let $m_{jt}$ be the log material input, and assume that the production function takes the form of:
\begin{equation}
y_{jt} = \beta_0 + \beta_l l_{jt} + \beta_k k_{jt} + \beta_m m_{jt} + \omega_{jt} + \eta_{jt}.
\end{equation}
- In addition, assume that the policy function for $m_{jt}$ is strictly monotonic in the ex-ante shock, and hence is invertible:
\begin{equation}
m_{jt} = m(k_{jt}, \omega_{jt}) \Leftrightarrow \omega_{jt} = m^{-1}(m_{jt}, k_{jt}) \equiv h(m_{jt}, k_{jt}).
\end{equation}




### Tackle Zero Investment Problem II: Use Another Proxy

- The first step:
\begin{equation}
\begin{split}
y_{jt} &= \beta_0 + \beta_l l_{jt} + \beta_k k_{jt} + \beta_m m_{jt} + h(m_{jt}, k_{jt}) + \eta_{jt}\\
&= \beta_l l_{jt} + \phi(m_{jt}, k_{jt}) + \eta_{jt}.
\end{split}
\end{equation}
- The second step:
\begin{equation}
\begin{split}
&y_{jt} - \beta_l^0 l_{jt}\\
& = \beta_k k_{jt} + \beta_m m_{jt} + g[\hat{\phi}(m_{j, t - 1}, k_{j, t - 1}) - \beta_k k_{j, t - 1} - \beta_m m_{j, t - 1}]\\
& + \nu_t + \eta_t.
\end{split}
\end{equation}
- The current material inputs $m_{jt}$ is likely to be correlated with the innovation $\nu_{t}$. So, we use the lagged variables $m_{j, t - 1}, m_{j, t - 2}, \cdots$ as instrumentals.
 



### Collinearity Problem

- We assumed that $k_{jt}$ and $\omega_{jt}$ are state variables.
- Then the policy function for labor input should take the form of:
\begin{equation}
l_{jt} = l(k_{jt}, \omega_{jt}).
\end{equation}
- However, because $\omega_{jt} = h(i_{jt}, k_{jt})$, we have:
\begin{equation}
l_{jt} = l(k_{jt}, h(i_{jt}, k_{jt})) = \tilde{l}(i_{jt}, k_{jt}).
\end{equation}
- Therefore, in the first stage, we encounter a multicollinearity problem:
\begin{equation}
\begin{split}
y_{jt} &= \beta_0 + \beta_l \tilde{l}(i_{jt}, k_{jt}) + \phi(i_{jt}, k_{jt}) + \eta_{jt}\\
&\equiv \tilde{\phi}(i_{jt}, k_{jt}).
\end{split}
\end{equation}
$\beta_l$ cannot be identified!
- Nevertheless, Olley and Pakes (1996) report some estimate on $\beta_l$.
- From where did it come from? 
- It is an identification by misspecification.
This is an assumption:
\begin{equation}
l_{jt} = l(k_{jt}, \omega_{jt}).
\end{equation}.
- In reality, this can be misspecified, and there will be additional error variables $z_{jt}$ such that:
\begin{equation}
l_{jt} = l(k_{jt}, \omega_{jt}, z_{jt}).
\end{equation}
- The variation in $z_{jt}$ was the source of identification of $\beta_l$.
- This fact is uncomfortable:
    - $z_{jt}$ has to have a positive variance conditional on $k_{jt}$ and $\omega_{jt}$.
    - $z_{jt}$cannot be serially correlated because if so it enters as a state variable that has to be controlled as well as $\omega_{jt}$.

### Tackle Collinearity Problem: Share Regression

- Let $w_t$ be wage and $p_t$ be the product price.
- Then, the first-order condition for profit maximization with respect to $L_{jt}$ is:
\begin{equation}
\begin{split}
&P_t F_L(L_{jt}, K_{jt})e^{\omega_{jt}} \mathbb{E} e^{\eta_{jt}} = w_t\\
&\Leftrightarrow \frac{P_t F_L(L_{jt}, K_{jt})e^{\omega_{jt}} \mathbb{E} e^{\eta_{jt}}}{F(L_{jt}, K_{jt}) } = \frac{w_t}{F(L_{jt}, K_{jt}) }\\
&\Leftrightarrow \frac{F_L(L_{jt}, K_{jt}) L_{jt}}{F(L_{jt}, K_{jt})  e^{\eta_{jt}} } = \frac{w_t L_{jt}}{P_t \underbrace{F(L_{jt}, K_{jt}) e^{\omega_{jt}} e^{\eta_{jt}}}_{Y_{jt}} },
\end{split}
\end{equation}
where the right hand side is expenditure share to the labor, which is observed.
- Furthermore, on the left hand side, we only have $\eta_{jt}$, which is independent of inputs.

- Let $s_{jt}$ be the log of expenditure share to the labor, and take a log of the previous equation gives:
\begin{equation}
\begin{split}
s_{jt} &= \log [F_L(L_{jt}, K_{jt}) L_{jt} \mathbb{E} e^{\eta_{jt}} / F(L_{jt}, K_{jt})] - \eta_{jt}\\
& = \log(\beta_l) + \ln \mathbb{E} e^{\eta_{jt}} - \eta_{jt}.
\end{split}
\end{equation}
- Remember that the coefficient in the Cobb-Douglas function is equal to the expenditure share.
- In general, share regression provides additional variation to identify the elasticity of anticipated production with respect to the labor.
Then we can follow the standard OP method to recover other parameters.




### Scalar Unobservable Problem: Finite-order Markov Process 

- We have assumed that anticipated shocks follow a first-order Markov process:
\begin{equation}
\omega_{jt} = g(\omega_{j, t - 1}) + \nu_{jt}.
\end{equation}
- However, it may be true that it has more than one lags, for example:
\begin{equation}
\omega_{jt} = g(\omega_{j, t - 1}, \omega_{j, t - 2}) + \nu_{jt}.
\end{equation}

- Then, we need proxies as many as the number of unobservables:
\begin{equation}
\begin{pmatrix}
i_{jt} \\ m_{jt} 
\end{pmatrix}
= \Gamma(k_{jt}, \omega_{jt}, \omega_{j, t - 1}),
\end{equation}
such that the policy function for the proxies is a bijection in $(\omega_{jt}, \omega_{j, t - 1})$.
- Then, we can have:
\begin{equation}
\omega_{jt} = \Gamma_1^{-1}(k_{jt}, i_{jt}, m_{jt}).
\end{equation}
- The reminder goes as in the standard OP method.


### Scalar Unobservable Problem: Demand and Productivity Shocks 

- There may be a demand shock $\mu_{jt}$ that also follows first-order Markov process.
- Then, the policy function depend both on $\mu_{jt}$ and $\omega_{jt}$.
- We again need proxies as many as the number of unobservable.
- Suppose that we can observe the price of the firm $p_{jt}$.
- Inverting the policy function:
\begin{equation}
\begin{pmatrix}
i_{jt}\\ p_{jt}
\end{pmatrix}
= \Gamma(k_{jt}, \omega_{jt}, \mu_{jt}).
\end{equation}
yields:
\begin{equation}
\omega_{jt} = \Gamma_1^{- 1}(k_{jt}, i_{jt}, p_{jt}).
\end{equation}
- If $\omega_{jt}$ only depends on $\omega_{j, t - 1}$ but not on $\mu_{j, t - 1}$, then the second step of the modified OP method is to estimate:
\begin{equation}
\begin{split}
y_{jt} - \hat{\beta}_l l_{jt} 
&= \beta_0 + \beta_k k_{jt}\\
& + g(\omega_{j, t - 1}) + \nu_{jt} + \eta_{jt}\\
&= \beta_0 + \beta_k k_{jt}\\
& + g(\hat{\phi}_{j, t - 1} - \beta_0 - \beta_k k_{j, t - 1}) + \nu_{jt} + \eta_{jt}.
\end{split}
\end{equation}
- It goes as in the standard OP method.
- If $\omega_{jt}$ depends both on $\omega_{j, t - 1}$ and $\mu_{j, t - 1}$, the second step regression equation will be:
\begin{equation}
\begin{split}
y_{jt} - \hat{\beta}_l l_{jt} 
&= \beta_0 + \beta_k k_{jt}\\
& + g(\omega_{j, t - 1}, \mu_{j, t - 1}) + \nu_{jt} + \eta_{jt}\\
&= \beta_0 + \beta_k k_{jt}\\
& + g(\hat{\phi}_{j, t - 1} - \beta_0 - \beta_k k_{j, t - 1}, \mu_{j, t - 1}) + \nu_{jt} + \eta_{jt}.
\end{split}
\end{equation}
- We still have to control $\mu_{j, t - 1}$ in the second step.
- Invert the policy function for $\mu_{j, t - 1}$ to get:
\begin{equation}
\mu_{j, t - 1} = \Gamma_2^{- 1}(k_{j, t - 1}, i_{j, t - 1}, p_{j, t - 1}),
\end{equation}
and plug it into the second step regression equation to get:
\begin{equation}
\begin{split}
&y_{jt} - \hat{\beta}_l l_{jt}\\
&= \beta_0 + \beta_k k_{jt}\\
&+g(\hat{\phi}_{j, t - 1} - \beta_0 - \beta_k k_{j, t - 1}, \Gamma_2^{- 1}(k_{j, t - 1}, i_{j, t - 1}, p_{j, t - 1})) + \nu_{jt} + \eta_{jt}.
\end{split}
\end{equation}
- The parameters $\beta_0$ and $\beta_k$ \textbf{cannot} be identified only with this observation, because $\Gamma_2^{-1}$ is \textbf{unknown nonparametric} function: it can mean any function of $(k_{j, t - 1}, i_{j, t - 1}, p_{j, t - 1})$.
- To estimate such a model, we jointly estimate the demand function along with the production function.
- At this point, we do not investigate it further because we have not yet learned how to estimate the demand function.
- For now just keep in mind that:
    - There has to be as many proxies as the dimension of the unobservable state variables.
    - It is okay that the unobservable state variable includes a demand shock.
    - It can be problematic when the unobservable demand shock affect the evolution of the anticipated productivity shock. 

## Cost Function Estimation

### Cost Function: Duality 

- Given a function $y = F(x)$ such that:
    - $\downarrow$ Add factor market structure.
    - $\downarrow$] Add cost minimization.
- $\rightarrow$ There exists a unique __cost function__ $c = C(y, p)$:
    - __Positivity__: positive for positive input prices and a positive.
    - __Homogeneity__: homogeneous of degree one in the input prices.
    - __Monotonicity__: increasing in the input prices and in the level of output.
    - __Concavity__: concave in the input prices.

- Given a function $c = C(y, p)$ such that:
    - __Positivity__: positive for positive input prices and a positive.
    - __Homogeneity__: homogeneous of degree one in the input prices.
    - __Monotonicity__: increasing in the input prices and in the level of output.
    - __Concavity__: concave in the input prices.
- $\rightarrow$ There exists a unique production function $F(x)$ that yields $C(y, p)$ as a solution to the cost minimization problem:
\begin{equation}
C(y, p) = \min_{x} p'x \text{   s.t.   } F(x) \ge y.
\end{equation}
- If the latter condition holds, the function $C$ is said to be __integrable__.

- It is rare that you can find a closed-form cost function of a production function.
- It makes sense to start from cost function.
- The duality ensures that there is a one-to-one mapping between a class of cost function and a class of production function.
- _If you accept competitive factor markets and cost minimization_, identifying a cost function is equivalent to identifying a production function. 

### First Order Elasticity of Cost Function

- The first and second derivatives have meanings.
- __Cost flexibility__: The elasticity of cost w.r.t. output is the reciprocal of the degree of \textbf{returns to scale}:
\begin{equation}
v_y(p, y) \equiv \frac{\partial \ln c}{\partial \ln y}|_{(p, y)} = \frac{1}{1' \frac{\ln y}{\ln x}}|_{(p, y)}.
\end{equation}
- __Cost Share__: The elasticity of cost w.r.t. input price is the cost share:
\begin{equation}
v(p, y) \equiv \frac{\partial \ln c}{\partial \ln p}|_{(p, y)} = [\frac{p_1 x_1}{c}, \cdots, \frac{p_K x_K}{c}]'|_{(p, y)} 
\end{equation}
- It is a review of production theory in microeconomics.
- An application of the envelope theorem.

### Second Order Elasticity of Cost Function

- __Cost share elasticity__:
\begin{equation}
U_{pp}(p, y) \equiv \frac{\partial^2 \ln c}{\partial \ln p^2}_{(p, y)} = \frac{\partial v}{\partial p}|_{(p, y)}
\end{equation}
- __Biases of scale__:
\begin{equation}
u_{py}(p, y) \equiv \frac{\partial^2 \ln c}{\partial \ln p \partial \ln y} = \frac{\partial v}{\partial \ln y}|_{(p, y)} = \frac{\partial v_y}{\partial \ln p}|_{(p, y)}. 
\end{equation} 
- __Elasticity of cost flexibility__:
\begin{equation}
u_{yy}(p, y) \equiv \frac{\partial^2 \ln c}{\partial \ln y^2}|_{(p, y)} = \frac{\partial v_y}{\partial \ln y}|_{(p, y)}
\end{equation}
 



### Translog Cost Function

- One of the popular specifications:
\begin{equation}
\begin{split}
\ln c &= \alpha_0 + \alpha_p' \ln p + \alpha_y \ln y + \frac{1}{2} \ln p' B_{pp} \ln p\\
& + \ln p' \beta_{py} \ln y + \frac{1}{2}\beta_{yy}(\ln y)^2.
\end{split}
\end{equation}
- It assumes that the first and second order elasticities are constant.
- A second-order (log) Taylor approximation of a general cost function.
 

### Translog Cost Function: Integrability

- Translog cost function is known to be integrable if the following conditions hold:
- __Homogeneity__: the cost shares and the cost flexibility are homogeneity of degree zero: $B_{pp}1 = 0$, $\beta_{py}'1 = 0$.
- __Cost exhaustion__: the sum of cost shares is equal to unity: $\alpha_p'1 = 1$, $B_{pp}'1 = 0$, $\beta_{py}'1 = 0$.
- __Symmetry__: the matrix of share elasticities, biases of scale, and the cost flexibility elasticity is symmetric:
\begin{equation}
\begin{pmatrix}
B_{pp} & \beta_{py}\\
\beta_{py}' & \beta_{yy}
\end{pmatrix}
=
\begin{pmatrix}
B_{pp} & \beta_{py}\\
\beta_{py}' & \beta_{yy}
\end{pmatrix}'.
\end{equation}
- __Monotonicity__: The matrix of share elasticities $B_{pp} + vv' - diag(v)$ is positive semi-definite.

### Two Approaches

1. Cost data approach.
    - Use accounting cost data.
    - It does not depend on behavioral assumption.
    - One can impose restrictions of assuming cost minimization.
    - The accounting cost data may not represent economic cost.

1. Revealed preference approach.
    - Assume decision problem for firms.
    - Assume profit maximization.
    - Reveal the costs from firm's equilibrium strategy.
    - It depends on structural assumptions.
    - It reveals the cost as perceived by firms.
 
### Cost Data Approach

- Estimating a cost function using accounting cost data is still popular among practitioners.
- The approach is somewhat getting less popular in IO researchers.
- This is why the econometric standard of this approach is not fully updated.
- I \textit{conjecture} one of the reasons for this is that IO researchers believe cost data taken from accounting information does not capture all the costs firms face.
- cf. @Byrne2015 : Propose a novel method to combine accounting cost data to estimate demand and cost function jointly without using instrumental variable approach.


### Revealed Preference Approach

- Another approach is to __reveal__ the marginal cost from firm's price/quantity setting behavior assuming it is maximizing profit.
- A parameter affects economic agent's action.
- Therefore, economic agent's action __reveals__ the information about the parameter.
- Intuition: In a competitive market, the equilibrium price is equal to the marginal cost. Therefore, the marginal cost is identified from prices.
- What if the competition is imperfect?

### Single-product Monopolist

- This approach requires researcher to specify the decision problem of a firm.
- Assume that the firm is a single-product monopolist.
- Let $D(p)$ be the demand function.
- Let $C(q)$ be the cost function.
- Temporarily, assume that we __know__ the demand function.
- We learn how to estimate demand functions in coming weeks.
- The only unknown parameter is the cost function.

- The monopolist solves:
\begin{equation}
\max_{p} D(p)p - C(D(p)).
\end{equation}
- The first-order condition w.r.t. $p$ for profit maximization is:
\begin{equation}
\begin{split}
&D(p) + pD'(p) - C'(D(p)) D'(p) = 0.\\
&\Leftrightarrow C'(D(p)) = \underbrace{\frac{D(p) + pD'(p)}{D'(p)}}_{\text{$p$ is observed and $D(p)$ is known.}}
\end{split}
\end{equation}
- This identifies the marginal cost \textit{at the equilibrium quantity}.
 

- To trace out the entire marginal cost function, you need a demand shifter $Z$ that changes the equilibrium: $D(p, Z)$.
\begin{equation}
C'(D(p, z)) = \frac{D(p, z) + pD'(p, z)}{D'(p, z)}
\end{equation}
- This identifies the marginal cost function \textit{at the quilibrium quantity when $Z = z$}.
- If the equilibrium quantities cover the domain of the marginal cost function when the demand shifter $Z$ moves around, then it identifies the entire marginal cost function.


### Unobserved Heterogeneity in the Cost Function

- Previously we did not consider any unobserved heterogeneity in the cost function.
- Now suppose that the cost function is given by:
\begin{equation}
C(q) = \tilde{C}(q) + q \epsilon + \mu,
\end{equation}
and $\epsilon$ and $\mu$ are not observed.
- Moreover, because it includes anticipated shocks, it is likely to be correlated with input decisions and hence the output.
 
- The first-order condition w.r.t. $p$ for profit maximization is:
\begin{equation}
\begin{split}
&D(p, z) + pD'(p, z) - [\tilde{C}'(D(p, z)) + \epsilon]D'(p, z) = 0.\\
&\Leftrightarrow \tilde{C}'(D(p, z))  = \frac{D(p, z) + pD'(p, z)}{D'(p,z)} - \epsilon.
\end{split}
\end{equation}
- Take the expectation conditional on $Z = z$: 
\begin{equation}
\tilde{C}'(D(p, z)) = \frac{D(p, z) + pD'(p, z)}{D'(p, z)} - \mathbb{E}\{\epsilon|Z = z\}.
\end{equation}
- If $Z$ and $\epsilon$ is independent, then the last term becomes zero and we can follow the same argument as before to trace out the marginal cost function.


### Multi-product Monopolist Case

- Demand for good $j$ is $D_j(p)$ given a price vector $p$.
- Cost for producing a vector of good $q$ is $C(q)$.
- Demand function is \textbf{known} but cost function is not known. 

- The monopolist solves:
\begin{equation}
\max_{p} \sum_{j = 1}^J p_j D_j(p) - C(D_1(p), \cdots, D_J(p)).
\end{equation}
- The first-order condition w.r.t. $p_i$ for profit maximization is:
\begin{equation}
\begin{split}
&D_i(p) + p_i \sum_{j = 1}^J \frac{\partial D_j(p)}{\partial p_i} = \sum_{j = 1}^J \frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_j} \frac{\partial D_j(p)}{\partial p_i}.\\
&= 
\begin{pmatrix}
\frac{\partial D_1(p)}{\partial p_i} & \cdots & \frac{\partial D_J(p)}{\partial p_i}
\end{pmatrix}
\begin{pmatrix}
\frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_1}\\
\vdots\\
\frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_J}
\end{pmatrix}
\end{split}
\end{equation}
 
- Summing up, the first-order condition w.r.t. $p$ is summarized as:
\begin{equation}
\begin{split}
&\begin{pmatrix}
 D_1(p) + p_1 \sum_{j = 1}^J \frac{\partial D_j(p)}{\partial p_1}\\
 \vdots\\
 D_J(p) + p_J \sum_{j = 1}^J \frac{\partial D_j(p)}{\partial p_J}
\end{pmatrix} 
=
\begin{pmatrix}
\frac{\partial D_1(p)}{\partial p_1} & \cdots & \frac{\partial D_J(p)}{\partial p_1}\\
\vdots\\
\frac{\partial D_1(p)}{\partial p_J} & \cdots & \frac{\partial D_J(p)}{\partial p_J}
\end{pmatrix}
\begin{pmatrix}
\frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_1}\\
\vdots\\
\frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_J}
\end{pmatrix}\\
&\Leftrightarrow
\begin{pmatrix}
\frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_1}\\
\vdots\\
\frac{\partial C(D_1(p), \cdots, D_J(p))}{\partial q_J}
\end{pmatrix} = 
\underbrace{\begin{pmatrix}
\frac{\partial D_1(p)}{\partial p_1} & \cdots & \frac{\partial D_J(p)}{\partial p_1}\\
\vdots\\
\frac{\partial D_1(p)}{\partial p_J} & \cdots & \frac{\partial D_J(p)}{\partial p_J}
\end{pmatrix}^{-1}  
\begin{pmatrix}
 D_1(p) + p_1 \sum_{j = 1}^J \frac{\partial D_j(p)}{\partial p_1}\\
 \vdots\\
 D_J(p) + p_J \sum_{j = 1}^J \frac{\partial D_j(p)}{\partial p_J}
\end{pmatrix}.}_{\text{$p$ is observed and $D(p)$s are known.}}
\end{split}
\end{equation} 
- Hence, the cost function is identified.
- Including unobserved heterogeneity in the cost function causes the same problem as in the previous case.
 
### Oligopoly

- There are firm $j = 1, \cdots, J$ and they sell product $j = 1, \cdots, J$, that is, firm = product (for simplicity). 
- Consider a price setting game. When the price vector is $p$, demand for product $j$ is given by $D_j(p)$.
- The cost function for firm $j$ is $C_j(q_j)$.

- Given other firms' price $p_{-j}$, firm $j$ solves:
\begin{equation}
\max_{p_j} D_j(p) p_j - C_j(D_j(p)).
\end{equation}
- The first-order condition w.r.t. $p_j$ for profit maximization is:
\begin{equation}
\begin{split}
&D_j(p) + \frac{\partial D_j(p)}{\partial p_j} p_j = \frac{\partial C_j(D_j(p))}{\partial q_j} \frac{\partial D_j(p)}{\partial p_j}.\\
&\frac{\partial C_j(D_j(p))}{\partial q_j} = \underbrace{\frac{\partial D_j(p)}{\partial p_j}^{-1}[D_j(p) + \frac{\partial D_j(p)}{\partial p_j} p_j ]}_{\text{$p$ is observed and $D_j(p)$ is known}}.
\end{split}
\end{equation}
- In Nash equilibrium, these equations jointly hold for all firms $j = 1, \cdots, J$.]
- Including unobserved heterogeneity in the cost function causes the same problem as in the previous case.
 
 
