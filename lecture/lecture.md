--- 
title: "ECON 6120I Topics in Empirical Industrial Organization"
author: "Kohei Kawaguchi"
date: 'Last updated: 2019-01-29'
output:
  pdf_document: default
  html_document:
    df_print: paged
bibliography:
- library.bib
- packages.bib
description: This is a minimal example of using the bookdown package to write a book.
  The output format for this example is bookdown::gitbook.
documentclass: book
highlight: espresso
link-citations: yes
csl: plain.csl
site: bookdown::bookdown_site
biblio-style: plain
---

# Syllabus

## Instructor Information

- Instructor:
    - Name: Kohei Kawaguchi.
    - Office: LSK6070, Monday 11:00-12:00.
    - Email: kkawaguchi@ust.hk.
    

## General Information

### Class Time

- Date: Monday.
- Time: 13:30-17:20.
- Venue: CYTG001.


### Description

- This is a PhD-level course for empirical industrial organization. This course covers various econometric methods used in industrial organization that is often referred to as the structural estimation approach. These methods have been gradually developed since 1980s in parallel with the modernization of industrial organization based on the game theory and now widely applied in antitrust policy, business strategy, and neighboring fields such as labor economics and international economics.

- This course presumes a good understanding of PhD-level microeconomics and microeconometrics. Participants are expected to understand at least UG-level industrial organization. This course requires participants to write programs mostly in R and sometimes in C++ to implement various econometric methods. In particular, all assignments will involve such a non-trivial programming task. Even though the understanding of these programming languages is not a prerequisite, a sharp learning curve will be required. Some experience in other programming languages will help. Audit without a credit is not admitted for students.


### Expectation and Goals

- The goal of this course is to learn and practice econometric methods for empirical industrial organization. The lecture covers the econometric methods that have been developed between 80s and 00s to estimate primitive parameters governing imperfect competition among firms,  such as production and cost function estimation, demand function estimation, merger simulation, entry and exit analysis, and dynamic decision models. The lecture also covers various new methods to recover model primitives in certain mechanisms such as auction, matching, network, and bargaining. The emphasis is put on the former group of methods, because they are the basis for other new methods. Participants will not only understand the theoretical background of the methods but also become able to implement these methods from scratches by writing their own programs. I will briefly discuss the latter class of new methods through reading recent papers. The participants will become able to understand and use these new methods.  

## Required Environment

- Participants should bring their laptop to the class. We have enough extension codes for students. The laptop should have sufficient RAM (at least $\ge$ 8GB, $\ge$ 16GB is recommended) and CPU power (at least Core i5 grade, Core i7 grade is recommended). Participants are fully responsible for their hardware issues. Operating System can be arbitrary. The instructor mainly uses OSX High Siera with iMac (Retina 5K, 27-inch, Late 2015) and Macbook Pro (TBA).
- Please install the following software by the first lecture. Technical issues related to the installment should be resolved by yourself, because it depends on your local environment. If you had an error, copy and paste the error message on a search engine, and find a solution. This solves 99.9% of the problems.
    - R: [https://www.r-project.org/](https://www.r-project.org/)
    - RStudio: [https://www.rstudio.com/](https://www.rstudio.com/)
    - LaTeX: 
        - MixTex [https://miktex.org/](https://miktex.org/)
        - TeXLive [https://www.tug.org/texlive/](https://www.tug.org/texlive/)
        - MacTeX [http://www.tug.org/mactex/](http://www.tug.org/mactex/)



## Evaluation

- Assignments (80): In total 8 homework are assigned. Each homework involves the implementation of the methods covered in the class. Each homework has 10 points. The working hour for each homework will be around 10-20 hours.
- Participation (10): Every time a participant asks a question in the class, the participant gets one point, up to 10 points. The participant who asked the question writes the name, ID number, his/her question, and my answer in a discussion board on the course website to claim a point.
- Referee report (10): Toward the end of the semester, a paper in industrial organization is randomly assigned to each participant. Each participant writes a critical referee report of the assigned paper in A4 2 pages that consists of the summary, contribution, strong and weak points of the paper.
- Grading is based on the absolute scores: A+ with more than 80 points, A with more than 70 points, A- with more than 60 points, B+ with more than 50 points, B with more than 40 points, B- with more than 30 points and C otherwise. 

## Academic Integrity

Without academic integrity, there is no serious learning. Thus you are expected to hold the highest standard of academic integrity in the course. You are encouraged to study and do homework in groups. However, no cheating, plagiarism will be tolerated. Anyone caught
cheating, plagiarism will fail the course. Please make sure adhere to the HKUST Academic
Honor Code at all time (see http://www.ust.hk/vpaao/integrity/).


## Schedule

| Date | Topic 
|------|-------|------------|
| Feb 4 | Introduction to structural estimation, R and RStudio |
| Feb 11 | Production function estimation I|
| Feb 18 | Production function estimation II|
| Feb 25 | Demand function estimation I|
| Mar 4 | Demand function estimation II|
| Mar 11 | Merger Analysis |
| Mar 18 | Entry and Exit |
| Mar 25 | Single-Agent Dynamics I |
| Apr 1 | Single-Agent Dynamics II, I change date due to my business trip |
| Apr 8 | Dynamic Game I |
| Apr 15 | Dynamic Game II |
| Apr 22 | Canceled because of Easter Monday |
| Apr 29 | Auction |
| May 6 | Other Mechanisms |

## Course Materials

### R and RStudio

- Grolemund, G., 2014, Hands-On Programming with R, O'Reilly.
    - Free online version is available: [https://rstudio-education.github.io/hopr/](https://rstudio-education.github.io/hopr/).
- Wickham, H., & Grolemund, G., 2017, R for Data Science, O'Reilly.
    - Free online version is available: [https://r4ds.had.co.nz/](https://r4ds.had.co.nz/).
- Boswell, D., & Foucher, T., 2011, The Art of Readable Code: Simple and Practical Techniques for Writing Better Code, O'Reilly.

### Handbook Chapters

- Ackerberg, D., Benkard, C., Berry, S., & Pakes, A. (2007). "Econometric tools for analyzing market outcomes". Handbook of econometrics, 6, 4171-4276.
- Athey, S., & Haile, P. A. (2007). "Nonparametric approaches to auctions". Handbook of
Econometrics, 6, 3847-3965.
- Berry, S., & Reiss, P. (2007). "Empirical models of entry and market structure". Handbook of Industrial Organization, 3, 1845-1886.
- Bresnahan, T. F. (1989). "Empirical studies of industries with market power". Handbook of
Industrial Organization, 2, 1011-1057.
- Hendricks, K., & Porter, R. H. (2007). "An empirical perspective on auctions". Handbook of
Industrial Organization, 3, 2073-2143.
- Matzkin, R. L. (2007). "Nonparametric identification". Handbook of Econometrics, 6, 5307-5368.
- Newey, W. K., & McFadden, D. (1994). "Large sample estimation and hypothesis testing". Handbook of Econometrics, 4, 2111-2245.
- Reiss, P. C., & Wolak, F. A. (2007). "Structural econometric modeling: Rationales and examples from industrial organization". Handbook of Econometrics, 6, 4277-4415.

### Books

- Train, K. E. (2009). Discrete Choice Methods with Simulation, Cambridge university press.
- Davis, P., & Garces, E. (2010). Quantitative Techniques for Competition and Antitrust Analysis, Princeton University Press.
- Tirole, J. (1988). The Theory of Industrial Organization, The MIT Press.

### Papers

- The list of important papers are occasionally given during the course.





<!--chapter:end:index.Rmd-->

# Introduction {#intro}

Change

You can label chapter and section titles using `{#label}` after them, e.g., we can reference Chapter \@ref(intro). If you do not manually label them, there will be automatic labels anyway, e.g., Chapter \@ref(methods).

Figures and tables with captions will be placed in `figure` and `table` environments, respectively.


```r
par(mar = c(4, 4, .1, .1))
plot(pressure, type = 'b', pch = 19)
```

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{01-intro_files/figure-latex/nice-fig-1} 

}

\caption{Here is a nice figure!}(\#fig:nice-fig)
\end{figure}

Reference a figure by its code chunk label with the `fig:` prefix, e.g., see Figure \@ref(fig:nice-fig). Similarly, you can reference tables generated from `knitr::kable()`, e.g., see Table \@ref(tab:nice-tab).


```r
knitr::kable(
  head(iris, 20), caption = 'Here is a nice table!',
  booktabs = TRUE
)
```

\begin{table}

\caption{(\#tab:nice-tab)Here is a nice table!}
\centering
\begin{tabular}[t]{rrrrl}
\toprule
Sepal.Length & Sepal.Width & Petal.Length & Petal.Width & Species\\
\midrule
5.1 & 3.5 & 1.4 & 0.2 & setosa\\
4.9 & 3.0 & 1.4 & 0.2 & setosa\\
4.7 & 3.2 & 1.3 & 0.2 & setosa\\
4.6 & 3.1 & 1.5 & 0.2 & setosa\\
5.0 & 3.6 & 1.4 & 0.2 & setosa\\
\addlinespace
5.4 & 3.9 & 1.7 & 0.4 & setosa\\
4.6 & 3.4 & 1.4 & 0.3 & setosa\\
5.0 & 3.4 & 1.5 & 0.2 & setosa\\
4.4 & 2.9 & 1.4 & 0.2 & setosa\\
4.9 & 3.1 & 1.5 & 0.1 & setosa\\
\addlinespace
5.4 & 3.7 & 1.5 & 0.2 & setosa\\
4.8 & 3.4 & 1.6 & 0.2 & setosa\\
4.8 & 3.0 & 1.4 & 0.1 & setosa\\
4.3 & 3.0 & 1.1 & 0.1 & setosa\\
5.8 & 4.0 & 1.2 & 0.2 & setosa\\
\addlinespace
5.7 & 4.4 & 1.5 & 0.4 & setosa\\
5.4 & 3.9 & 1.3 & 0.4 & setosa\\
5.1 & 3.5 & 1.4 & 0.3 & setosa\\
5.7 & 3.8 & 1.7 & 0.3 & setosa\\
5.1 & 3.8 & 1.5 & 0.3 & setosa\\
\bottomrule
\end{tabular}
\end{table}

You can write citations, too. For example, we are using the **bookdown** package [@R-bookdown] in this sample book, which was built on top of R Markdown and **knitr**.

<!--chapter:end:01-intro.Rmd-->

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
 
 

<!--chapter:end:02-production.Rmd-->

# Demand Function Estimation {#demand}

## Continuous Function Approach

### Utility Function Estimation

- We cannot observe the output of utility function, _utility_, while we could observe the output of production function, _production_.
- We can at most identify a demand function, the relationship between choice sets and demand or other related functions such as an expenditure function. 
- Under the assumption that the observed demand function is a solution to a utility maximization problem, we may be able to recover some information of the underlying utility function.




### Starting from a Utility Function: Difficulty

- It is rather a special case that we can derive a closed form solution to a utility maximization problem.
- It is often the case that we can only have first-order conditions:
\begin{equation}
\frac{\partial U(q)}{\partial q_i} = \lambda p_i, i = 1, \cdots, J.
\end{equation}
- We can use the first-order conditions as moment conditions for identification.
- The derivation of a demand function from the identified utility function in general require a numerical simulation, which can be bothering.




### Duality between Utility and Expenditure Functions

- As well as the duality between production and cost functions, we have the same duality theorem for utility and expenditure functions.
- There is a one-to-one mapping between a class of utility functions and a class of expenditure functions.
- \textit{Therefore, it is okay to start from an expenditure function}.
- It is rare that we can recover the utility function associated with an expenditure function in a closed form. But it is not often required for analysis.
- \textit{In addition, by Shepard's lemma, the derivative of the expenditure function with respect to the price is a (Hicksian) demand function.}




### Starting from an Expenditure Function

- Let $p$ be the price vector and $u$ be the target utility level.
- Let $u(q)$ be a utility function.
- An expenditure function associated with the utility function is defined by:
\begin{equation}
e(u, p) = \min_{q} p'q, u(q) \ge u.
\end{equation}
- Let $x$ be the total expenditure such that:
\begin{equation}
x = e(u, p).
\end{equation}
- We can start from specifying this function.




### Deriving Other Functions

- It is easy to derive other functions from an expenditure function.


- \textbf{Indirect utility function}: invert the expenditure function to get:
\begin{equation}
u = e^{-1}(p, x) \equiv v(p, x).
\end{equation}
- \textbf{Hicksian demand function}: apply Shepard's lemma: 
\begin{equation}
q_i = \frac{\partial e(u, p)}{\partial p_i} \equiv h_i(u, p).
\end{equation}
- \textbf{Marshallian demand function}: insert Hicksian demand function to the expenditure function:
\begin{equation}
q_i = h_i(v(p, x), p) \equiv d_i(p, x).
\end{equation}




### Starting from an Indirect Utility Function

- It is almost equivalent to start from an indirect utility function.
- An indirect utility function with the utility function is defined by:
\begin{equation}
v(p, x) \equiv \max_{q} u(q), p'q \le x.
\end{equation}
- We can derive Marshallian demand function by Roy's identity:
\begin{equation}
q_i = \frac{- \partial v(p, x)/\partial p_i}{\partial v(p, x)/\partial x} \equiv d_i(p, x).
\end{equation}




### Expenditure Share Equation

- Let's start from an expenditure function $e(p, x)$. 
- By Shepard's lemma, we have:
\begin{equation}
\frac{\partial \ln e(u, p)}{\partial \ln p_i} = \frac{\partial e(u, p)}{\partial p_i} \frac{p_i}{e(u, p)} = \frac{p_i q_i}{x} \equiv w_i.
\end{equation}
- We call this an expenditure share equation.




### Almost Ideal Demand System (AIDS)

- Deaton and Muellbauer (1980). 
- Consider an expenditure function that satisfies the following conditions:

- It allows aggregation (this is no longer that important).
- It gives an arbitrary first-order approximation to any demand system.
- It can satisfy the restrictions of utility maximization.
- It can be used to test the restrictions of utility maximization.





### PIGLOG Class

- PIGLOG (price-independent generalized logarithmic) class (Muellbauar 1976).
\begin{equation}
\ln e(u, p) = (1 - u) \ln a(p) + u\ln b(p),
\end{equation}
where $a(p)$ and $b(p)$ are arbitrary linear homogeneous concave functions. 
- Consider households that differ in total income.
- PIGLOC ensures that the aggregate demand can be written in the same form where the total income is replaced with the sum of household total income.




### Specify the Detail 

- It gives an arbitrary first-order approximation to any demand system.
- $\to$ The derivatives should be given free parameters.
- In AIDS, we take:
\begin{equation}
\begin{split}
\ln a(p) &\equiv a_0 + \sum_{k} \alpha_k \ln p_k + \frac{1}{2}\sum_{k} \sum_{j} \gamma_{kj}^* \ln p_k \ln p_j\\
\ln b(p) &\equiv \ln a(p) + \beta_0  \prod_{k} p_k^{\beta_k}.
\end{split}
\end{equation}




### Derive the Share Equation I

- By Roy's identify, we can derive the associated share equation:
\begin{equation}
w_i \equiv \frac{\partial \ln e(u, p)}{\partial \ln p_i} = \alpha_i + \sum_{j} \gamma_{ij} + \beta_i u \beta_0 \prod_{k} p_k^{\beta_k},
\end{equation}
where
\begin{equation}
\gamma_{ij} = \frac{1}{2}(\gamma_{ij}^* + \gamma_{ji}^*).
\end{equation}




### Derive the Share Equation II

- Insert indirect utility function $u = v(p, x)$ to this to get:
\begin{equation}
w_i = \alpha_i + \sum_{j} \gamma_{ij} \ln p_j + \beta_i \ln \frac{x}{P},
\end{equation} 
where
\begin{equation}
\ln P \equiv  \alpha_0 + \sum_{k} \alpha_k \ln p_k + \frac{1}{2} \sum_{j} \sum_{k} \gamma_{kj} \ln p_k \ln p_j.
\end{equation}
- $P$ is a price index associated with the given preference.
- In Stone (1953), it becomes $\ln P = \sum_{j} w_j \ln p_j$. It was used as an approximation.




### Specify the Detail II

- It can satisfy the restrictions of utility maximization.
- It can be used to test the restrictions of utility maximization.
- $\sum_{j} w_j = 1$:
\begin{equation}
\sum_{j} \alpha_j = 1, \sum_{j} \gamma_{jk} = 0, \sum_{j} \beta_j = 0.
\end{equation}
- $e(u, p)$ is linear homogeneous in $p$:
\begin{equation}
\sum_{j} \gamma_{ij} = 0.
\end{equation}
- Symmetry:
\begin{equation}
\gamma_{ij} = \gamma_{ji}.
\end{equation}




### Estimation

- \textit{If we use aggregate data}, the error term is correlated with the price vector.
- Therefore, we need at least as many instrumental variables as the dimension of the price vector.

- In 80s, people was not careful enough about this problem.

- With valid instrumental variables, we can estimate the model with GMM.
- The number of elasticity parameters $\gamma_{ij}$ grow at the order of $J^2$ with the number of consumption goods $J$.





### From Product Space Approach to Characteristics Space Approach

- The framework up to here is called \textbf{product space approach} because the utility has been defined over a product space.
- When there are $J$ goods, there are $J^2$ parameters for prices.

- One way to resolve this issue is to introduce a priori knowledge about the preference.
- For example, introduce a priori segmentation with separability.

- It is hard to evaluate the effect of introducing new product.

- Again, we have to a priori decide which segment/product is similar to the new product.

- This leads us to the \textbf{characteristics space approach}.



### From Continuous Choice Approach to Discrete Choice Approach

- In the standard consumption problem, a consumer is supposed to choose a consumption bundle given a price vector.
- A consumption bundle in a period, in reality, is generated from a complicated shopping behaviors during the period.
- The most primitive decision problem is a \textbf{which to buy} problem: 

- Coca Cola and Pepsi Cola are on the shelf. The consumer buys either of them or buys nothing.

- The consumption bundle of a period is obtained by integrating these primitive choices across shopping occasions.
- This leads us to the \textbf{discrete choice approach}.





## Discrete Choice Approach

### Discrete Choice Approach

- Let $u(x, z_i)$ be the utility of a consumer over $J + 1$ dimensional consumption bundle $x$ characterized by consumer characteristics $z_i$.
- The consumer solves:
\begin{equation}
V(p, y_i; z_i) = \max_{x \in X}u(x, z_i), \text{   s.t.   } p'x \le y_i.
\end{equation}
- Alternative $0$ is an \textbf{outside good}.
- Normalize $p_0 = 1$.
- We call alternatives $j = 1, \cdots, J$ \textbf{inside goods}.
- The choice space is restricted on:
\begin{equation}
\begin{split}
X = \{x:& x_0 \in [0, M], x_j \in \{0, 1\}, j = 1, \cdots, J,\\
& x_j x_k = 0, \forall j \neq k, j, k > 0, M < \infty\}.
\end{split}
\end{equation}




### Discrete Choice Approach

- The budget constraint reduces to:
\begin{equation}
\begin{cases}
x_0 + p_j x_j = y &\text{   if   } x_j = 1, j > 0\\
x_0 = y &\text{   otherwise}.
\end{cases}
\end{equation}
- Hence, 
\begin{equation}
x_0 = y - \sum_{j = 1}^J p_j x_j.
\end{equation}




### Discrete Choice Approach

- The utility maximization problem can be written as:
\begin{equation}
V(p, y_i; z_i) = \max_{j = 0, 1, \cdots, j}  v_j(p, y_i; z_i),
\end{equation}
where
\begin{equation}
\begin{split}
&v_j(p, y_i; z_i)\\
& =
\begin{cases}
u(y_i - p_j, 0, \cdots, \underbrace{1}_{x_j}, \cdots, 0; z_i) &\text{   if  }j > 0,\\
u(y_i, 0, \cdots, 0; z_i) &\text{   if   }j = 0,
\end{cases}
\end{split}
\end{equation}
is called the \textbf{choice-specific indirect utility}.




### Characteristics Space Approach

- Preference is defined over the characteristics of alternatives, $w_j$:

- Car: vehicle, engine power, model-year, car maker, etc.
- PC: CPU power, number of cores, memory, HDD volume, etc.

- The choice-specific indirect utility is a function of the characteristics of the alternative:
\begin{equation}
\begin{split}
v_j(p, y_i; z_i) &=u(y_i - p_j, 0, \cdots, \underbrace{1}_{x_j}, \cdots, 0; z_i)\\
&= u^*(y_i - p_j, w_j; z_i)\\
&\equiv v(p, w_j, y_i; z_i).
\end{split}
\end{equation}




### Characteristics Space Approach

- Characteristics space approach resolves the problem of product space approach:
- The number of parameters depend on the possible dimensions of characteristics that consumers will take care, which do not grow as rapidly as the product space approach when the number of products increases.
- The preference over a new product can be evaluated as long as the characteristics of the new products fall in the domain with a known preference.




### Weak Separability and Income Effect

- We usually focus on a particular product category such as cars, PCs, cereals, detergents, and so on.
- Assume that the preference is separable between the category in question and other categories.
- Then, call the category in question inside goods.
- The outside good captures the income effect of the choice in this category.




### Weak Separability and Income Effect 

- Thus, how the preference for the outside good is modeled determines how the individual income affects the choice.
\begin{equation}
\begin{split}
&u^*(y_i - p_j, w_j; z_i) = u^{**}(w_j; z_i) + \alpha(y_i - p_j).\\
&u^*(y_i - p_j, w_j; z_i) = u^{**}(w_j; z_i) + \alpha \ln (y_i - p_j).
\end{split}
\end{equation}
- In the first example, the income level does not affect the choice because the term $\alpha y_i$ is common and constant across choices (there is no income effect).
- We often do not observe income of a consumer, $y_i$. 




### Utility Function Normalization

 - The \textbf{location} of utility function is often normalized by setting:
\begin{equation}
u(y^*, 0, \cdots, 0; z^*) = 0,
\end{equation}
for certain choice of $(y^*, z^*)$.
- We will also introduce a normalization for the \textbf{scale} of utility function later.
 



### Aggregation of the Individual Demand

- Let $x(p, w, y_i; z_i) = \{x_j(p, w_j, y_i; z_i)\}_{j = 0, \cdots, J}$ be the demand function of consumer $i$, that is:
\begin{equation}
x_j(p, w_j, y_i; z_i) = 1 \Leftrightarrow j = \text{argmax}_{j = 0, 1, \cdots, j}  v(p, w_j, y_i; z_i).
\end{equation}
- Let $f(y, z)$ be the joint distribution of the income and parameters.
- The aggregate demand for good $j$ is:
\begin{equation}
D_j(p, w_j; f) \equiv N \int  x_j(p, w_j, y; z) f(y, z) dy dz,
\end{equation}
where $N$ is the population.




### Horizontal Product Differentiation

- We can proceed the analysis by specifying  $v(p, w_j, y_i; z_i)$.
- There are two convenience stores $j = 1, 2$ on a street $[0, 1]$.
- Let $z_i = L_i$, the location of consumer $i$ and $w_j = L_j$, the location of the choice on a street $[0, 1]$ with $L_1 < L_2$.
- A consumer has a preference such that:
\begin{equation}
v_{ij} \equiv v(p, w_j, y_i; z_i) \equiv s - t |L_i - L_j| - p_j,
\end{equation}
where $d(\cdot, \cdot)$ is a Euclid distance.
- This is an example of \textbf{horizontal product differentiation}, i.e., consumers do not agree on the ranking of the choices.




### Horizontal Product Differentiation

- Suppose that the prices are low enough that entire consumers on the street are willing to buy either from the stores.
- Consumer $i$ buys from store $1$ if and only if:
\begin{equation}
\begin{split}
&v(p, w_1, y_i; z_i) \ge v(p, w_2, y_i; z_i)\\
&\Leftrightarrow s - t |L_i - L_1| - p_1 \ge s - t |L_i - L_2|- p_2\\
&\Leftrightarrow L_i \le \frac{p_2 - p_1}{2 t} + \frac{L_1 + L_2}{2} \equiv \overline{L}_1(p_1, p_2).
\end{split}
\end{equation}
- Let $f(L_i)$ be $U[0, 1]$. Then, the aggregate demand for store 1 is:
\begin{equation}
\begin{split}
D_1(p, L_1, L_2) = N \int_{0}^{\overline{L}_1(p_1, p_2)} d L_i = N\overline{L}_1(p_1, p_2).
\end{split}
\end{equation}




### Vertical Product Differentiation

- There are $J$ goods and consumer $i$ has a utility such as:
\begin{equation}
v_{ij} \equiv v(p, w_j, y_i; z_i) = z_i w_j - p_j,
\end{equation}
where $w_j$ is a quality of product $j$ and $z_i$ is the consumer's willingness to pay for the quality with $w_j < w_{j + 1}$.
- Consumers' problem is:
\begin{equation}
\max\{0, z_i w_1 - p_1, \cdots, z_i w_J - p_J \}.
\end{equation}
- This is an example of \textbf{vertical product differentiation}, i.e., consumers agree on the ranking of the choices.




### Vertical Product Differentiation

- Consumer $i$ prefers good $j + 1$ to good $j$ if and only if:
\begin{equation}
\begin{split}
&v(p, w_{j + 1}, y_i; z_i) \ge v(p, w_j, y_i; z_i)\\
&\Leftrightarrow z_i w_{j + 1} - p_{j + 1} \ge z_i w_j - p_j\\
&\Leftrightarrow z_i \ge \frac{p_{j + 1} - p_j}{w_{j + 1} - w_j} \equiv \Delta_j.
\end{split}
\end{equation}
- So consumer $i$ purchases good $j$ if and only if $z_i \in [\Delta_{j - 1}, \Delta_j)$ and buys nothing if:
\begin{equation}
z_i \le \Delta_0 \equiv \min\{p_1/w_1, \cdots p_J/w_J\}.
\end{equation}
- Letting $F(z)$ be the distribution function of $z$, the aggregate demand for good $j$ is:
\begin{equation}
D_j(p, w, z) = N[F(\Delta_{j}) - F(\Delta_{j - 1})].
\end{equation}




### Econometric Models

- So far there was no econometrics.
- Next we define what are observable and unobservable, and what are known and unknown.
- Then consider how to identify and estimate the model.




### Multinomial Logit Model: Preference Shock

- Suppose that there is some unobservable component in consumer characteristics. 
- In reality, consumers choice change somewhat randomly.
- Let's capture such a \textbf{preference shock} by consider the following model:
\begin{equation}
v(p, w_j, y_i; z_i) \equiv v(p, w_j, y_i) + \epsilon_{ij},
\end{equation}
where I assumed that there is no other $z_i$ for exposition simplicity, with some random vector:
\begin{equation}
\epsilon_i \equiv (\epsilon_{i0}, \cdots, \epsilon_{iJ})' \sim G.
\end{equation}
- At this point, $G$ can be any distribution and the shocks can be dependent across $j$ within $i$.




### Multinomial Logit Model: Distributional Assumption 

- Now assume the followings:

- $\epsilon_{ij}$ are independent across $j$: $G(\epsilon_i) = \prod_{j = 0, \cdots, J} G_j(\epsilon_{ij})$.
- $\epsilon_{ij}$ are identical across $j$: $G_j(\epsilon_{ij}) = \overline{G}(\epsilon_{ij})$.
- $\overline{G}$ is a type-I extreme value.

- $\rightarrow$ The density $g(\epsilon_{ij}) = \exp[-\exp(-\epsilon_{ij}) - \epsilon_{ij}]$.


- This is called the (homoskedastic) \textbf{multinomial logit model}.
- Setting the variance of $\epsilon_{ij}$ at 1 for some $j$ is a \textbf{scale normalization}. There is no obvious ``unit'' in preference.




### Multinomial Logit Model: Choice Probability

- The \textbf{choice probability} of consumer $i$ of good $j$ is:
\begin{equation}
\begin{split}
s_{j}(p, w, y_i) & \equiv \mathbb{P}\{j = \text{argmax}_{k = 0, 1, \cdots, J} v(p, w_k, y_i) + \epsilon_{ik}  \}\\
&=\mathbb{P}\{v(p, w_j, y_i) -  v(p, w_k, y_i) \ge \epsilon_{ik} - \epsilon_{ij}, \forall k \neq j\}\\
& = \text{...after some algebra...}\\
&= \frac{\exp[v(p, w_j, y_i) ]}{\sum_{k = 0}^J \exp[v(p, w_k, y_i)] }.
\end{split}
\end{equation}
- For example, if:
\begin{equation}
v(p, w_k, y_i) = \beta'w_k - \alpha \ln(y_i - p_k),
\end{equation}
then, we have:
\begin{equation}
s_{j}(p, w, y_i) = \frac{\exp[\beta'w_j - \alpha \ln(y_i - p_j) ]}{\sum_{k = 0}^J \exp[\beta'w_k - \alpha \ln (y_i - p_k) ]}.
\end{equation}




### Multinomial Logit Model: Inclusive Value

- The expected utility for consumer $i$ before the preference shocks are drawn under multinomial logit model is given by:
\begin{equation}
\begin{split}
&\mathbb{E}\{\max_{j = 0, \cdots, J} v(p, w_j, y_i) + \epsilon_{ij}\} \\
&= \text{   ...after some algebra...}\\
&= \ln \Bigg\{\sum_{j = 0}^J \exp[v(p, w_j, y_i)] \Bigg\} + constant.
\end{split} 
\end{equation} 
- This is sometimes called the \textbf{inclusive value} of the choice set.




### Maximum Likelihood Estimation of Multinomial Logit Model

- Suppose we observe a sequence of income $y_i$, choice $x_{i}$, product characteristics $w_j$ and price $p_j$.
- $x_i = (x_{i0}, \cdots, x_{iJ})'$ and $x_{ij} = 1$ if $j$ is chosen and $0$ otherwise.
- The parameter of interest is the mean indirect utility function $v$.
- Then the log likelihood of $\{x_i\}_{i = 1}^N$ conditional on $\{y_i\}_{i = 1}^N$ and $\{w_j,p_j\}_{j = 1}^J$ is:
\begin{equation}
\begin{split}
l(v; x, y, w) &= \sum_{i = 1}^N \ln \mathbb{P}\{x_i = x(p, w_j, y_i)|p, w_j, y_i \}\\
& = \sum_{i = 1}^N \log \Bigg\{ \prod_{j = 0}^{J} s_{j}(p, w, y_i)^{x_{ij}} \Bigg\}.
\end{split}
\end{equation}





### Nonlinear Least Square Estimation of Multinomial Logit Model

- The multinomial logit model can be estimated by nonlinear least square method as well.
- This is particularly important when we only have an aggregate data instead of choice data.
- Note that:
\begin{equation}
\begin{split}
\ln s_{j}(p, w, y_i)  &= \ln \Bigg\{ \frac{\exp[v(p, w_j, y_i) ]}{\sum_{k = 0}^J \exp[v(p, w_k, y_i)] }  \Bigg\}\\
&= v(p, w_j, y_i) - \ln\Bigg\{ \sum_{k = 0}^J \exp[v(p, w_k, y_i)]  \Bigg\}.
\end{split}
\end{equation}




### Nonlinear Least Square Estimation of Multinomial Logit Model

- Moreover, because of the location normalization of the utility function,
\begin{equation}
s_{0}(p, w, y_i) = \frac{1}{\sum_{k = 0}^J \exp[v(p, w_k, y_i)] }.
\end{equation}
- Hence,
\begin{equation}
\ln s_{j}(p, w, y_i) - \ln s_{0}(p, w, y_i) = v(p, w_j, y_i).
\end{equation}




### Nonlinear Least Square Estimation of Multinomial Logit Model 

- Suppose that conditional on $y_i$, the observed choice probabilities are $s_{j}(y_i)$.
- In practice, it will be estimated on a discretized income $\{y_1, \cdots, y_M\}$.
- Then, we can estimate the parameter by NLLS such that:
\begin{equation}
\min \sum_{m = 1}^M \sum_{j = 1}^J \{\ln[s_{j}(y_m)/s_{0}(y_m)] - v(p, w_j, y_m)\}^2.
\end{equation} 
- If $v$ is linear in parameter, it is the OLS.




### Nonlinear Least Square Estimation of Multinomial Logit Model

- Suppose that there are $t = 1, \cdots, T$ markets.
- The average income level is $y_t$ in market $t$.
- The average price level is $p_i$ in market $t$.
- It is often assumed that the market share of good $j$ in market $t$ is given by:
\begin{equation}
s_{j}(y_t) = \frac{\exp[v(p_t, w_j, y_t) ]}{\sum_{k = 0}^J \exp[v(p_t, w_k, y_t)] },
\end{equation}
and the parameter is estimated by:
\begin{equation}
\min \sum_{t = 1}^T \sum_{j = 1}^J \{\ln[s_{jt}/s_{0t}] - v(p_t, w_j, y_t)\}^2,
\end{equation}
where $s_{jt}$ is the observed choice share of product $j$ in market $t$. 




### IIA Problem

- Multinomial logit problem is intuitive and easy to implement.
- However, there are several problems in the model.
- The most important problem is the \textbf{independence of irrelevant alternatives (IIA)} problem. 
- Notice that:
\begin{equation}
\frac{s_{j}(p, w, y_i)}{s_{k}(p, w, y_i)} = \frac{\exp[v(p, w_j, y_i)]}{\exp[v(p, w_k, y_i)]}.
\end{equation}
- \textit{The ratio of choice probabilities between two alternatives depend only on the mean indirect utility of these two alternatives and independent of irrelevant alternatives}.




### Blue Bus and Red Bus Problem

- Why is this problematic?
- Suppose that you can go to a town by bus or by train.
- Half of commuters use a bus and the other half use a train. 
- The existing bus was blue. Now, the county introduced a red bus, which is identical to the existing blue bus.
- No one take care of the color of bus. So the mean indirect utility of blue bus and red bus are equal.
- What is the new share across blue bus, red bus, and train?
- IIA $\to$ share of blue bus = share of train.
- Buses are identical $\to$ share of blue bus = share of red bus.
- Therefore, shares have to be 1/3, respectively.
- But shouldn't it be that train keeps half share and bus have half share in total?




### Restrictive Price Elasticity

- IIA property restrict price elasticities in an unfavorable manner.
- This is a serious problem because the main purpose for us to estimate demand functions is to identify the price elasticity.
- Let $v(p, w_j, y_i) = \beta'w_j - \alpha p_j$. Then, we have:
\begin{equation}
e_{jk} =
\begin{cases}
-\alpha p_{j} (1 - s_{j}(p, w, y_i)) &\text{   if   } k = j\\
\alpha p_{k} s_{k}(p, w, y_i) &\text{   if   } k \neq j.
\end{cases}
\end{equation}
- The price elasticity is completely determined by the existing choice probabilities of the relevant alternatives.




### Restrictive Price Elasticity

- Suppose that there are coca cola, pepsi cola, and a coffee.
- The shares were 1/2, 1/6, 1/3, respectively.
- Suppose that the price of coca cola increased.
- We expect that they instead purchase pepsi cola because pepsi cola is more similar to coca cola than coffee.
- However, according to the previous result, twice more consumers substitute to coffee rather than to pepsi cola.




### Monotonic Inclusive Value

- Suppose that there is a good whose mean indirect utility is $v$.
- The inclusive value for this choice set is $\ln[1 + \exp(v)]$.
- Suppose that we put $J$ same goods on the shelf and consumer can choose any of them.
- The inclusive value is $\ln[1 + J \exp(v)]$.
- We just added the same goods. But the expected utility of consumer increases monotonically in the number of alternatives.
 



### The Source of the Problem

- All of these problems are the different side of the same coin. 
- \textit{The source of the problem is that there is no correlation in the preference shock across products}.
- When the preference shock to coca cola is high, the preference shock to pepsi cola should be high, while the preference shock to coffee should be relatively independent.
- Because the expected value of the maximum of the preference shocks increases according to the number of alternatives, the inclusive value becomes increasing in the number of alternatives. 
- However, the preference shocks should be the same for the same good. Then, the the expected value of the maximum of the preference shock does not increase even if we add the same products on the shelf.




### To Resolve the Problem

- Therefore, the preference shock should be such that: preference shocks between two alternative should be more correlated when they are closer in the characteristics space.
- So we have to allow the covariance matrix of the preference shock to be free parameters.
- If we allow flexible covariance matrix, the curse of dimensionality in the number of alternatives returns: The dimensionality of the covariance matrix is $J^2$.
- Another way is to remove $\epsilon_{ij}$: it is called a \textbf{pure characteristics model}.




### Mixed Logit Model (Random-coefficient Model)

- Let $v(p, w_j, y_i) = \beta'w_j - \alpha  p_j$.
- But now, suppose that $\beta$ and $\alpha$ can be different across consumers. So, $v(p, w_j, y_i) = \beta_i'w_j - \alpha_i p_j$.
- The density of consumer characteristics is:
\begin{equation}
f(\beta_i, \alpha_i, y_i, \epsilon_i) = f(\beta_i, \alpha_i|y_i)f(y_i)f(\epsilon_i).
\end{equation}
where $f(\epsilon_i)$ is i.i.d. Type-I extreme value.
- $f(\beta_i, \alpha_i|y_i)$ is often independent normal distribution.
- Then, the choice probability of good $j$ by consumer $i$ is:
\begin{equation}
s_{j}(p, w, y_i) = \int_{\beta_i, \alpha_i} \frac{\exp[\beta_i'w_j - \alpha_i p_j ]}{\sum_{k = 0}^J \exp[\beta_i'w_k - \alpha_i p_k]} f(\beta_i, \alpha_i|y_i) d\beta_i d\alpha_i.
\end{equation}




### Mixed Logit Model (Random-coefficient Model) 

- Now the preference is correlated as we desired.
- For example, suppose it is a choice over cars, and $w_{j1}$ is the engine power.
- Suppose $\beta_{i1}$, the coefficient for $w_{j1}$ was high. Then, it means that the consumer likes a car with high engine power.
- The preference of this consumer is, therefore, also higher for other cars with high $w_{ji}$.
- There is no IIA:
\begin{equation}
\frac{s_{j}(p, w, y_i)}{s_{l}(p, w, y_i)} = \frac{\int_{\beta_i, \alpha_i} \frac{\exp[\beta_i'w_j - \alpha_i p_j]}{\sum_{k = 0}^J \exp[\beta_i'w_k - \alpha_i p_k]} f(\beta_i, \alpha_i|y_i) d\beta_i d\alpha_i}{\int_{\beta_i, \alpha_i} \frac{\exp[\beta_i'w_l - \alpha_i p_l]}{\sum_{k = 0}^J \exp[\beta_i'w_k - \alpha_i p_k]} f(\beta_i, \alpha_i|y_i) d\beta_i d\alpha_i}.
\end{equation}




### Mixed Logit Moel: Price Elasticities

- The price elasticities of the choice probabilities is:
\begin{equation}
e_{jk} = 
\begin{cases}
-\frac{p_j}{s_j} \int \alpha_i s_{ij}(1 - s_{ij})f(\beta_i, \alpha_i|y_i) d\beta_i d\alpha_i &\text{   if   } j = k\\
\frac{p_k}{s_j} \int \alpha_i s_{ij} s_{ik} f(\beta_i, \alpha_i|y_i) d\beta_i d\alpha_i &\text{   otherwise},
\end{cases} 
\end{equation} 
where
\begin{equation}
s_{ij} = \frac{\exp[\beta_i'w_j - \alpha_i p_j ]}{\sum_{k = 0}^J \exp[\beta_i'w_k - \alpha_i p_k]}.
\end{equation}




### Mixed Logit Model: Including Consumer Characteristics

- The distribution of the random-coefficient can be conditional on observable consumer characteristics. 
- Let $z_i$ be a vector of observable consumer characteristics such as the family size, father's age, mother's age, ethnicity, and so on.
\begin{equation}
s_{j}(p, w, y_i, z_i) = \int_{\beta_i, \alpha_i} \frac{\exp[\beta_i'w_j - \alpha_i p_j ]}{\sum_{k = 0}^J \exp[\beta_i'w_k - \alpha_i p_k]} f(\beta_i, \alpha_i|y_i, z_i) d\beta_i d\alpha_i.
\end{equation}
- The distribution of $\beta_i$ is often assumed to be:
\begin{equation}
\begin{split}
&\beta_i = \Pi_0 z_i + \nu_i, \nu_i \sim N(0, \sigma_\nu^2).\\
&\Rightarrow \beta_i'w_j = z_i' \Pi_0' w_j + \nu_i' w_j.
\end{split}
\end{equation}
- Thus, observable consumer characteristics enter the mean indirect utility as interaction terms to observable product characteristics.





### Simulated Maximum Likelihood Estimation of the Mixed Logit Model (Random-coefficient Model) 

- The choice probability of the mixed logit model is an integration of the multinomial logit choice probability.
- This is not derived analytically in general.
- We use simulation to evaluate the choice probability:

- Draw $R$ values of $\beta$ and $\alpha$, $\{\beta^r, \alpha^r \}_{r = 1}^R$.
- Compute the multinomial choice probabilities associated with $(\beta^r, \alpha^r)$ for each $r = 1, \cdots, R$.
- Approximate the choice probability with the mean of the simulated multinomial choice share:
\begin{equation}
s_{j}(p, w, y_i) \approx \hat{s}_{j}(p, w, y_i) \equiv \frac{1}{R} \sum_{r = 1}^R  \frac{\exp[\beta^{r\prime} w_j - \alpha^r p_j ]}{\sum_{k = 0}^J \exp[\beta^{r\prime}w_k - \alpha^r p_k]}.
\end{equation}





### Simulated Maximum Likelihood Estimation of the Mixed Logit Model (Random-coefficient Model)

- Suppose we observe a sequence of income $y_i$, choice $x_i$, product characteristics $w_j$ and price $p_j$.
- $x_i = (x_{i0}, \cdots, x_{iJ})'$ and $x_{ij} = 1$ if $j$ is chosen and $0$ otherwise. 
- The simulated log likelihood of $\{x_i\}_{i = 1}^N$ conditional on $\{w_j, p_j\}_{j = 1}^J$ is:
\begin{equation}
\begin{split}
l(v; x, y, w) &= \sum_{i = 1}^N \ln \mathbb{P}\{x_i = x(p, w_j, y_i)|p, w_j, y_i \}\\
& \approx \sum_{i = 1}^N \log \Bigg\{ \prod_{j = 0}^{J} \hat{s}_{j}(p, w, y_i)^{x_{ij}} \Bigg\}.
\end{split}
\end{equation}




### Simulated Non-linear Least Square Estimation of the Mixed Logit Model (Random-coefficient model)

- Suppose that there are $t = 1, \cdots, T$ markets.
- The average income level is $y_t$ in market $t$.
- The average price level is $p_i$ in market $t$.
- We can simulate the choice share of product $j$ in market $t$ by $\hat{s}_{j}(p_t, w, y_t)$.
- Then we can estimate the parameter by:
\begin{equation}
\min \sum_{t = 1}^T \sum_{j = 1}^J \{s_{jt} - \hat{s}_{j}(p_t, w, y_t)\}^2,
\end{equation}
where $s_{jt}$ is the observed choice share of product $j$ in market $t$.




### Nested Logit Model: A Special Case of Mixed Logit Model

- Let $w_{j1}, \cdots, w_{jG}$ be the indicator of product category, i.e., $w_{jg}$ takes value 1 if good $j$ belong to category $g$ and 0 otherwise.

- e.g., car category = \{Sports, Luxury, Large, Midsize, Small\}.

- We have:
\begin{equation}
\begin{split}
v(p, w_j, y_i; z_i) &= \beta'w_j - \alpha \ln(y_i - p_j)\\
& + \underbrace{\sum_{g = 1}^G \zeta_{jg} w_{jg}}_{\text{this creates correlation within category}} + \epsilon_{ij}.
\end{split}
\end{equation}




### Nested Logit Model

- Let 
\begin{equation}
\varepsilon_{ij} \equiv \sum_{g = 1}^G \zeta_{jg} w_{jg} + \epsilon_{ij}.
\end{equation}
- Under certain distributional assumption on $\zeta_{jg}$ and $\epsilon_{ij}$, the term $\varepsilon_{ij}$ have a cumulative distribution:
\begin{equation}
F(\varepsilon_i) = \exp\Bigg\{- \sum_{g = 1}^G \Bigg(\sum_{j \in \text{   category   } g} \exp[-\varepsilon_{ij}/\lambda_g] \Bigg)^{\lambda_g}  \Bigg\}.
\end{equation}




### Nested Logit Model

- Under this distributional assumption, the choice probability is:
\begin{equation}
\begin{split}
s_{j}(p, w, y_i) = \frac{\exp[v(p, w_j, y_i)/\lambda_g] \Bigg(\sum_{k \in \text{   category   } g} \exp[v(p, w_k, y_i)/\lambda_g]\Bigg)^{\lambda_g - 1}}{\sum_{g = 1}^G \Bigg(\sum_{k \in \text{   category   } g} \exp[v(p, w_k, y_i)/\lambda_g]\Bigg)^{\lambda_g}},
\end{split}
\end{equation}
if good $j$ belongs to category $g$.
- The higher $\lambda_g \in [0, 1]$ implies lower correlation within category $g$.
- $\lambda_g = 1$ for all $g$ coincides with the multinomial logit model.





### Discrete Choice Model with Endogenous Variables

- We have assumed that good $j$ is characterized by a vector $w_j$.
- Can econometrician observe all the relevant characteristics for goods in the choice set?
- Maybe no. For example, econometrician may not observe brand values that are created by advertisement and recognized by consumers.
- Moreover, such unobserved product characteristics are likely to be correlated with the price.
- This causes an endogeneity problem.




### Market-level Data

- We consider a situation where there are $t = 1, \cdots, T$ market, and product characteristics $\{w_j\}_{j = 1}^J$, average price vector of each market $\{p_{t}\}_{t = 1}^{T}$, and the choice probabilities of each market $\{s_t\}_{t = 1}^T$, and the average income of each market $\{y_t\}_{t = 1}^T$ are observed.
- We revisit choice-level data case later.




### Unobserved Fixed Effects in Multinomial Logit Model

- Suppose that the indirect utility function of good $j$ for consumer $i$ in market $t$ is:
\begin{equation}
\beta' w_j  - \alpha p_{jt} - \xi_{jt} + \epsilon_{ik},
\end{equation}
where $\epsilon_{ik}$ is i.i.d. Type-I extreme value.
- $\xi_{jt}$ is unobserved fixed effect of product $j$ in market $t$, which can be correlated with $p_{jt}$.
- The choice probability of good $j$ for this consumer and hence the choice share in this market is:
\begin{equation}
s_j(p_t, w, \xi_t) = \frac{\exp(\beta' w_j - \alpha p_{jt} + \xi_{jt})}{1 + \sum_{k = 1}^J\exp(\beta' w_k - \alpha p_{kt} +  \xi_{kt} ) }.
\end{equation}
- How to deal with the endogeneity?




### Unobserved Fixed Effects in Multinomial Logit Model

- Suppose that we have a vector of instrumental variables $z_{jt}$ such that:
\begin{equation}
\mathbb{E}\{\xi_{jt}|z_{jt}\} = 0.
\end{equation}
- Remember that in the IV estimator for a liner model, we write:
\begin{equation}
\epsilon_{jt} = y_{jt} - \beta'x_{jt},
\end{equation}
and exploit a moment condition such as:
\begin{equation}
\begin{split}
&\mathbb{E}\{\epsilon_{jt}|z_{jt}\} = 0,\\
&\Rightarrow \mathbb{E}\{ \epsilon_{jt} z_{jt}\} = 0,\\
&\Leftrightarrow \mathbb{E}\{(y_{jt} - \beta'x_{jt}) z_{jt} \} = 0
\end{split}
\end{equation}
- To use the moment condition above, we have to write $\xi_{jt}$ as a function of parameters of interest.




### Unobserved Fixed Effects in Multinomial Logit Model

- This is straightforward in multinomial logit models.
- Remember that we have:
\begin{equation}
\begin{split}
&\ln [s_j(p_t, w, \xi_t) / s_0(p_t, w, \xi_t)] = \beta' w_j - \alpha p_{jt} + \xi_{jt}\\
&\Leftrightarrow \xi_{jt} = \ln [s_j(p_t, w, \xi_t) / s_0(p_t, w, \xi_t)] - [\beta' w_j - \alpha p_{jt}].
\end{split}
\end{equation}
- Therefore, the moment condition can be written as:
\begin{equation}
\begin{split}
&\mathbb{E}\{\xi_{jt}|z_{jt}\} = 0,\\
&\Rightarrow \mathbb{E}\{\xi_{jt} z_{jt}\} = 0,\\
&\Leftrightarrow \mathbb{E}\{(\ln [s_{jt} / s_{0t}] - [\beta' w_j - \alpha p_{jt}]) z_{jt}  \} = 0,
\end{split}
\end{equation}
where $s_{jt}$ is the observed choice share of product $j$ in market $t$.


### Unobserved Fixed Effects in Multinomial Logit Model

- If you can assume $\xi_{jt} = \xi_j$, then
\begin{equation}
ln [s_j(p_t, w, \xi_t) / s_0(p_t, w, \xi_t)] = \beta' w_j - \alpha p_{jt} + \xi_{j}.
\end{equation} 
- This is nothing but a linear regression of $ln [s_j(p_t, w, \xi_t) / s_0(p_t, w, \xi_t)]$ on $w_j$ and $p_{jt}$ with product-specific unobserved fixed effect.
- This can be estimated by a within-market estimator.
- This is a good starting point.




### Unobserved Fixed Effects in Mixed-logit Model

- Suppose that the indirect utility function of good $j$ for consumer $i$ in market $t$ is:
\begin{equation}
\beta_i' w_j  - \alpha_i p_{jt} - \xi_{jt} + \epsilon_{ik},
\end{equation}
where $\epsilon_{ik}$ is i.i.d. Type-I extreme value.
- $\xi_{jt}$ is unobserved fixed effect of product $j$ in market $t$, which can be correlated with $p_{jt}$.
- The random-coefficient $\beta_{il}$ and $\alpha_i$ are drawn from:
\begin{equation}
\begin{split}
&\beta_{il} = \beta_l + \sigma_{\beta l} \nu_{il}, l = 1, \cdots, L,\\
&\alpha_i = \alpha + \sigma_{\alpha} \nu_{i},
\end{split}
\end{equation}
where $\nu_{il}$ and $\nu_i$ are i.i.d. standard normal distribution.
- Then the indirect utility of good $j$ for consumer $i$ in market $t$ is written as:
\begin{equation}
\underbrace{\sum_{l = 1}^L \beta_{l} w_{jl} - \alpha p_{jt} + \xi_{jt}}_{\text{product and market specific}} + \underbrace{\sum_{l = 1}^L \sigma_{\beta k} \nu_{il} w_{jl} - \sigma_{\alpha} \nu_i p_{jt}}_{\text{individual heterogeneity matters}}.
\end{equation}




### Unobserved Fixed Effects in Mixed-logit Model

- The choice share of good $j$ in market $t$ is:
\begin{equation}
s_{j}(p_t, w, \xi_t) = \int \frac{\exp\Bigg(\sum_{l = 1}^L \beta_{l} w_{jl} - \alpha p_{jt} + \xi_{jt} + \sum_{l = 1}^L \sigma_{\beta k} \nu_{il} w_{jl} - \sigma_{\alpha} \nu_i p_{jt} \Bigg)}{1 + \sum_{k = 1}^J \exp\Bigg(\sum_{l = 1}^L \beta_{l} w_{kl} - \alpha p_{kt} + \xi_{kt} + \sum_{l = 1}^L \sigma_{\beta k} \nu_{il} w_{kl} - \sigma_{\alpha} \nu_i p_{kt} \Bigg)} f(\nu) d\nu.
\end{equation}
- How can we represent $\xi_{jt}$ as a function of parameters of interest to exploit the moment condition?
- Let $\theta_1 = \{\{\beta_l\}_{l = 1}^L, \alpha\}$ and $\theta_2 = \{\{\sigma_{\beta l}\}_{l = 1}^L, \sigma_{\alpha}\}$.
- The parameters of interest are $\theta = \{\theta_1, \theta_2\}$.
- I will call $\theta_1$ linear parameters and $\theta_2$ non-linear parameters for reasons I explain later.
- Let $s_{j}(p_t, w, \xi_t; \theta)$ denote the choice probability implied by parameters $\theta$ to make the dependence explicit.




### Representing $\xi_{jt}$ as a Function of Parameters of Interest

- The following equality implicitly determines $\xi_{jt}$ as a function of parameters of interest:
\begin{equation}
s_{jt} = s_{j}(p_t, w, \xi_t; \theta),
\end{equation}
where $s_{jt}$ is the observed choice share of good $j$ in market $t$. 
- Let $\xi_{jt}(\theta)$ is the solution to the equation above given parameter $\theta$.
- Does this solution exist?
- Is it unique?
- Is there efficient method to find the solution?




### Solving for $\xi_{jt}(\theta)$

- Now, let $\delta_{jt}$ be the product and market specific terms in the indirect utility:
\begin{equation}
\delta_{jt} \equiv \sum_{l = 1}^L \beta_{l} w_{jl} - \alpha p_{jt} + \xi_{jt}.
\end{equation}
- I call it the average utility of the product in the market.
- Then, the choice share of product $j$ in market $t$ is written as:
\begin{equation}
\begin{split}
&\sigma_{jt}(\delta_t, \theta_2) \\
&\equiv \int \frac{\exp\Bigg(\delta_{jt} + \sum_{l = 1}^L \sigma_{\beta k} \nu_{il} w_{jl} - \sigma_{\alpha} \nu_i p_{jt} \Bigg)}{1 + \sum_{k = 1}^J \exp\Bigg(\delta_{kt} + \sum_{l = 1}^L \sigma_{\beta k} \nu_{il} w_{kl} - \sigma_{\alpha} \nu_i p_{kt} \Bigg)} f(\nu) d\nu,
\end{split}
\end{equation}
for $j = 1, \cdots, J, t = 1, \cdots, T$.




### Solving for $\xi_{jt}(\theta)$

- Now, fix $\theta_2$ and define an operator $T$ such that:
\begin{equation}
T_t(\delta_t) = \delta_t + \ln \underbrace{s_{jt}}_{\text{data}} - \ln \underbrace{\sigma_{jt}(\delta_t, \theta_2)}_{\text{model}}.
\end{equation} 
- Let $\delta_t^{(0)} = (\delta_{1t}^{(0)}, \cdots, \delta_{Jt}^{(0)})'$ be an arbitrary starting vector of average utility of products in a market.
- Using the operator above, we update $\delta_{t}^{(r)}$ by:
\begin{equation}
\delta_{t}^{(r + 1)} = T_t(\delta_{t}^{(r)}) = \delta_t^{(r)} + \ln s_{jt} - \ln \sigma_{jt}(\delta_t^{(r)}, \theta_2),
\end{equation}
for $r = 0, 1, \cdots$.




### Solving for $\xi_{jt}(\theta)$

- Berry, Levinsohn and Pakes (1995) proved that $T_t$ as specified above is a \textbf{contraction mapping with modulus less than one}.
- This means that i) $T_t$ has a unique fixed point and ii) for arbitrary $\delta_t^{(r)}$, $\lim_{r \to \infty} T_t^r(\delta_t^{(0)})$ is the unique fixed point.
- The fixed point of $T_t$ is $\delta_t^*$ such that $\delta_t^* = T_t(\delta_t^*)$, i.e.,
\begin{equation}
\begin{split}
&\delta_t^* = \delta_t^* + \ln s_{jt} - \ln \sigma_{jt}(\delta_t^*, \theta_2),\\
&\Leftrightarrow s_{jt} = \sigma_{jt}(\delta_t^*, \theta_2).
\end{split}
\end{equation}
- So, the fixed point $\delta_t^*$ is the average utility that solves the equality given non-linear parameter $\theta_2$.
- Moreover, the solution is unique.
- Moreover, it can be found by iterating the operator.
- Let $\delta_t(\theta_2)$ be the solution to this equation that are computed by iteratively applying the operator.




### Solving for $\xi_{jt}(\theta)$

- We defined the average utility as:
\begin{equation}
\delta_t = \sum_{l = 1}^L \beta_{l} w_{jl} - \alpha p_{jt} + \xi_{jt}.
\end{equation}
- Hence,
\begin{equation}
\xi_{jt}(\theta) = \delta_t(\theta_2) - \Bigg[\sum_{l = 1}^L \beta_{l} w_{jl} - \alpha p_{jt} \Bigg],
\end{equation}
solves the equality:
\begin{equation}
s_{jt} = s_{j}(p_t, w, \xi_t; \theta).
\end{equation}




### Solving for $\xi_{jt}(\theta)$

- In summary, $\xi_{jt}$ that solves the equality exists and unique, and can be computed by:

- Fix $\theta = \{\theta_1, \theta_2\}$.
- Fix arbitrary starting value $\delta_t^{(0)}$ for $t = 1, \cdots, T$.
- Let $\delta_t(\theta_2)$ be the limit of $T_t^r(\delta_t^{(0)})$ for $r = 0, 1, \cdots$ for each $t = 1, \cdots, T$.

- Stop the iteration if $|\delta_t(\theta_2)^{(r + 1)} - \delta_t(\theta_2)^{(r)}|$ is below a threshold.

- Let $\xi_{jt}(\theta)$ be such that:
\begin{equation}
\xi_{jt}(\theta) = \delta_t(\theta_2) - \Bigg[\sum_{l = 1}^L \beta_{l} w_{jl} - \alpha p_{jt} \Bigg].
\end{equation}

- We run this algorithm every time we evaluate the moment condition.




### Estimating Parameters

- Find $\theta$ that solves:
\begin{equation}
\min_{\theta} \xi(\theta)' Z W^{-1} Z' \xi(\theta),
\end{equation}
where $W$ is some weight matrix,
\begin{equation}
\xi(\theta) = 
\begin{pmatrix}
\xi_1(\theta)\\
\vdots\\
\xi_T(\theta)
\end{pmatrix},
Z = 
\begin{pmatrix}
z_{11}' \\
\vdots \\
z_{J1}' \\
\vdots \\
z_{1T}' \\
\vdots \\
z_{JT}' \\
\end{pmatrix}.
\end{equation}
- There are $J \to \infty$ and $T \to \infty$ asymptotics. Either is fine to consistently estimate the parameters.




### Estimating Parameters

- The first-order condition for $\theta_1$ is:
\begin{equation}
\theta_1 = (X_1'Z W^{-1} Z'X_1)^{-1} X_1' Z W^{-1} Z' \delta(\theta_2),
\end{equation} 
where
\begin{equation}
X_1 = 
\begin{pmatrix}
\tilde{X}_1 & - p_1\\
\vdots & \vdots \\
\tilde{X}_1 & - p_T
\end{pmatrix},
\tilde{X}_1 =
\begin{pmatrix}
w_{11} & \cdots & w_{1L}\\
\vdots & & \vdots\\
w_{J1} & \cdots & w_{JL}
\end{pmatrix},
\delta(\theta_2) =
\begin{pmatrix}
\delta_1(\theta_2)\\
\vdots\\
\delta_T(\theta_2)
\end{pmatrix}
\end{equation}.
- So, finding optimal $\theta_1$ given $\theta_2$ is easy.
- We search over $\theta_2$ and find optimal $\theta_1$ for $\theta_2$ from the first-order condition above.




### Instrumental Variables

- Hausman-type IV: 

- Assume that demand shocks independent across markets, while the cost shocks are correlated.
- Then, the prices of goods in other markets $p_{j, -t}$ will be valid instruments for the price of goods in a given market, $p_{jt}$. 

- BLP-type IV:

- In oligopoly, the price of a good in a market depends on the market structure, i.e., what kind of products are available in the market.
- For example, if there are similar products in the market, the price will tend to be lower.
- Then, the product characteristics of other products in the market , will be valid instrument for the price of goods in a given market, $p_{jt}$.
- If there are multi-product firms, whether the other good is owned by the same company will also affect the price.





### Optimal BLP-type IV

- When $\mathbb{E}\{\xi_{jt}|z_{t}\} = 0$ holds, then for any function $H$, we have:
\begin{equation}
\mathbb{E}\{\xi_{jt} H(z_{t}) \} = \mathbb{E}\{\mathbb{E}\{\xi_{jt}|z_{jt}\}H(z_{t})\} = 0.
\end{equation}
- The choice of $H$ matters the efficiency.
- $H$ should be something that makes it harder to satisfy the condition when the parameter to evaluate is away from the true parameter.
- Let $d_{jk} = d(w_j, w_k)$ be some distance between product characteristics.
- It is known that the optimal IV $H$ for $p_{jt}$ is a function of the distribution of $\{d_{jk}\}_{k \neq j, k\text{   is available in market   }t}$,  $F_j(d)$.
- We can compute empirical distribution of $F_j(d)$ in a market, $\hat{F}_j(d)$.
- We can use some moments of $\hat{F}_j(d)$ as IV for $p_{jt}$.




### Control Function Approach

- The equilibrium price vector in a market is determined by product characteristics, and productivity and demand conditions.
- It will depends on the unobserved product characteristics $\xi_{jt}$.
- Suppose that the equilibrium price vector in a market is determined by:
\begin{equation}
p_{t} = P(w, z_t, \xi_t),
\end{equation}
where $z_t$ is a vector of variables that affect the price but are excluded from the indirect utility function.
- If we can estimate it and it is invertible in $\xi_t$, then, we can have a proxy for $\xi_t$ such as:
\begin{equation}
\hat{\xi}_t = \hat{P}^{-1}(w, z_t).
\end{equation}
- If we insert this into the previous models, $\xi_{jt}$ is no longer \textbf{unobserved} product characteristics.
- This approach is similar to Olley and Pakes method for production function estimation.


<!--chapter:end:03-demand.Rmd-->

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






<!--chapter:end:04-merger.Rmd-->

# Entry and Exit {#entryexit}


## Entry and Exit

### Entry Cost, Mode of Competition, and Market Structure

- Fixed and sunk entry costs and mode of competition are key determinants for market structure. 
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/entrycost} 

}

\end{figure}
- The tougher the competition, the less firms can earn enough profit to compensate the entry cost.
- Therefore, the tougher the competition, the number of firms in the market in the equilibrium \textbf{does not} grow when the market size increases.



### Exogenous and Endogenous Entry Cost

- \textbf{Exogenous fixed and sunk entry cost}: 

- It determines the cutoff profit and so the equilibrium number of firms in the market.
- The cost is the same across modes of entry.

- \textbf{Endogenous fixed and sunk entry cost}: 

- The cost differ across modes of entry.
- For example, firms decide the quality of the product upon entering the market.
- The endogenous fixed and sunk entry cost will be increasing in the quality choice.

- If endogenous fixed and sunk entry cost is relevant, the entry cost to have a positive profit in the market increases as the the number of firms in the market increase.
- Therefore, the equilibrium firm size tend to be large when endogenous fixed and sunk entry cost is relevant.



### Studying Entry Decisions

- By studying the entry decisions of firms, we can identify the profit function including the entry cost of firms.
- A profit function is the reduced-form of the underlying demand function, cost function, and conduct parameters.
- The profit function can be identified without assuming a particular conduct.
- It is enough to answer questions regarding the market structure and producer surplus.
- Last week, we studied the relationship between the equilibrium price and price elasticity to infer the conduct in the product market.
- In the entry/exit analysis, we study the relationship between the market size and the equilibrium number of firms to infer the conduct in the product market.



### Homogeneous and Heterogeneous Entrants


- Entrants may differ in observed and/or unobserved manner.
- In a heterogeneous case, there may be multiple equilibria or there may be no pure-strategy equilibrium.
- This causes severe identification problems.
- We start from a simple homogeneous firm model.




### A Simple Homogeneous Firm Model

- There are $t = 1, \cdots, T$ markets.
- Let $x_t$ be the state variables of market $t$ such as population and income level.
- Let $F_t$ be the exogenous fixed and sunk entry cost in market $t$.
- When there are $N_t$ firms in the market, from product market competition, a firm earns a variable profit:
\begin{equation}
V(N_t, x_t, \theta),
\end{equation}
where $V$ is known up to the unknown profit parameters $\theta$.
- The net profit in market $t$ is:
\begin{equation}
\pi(N_t, \theta, F_t) \equiv V(N_t, x_t, \theta) - F_t. 
\end{equation} 
- The homogeneity assumption means that $V$ and $F_t$ are the same across firms for market $t$.



### Equilibrium Condition

- The equilibrium number of firms $N_t^*$ in market $t$ is characterized by:
\begin{equation}
\begin{split}
&V(N_t^*, x_t, \theta) - F_t \ge 0, \\
&V(N_t^* + 1, x_t, \theta) - F_t < 0.
\end{split}
\end{equation}
that is,
\begin{equation}
V(N_t^*, x_t, \theta) \ge F_t > V(N_t^* + 1, x_t, \theta).
\end{equation}
- The $N_t^*$th firm can enjoy positive net profit.
- The entry of additional firm makes the net profit negative.


### Distributional Assumption on Entry Cost

- Assume that entry cost $F_t$ is drawn from a distribution $\Phi(\cdot|x_t, \omega)$ that is i.i.d. conditional on the state variable $x_t$ that is known up to entry cost parameters $\omega$.
- Then the likelihood of observing $N_t$ in market $t$ with state variable $x_t$ is:
\begin{equation}
\begin{split}
&\mathbb{P}\{V(N_t, x_t, \theta) \ge F_t > V(N_t + 1, x_t, \theta)| x_t, \omega\}\\
&=\mathbb{P}\{V(N_t, x_t, \theta) \ge F_t| x_t, \omega\} - \mathbb{P}\{V(N_t + 1, x_t, \theta) \ge F_t| x_t, \omega\}\\
&=\Phi(V(N_t, x_t, \theta)|x_t, \omega) - \Phi(V(N_t + 1, x_t, \theta)|x_t, \omega).
\end{split}
\end{equation}
 



### Log Likelihood Function

- Therefore, the log likelihood of observing $\{N_t\}_{t = 1}^T$ given $\{x_t\}_{t = 1}^T$ is:
\begin{equation}
\begin{split}
&L(\theta, \omega|\{N_t\}_{t = 1}^T,  \{x_t\}_{t = 1}^T) \\
&= \sum_{t = 1}^T \log\{\Phi(V(N_t, x_t, \theta)|x_t, \omega) - \Phi(V(N_t + 1, x_t, \theta)|x_t, \omega)\}.
\end{split}
\end{equation}
- This is a \textbf{ordered} model in $N_t$.
- If $\Phi$ is a normal distribution, it is an \textbf{ordered probit model}.



### Identification of the Variable Profit

- Suppose that there are many markets whose state variables are roughly $x$.
- Then, we can identify the distribution of number of firms across market conditional on that the state variables are roughly $x$.
- The share of such market where the number of firms is $N$, $s(N, x)$ has to be:
\begin{equation}
\Phi(V(N, x, \theta)|x, \omega) - \Phi(V(N + 1, x, \theta)|x, \omega), N = 0, 1, 2, \cdots.
\end{equation}
- Then,
\begin{equation}
\begin{split}
&V(0, x, \theta) = 0,\\
&\Phi(V(N + 1, x, \theta)|x, \omega) = \Phi(V(N, x, \theta)|x, \omega) - s(N, x), N = 1, 2, \cdots.
\end{split}
\end{equation}
- You can repeat the argument by changing $x$.



### $V$ Allow Various Product Market Models

- In theory, we can identify $V$ nonparametrically.
- It nests various product market models.



### An Example of $V$

- The variable cost function is $C(q) = cq - dq^2/2$.
- The demand in market $t$ is $Q_t = S_t (\alpha - \beta P_t)$ where $S_t$ is the market size.
- Firm compete in quantity:
\begin{equation}
\max_{q_j} \frac{1}{\beta}\Bigg(\alpha - \frac{Q_t}{S_t}\Bigg) q_j - cq_j + \frac{d}{2}q_j^2.
\end{equation}
- The first-order condition for firm $j$ is:
\begin{equation}
\frac{1}{\beta}\Bigg(\alpha - \frac{Q_t}{S_t}\Bigg) - \frac{q_j}{\beta S_t} - c + dq_j = 0.
\end{equation}
- Because of symmetry, the FOC is the same across firms.



### An Example of $V$

- Sum up the FOC across $N_t$ firms, we get:
\begin{equation}
\begin{split}
&\frac{N_t}{\beta}\Bigg(\alpha - \frac{Q_t}{S_t} \Bigg) + \Bigg(-\frac{1}{\beta S_t} + d \Bigg) Q_t - cN_t = 0\\
&\Leftrightarrow Q_t = \frac{N_t S_t \alpha - c N_t \beta S_t}{N_t + 1 - d\beta S_t}.
\end{split}
\end{equation}
- The equilibrium price is:
\begin{equation}
P_t = \frac{\alpha}{\beta} - N_t \frac{\alpha/\beta - c}{N_t + 1 - d \beta S_t}.
\end{equation}



### An Example of $V$

- In summary, the variable profit is:
\begin{equation}
\begin{split}
V(N_t, S_t, \theta) = \frac{S \theta_1^2 (2 - \theta_2 S_t)}{2(N_t + 1 - \theta_2 S_t)^2},
\end{split}
\end{equation}
where
\begin{equation}
\theta_1 = (\alpha/\beta - c)\sqrt{\beta}, \theta_2 = d\beta.
\end{equation}
- The variable profit in this case is i) decreasing in $N_t$ and ii) increasing in $S_t$.
- Therefore, $N_t$ is the equilibrium number of entrants if and only if:
\begin{equation}
\begin{split}
\frac{S \theta_1^2 (2 - \theta_2 S_t)}{2(N_t + 2 - \theta_2 S_t)^2} < F_t \le\frac{S \theta_1^2 (2 - \theta_2 S_t)}{2(N_t + 1 - \theta_2 S_t)^2}.
\end{split}
\end{equation}



### Identification of Demand and Cost Parameters

- In the previous example, the identification of $V$ is the identification of $\theta_1$ and $\theta_2$.
- $\theta_1$ and $\theta_2$ are the reduced-form parameters of demand parameters $\alpha, \beta$ and cost parameters $c, d$.
- It is clear that we cannot uniquely determine the value of four unknowns from two equations.
- Thus, demand and cost parameters are not necessarily identified even if the variable profit function is identified.



### Entry in Small Markets

- Bresnahan and Reiss (1990, 1991) study the entry of retail and professional service businesses into small isolated markets in the United States.

- How quickly the variable profit $V$ drops when the number of firms increases? (How severe is the competition?)
- How large the (exogenous) fixed and sunk entry costs of setting up a business are relative to variable profits?

### Profit Function Specification

- They considered the following variable profit function specification:
\begin{equation}
V(N_t, S_t, x_t, \theta) = S_t \Bigg(\theta_1 + \sum_{n = 2}^{\overline{N}} \theta_n D_n + x_t'\beta \Bigg),
\end{equation}
where $D_n$ takes 1 if at least $n$ firms have entered the market, and $x_t$ are exogenous state variables of the market.
- $\theta_1$ captures the monopoly variable profit, and $\theta_n$ captures how quickly the variable profit drops when additional firm enters the market.
- $x_t$ includes the per capita income, the log of heating degree days, housing units per population, value per acre of farmland and buildings, median value of owner-occupied houses. It also includes the number of births and the number of elderly residents in doctors' and dentists' cases.



### Fixed Cost Specification

- The author considers the following fixed costs:
\begin{equation}
F_t = \gamma_1 + \gamma_L W_L + \sum_{n = 2}^{\overline{N}} \gamma_n D_n + \epsilon_t, \epsilon \sim N(0, 1),
\end{equation}
where $W_L$ is the value per acre of farmland and buildings.
- It allows that the mean fixed cost varies across the number of firms.

### Entry Threshold

- To facilitate the interpretation of the estimation result, they computed the ``entry threshold'' $S_N$, the smallest market size that would accommodate $N$ firms.

### Town Population Ranges

- 202 isolated local markets in the US.
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/population} 

}

\end{figure}

### Number of Firms in a Market
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/number} 

}

\end{figure}


### Population and Number of Firms
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/numpop1} 

}

\end{figure}
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/numpop2} 

}

\end{figure}

- As the size of population increase, the number of dentists increases.



### Variable Profit Estimation Result
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/header} 

}

\end{figure}
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/variable} 

}

\end{figure}


### Fixed Cost Estimation Result
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/header} 

}

\end{figure}
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/fixed} 

}

\end{figure}


### Entry Threshold
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/ratio} 

}

\end{figure}


### Firm Heterogeneity

- So far we have assumed that entrants are ex-ante homogeneous.
- In reality, firms have different costs, sell different products, and occupy different locations.
- With firm heterogeneity, the model may have multiple equilibria or have no pure-strategy equilibrium.
- This causes a serious problem for the identification and estimation of the model.



### Two-player Entry Game

- Suppose that there are two potential entrants.
- They simultaneously decide whether to enter the market.
- The payoff matrix for the action pairs are:
\begin{center}
\begin{table}
\begin{tabular}{l l c c} \toprule
& & \multicolumn{2}{c}{Firm 2}\\ \cline{3-4}
& & Enter & Stay \\ \hline
Firm 1 & Enter & $(\pi_1^D, \pi_2^D)$ & $(\pi_1^M, 0)$ \\
& Stay & $(0, \pi_2^M)$ & $(0, 0)$ \\ \bottomrule
\end{tabular}
\end{table}
\end{center}
where the superscript $M$ and $D$ represent the monopoly and duopoly profits, and the subscript $1$ and $2$ represent the firm identity.
- Let $D_j, j = 1, 2$ be the indicator variables that takes 1 if firm $j$ enters and 0 otherwise.



### Information Structure

- Suppose that there is a firm-specific profit shock that is \textbf{observable} to the firms but \textbf{unobservable} to econometrician.
- So this is a \textbf{complete information game}.
- The profit function is:
\begin{equation}
\pi_j =
\begin{cases}
0 &\text{   if   } D_j = 0\\
\overline{\pi}^M(x, z_j) + \epsilon_j &\text{   if   } D_j = 1, D_{-j} = 0\\
\overline{\pi}^D(x, z_j) + \epsilon_j &\text{   if   } D_j = 1, D_{-j} = 1.
\end{cases}
\end{equation}
- The terms $\overline{\pi}^M$ and $\overline{\pi}^D$ are the mean monopoly and duopoly profit functions.
- These are the parameters of interest.
- $x$ are the state variables and $z_j$ are firm $j$ specific state variables.



### Nash Equilibrium
\begin{table}
\begin{tabular}{l c c} \toprule
Market Outcome & $N$ & Conditions \\ \hline
No firms & 0 & $\overline{\pi}^M(x, z_1) + \epsilon_1 < 0$, $\overline{\pi}^M(x, z_2) + \epsilon_2 < 0$ \\
Firm 1 monopoly & 1 & $\overline{\pi}^M(x, z_1) + \epsilon_1 > 0$, $\overline{\pi}^D(x, z_2) + \epsilon_2 < 0$ \\
Firm 2 monopoly & 1 & $\overline{\pi}^D(x, z_1) + \epsilon_1 < 0$, $\overline{\pi}^M(x, z_2) + \epsilon_2 > 0$ \\
Duopoly & 2 & $\overline{\pi}^D(x, z_1) + \epsilon_1 > 0$, $\overline{\pi}^D(x, z_2) + \epsilon_2 > 0$ \\ \bottomrule
\end{tabular}
\end{table}
$\Leftrightarrow$
\begin{table}
\begin{tabular}{l c c} \toprule
Market Outcome & $N$ & Conditions \\ \hline
No firms & 0 & $\epsilon_1 < - \overline{\pi}^M(x, z_1)$, $\epsilon_2 < - \overline{\pi}^M(x, z_2)$ \\
Firm 1 monopoly & 1 & $\epsilon_1 > - \overline{\pi}^M(x, z_1)$, $\epsilon_2 < - \overline{\pi}^D(x, z_2)$ \\
Firm 2 monopoly & 1 & $\epsilon_1 < - \overline{\pi}^D(x, z_1)$, $\epsilon_2 > -\overline{\pi}^M(x, z_2)$ \\
Duopoly & 2 & $\epsilon_1 > - \overline{\pi}^D(x, z_1)$, $\epsilon_2 > -\overline{\pi}^D(x, z_2)$ \\ \bottomrule
\end{tabular}
- For some regions of $(\epsilon_1, \epsilon_2)$, there are multiple equilibria.
\end{table}


### Nash Equilibrium
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/twoplayer_correct} 

}

\end{figure}

- Equilibia at different pairs of $(\epsilon_1, \epsilon_2)$.
- For example, in the green zone, duopoly is the unique equilibriums because $\epsilon_1 > - \overline{\pi}^D(x, z_1)$ and $\epsilon_2 > - \overline{\pi}^D(x, z_2)$



### Likelihood Function DOES NOT exist

- The likelihood function maps the parameter to the likelihood of the event.
- In the current model, no firm event happens with probability:
\begin{equation}
\begin{split}
&\mathbb{P}\{D_1 = 0, D_2 = 0|x, z_1, z_2\}\\
&= \mathbb{P}\{\epsilon_1 < - \overline{\pi}^M(x, z_1), \epsilon_2 < - \overline{\pi}^M(x, z_2)|x, z_1, z_2\},
\end{split}
\end{equation}
which is the mass of the pink area.
- Duopoly event happens with probability:
\begin{equation}
\begin{split}
&\mathbb{P}\{D_1 = 1, D_2 = 1|x, z_1, z_2\}\\
&= \mathbb{P}\{\epsilon_1 > - \overline{\pi}^D(x, z_1), \epsilon_2 > -\overline{\pi}^D(x, z_2) |x, z_1, z_2\},\end{split}
\end{equation}
which is the mass of the green area.



### Likelihood Function DOES NOT exist

- But what is the likelihood of firm 1 monopoly?

- It is at least as much as the mass of the blue zone.
- It is at most as much as the mass of the blue and orange zone.

- The likelihood of firm 1 monopoly is undetermined. It is a range.
- The likelihood of firm 2 monopoly is also undetermined.



### Multiple Equilibria Problem

- The source of this problem is that there are multiple equilibria when $(\epsilon_1, \epsilon_2)$ is in the orange area.
- We do not have a probability law of selecting a equilibrium from multiple equilibria.
- Therefore, we cannot determine the likelihood.



### Resolving Multiple Equilibria Problem

- Four types of solutions have been suggested for this multiple equilibria problem.


- Model the probabilities of aggregated outcomes that are robust to the equilibrium selection.
- Place additional conditions on the model that guarantee a unique equilibrium.
- Include in the estimation additional parameter that select among multiple equilibria.
- Accept that some models with multiple equilibria are not exactly identified and yet to note that they nevertheless do generate useful restrictions on economic quantities.




### Write Likelihood on the Aggregate Outcome

- Even if the equilibrium identity of firms in the market can be indeterminate, the equilibrium number of firms can be determinate.
- Intuitively, the equilibrium number of firms gives information about the average profitability of the market, but does not tell how profitable the market is for a particular firm.
- The equilibrium identity of firms gives information about the profitability of the market for the entered firms and the other firms.
- Therefore, we cannot identify the firm-level unobserved heterogeneity in the profitability across firms when we focus on the equilibrium number of firms.



### Entry in the Airline Industry: One-shot Game

- Based on Berry (1992).
- A market = a city pair market at a single point in time.
- Consider a one-shot entry game that yields a network structure.
- At the beginning of the period, each firm takes its overall network structure as given and decides whether to operate in a given city pair \textit{independently} across markets.

- $\leftrightarrow$ entry decisions can be dependent across markets if the demand/cost shocks are dependent across markets or an entry to a market affects the profit in the other market as well. 




### Entry in the Airline Industry: Profit Function

- Let $s$ be a strategy profile.

- $s = (s_1, \cdots, s_{K_i})'$, $s_k \in \{0, 1\}$.
- $K_i$ is the number of potential entrants in market $i$.

- The profit function for firm $k$ in market $i$:
\begin{equation}
\pi_{ik}(s) = v_i(N(s)) + \phi_{ik}
\end{equation}
- $v_i$ is strictly decreasing in $N$, for every $\phi_i$.
- $N_i^*$ is determined by:
\begin{equation}
N_i^* = \max_{0 \le n \le K_i} \{n: v_i(n) + \phi_{in} \ge 0\},
\end{equation}
where
\begin{equation}
\phi_{i1} > \phi_{i2} > \cdots > \phi_{i K_i},
\end{equation}
without loss of generality.



### Entry in the Airline Industry: Profit Function

- The common term:
\begin{equation}
v_i(N) = X_i \beta + h(\delta, N) + \rho u_{io}, 
\end{equation} 
where $X_i$ is the observed market characteristics, $h(\cdot)$ is a function that is decreasing in $N$, $u_{io}$ is the market characteristics that is observed by firms but not by econometrician.
- For example, $h(\delta, N) = - \delta ln(N)$.
- The firm-specific term:
\begin{equation}
\phi_{ik} = Z_{ik} \alpha + \sigma u_{ik},
\end{equation}
where $Z_{ik}$ is the observed firm characteristics.
- A scale normalization: $\sigma = \sqrt{1 - \rho^2}$ $\Rightarrow var(\rho u_{i0} + \sigma u_{ik}) = 1$.
 


### Entry in the Airline Industry: Likelihood Function

- The observed part:
\begin{equation}
r_{ik}(N) = X_i \beta - \delta \ln (N) + Z_{ik} \alpha. 
\end{equation} 
- The unobserved part:
\begin{equation}
\epsilon_{ik} = \sqrt{1 - \rho^2} u_{ik} + \rho u_{io}.
\end{equation}
- Then,
\begin{equation}
N_i^* \le N \Leftrightarrow \#\{k: \epsilon_{ik} \le - r_{ik}(N)\} \le N.
\end{equation}

\begin{equation}
\mathbb{P}\{N_i^* = N\} = \mathbb{P}\{N_i^* \le N\} - \mathbb{P}\{N_i^* \le (N - 1)\}. 
\end{equation}
 


### Is the Equilibrium Number of Firms Unique?

- Either of the following conditions are sufficient: 


- No firm-level unobserved heterogeneity: $\rho = 1$.
- No market-level unobserved heterogeneity: $\rho = 0$.
- The order of entry is predetermined:

- The most profitable firms enter first.
- The incumbent firms enter first.





### Entry in the Airline Industry: $\rho = 1$ or $\rho = 0$

- For each firm $i$, given $W_i = (X_i, Z_i)$ and parameter $\theta$, simulate $R$ equilibrium number of firms $N_i^{(r)}, r = 1, \cdots, R$ based on the previous condition by drawing $R$ errors $u_{i}^{(r)}, r = 1, \cdots, R$:
\begin{equation}
\begin{split}
&\pi_i(N, u_i^{(r)}) = X_i \beta + Z_{ik} \alpha - \delta \ln(N) + \rho u_{io}^{(r)} + \sqrt{1 - \rho^2} u_{ik}^{(r)},\\
&n(W_i, \theta, u_i^{(r)}) = \max_{0 \le n \le K_i} \{n: \#\{k: \pi_{ik}(N, u_i^{(r)}) \ge 0 \} \ge n\}.
\end{split}
\end{equation}
- Compute the simulated average:
\begin{equation}
N(W_i, \theta, u_i^{(1)}, \cdots, u_i^{(R)}) = \frac{1}{R} \sum_{r = 1}^R n(W_i, \theta, u_i^{(r)}).
\end{equation}
- Regress the observed number of the simulated average:
\begin{equation}
\hat{\theta} = \text{argmin}_{\theta} \frac{1}{T} \sum_{i = 1}^T [N_i - N(W_i, \theta, u_i^{(1)}, \cdots, u_i^{(R)})]^2.
\end{equation}



### Entry in the Airline Industry: $\rho = 1$ or $\rho = 0$
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/special} 

}

\end{figure}



### Entry in the Airline Industry The most profitable firms move first

- Given parameter $\theta$ and error $u_{i}^{(r)}$, firm $k$ enters market $i$ if:
\begin{equation}
n(W_i, \theta, u_i^{(r)}) \ge q_k(W_i, \theta, u_i^{(r)}),
\end{equation}
where $q_k(W_i, \theta, u_i^{(r)})$ the ranking of firm $k$ in market $i$ in terms of $\pi_{ik}(W_i, \theta, u_i^{(r)})$.
- Let $d_{ik}(W_i, \theta, u_i^{(r)})$ be the indicator variable that takes $1$ if firm $k$ enters market $i$ given $W_i, \theta$, and $u_i^{(r)}$.
- Compute the simulated probability of entry:
\begin{equation}
P_{ik}(W_i, \theta, u_i^{(1)}, \cdots, u_i^{(R)}) = \frac{1}{R} \sum_{r = 1}^R d_{ik}(W_i, \theta, u_i^{(r)}).
\end{equation}
- Estimate the parameter by:
\begin{equation}
\hat{\theta} = \text{argmin}_\theta \frac{1}{T} \sum_{i = 1}^T \frac{1}{K_i}\sum_{k = 1}^{K_i} [I_{ik} - P_{ik}(W_i, \theta, u_i^{(1)}, \cdots, u_i^{(R)})]^2,
\end{equation}
where $I_{ik}$ takes 1 if firm $k$ enters market $i$ in the data.
 



### Entry in the Airline Industry: Data 

- \textit{Origin and Destination Survey of Air Passenger Traffic} (O\&D survey).
- Focus on 1980Q1 and Q3.
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/entryexit} 

}

\end{figure}



### Entry in the Airline Industry: Simulation Estimates
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/estimation} 

}

\end{figure}


### Set Identification

- A model may not predict a unique outcome.
- However, it still restricts the set of possible outcomes.
- We can use these restrictions to infer the parameter.
- Such restrictions may be too weak to point identify the parameter, but allows \textbf{set identification}.



### Set Identification

- Let $\Theta$ is the set of parameters and $\mathcal{P}: \Theta \to \Delta(Y, X)$ be the set of possible data distributions under parameter $\theta$.

- The mapping $\mathcal{P}$ is multi-valued if the model does not predict a unique outcome.

- Suppose we observe a data distribution on $(X, Y)$, say $\pi \in \Delta(Y, X)$.
- Given the model $\mathcal{P}$, the set of parameters that are consistent with the observation $\pi$ is:
\begin{equation}
\{\theta \in \Theta: \pi \in \mathcal{P}(\theta)\},
\end{equation}
which is called the \textbf{identified set}.
- If the identified set is a singleton, the parameter is point-identified.



### Identified Set in the Two Player Entry Game

- No firm event happens with probability:
\begin{equation}
\mathbb{P}\{D_1 = 0, D_2 = 0|x, z_1, z_2\} = \mathbb{P}\{\epsilon_1 < - \overline{\pi}^M(x, z_1), \epsilon_2 < - \overline{\pi}^M(x, z_2)|x, z_1, z_2\}.
\end{equation}
- Duopoly event happens with probability:
\begin{equation}
\scriptsize
\mathbb{P}\{D_1 = 1, D_2 = 1|x, z_1, z_2\}= \mathbb{P}\{\epsilon_1 > - \overline{\pi}^D(x, z_1), \epsilon_2 > -\overline{\pi}^D(x, z_2) |x, z_1, z_2\}.
\end{equation}
- The bounds for firm 1 monopoly probability is:
\begin{equation}
\begin{split}
&\mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1, \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\} - \\
&\mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1 \le -\overline{\pi}^D(x, z_1), -\overline{\pi}^M(x, z_2) \le \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\}\\
&\le \mathbb{P}\{D_1 = 1, D_2 = 0|x, z_1, z_2\}\\
&\le \mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1, \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\}.
\end{split}
\end{equation}
- The bounds for firm 2 monopoly probability is obtained in the same way.




### Entry in the Airline Industry: Bounds Estimation

- Let the lower bound functions be:
\begin{equation}
\begin{split}
\underline{H}(0, 0|x, z_1, z_2) &= \mathbb{P}\{\epsilon_1 < - \overline{\pi}^M(x, z_1), \epsilon_2 M -\overline{\pi}^M(x, z_2) |x, z_1, z_2\},\\
\underline{H}(1, 1|x, z_1, z_2) &= \mathbb{P}\{\epsilon_1 > - \overline{\pi}^D(x, z_1), \epsilon_2 > -\overline{\pi}^D(x, z_2) |x, z_1, z_2\},\\
\underline{H}(1, 0|x, z_1, z_2) &=\mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1, \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\}\\
&- \mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1 \le -\overline{\pi}^D(x, z_1),\\
& -\overline{\pi}^M(x, z_2) \le \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\},\\
\underline{H}(0, 1|x, z_1, z_2) &=\mathbb{P}\{ \epsilon_1 \le -\overline{\pi}^D(x, z_1),  -\overline{\pi}^M(x, z_2) \le \epsilon_2|x, z_1, z_2\}\\
&- \mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1 \le -\overline{\pi}^D(x, z_1),\\
& -\overline{\pi}^M(x, z_2) \le \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\}
\end{split}
\end{equation}
- This is the lower bound of the probabilities of each equilibrium.
 


### Entry in the Airline Industry: Bounds Estimation

- Let the upper bound functions be:
\begin{equation}
\begin{split}
\overline{H}(0, 0|x, z_1, z_2) &= \mathbb{P}\{\epsilon_1 < - \overline{\pi}^M(x, z_1), \epsilon_2 < -\overline{\pi}^M(x, z_2) |x, z_1, z_2\},\\
\underline{H}(1, 1|x, z_1, z_2) &= \mathbb{P}\{\epsilon_1 > - \overline{\pi}^D(x, z_1), \epsilon_2 > -\overline{\pi}^D(x, z_2) |x, z_1, z_2\},\\
\overline{H}(1, 0|x, z_1, z_2) &=\mathbb{P}\{-\overline{\pi}^M(x, z_1) \le \epsilon_1,  \epsilon_2 \le -\overline{\pi}^D(x, z_2) |x, z_1, z_2\},\\
\overline{H}(0, 1|x, z_1, z_2) &=\mathbb{P}\{ \epsilon_1 \le -\overline{\pi}^D(x, z_1),  -\overline{\pi}^M(x, z_2) \le \epsilon_2|x, z_1, z_2\}.
\end{split}
\end{equation}
- This is the upper bound of the probabilities of each equilibrium.
 


### Entry in the Airline Industry: Simulate the Bounds

- The bounds do not necessarily have analytical expression.
- Then, we can draw $R$ errors $\epsilon_i^{(r)} = (\epsilon_{i1}^{(r)}, \epsilon_{i2}^{(r)})$ to compute the bounds.
- For example, we can compute the upper bound for $(1, 0)$ in market $i$ with  $(x_i, z_{i1}, z_{i2})$ evaluated at a parameter $\theta$ by:
\begin{equation}
\begin{split}
&\overline{H}(1, 0|x_i, z_{i1}, z_{i2}; \epsilon_{i}^{(1)}, \cdots, \epsilon_i^{(R)}) \\
&= \frac{1}{R} \sum_{r = 1}^R 1\{ -\overline{\pi}^M(x_i, z_{i1}) \le \epsilon_{i1}^{(r)},  \epsilon_{i2}^{(r)} \le -\overline{\pi}^D(x_i, z_{i2})\}.
\end{split}
\end{equation}
- You can compute the upper/lower bounds for other equilibria and at other markets as well.
 


### Entry in the Airline Industry: Moment Condition

- In estimation using moment \textbf{equalities}, we penalize a parameter when the moment is away from zero.
- Now we consider estimation using moment \textbf{inequalities} in addition to moment equalities.
- In this case, we penalize a parameter only when it is away from zero in one direction.
 


### Entry in the Airline Industry: Estimate the Reduced-form Probability

- We can estimate the probability of $(D_1, D_2)$ conditional on $(x, z_1, z_2)$ using data across markets:
\begin{equation}
 \hat{P}(d_1, d_2|x, z_1, z_2)  = \frac{1}{T} \sum_{i = 1}^T 1\{D_{i1} = d_1, D_{i2} = d_2|x, z_1, z_2\}.
\end{equation} 
- This summarizes the data distribution.
- We try to find parameters that are consistent with this data distribution.
 


### Entry in the Airline Industry: Objective Function

- Given the simulated bounds at each market, we can consider the following objective function:
\begin{equation}
\begin{split}
\hat{Q}(\theta) = \frac{1}{T} \sum_{i = 1}^T \Bigg\{ &[\hat{P}(x_i, z_{1i}, z_{2i})  - \underline{H}(x_i, z_{1i}, z_{2i}; \epsilon_{i}^{(1)}, \cdots, \epsilon_i^{(R)})]_{-} \\
&+ [\hat{P}(x_i, z_{1i}, z_{2i})  - \overline{H}(x_i, z_{1i}, z_{2i}; \epsilon_{i}^{(1)}, \cdots, \epsilon_i^{(R)})]_{+}]\Bigg\},
\end{split}
\end{equation}
where $[x]_{-} = 1\{x < 0\} |x|$ and $[x]_{+} = 1\{x > 0\} |x|$.
- Parameter $\theta$ such that $\hat{Q}(\theta) = 0$ is consistent with the data.
 


### Entry in the Airline Industry: Heterogeneous Competitive Effect

- In the previous application, we can use either of the bounds approach and the aggregation approach.
- In some cases, we cannot use the aggregation approach, that is, there is a situation where even the equilibrium number of firms is not unique.
- For example, if there is heterogeneous competitive effect, the entry game does not have a unique prediction on the number of entrants:
\begin{equation}
\pi_{ik} = X_k \beta_k + Z_{ik} \alpha_k + \underbrace{\sum_{l \neq k} \delta_l^k D_{li} + \sum_{l \neq k} Z_{li} \phi_l^k D_{li}}_{\text{heterogeneous competitive effect}} + \epsilon_{il}.
\end{equation}
- Then, the only way is to assume the order of entry or the bounds approach.
 


### Entry in the Airline Industry: Data

- Ciliberto \& Tamer (2009).
- They use the same O\&D survey.
- They focus on 2001Q2.
- They mainly study the heterogeneous competitive effects between legacy carriers and LCCs.



\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/ct1} 

}

\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/ct2} 

}

\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/ct3} 

}

\end{figure}


<!--chapter:end:05-entryexit.Rmd-->

# Single-agent Dynamics {#dynamics}

## Dynamic Models

### Dynamic Models

- There is an \textbf{endogenous state variable}, a state variable that is affected by the action of players.


- Payoff linkages:

- Demand:

- Durable good: The stock of a product is the endogenous state variable. Tomorrow's demand depends on how many consumers purchase and consume today, which depends on the today's price and the future pricing plan.

- Cost:

- Learning by doing: The productivity of a firm is the endogenous state variable. Tomorrow's productivity depends on how many the firm produces today.

- Information linkages:

- Uncertainty about the quality: The belief about the quality of a product is the endogenous variable. Tomorrow's demand depends on the tomorrow's belief about the quality of the product, which depends on the consumer's consumption decision today, which depends on the today's price.

- Strategic linkages:

- Tacit collusion: The history of actions is the endogenous state variable. Tomorrow's rivals' actions depend on today's action.



- This lecture covers the payoff and information linkages.



### A Simple Framework

- We consider a simple set-up:

- Single agent.
- Infinite discrete time.
- Finitely many choices.
- Finite state space.
- Markovian framework.




### Set-up

- There is one agent.
- Time is $t = 1, 2, \cdots, \infty$.
- There are $K + 1$ actions $A = \{0, 1, \cdots, K\}$.
- There are $L$ states $S = \{1, \cdots, L\}$.



### Timing of the Model

- At period $t$:

- State $s^t$ is publicly observed, $s^t \in S$.
- Choice-specific profitability shocks are privately observed, $\epsilon^t \in \mathbb{R}^{ K + 1}$, and
$\epsilon^t \sim F(\cdot|s^t)$, i.i.d.
- Choice is made, $a^t \in A$.
- State evolves according to a transition probability:
\begin{equation}
g(a, s, s') \equiv \mathbb{P}\{s^{t + 1} = s'|s^t = s, a^t = a\},
\end{equation}

\begin{equation}
G \equiv 
\begin{pmatrix}
g(0, 1, 1) & \cdots & g(0, 1, L)\\
\vdots & & \vdots \\
g(0, L, 1) & \cdots & g(0, L, L)\\
& \vdots & \\
g(K, 1, 1) & \cdots & g(K, 1, L)\\
\vdots & & \vdots \\
g(K, L, 1) & \cdots & g(K, L, L)\\
\end{pmatrix}.
\end{equation}




### Period Payoff

- When the state is $s^t$, action is $a^t$, and the profitability shocks are $\epsilon^t$, the period payoff is:
\begin{equation}
\pi(a^t, s^t) + \sum_{k = 1}^K \epsilon^{tk} 1\{a_t = k\},
\end{equation}
where $\pi(a^t, s^t)$ is the mean period profit, and let $\Pi$ be:
\begin{equation}
\Pi =
\begin{pmatrix}
\pi(0, 1)\\
\vdots \\
\pi(0, L)\\
\vdots \\
\pi(K, 1)\\
\vdots \\
\pi(K, L)\\
\end{pmatrix}.
\end{equation}
- The profit is the discounted sum of future payoffs with discount factor $\beta < 1$.



### Markovian Framework

- The strategy is in general a mapping from the entire history to the action set.
- We restrict the set of possible strategies to Markovian strategies $a(\epsilon^t, s^t)$.
- i.e., the behavior does not depend on the past states, conditional on today's states.
- Beliefs about future behavior is denoted by $\sigma(a|s)$, and let $\sigma$ be:
\begin{equation}
\sigma = [\sigma(0|1), \cdots, \sigma(0|L), \cdots, \sigma(K|1), \cdots, \sigma(K|L)]'.
\end{equation}



### Decision Problem

- The agent chooses strategy $a(\cdot, \cdot)$ such that:
\begin{equation}
\begin{split}
\max_{a(\cdot, \cdot)} & \pi(a(\epsilon^0, s^0), s^0) + \sum_{k = 1}^K \epsilon^{0k} 1\{a(\epsilon^0, s^0) = k\}\\
&+ \mathbb{E}\Bigg\{ \sum_{t = 1}^\infty \beta^t \Bigg[\pi(a^t, s^t) + \sum_{k = 1}^K \epsilon^{tk} 1\{a^t = k\}\Bigg]\Bigg|s^0, a(\epsilon^0, s^0)\Bigg\}
\end{split}
\end{equation}
subject to the transition probability and the distribution of the profitability shocks.



### Value Function

- When the belief about the future behavior is $\sigma$, then the value function associated with the belief is:
\begin{equation}
\begin{split}
&V(\sigma, s^0, \epsilon^0)\\
&= \sum_{a \in A} \sigma(a|s^0) \Bigg\{\pi(a, s^0) + \epsilon^{0a} + \mathbb{E}\Bigg[ \sum_{t = 1}^\infty \beta^t \sum_{a \in A}\sigma(a|s^t)\Bigg(\pi(a, s^t) + \epsilon^{ta}\Bigg)\Bigg|s^0, a\Bigg] \Bigg\}\\
& = \sum_{a \in A} \sigma(a|s^0) \Bigg\{\pi(a, s^0) + \epsilon^{0a} + \beta \mathbb{E}\Bigg[V(\sigma, s^1, \epsilon^1)\Bigg|s^0, a\Bigg]\Bigg\}\\
& = \sum_{a \in A} \sigma(a|s^0) \Bigg\{\pi(a, s^0) + \epsilon^{0a} + \beta \sum_{s^1 \in S} V(\sigma, s^1, \epsilon^1)g(a, s^0, s^1)\Bigg\}.
\end{split}
\end{equation}
- The \textbf{ex-ante value function} with the belief is defined to be:
\begin{equation}
V(\sigma, s) = \mathbb{E}\{V(\sigma, s, \epsilon)|s\}.
\end{equation}



### Decision Problem

- When the current state and profitability shocks are $s$ and $\epsilon$ and the belief about the future behavior is $\sigma$, the \textbf{choice-specific value function} for an agent in a period is written as:
\begin{equation}
\begin{split}
V(a, s, \epsilon) &= \pi(a , s) + \epsilon^a + \beta \sum_{s' \in S} V(\sigma, s') g(a, s, s')\\
 &= \underbrace{\pi(a , s) + \beta \sum_{s' \in S} V(\sigma, s') g(a, s, s')}_{v(\sigma, a, s)} + \epsilon^a.
\end{split}
\end{equation}
- We call $v(\sigma, a, s)$ be the \textbf{choice-specific mean value function} with belief $\sigma$.



### Optimality Condition

- When the state and profitability shocks are $s$ and $\epsilon$, $a$ is the optimal choice if and only if:
\begin{equation}
v(\sigma, a, s) + \epsilon^{a} \ge v(\sigma, a', s) + \epsilon^{a'}, \forall a' \in A.
\end{equation}
- This condition looks similar to the optimality condition in static discrete choice models.
- The only difference from the static discrete choice model is that the mean indirect utility is the sum of the choice-specific mean profit and the discounted continuation value.



### Optimal Choice Probability

- Therefore, the \textbf{optimal choice probability} with belief $\sigma$ is:
\begin{equation}
\begin{split}
p(a|s, \sigma) &= \mathbb{P}\{v(\sigma, a, s) + \epsilon^{a} \ge v(\sigma, a', s) + \epsilon^{a'}, \forall a' \in A\}\\
&= \int \prod_{a' \neq a} 1\{v(\sigma, a, s) + \epsilon^{a} \ge v(\sigma, a', s) + \epsilon^{a'}\} dF\\
&\equiv \Psi(a, s, \sigma).
\end{split}
\end{equation}
- $\Psi(a, s, \sigma)$ maps the tuple of action, state and belief to the optimal choice probability of the action given the state and the belief.



### Optimal Choice Probability Mapping

- Let $p$ and $\Psi$ be:
\begin{equation}
p = [p(0|1), \cdots, p(0|L), \cdots, p(K|1), \cdots, p(K|L)]',
\end{equation}

\begin{equation}
\Psi(\sigma) = [\Psi(0, 1, \sigma), \cdots, \Psi(0, L, \sigma), \cdots, \Psi(K, 1, \sigma), \cdots, \Psi(K, L, \sigma)]'.
\end{equation}
- \textbf{The optimality condition} with respect to the choice probabilities given the belief is:
\begin{equation}
p = \Psi(\sigma).
\end{equation}
- The \textbf{rational expectation hypothesis} requires: 
\begin{equation}
p = \Psi(p).
\end{equation}
- The optimal choice probability under the rational expectation hypothesis is a fixed point of the mapping $\Psi$.



### Mapping from a Choice Probability to an Ex-ante Value Function

- In the previous model, you could derive the ex-ante value function given choice probabilities by:
\begin{equation}
\begin{split}
V(s) &= \mathbb{E}\{V(s, \epsilon)|s\}\\
&= \mathbb{E}\Bigg[ \sum_{t = 0}^\infty \beta^t \sum_{a \in A}p(a|s^t)\Bigg(\pi(a, s^t) + \epsilon^{ta}\Bigg)\Bigg|s^0, a\Bigg]\\
&\equiv \varphi(p, s).
\end{split}
\end{equation}



### Mapping from an Ex-ante Value Function to a Choice Probability

- On the other hand, you can derive the choice probability given ex-ante value function by:
equation
\begin{equation}
\begin{split}
p(a|s) = \mathbb{P}\Bigg\{&\pi(a , s) + \beta \sum_{s' \in S} V(s') g(a, s, s') + \epsilon^a \ge\\
&\pi(a' , s) + \beta \sum_{s' \in S} V(s') g(a', s, s') + \epsilon^{a'}, \forall a' \in A \Bigg\}\\
&\equiv \Lambda(V, s).
\end{split}
\end{equation}



### The Optimality Conditions

- In terms of the choice probabilities:
\begin{equation}
p = \Psi(p).
\end{equation}
- In terms of the ex-ante value function:
\begin{equation}
V = \Lambda(p) = \Lambda(\varphi(V)) \equiv \Phi(V).
\end{equation}



### Type-I Extreme Value

- If $\epsilon$ is drawn from i.i.d. Type-I extreme value distribution, we can derive the mapping from the ex-ante value function to the choice probability in a closed form:
\begin{equation}
\begin{split}
p(a|s) &= \mathbb{P}\{\pi(a , s) + \beta \sum_{s' \in S} V(s') g(a, s, s') + \epsilon^{a} \ge\\
 & \pi(a' , s) + \beta \sum_{s' \in S} V(s') g(a', s, s') + \epsilon^{a'}, \forall a' \in A\}\\
&=\frac{\exp[\pi(a , s) + \beta \sum_{s' \in S} V(s') g(a, s, s')]}{\sum_{a' \in A} \exp[\pi(a' , s) + \beta \sum_{s' \in S} V(s') g(a', s, s')]}.
\end{split}
\end{equation}



### Type-I Extreme Value

- If $\epsilon$ is drawn from i.i.d. Type-I extreme value distribution, we can also derive the mapping from the choice probability to the ex-ante value function:
\begin{equation}
\begin{split}
V(s) &= \mathbb{E}\{\max_{a \in A} \pi(a , s) + \beta \sum_{s' \in S} V(s') g(a, s, s') + \epsilon^{a}\} \\
&=\log \Bigg\{\sum_{a \in A} \exp[\pi(a , s) + \beta \sum_{s' \in S} V(s') g(a, s, s')] \Bigg\} + \gamma,
\end{split}
\end{equation}
where $\gamma$ is Euler's constant.



### Crucial Underlying Assumptions

- \textbf{Conditional i.i.d. Unobservable}: The profit shocks that are unobservable to econometrician are i.i.d. conditional on the observable state.
- \textbf{Additive separable shocks}: The profit shocks that are unobservable to the econometrician is additively separable in the period profit. 
- \textbf{Conditional Independence of Future Observable State}: 
\begin{equation}
\mathbb{P}\{s^{t + 1}|s^t, a^t, \epsilon^t\} = \mathbb{P}\{s^{t + 1}|s^t, a^t\}.
\end{equation}



### Crucial Underlying Assumptions

- Thanks to the first assumption we can write the optimal choice probability as the function of the observable state of the period.

- If $\epsilon_t$ is serially correlated, to integrate over $\epsilon_{t + 1}$ we have to condition on $\epsilon_t$.

- Because of the second and third assumptions, we can write the choice probability as:
\begin{equation}
p(a|s, \sigma) = \mathbb{P}\{v(\sigma, a, s) + \epsilon^{a} \ge v(\sigma, a', s) + \epsilon^{a'}, \forall a' \in A\}
\end{equation}
that looks similar to the static discrete choice models.



### Identification

- The model primitives are $(\Pi, F, \beta, G)$.
- The transition probability $G$ is directly identified from the data because $a, s, s'$ are observed by econometrician.
- It is known that the model is in general not identified (Magnac and Thesmer 2002).



### Identification

- The discount factor $\beta$ is hard to identify. 

- It determines the weight between the current and future profits.
- Suppose that a firm makes a large investment. This may be because the firm overweights the future (high $\beta$) or because the investment cost is low ($\pi$ is such that the investment cost is low).
- We cannot distinguish between these two possibilities.
- To identify it, you need some instruments that changes the future return to the investment but does not affect today's payoff.




### Identification

- We often fix $\beta$ and $F$ and consider the identification of $\Pi$.
- Note that the optimal choice probability is directly identified from the data because $s$ and $a$ are observed.
- Then the optimality condition under the rational expectation hypothesis gives the following $KL$ system of equations $p = \Psi(p)$.
- On the other hand, the dimension of parameter $\Pi$ is in general $(K + 1)L$ (the mean profit at a state and an action).
- One possible restriction is to assume that $\pi(0, s)$ are known for any $s$. For example, assume that $a = 0$ means that the firm is inactive and so $\pi(0, s) = 0$.



### Dynamic Entry/Exit Model

- Every period, a monopolist decides whether to open/close the store given the market condition.
- Action: $a^t \in \{0, 1\}$, becoming inactive or active.
- State: $s^t \in \{0, 1\}$, being inactive or active.
- State transition: $s^t = a^{t - 1}$ (deterministic).
- Payoff:
\begin{equation}
1(a^t = 1)[x + \epsilon^{t1} - e 1(s^t = 0)],
\end{equation}
where $x$ is the mean variable profit of opening the store, $e$ is the entry cost.



### Bus Engine Replacement Decisions

- Rust (1987) studies the bus engine replacement decision of Harold Zurcher, superintendent of maintenance at the Madison Metropolitan Bus Company.
- Time is month $t = 1, 2, \cdots, \infty$.
- Action $a_t \in \{0, 1\}$ represents whether to replace bus engine or not.
- State $s_t \in \{1, 2, 3\}$ represents the mileage:

- $[0, 5000)$, $[5000, 10000)$, $[10000, +\infty)$.





### Period Profit and Transition Law

- Period profit:

- $-c(s_t, \theta_1)$: the expected per period operating costs (the sum of maintenance, fuel, and insurance costs).
- $RC$: the fixed replacement cost.
- The mean period profit:
\begin{equation}
\pi(s_t, a_t, \theta_1, RC) = -c(s_t, \theta_1)(1 - a_t) + [-c(0, \theta_1) - RC]a_t
\end{equation}
- There are additive profit shocks that are drawn from an i.i.d. Type-I extreme value distribution.




### Transition Law

- Transition law:
- The mileage traveled each month by a given bus is exponentially distributed with parameter $\theta_2$, independently of mileage driven in previous period.
\begin{equation}

g(s_t, s_{t + 1}, a_t; \theta_1) = 
\begin{cases}
\theta_2 \exp[\theta_2(s_{t + 1} - s_t)] &\text{   if   }a_t = 0, s_{t + 1} \ge s_t\\
\theta_2 \exp[\theta_2(s_{t + 1} - s_t)] &\text{   if   }a_t = 1, s_{t + 1} \ge 0\\
0 &\text{   otherwise}.
\end{cases}
\end{equation}



### Bellman Equation

- The Bellman equation is:
\begin{equation}

V(s_t, \epsilon_t) = \max_{a_t}\{\pi(s_t, a_t, \theta_1, RC) + \epsilon_t(a_t) + \beta \mathbb{E}[\mathbb{E}[V(s_{t + 1}, \epsilon_{t + 1})|s_t]|s_t, a_t]\}.
\end{equation}
- The optimal policy is:
\begin{equation}
\begin{split}
&f(s_t, \epsilon_t, \theta_1, \theta_2, RC)\\
&= \text{argmax}_{a_t} \{\pi(s_t, a_t, \theta_1, RC) + \epsilon_t(a_t) + \beta \mathbb{E}[\mathbb{E}[V(s_{t + 1}, \epsilon_{t + 1})|s_t]|s_t, a_t]\}.
\end{split}
\end{equation}
- The optimal choice probability is:
\begin{equation}
\begin{split}
p(a_t|s_t, \theta_1, \theta_2, RC)=\frac{\exp\{\pi(s_t, a_t, \theta_1, RC) + \beta \mathbb{E}[V(s_{t + 1})|s_t, a_t]\}}{\sum_{a = 0}^1 \exp\{\pi(s_t, a, \theta_1, RC) + \beta \mathbb{E}[V(s_{t + 1}|s_t, a]\}}.
\end{split}
\end{equation}



### Solving for the Ex-ante Value Function

- How to find the optimal policy (choice probability) and the value function given parameters $\theta = (\theta_1, \theta_2, RC)$?
- The Bellman equation in terms of the ex-ante value function is:
\begin{equation}
\begin{split}
&\mathbb{E}[V(s_{t + 1})|s_t, a_t]\\
& = \int \log \Bigg\{\sum_{a = 0}^1 \exp\{ \pi(s_{t + 1}, a, \theta_1, RC)\\
 &+ \beta \mathbb{E}[V(s_{t + 2})|s_{t + 1}, a)]\} \Bigg\}g(s_{t + 1}|s_t, a) d s_{t + 1} + \gamma.
\end{split}
\end{equation}



### Solving for the Ex-ante Value Function

- The ex-ante value function is a fixed point of this mapping, and the mapping is a contraction mapping as long as $\beta < 1$.

- Starting from arbitrary function $W^{(0)}(s, a)$.
- Iterate:
\begin{equation}
\begin{split}
&W^{(r + 1)}(s, a)\\
& = \int \log \Bigg\{\sum_{a' = 0}^1 \exp\{ \pi(s', a', \theta_1, RC)\\
&+ \beta W^{(r)}(s', a')\} \Bigg\}g(s'|s, a; \theta_2) d s' + \gamma.
\end{split}
\end{equation}
until $d(W^{(r + 1)}, W^{(r)} )$ is below some threshold.





### Solving for the Optimal Choice Probability

- Let $W^{(*)}(s, a; \theta)$ be the solution to the previous fixed-point algorithm.
- Then, we can derive the optimal choice probability as:
\begin{equation}
\begin{split}
p^{(*)}(a|s; \theta)=\frac{\exp\{\pi(s, a, \theta_1, RC) + \beta W^{(*)}(s, a; \theta) \}}{\sum_{a' = 0}^1 \exp\{\pi(s, a', \theta_1, RC) + \beta W^{(*)}(s, a'; \theta)\}}.
\end{split}
\end{equation}
- These are the ex-ante value function and optimal choice probabilities under parameters $\theta = (\theta_1, \theta_2, RC)$.
- Fixed-point algorithm can be run through the value function or policy function instead of the ex-ante value function.



### Estimation by Nested Fixed-Point Algorithm

- The previous algorithm allows you to derive the optimal choice probability given parameters.
- Then it is straight forward to evaluate the likelihood function given observations $\{a_t, s_t\}_{t = 1}^T$:
\begin{equation}
\begin{split}
&L(\theta; \{a_t, s_t\}_{t = 1}^T) =\prod_{t = 1}^T \prod_{a_t = 0}^1 p^{(*)}(a_t|s_t; \theta)^{a_t} g(s_{t + 1}|s_t, a_t; \theta_2).
\end{split}
\end{equation}
and so the log likelihood function is:
\begin{equation}
\begin{split}
&l(\theta; \{a_t, s_t\}_{t = 1}^T)\\
&=\sum_{t = 1}^T \sum_{a_t = 0}^1 a_t \log [p^{(*)}(a_t|s_t; \theta)] + \sum_{t = 1}^T \log g(s_{t + 1}|s_t, a_t; \theta_2).
\end{split}
\end{equation}
- This estimation algorithm is called a \textbf{nested fixed-point algorithm} because a fixed-point algorithm.



### Full and Partial Likelihood

- We can find $\theta$ that maximizes the full log likelihood $l(\theta; \{a_t, s_t\}_{t = 1}^T)$ to estimate the model.
- However, the convergence takes longer as the number of parameters are larger.
- Parameters that govern the state transition is estimated by finding $\theta_2$ that maximizes the partial likelihood:
\begin{equation}
\hat{\theta}_2 = \text{argmax}_{\theta_2} \sum_{t = 1}^T \log g(s_{t + 1}|s_t, a_t; \theta_2).
\end{equation}
- Then we can estimate $\theta_1$ and $RC$ by finding $\theta_1$ and $RC$ that maximize the partial likelihood:
\begin{equation}
(\hat{\theta}_1', \hat{RC})' = \text{argmax}_{\theta_1, RC} \sum_{t = 1}^T \sum_{a_t = 0}^1 a_t \log [p^{(*)}(a_t|s_t; \theta_1, \hat{\theta}_2, RC)].
\end{equation}
- This causes some efficiency loss but speeds up the convergence.




### Review

- Let $\theta = (\theta_1, \theta_2)$ where $\theta_1$ are the parameters in the profit function $\pi$ and $\theta_2$ are the parameters in the transition probability $g$.
- The optimal conditional choice probability $p$ under the rational expectation hypothesis in single-agent dynamic models is characterized by the equation:
\begin{equation}
p = \Psi^{\theta}(p),
\end{equation}
where $\Psi$ is determined by parameters $\theta$.



### Review

- The mapping $\Psi^\theta$ is a composite mapping for two mappings:
\begin{equation}
p = \Lambda^\theta(\varphi^\theta(p)).
\end{equation}

\begin{equation}
\begin{split}
V(s) &= \varphi^\theta(p, s)\\
&= \mathbb{E}\Bigg[ \sum_{t = 0}^\infty \beta^t \sum_{a \in A}p(a|s^t)\Bigg(\pi(a, s^t) + \epsilon^{ta}\Bigg)\Bigg|s^0, a\Bigg].
\end{split}
\end{equation}

\begin{equation}
\begin{split}
p(a|s) &= \Lambda^\theta(V, a, s)\\
&\equiv \mathbb{P}\Bigg\{\pi(a , s) + \beta \sum_{s' \in S} V(s') g(a, s, s') + \epsilon^a \ge\\
&\pi(a' , s) + \beta \sum_{s' \in S} V(s') g(a', s, s') + \epsilon^{a'}, \forall a' \in A \Bigg\}.
\end{split}
\end{equation}



### Review

- In the nested fixed-point algorithm, we find $p^\theta$ such that $p^\theta = \Psi^\theta(p^\theta)$ for each $\theta$, and search $\theta$ that maximizes:
\begin{equation}
l(\theta; \{s^t, a^t\}) = \sum_{t = 1}^T a_t \log p^\theta(a^t|s^t)  + \sum_{t = 1}^T \log g^{\theta_2}(s^{t + 1}|s^t, a^t).
\end{equation}
- This algorithm takes time because we have to run fixed-point algorithm for each functional evaluation.



### CCP Approach

- Conditional Choice Probability (CCP) approach suggested by Hotz and Miller (1993) significantly reduces the computation time at the cost of some efficiency.
- The idea is:

- We can identify the optimal conditional choice probability $p^\theta$ directly from the data. This is a reduced-form parameter ($\leftrightarrow$ $\theta$ is the structural parameters) of the model.
- The optimality condition $p^\theta = \Psi^\theta(p^\theta)$ can be regarded as a moment condition. 




### CCP Approach

- In the nested fixed-point algorithm, we find $p^\theta$ that solves the optimality condition given $\theta$ to compute the likelihood.
- In CCP approach, we find $\theta$ that solves the optimality condition given $p^\theta$ that is identified directly from the data.



### First Step: Estimating CCP

- The first step of the CCP approach is to estimate the conditional choice probability and transition probability.
- If everything is discrete, it is nothing but the empirical distribution:
\begin{equation}
\begin{split}
&\hat{p}(a|s) = \frac{\sum_{i = 1}^N \sum_{t = 1}^T 1\{a_i^t = a, s_i^t = s\}}{\sum_{i = 1}^N \sum_{t = 1} 1\{s_i^t = s\}},\\
&\hat{g}(s'|s, a) = \frac{\sum_{i = 1}^N \sum_{t = 1}^T 1\{s_i^{t + 1} = s', s_i^t = s, a_i^t = a\}}{\sum_{i = 1}^N \sum_{t = 1} 1\{s_i^t = s, a_i^t = a\}}.
\end{split}
\end{equation}



### First Step: Estimating CCP

- You can use parametric models.
- For example, you may estimate the conditional choice probability with a multinomial logit models:
\begin{equation}
\begin{split}
&\hat{p}(a|s) = \frac{\exp[\hat{\beta} a + \hat{\gamma} s)]}{\sum_{a' \in A} \exp[\hat{\beta} a' + \hat{\gamma} s)]}.
\end{split}
\end{equation}
- You may estimate the transition probability with AR(1) models:
\begin{equation}
s^{t + 1} = \hat{\rho} s^t + (1 - \hat{\rho}) \hat{\gamma} a^t + \epsilon_t, \epsilon_t \sim~ N(0, \hat{\sigma}^2),
\end{equation}
and then discretize.



### First Step: Estimating CCP

- What is the estimated CCP $\hat{p}$?
- This is a conditional choice probability \underline{at a particular equilibrium}.
- If parameter changes, then the equilibrium changes. Then, the conditional choice probability also changes.
- The reduced-form parameter $\hat{p}$ embodies the information about behaviors under the actual equilibrium but does not tell anything about behaviors under hypothetical equilibria.
- Therefore, $\hat{p}$ is not sufficient to make counterfactual prediction.



### Second Step: Estimating Structural Parameters

- Among structural parameters $\theta$, parameters in the transition probability $\theta_2$ have been already identified from the data.
- How do we identify $\theta_1$, parameters in the profit function $\pi$?
- If we fix $\theta_1$, in theory, we can compute:
\begin{equation}
\begin{split}
&\varphi^{(\theta_1, \hat{\theta}_2)}(p, s)\\
&\equiv \mathbb{E}\{V(s, \epsilon)|s\}\\
&= \mathbb{E}\Bigg[ \sum_{t = 0}^\infty \beta^t \sum_{a \in A}\hat{p}(a|s^t)\Bigg(\pi^{\theta_1}(a, s^t) + \epsilon^{ta}\Bigg)\Bigg|s\Bigg],\\
\end{split}
\end{equation}
although the expectation may not have a closed form solution.




### Second Step: Estimating Structural Parameters

- In addition, if we fix $\theta_1$, in theory, we can compute:
\begin{equation}
\begin{split}
&\Lambda^{(\theta_1, \hat{\theta}_2)}(V, a, s)\\
&\equiv \mathbb{P}\Bigg\{\pi^{\theta_1}(a , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a, s, s') + \epsilon^a \ge\\
&\pi^{\theta_1}(a' , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a', s, s') + \epsilon^{a'}, \forall a' \in A \Bigg\}
\end{split}
\end{equation}
- Combining these two mappings, we can compute:
\begin{equation}
\Psi^{(\theta_1, \hat{\theta_2})}(\hat{p}) = \Lambda^{(\theta_1, \hat{\theta}_2)}(\varphi^{(\theta_1, \hat{\theta}_2)}(\hat{p})).
\end{equation}
- Then, we can find $\theta_1$ that minimizes the distance between $\hat{p}$ and $\Psi^{(\theta_1, \hat{\theta_2})}(\hat{p})$ to find $\theta_1$ that is consistent with the observed conditional choice probabilities.



### Second Step: Estimating Structural Parameters

- Then, we can estimate $\theta_1$ by finding $\theta_1$ that satisfy the sample analogue of the moment condition:
\begin{equation}
\begin{split}
&\sum_{s = 1}^L \sum_{a = 0}^K \Bigg[\frac{n_{as}}{NT} -  \Psi^{(\theta_1, \hat{\theta}_2)}(\hat{p}, a, s)\Bigg] = 0\\
&\Leftrightarrow \sum_{s = 1}^L \sum_{a = 0}^K \Bigg[\tilde{p}(a|s) -  \Psi^{(\theta_1, \hat{\theta}_2)}(\hat{p}, a, s)\Bigg] = 0,
\end{split}
\end{equation}
where $\tilde{p}(a|s)$ is a nonparametric estimate of the optimal choice probability.
- You can replace $\tilde{p}$ with $\hat{p}$ as long as they are consistent estimators.



### Type-I Extreme Value Distribution

- $\Lambda$ and $\varphi$ do no have closed form expressions in general.
- Exception is the case where the profitability shocks $\epsilon_i^t(a)$ is drawn from i.i.d. type-I extreme value distribution.
- First, we know that $\Lambda$ can be written as:
\begin{equation}
\begin{split}
&\Lambda^{(\theta_1, \hat{\theta}_2)}(V, a, s)\\
&\equiv \mathbb{P}\Bigg\{\pi^{\theta_1}(a , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a, s, s') + \epsilon^a \ge\\
&\pi^{\theta_1}(a' , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a', s, s') + \epsilon^{a'}, \forall a' \in A \Bigg\}\\
&=\frac{\exp\Big[\pi^{\theta_1}(a , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a, s, s')\Big]}{\sum_{a' = 0}^K \exp\Big[\pi^{\theta_1}(a' , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a', s, s') \Big]}.
\end{split}
\end{equation}



### Type-I Extreme Value Distribution

- Second, we can show that $\varphi$ has a closed form solution:
\begin{equation}
\begin{split}
&\varphi^{(\theta_1, \hat{\theta}_2)}(p, s)\\
&\equiv \mathbb{E}\{V(s, \epsilon)|s\}\\
&= \mathbb{E}\Bigg[ \sum_{t = 0}^\infty \beta^t \sum_{a \in A}\hat{p}(a|s^t)\Bigg(\pi^{\theta_1}(a, s^t) + \epsilon^{ta}\Bigg)\Bigg|s\Bigg]\\
&=\mathbb{E}\Bigg[\sum_{a \in A}\hat{p}(a|s)\Bigg(\pi^{\theta_1}(a, s) + \epsilon^{a} + \beta \sum_{s' \in S} \mathbb{E}\{V(s, \epsilon)|s'\} g^{\hat{\theta}_2}(a, s, s')  \Bigg)\Bigg|s\Bigg]\\
&=\mathbb{E}\Bigg[\sum_{a \in A}\hat{p}(a|s)\Bigg(\pi^{\theta_1}(a, s) + \epsilon^{a} + \beta \sum_{s' \in S} \varphi^{(\theta_1, \hat{\theta}_2)}(p, s') g^{\hat{\theta}_2}(a, s, s')  \Bigg)\Bigg|s\Bigg]\\
&=\sum_{a \in A}\hat{p}(a|s)\Bigg(\pi^{\theta_1}(a, s) + \mathbb{E}[\epsilon^{a}|s, a] + \beta \sum_{s' \in S} \varphi^{(\theta_1, \hat{\theta}_2)}(p, s') g^{\hat{\theta}_2}(a, s, s')  \Bigg)
\end{split}
\end{equation}
- We need closed form expression of $\mathbb{E}[\epsilon^{a}|s, a]$. 



### Type-I Extreme Value Distribution
\begin{equation}
\begin{split}
\mathbb{E}[\epsilon^{a}|s, a] &= p(a|s)^{-1} \int \epsilon^a 1\Bigg\{\pi^{\theta_1}(a , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a, s, s') + \epsilon^a \ge\\
&\pi^{\theta_1}(a' , s) + \beta \sum_{s' \in S} V(s') g^{\hat{\theta}_2}(a', s, s') + \epsilon^{a'}, \forall a' \in A \Bigg\}dF(e)\\
&= \gamma - \ln p(a|s),
\end{split}
\end{equation}
where $\gamma$ is Euler's constant:
\begin{equation}
\gamma \equiv \lim_{n \to \infty} \Bigg(\sum_{k = 1}^n \frac{1}{k} - \ln(n) \Bigg) \approx 0.57721...
\end{equation}
if $\epsilon^a$ is drawn from i.i.d. type-I extreme value distribution.


### Type-I Extreme Value Distribution

- Inserting this into the previous expression, we get:
\begin{equation}
\begin{split}
&\varphi^{(\theta_1, \hat{\theta}_2)}(p, s)\\
& = \sum_{a \in A}\hat{p}(a|s)\Bigg(\pi^{\theta_1}(a, s) + \gamma - \ln p(a|s)\\
&+ \beta \sum_{s' \in S} \varphi^{(\theta_1, \hat{\theta}_2)}(p, s') g^{\hat{\theta}_2}(a, s, s')  \Bigg).
\end{split}
\end{equation}



### Type-I Extreme Value Distribution

- Write the continuation value in a matrix form:
\begin{equation}

\begin{split}
& \sum_{s' \in S} \varphi^{(\theta_1, \hat{\theta}_2)}(p, s') g^{\hat{\theta}_2}(a, s, s')\\
& = [g^{\hat{\theta}_2}(a, s, 1), \cdots, g^{\hat{\theta}_2}(a, s, L)] 
\underbrace{\begin{bmatrix}
\varphi^{(\theta_1, \hat{\theta}_2)}(p, 1)\\
\vdots\\
\varphi^{(\theta_1, \hat{\theta}_2)}(p, L).
\end{bmatrix}}_{\equiv \varphi^{(\theta_1, \hat{\theta}_2)}(p)}
\end{split}
\end{equation}



### Type-I Extreme Value Distribution

- Write the ex-ante value function in a matrix form:
\begin{equation}
\begin{split}
&\varphi^{(\theta_1, \hat{\theta}_2)}(p, s)\\
&=\underbrace{[p(0|s), \cdots, p(K|s)]}_{\equiv p(s)'} \\
&\times\begin{bmatrix}
\underbrace{\begin{bmatrix}
\pi^{\theta_1}(0, s)\\
\vdots\\
\pi^{\theta_1}(K, s)
\end{bmatrix}}_{\equiv \pi^{\theta_1}(s)}
+ \gamma
-
\underbrace{\begin{bmatrix}
\ln p(0|s)\\
\vdots\\
\ln p(K|s)
\end{bmatrix}}_{\equiv \ln p(s)}
+\beta
\underbrace{\begin{bmatrix}
g^{\hat{\theta}_2}(0, s, 1), \cdots, g^{\hat{\theta}_2}(0, s, L)\\
\vdots\\
g^{\hat{\theta}_2}(K, s, 1), \cdots, g^{\hat{\theta}_2}(K, s, L)
\end{bmatrix}}_{\equiv G^{\hat{\theta}_2}(s)}
\varphi^{(\theta_1, \hat{\theta}_2)}(p)
\end{bmatrix}\\
&=p(s)'[\pi^{\theta_1}(s) + \gamma - \ln p(s)] + \beta p(s)' G^{\hat{\theta}_2}(s)  \varphi^{(\theta_1, \hat{\theta}_2)}(p)
\end{split}
\end{equation}



### Type-I Extreme Value Distribution

- Stacking up for $s$, we get:
\begin{equation}
\begin{split}
&\varphi^{(\theta_1, \hat{\theta}_2)}(p) =
\begin{bmatrix}
p(1)'[\pi^{\theta_1}(1) + \gamma - \ln p(1)]\\
\vdots\\
p(L)'[\pi^{\theta_1}(L) + \gamma - \ln p(L)]
\end{bmatrix}
+\beta
\begin{bmatrix}
p(1)' G^{\hat{\theta}_2}(1)\\
\vdots\\
p(L)' G^{\hat{\theta}_2}(L)
\end{bmatrix}
\varphi^{(\theta_1, \hat{\theta}_2)}(p)\\
&\Leftrightarrow\\
&\varphi^{(\theta_1, \hat{\theta}_2)}(p) = 
\begin{bmatrix}
I -
\beta
\begin{bmatrix}
p(1)' G^{\hat{\theta}_2}(1)\\
\vdots\\
p(L)' G^{\hat{\theta}_2}(L)
\end{bmatrix}
\end{bmatrix}^{-1}
\begin{bmatrix}
p(1)'[\pi^{\theta_1}(1) + \gamma - \ln p(1)]\\
\vdots\\
p(L)'[\pi^{\theta_1}(L) + \gamma - \ln p(L)]
\end{bmatrix}.
\end{split}
\end{equation}
- Note that you can get this expression even if the profitability shocks are not type-I extreme value, although you need numerical integration for $\mathbb{E}\{\epsilon^a|s, a\}$ instead of the analytical solution $\gamma - \ln p(a|s)$.



### General Distribution

- If the profitability shock $\epsilon^a$ is not an i.i.d. type-I extreme value random variable, you may need to compute $\mathbb{E}\{\epsilon^a|s, a\}$ and $\Lambda^{(\theta_1, \hat{\theta}_2)}(V)$ numerically.
- This may or may not feasible.



### Contraceptive Choice and Voluntary Sterilization

- Application in Hotz and Miller (1993).
- In those years, voluntary sterilization were the most common method of family planning within the U.S.A.
- Data: white married couples surveyed in the National Fertility Survey of 1970-1975.
- It asks monthly records of contraceptive utilization.
- In any given year, approximately 18\% of couples at risk of child bearing used no form of contraception, 74\% used temporary contraceptive method, and 8\% chose to sterilize.

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/contraception} 

}

\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/health} 

}

\end{figure}


- U.S. Department of Health and Human Services, 2010, ``Use of Contraception in the United States: 1982–2008''.



### Contraceptive Choice and Voluntary Sterilization

- They estimate a model in which parents value the direct utility received from their children and from their own consumption.

- If we focus on households, we cannot use ``profit'' data to identify the period payoff, but have to use information revealed through their actions.

- Their consumption of these two goods are constrained by their income, the costs of rearing their own children, and their inability to control perfectly the extent and timing of childbearing.



### Contraceptive Choice and Voluntary Sterilization
\framesubtitle{Action Space}

- A household can choose either to use no contraceptive method, temporary contraception, or voluntary sterilization.
- $d_i^t = (d_{i1}^t, d_{i2}^t, d_{i3}^t)'$, where each of $d_{i1}^t, d_{i2}^t, d_{i3}^t$ take one if the household uses no contraceptive method, temporary contraception, or voluntary sterilization and take 0 otherwise, respectively.
 


### Contraceptive Choice and Voluntary Sterilization
\framesubtitle{State Space and State Transition Law}

- $s_i^t = (a_{i1}^t, a_{i2}^t, h_i^{t})'$ where:

- $a_{i1}^t$: the age of mother.
- $a_{i2}^t$: the age of father.
- $h_i^{t} = (h_{i1}^t, h_{i2}^t, h_{i3}^t)$: vector of children's age.

- If a household does not use voluntary sterilization, the household bears a child with some probability, while it never bears a child if the household uses voluntary sterilization.
- The age of mother and father increments by one every year.
 


### Contraceptive Choice and Voluntary Sterilization
\framesubtitle{Period Utility} 

- The period utility is:
\begin{equation}
u_i^t = \pi_i^t(h_i^t) + c_i^t - \psi_1 [\pi_i^t(h_i^t)]^2 - \psi_2 (c_i^t)^2 + \sum_{j = 1}^3[\mu_{j0} + \mu_{j1} a_{i1}^t + \mu_{j2} (a_{j2}^t)^2 + \mu_{j3} e_{i1} + \epsilon_{ij}^t]d_{ij}^t, 
\end{equation}
where $\epsilon_i^t$ is drawn from i.i.d. type-I extreme value distribution, $\pi_i^t(h_i^t)$ is a service flow from children:
\begin{equation}
\pi_i^t(h_i^t) = \sum_{s = 0}^{\overline{s}} \sum_{l = 1}^{\overline{l}}\eta_s1\{h_{il}^t = s\},
\end{equation}
where $\eta_s$ is a service flow from $s$ years old child, $c_i^t$ is the household's consumption, $e_{i1}$ is the mother's education level.
- Parameters in the period utility are $\{\eta_s\}_{s = 0}^{\overline{s}}, \psi_1, \psi_2$ and $\{\mu_{j0}, \mu_{j1}, \mu_{j2}, \mu_{j3}\}_{j = 1}^3$.



### Contraceptive Choice and Voluntary Sterilization
\framesubtitle{Budget Constraint and Total Income}

- Let $y_i^t$ be the total income of the household.
- The budget constraint for the household is:
\begin{equation}
 c_i^t + \sum_{s = 0}^{\overline{s}} \sum_{l = 1}^{\overline{l}} \omega_s1\{h_{il}^t = s\} = y_i^t. 
 \end{equation} 
 - The income process is assumed to be exogenous.
 - They fit a parametric model to income process:
 \begin{equation}
 y_i^t = \gamma_0 + \gamma_1 a_{i2}^t + \gamma_2 (a_{i2}^t)^2 + \gamma_3 e_{i2} + \gamma_4 e_{i2} a_{i2}^t + \gamma_5 e_{i2} (a_{i2}^t)^2 + \xi_i^t,
 \end{equation}
 where $e_{i2}$ is father's education level.

 - In those days, they could assume that the household income is exclusively from father's income.
 - This part gets complicated these days because of diverse labor participation decisions within household.

 


### Contraceptive Choice and Voluntary Sterilization
\framesubtitle{Estimation} 

- Income equation is estimated outside the dynamic model using the standard OLS.
- The child bearing probability can be fitted to a nonparametric binary model in which the state variables and decision variables enter as covariates $\to \hat{\theta}_2$.

- It is okay to fit a binary logit model.

- The optimal choice probability can be fitted to a multinomial nonparametric model in which the state variables and decision variables enter as covariates $\to \hat{p}$.

- It is okay to fit a multinomial logit model.

- Given these estimate, they find $\theta_1$ such that:
\begin{equation}
\sum_{s = 1}^L \sum_{a = 0}^K \Bigg[\tilde{p}(a|s) -  \Psi^{(\theta_1, \hat{\theta}_2)}(\hat{p}, a, s)\Bigg] = 0
\end{equation}
- Current and lagged states and a vector of ones are often included in $z_i^t$.



### Contraceptive Choice and Voluntary Sterilization: Child Bearing Probability
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/bearing1} 

}

\end{figure}



### Contraceptive Choice and Voluntary Sterilization: Child Bearing Probability
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/bearing2} 

}

\end{figure}



### Contraceptive Choice and Voluntary Sterilization: Optimal Choice Probability} 

- Holding other characteristics of a couple constant at their sample means, the estimated model indicates:

- Wives who have an additional year of education are 16.5\% less likely not to contracept 5\% less likely to sterilize, but 15\% more likely to use temporary methods.
- Wives who grow one year are 9.8\% more likely not to contracept, 1.6\% less likely to use temporary methods, and 3\% more likely to sterilize.
- For couples with only 1 child, the predicted probability of not contracepting immediate after the birth is 3\%, with 85\% using a temporary contraceptive and 12\% choosing sterilization.
- By the time the child is 5 years old, the incidence of not contracepting more than doubles to 8\% while the use of temporary methods and sterilization declines to 82\% and 10\%.




### Contraceptive Choice and Voluntary Sterilization: Structural Parameters
\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{figuretable/structural} 

}

\end{figure}


### Contraceptive Choice and Voluntary Sterilization

- With the estimates of the structural parameters, we can conduct various counterfactual simulation.
- How do contraceptive behavior and so the child bearing decisions change if the government provide $y$ yen subsidy to $n$th children bearing?
- Does it decrease the overall use of contraceptive method once the government prohibits the voluntary sterilization?
- How much of the changes in the number of child birth during the data period can be explained by the changes in the education level of the mothers?



### Relationship between CCP and MLE

- At the optimum, we have $p = \Psi^{(\theta_1, \theta_2)}(p)$.
- So the (partial) log likelihood is:
\begin{equation}
\begin{split}
&l(\theta) = \frac{1}{NT}\sum_{i = 1}^N \sum_{t = 1}^N \sum_{a = 0}^K 1\{a_{i}^t = a\} \ln \Psi^{(\theta_1, \theta_2)}(p, a, s_i^t)\\
&=\frac{1}{NT} \sum_{s = 1}^L \sum_{a = 0}^K n_{as} \ln \Psi^{(\theta_1, \theta_2)}(p, a, s)\\
&= \sum_{s = 1}^L \sum_{a = 0}^K \tilde{p}_{as} \ln \Psi^{(\theta_1, \theta_2)}(p, a, s).
\end{split}
\end{equation}
where $n_{ks} = \sum_{i = 1}^N \sum_{t = 1}^T 1\{a_i^t = k, s_i^t = s\}$.



### Relationship between CCP and MLE

- Note that $\Psi^{(\theta_1, \theta_2)}(p, 0, s) = 1 - \sum_{a = 1}^k \Psi^{(\theta_1, \theta_2)}(p, a, s)$.
- The first-order condition w.r.t. $\theta_1$ is:
\begin{equation}
\begin{split}
&\frac{\partial l(\theta)}{\partial \theta_1}\\
&= \sum_{s = 1}^L \sum_{a = 1}^K \Bigg[\frac{p_{as}}{\Psi^{(\theta_1, \theta_2)}(p, a, s)} - \frac{p_{0s}}{\Psi^{(\theta_1, \theta_2)}(p, 0, s)} \Bigg]  \frac{\partial \Psi^{(\theta_1, \theta_2)}(p, a, s)}{\partial \theta_1}\\
&= \sum_{s = 1}^L \sum_{a = 1}^K \Bigg[\frac{p_{as} - \Psi^{(\theta_1, \theta_2)}(p, a, s)}{\Psi^{(\theta_1, \theta_2)}(p, a, s)} - \frac{p_{0s} - \Psi^{(\theta_1, \theta_2)}(p, 0, s)}{\Psi^{(\theta_1, \theta_2)}(p, 0, s)} \Bigg]  \frac{\partial \Psi^{(\theta_1, \theta_2)}(p, a, s)}{\partial \theta_1}\\
&= \sum_{s = 1}^L \sum_{a = 1}^K \Bigg[\frac{p_{as} - \Psi^{(\theta_1, \theta_2)}(p, a, s)}{\Psi^{(\theta_1, \theta_2)}(p, a, s)} + \sum_{a' = 1}^K\frac{p_{a's} - \Psi^{(\theta_1, \theta_2)}(p, a', s)}{\Psi^{(\theta_1, \theta_2)}(p, 0, s)} \Bigg]  \frac{\partial \Psi^{(\theta_1, \theta_2)}(p, a, s)}{\partial \theta_1}.
\end{split}
\end{equation}



### Relationship between CCP and MLE

- In a matrix form:
\begin{equation}
\begin{split}
&\frac{\partial l(\theta)}{\partial \theta_1} \\
&= \nabla_\theta \Psi^{(\theta_1, \theta_2)\prime}(p) \Sigma^{-1}[\Psi^{(\theta_1, \theta_2)}(p)][\tilde{p} - \Psi^{(\theta_1, \theta_2)}(p)],
\end{split}
\end{equation}
where
\begin{equation}
\begin{split}
&\Sigma^{-1}[\Psi^{(\theta_1, \theta_2)}(p)]\\
& = \text{diag}\Bigg(\frac{1}{\Psi^{(\theta_1, \theta_2)}(p, 1, s)}, \cdots, \frac{1}{\Psi^{(\theta_1, \theta_2)}(p, K, s)} \Bigg) + \frac{1}{\Psi^{(\theta_1, \theta_2)}(p, 0, s)} 1_K 1_K',
\end{split}
\end{equation}
and
\begin{equation}
\Sigma^{-1}[\Psi^{(\theta_1, \theta_2)}(p)] = \text{blkdiag}\{\Sigma^{-1}[\Psi^{(\theta_1, \theta_2)}(p), 1], \cdots, \Sigma^{-1}[\Psi^{(\theta_1, \theta_2)}(p)](L) \}
\end{equation}



### Relationship between CCP and MLE

- Evaluating the expression at $p = \hat{p}$ and $\theta_2 = \hat{\theta}_1$, we have:
\begin{equation}
\begin{split}
&\frac{\partial l(\theta_1, \hat{\theta}_2)}{\partial \theta_1} \\
&= \nabla_\theta \Psi^{(\theta_1, \hat{\theta}_2)\prime}(\hat{p}) \Sigma^{-1}[\Psi^{(\theta_1, \hat{\theta}_2}(\hat{p})][\tilde{p} - \Psi^{(\theta_1, \hat{\theta}_2)}(\hat{p})],
\end{split}
\end{equation}
which is the same as the moment conditions in the CCP approach with different weight on each pair of action and state.



<!--chapter:end:06-dynamics.Rmd-->

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


<!--chapter:end:07-dynamicgame.Rmd-->

# Auction {#auction}

## Auction

### Auction

- It is important to understand how price is formed.
- It is widely used both for public and private sectors.
- The sellers should know:

- Which auction format to use?
- Whether to restrict participation?
- Whether to charge entry fees?

- Some of them can be answered theoretically.
- Some of them need empirical assessment.




### Auction Formats

- Single item auction formats:

- English auction: Bidders call out successively higher prices until one bidder remains.
- Vickrey or 2nd price auction: Bidders submit sealed bids; high bidder wins and pays second highest bid.
- Dutch or descending price auction: Prices falls until one bidder presses button and bidder gets the object at the current price.
- First price auction: Bidders submit sealed bids; high bidder wins and pays his bid.




### Auction Formats

- Multi item auction formats:

- Discriminatory auction: A seller has an supply of items. Buyers submit downward sloping demand schedules ($p, q$ combinations). Equilibrium supply is where aggregate demand equals supply. Buyers pay their bid for sold items.
- Uniform price: A seller has an supply of items. Buyers submit downward demand schedules ($p, q$ combinations). Equilibrium supply is where aggregate demand equals supply. Buyers pay the equilibrium price.
- Simultaneous ascending price auction: Each bidder demands one unit. Bids are raised in multiple rounds. In each round, bidders specify which object that they are bidding for, and may switch from bidding for one object to bidding for another object. Auction closes when no further bids are raised.




### Informational Environment

- Private values:

- Each bidder $i$ values the item at a known value $v_i$. Other bidders do not know $v_i$ but know that $v_i$ is drawn from some known probability distribution.
- It is an independent and private values if the $v_i$s are independent across bidders.
- c.g. construction work.

- Common values:

- Same values for all bidders. However, each bidder only knows a private signal of true value. 
- The signals are often assumed to be independent conditional on the common value.
- c.g. oil field extraction.

- Affiliated values:

- Mixture between private and common values.




### Reserve Price

- The seller can set the reserve price $R$.
- Bidders can get the object only if the winning bid is no less than the reserve price.



### Second Price Auction

- Rule: highest bidders wins and pays the second highest bid.
- $N$ bidders.
- Consider independent and private value $v_i \in [0, V]$.
- Let $b_i$ be the bid of bidder $i$.
- Let $b_{(k)}$ be the $k$th highest bid.
- Payoff:
\begin{equation}
\begin{cases}
v_i - b_{(2)} &\text{   if  wins}\\
0 &\text{   otherwise.}
\end{cases}
\end{equation}



### Second Price Auction

- Result: It is a dominant strategy equilibrium that every bidder bids their true value: $b_i^* = v_i, i = 1, \cdots, N$.
- Proof:

- $v < R$: Paying more than $v \ge R$ can result in negative payoff. Paying less than $R$ gives zero payoff. So $b^* = v$ is optimal.
- $v \ge R$: Under $b^* = v$, if win, he gets $v - b_{(2)} \ge 0$. Consider deviation.

- $b_i > v$: for $b_{(2)} \le v$, pays $b_{(2)}$ and gets the same payoff while for $b_i > b_{(2)} > v$ makes a loss. No incentive to deviate.
- $b_i < v$: for $b_{(2)} < b_i$, pays $b_{(2)}$ and gets the same payoff while for $b_i \le b_{(2)} < v$, looses the auction and gets zero. No incentive to deviate.





### Second Price Auction

- The second price auction is efficient: the bidder that values the item most gets the object.
- Expected revenue for the seller (when $R = 0$): the expected second highest valuation.
- Other equilibrium?: $b_1 = V, b_i = 0, i \neq 1$.



### First Price Auction

- Temporarily abstract away from the reserve price.
- $N$ bidders.
- Consider independent and private value $v_i \in [0, 1]$.
- $v_i$ is drawn from known distribution whose density is $f$ and distribution is $F$.
- Payoff:
\begin{equation}
\begin{cases}
v_i - b_i &\text{   if  wins}\\
0 &\text{   otherwise.}
\end{cases}
\end{equation}
- Expected payoff is:
\begin{equation}
U_i(v_i, b_i) = [v_i - b_u] \mathbb{P}\{b_i > b_j, j \neq i\}.
\end{equation}
- We assume that the belief about $b_j, j \neq i$ is consistent with the equilibrium strategy. 



### First Price Auction

- Strategy is a mapping from values to bids: $b_i: [0, 1] \to \mathbb{R}$.
- We focus on symmetric equilibrium: $b_i(\cdot) = b(\cdot), i = 1, \cdots, N$.
- We assume that the equilibrium symmetric strategy $b(\cdot)$ is differentiable and strictly increasing, and verity it later.



### First Price Auction

- The winning probability:
\begin{equation}
\begin{split}
\mathbb{P}\{b_i > b_j, j \neq i\} & \underbrace{=}_{\text{consistency}} \mathbb{P}\{b_i > b(v_j), j \neq i\}\\
&\underbrace{=}_{\text{strictly increasing}}\mathbb{P}\{b^{-1}(b_i) > v_j, j \neq i\}\\
&\underbrace{=}_{\text{independence}}\mathbb{P}\{b^{-1}(b_i) > v_1\}\cdots\mathbb{P}\{b^{-1}(b_i) > v_N\}\\
&= F(b^{-1}(b_i))\cdots F(b^{-1}(b_i))\\
&= F(b^{-1}(b_i))^{N - 1}.
\end{split}
\end{equation}
- The expected payoff conditional on $v_i$ is thus:
\begin{equation}
U_i(v_i, b_i) = [v_i - b_i] F(b^{-1}(b_i))^{N - 1}.
\end{equation}



### First Price Auction

- In a symmetric equilibrium, the following conditions have to hold:
\begin{equation}
\begin{split}
&b_i = b(v_i)\\
&\frac{\partial U_i(b_i, v_i)}{\partial b_i} = 0.
\end{split}
\end{equation}
- Then,
\begin{equation}
\begin{split}
F(b^{-1}(b_i))^{N - 1} &= F(b^{-1}(b(v_i)))^{N - 1}\\
&= F(v_i)^{N - 1}.
\end{split}
\end{equation}
- Thus, the expected payoff conditional on $v$ given symmetric strategy $b(\cdot)$ is:
\begin{equation}
U_i(v, b(v)) = [v - b(v)]F(v)^{N - 1}.
\end{equation}



### First Price Auction

- By definition:
\begin{equation}
U_i(v, b(v)) = \int_0^v \frac{d U_i(x, b(x))}{\partial x} dx,
\end{equation}
where at the equilibrium:
\begin{equation}
\begin{split}
\frac{d U_i(x, b(x))}{d x} &= \frac{\partial U_i(x, b(x))}{\partial x} + \underbrace{\frac{\partial U_i(x, b(x))}{\partial b_i}}_{= 0: optimality} \frac{\partial b(x)}{\partial x}\\
&=\frac{\partial U_i(x, b(x))}{\partial x} \\
&=F(x)^{N - 1}.
\end{split}
\end{equation}
- Hence,
\begin{equation}
\begin{split}
&[v - b(v)] F(v)^{N - 1} = \int_0^v F(x)^{N - 1} dx\\
&\Leftrightarrow b(v) = v - \frac{\int_0^v F(x)^{N - 1} dx}{F(v)^{N - 1}}.
\end{split}
\end{equation}
- It is actually differentiable and strictly increasing in $v$ (check it).



### First Price Auction

- When there is a reserve price $R$, let $R = b(r)$.
- Then, when $v \le r$, the bidder does not get anything.
- Therefore, we have:
\begin{equation}
\begin{split}
U_i(v, b(v)) &=U_i(v, b(v)) - U_i(r, b(r)) \\
&= \int_r^v \frac{d U_i(x, b(x))}{\partial x} dx\\
&= \int_r^v F(x)^{N - 1} dx.
\end{split}
\end{equation}
- Therefore,
\begin{equation}
\begin{split}
&[v - b(v)] F(v)^{N - 1} = \int_r^v F(x)^{N - 1} dx\\
&\Leftrightarrow b(v) = v - \frac{\int_r^v F(x)^{N - 1} dx}{F(v)^{N - 1}}.
\end{split}
\end{equation}



### Estimation of Auction

- Model primitives:

- The distribution of the value $F$.
- The potential number of bidders $N$ especially if the participation is endogenous.

- The estimation results can be used to consider the optimal auction format, optimal reserve price, and so on.



### Estimation of Second Price Auction

- Data: $\{\{b_i^t\}_{i = 1}^N\}_{t = 1}^T$ bids of $N$ bidders in $T$ auctions.
- $T$ auctions sell the identical object, fixed number of bidders participate, and observations are independent.
- Assume that $b_i = v_i, i = 1, \cdots, N$ in the equilibrium. 
- It is straightforward to estimate $F$ by:
\begin{equation}
\begin{split}
\hat{F}(v) = \frac{1}{N T} \sum_{i = 1}^N \sum_{t = 1}^T 1\{b_i^t \le v\}.
\end{split}
\end{equation}



### Estimation of Second Price Auction

- Data: $\{w^t\}_{t = 1}^T$ winning bids of $T$ auctions.
- $T$ auctions sell the identical object, fixed number of bidders participate, and observations are independent.
- Assume that $b_i = v_i, i = 1, \cdots, N$ in the equilibrium.
- We can estimate the distribution of winning bids:
\begin{equation}
\hat{F}_w(w) = \frac{1}{T} \sum_{t = 1}^T 1\{w^t \le w\}. 
\end{equation}
- Note that the distribution of winning bids are:
\begin{equation}
\begin{split}
F_w(w) &= \mathbb{P}\{b_{(2)} \le w\}\\
&=\mathbb{P}\{v_{(2)} \le w\}\\
&= N(N - 1) \int_{0}^{w} F(x)^{N - 2} (1 - F(x)) f(x) dx\\
&= N(N - 1) \int_{0}^{F(w)} u^{N - 2}(1 - u) du \\
&\equiv \varphi(F(w), N)
\end{split}
\end{equation} 
- Because $\varphi$ is strictly increasing in $F(w)$, we can estimate $F$ by:
\begin{equation}
\hat{F}(w) = \varphi^{-1}(\hat{F}_w(w), N).
\end{equation}



### Estimation of First Price Auction

- Data: $\{\{b_i^t\}_{i = 1}^N\}_{t = 1}^T$ bids of $N$ bidders in $T$ auctions.
- $T$ auctions sell the identical object, fixed number of bidders participate, and observations are independent.
- First consider identification.
- Then Consider direct and indirect inference approaches.



### Estimation of First Price Auction
\framesubtitle{Identification} 

- Let $H(b)$ be the distribution of symmetric equilibrium bids.
- Then the expected payoff to a bidder conditional on $v$ can be written as:
\begin{equation}
\max_{b} (v - b) H(b)^{N - 1}.
\end{equation}
- The first-order condition w.r.t. $b$ gives:
\begin{equation}
\begin{split}
&- H(b)^{N - 1} + (v - b)(N - 1) H(b)^{N - 2} h(b) = 0\\
&\Leftrightarrow v = b + \frac{H(b)}{(N - 1)h(b)}.
\end{split}
\end{equation}
- This is the inverse function of the symmetric equilibrium bidding strategy $b^{-1}(\cdot)$.



### Estimation of First Price Auction: Identification

- We can identify $H(b)$ and $h(b)$ directly from the data.
- For $b_i^t$, we can compute:
\begin{equation}
 v_i^t = b_i^t + \frac{H(b_i^t)}{(N - 1)h(b_i^t)}.
\end{equation}
- Because the right hand side is the inverse function of strictly increasing function, it has to be also strictly increasing, i.e. $H(b)/h(b)$ has to be strictly increasing in $b$. Otherwise, the data is inconsistent with the model.
- If this holds, then the data is consistent with the model and the distribution of the value is identified by the distribution of $v_i^t$ that is constructed from the distribution of bids.
 


### Estimation of First Price Auction: Direct Inference Approach

- Suppose that the distribution $F$ is known up to finite-dimensional parameter $\theta$, $F(\cdot; \theta)$.
- Let $b(\cdot; \theta)$ be the associated symmetric equilibrium bidding strategy.
- The distribution of bids is related to the distribution of the value with:
\begin{equation}
\begin{split}
H(x) &= \mathbb{P}\{b(v; \theta) \le  x\}\\
&= \mathbb{P}\{v \le b^{-1}(x; \theta)\}\\
&=F(b^{-1}(x; \theta)).
\end{split}
\end{equation}
- Hence, the density is:
\begin{equation}
h(x) = f(b^{-1}(x; \theta)) \frac{\partial b^{-1}(x; \theta)}{\partial b}.
\end{equation}



### Estimation of First Price Auction: Direct Inference Approach

- Therefore, the likelihood function for the data $\{\{b_i^t\}_{i = 1}^N\}_{t = 1}^T$ is:
\begin{equation}
\begin{split}
L(\theta) &= \prod_{i = 1}^N \prod_{t = 1}^T h(b_i^t) \\
&= \prod_{i = 1}^N \prod_{t = 1}^T f(b^{-1}(b_i^t; \theta)) \frac{\partial b^{-1}(b_i^t; \theta)}{\partial b}.
\end{split}
\end{equation}
- Find $\theta$ that maximizes the likelihood.
- It is computationally intensive especially if one allows heterogeneity in $F$ across bidders.



### Estimation of First Price Auction: Indirect Inference Approach

- It uses the identification argument:
\begin{equation}
\begin{split}
&\hat{h}(b) = \frac{1}{NT h} \sum_{i = 1}^N \sum_{t = 1}^T K\Bigg(\frac{b_i^t - b}{h}\Bigg) \Rightarrow \hat{H}(b).
\end{split}
\end{equation}
- Estimate $F$ by:
\begin{equation}
\hat[F](v) = \frac{1}{NT} \sum_{i = 1}^N \sum_{t = 1}^T 1\Bigg\{b_i^t + \frac{\hat{H}(b_i^t)}{(N - 1)\hat{h}(b_i^t)} \le v  \Bigg\}.
\end{equation}
- This approach extends nicely to:

- Asymmetric bidders.
- Common values.
- Other auction rules.




### Risk Aversion

- If bidders are risk averse, then the model cannot be identified.
- Intuitively, the bids depend both on the uncertainty about the others value and the risk averseness.
- The bid distribution only cannot separately identify them.
- Let $v$ be the evaluation in money.
- Let $U$ be the utility over the money.
- Then the expected payoff is:
\begin{equation}
U(v - b)H(b)^{N - 1}.
\end{equation}
- The first-order condition is:
\begin{equation}

\begin{split}
&- U'(v - b) H(b)^{N - 1} + U(v - b)(N - 1)H(b)^{N - 2} h(b) = 0\\
&\Leftrightarrow v = b + \lambda^{-1}\Bigg(\frac{H(b)}{(N - 1)h(b)} \Bigg),
\end{split}
\end{equation}
where $\lambda = U/U'$.


### Ascending Auctions with Private Values

- In the simultaneous second price auction, you can observe the bids of the entire bidders.
- In the ascending auction, the auction stops when only one bidder remained.
- Therefore, you can observe only the distribution of 2nd to the lowest bids.



### Ascending Auctions with Private Values

- When $n$ samples are drawn from a distribution $F$, it can be shown that the distribution of $i$th statistics $F^{(i:n)}$ is:
\begin{equation}
F^{(i:n)} = \frac{n!}{(n - i)! (i - 1)!} \int_{0}^{F(s)} t^{i - 1} (1 - t)^{n - i} dt, \forall s,
\end{equation}
and the right-hand side function is strictly increasing in $F(s)$.
- You can identify $F$ from $F^{i:n}$.
- Because the bid is equal to the value in the ascending auction, you can identify the distribution of the values.



### General Framework

- The utility bidder $i \in \{1, \cdots, n\}$ is $U_i$, and $U = (U_1, \cdots, U_n)$.
- The private information (type) of bidder $i$ is $X_i$, and $X = (X_1, \cdots, X_n)$.
- The type is informative about the utility of bidder $i$ in the sense:
\begin{equation}
\mathbb{E}\{U_i|X_i = x_i, X_{-i} = x_{-i}\}
\end{equation}
is strictly increasing in $x_i$ for all realizations of $x_{-i}$.
- Normalization:
\begin{equation}
\mathbb{E}\{U_i|X_i = x_i\} = x_i.
\end{equation}



### General Framework: A Restriction on the Information

- The structural parameters is $F_{X, U}$.
- Bidders have \textbf{private values} if 
\begin{equation}
\mathbb{E}\{U_i|X_1 = x_1, \cdots, X_n = x_n\} = \mathbb{E}\{U_i|X_i = i\}
\end{equation}
for all $x_{-i}$ for all $i$.
- In the private values models, bidders do not have private information about the valuations of their opponents.



### General Framework: A Restriction on the Information

- Bidders have \textbf{common values} if
\begin{equation}
\mathbb{E}\{U_i|X_1 = x_1, \cdots, X_n ~ x_n\}
\end{equation}
is strictly increasing in $x_j$ for any $i, j$ at any $x_j$.
- In the common values models, the signals of the other bidders are informative for a bidder.



### General Framework: A Restriction on the Values

- The previous assumption was for the signals $X$.
- The values $U$ may be \textbf{independent} or dependent.
- The special case of dependence (including independence): \textbf{affiliation}.
- $U$ with joint density $f_U$ is affiliated if for all $u$ and $u'$,
\begin{equation}
f_U(u \vee u') f_(u \wedge u') \ge f_U(u) f_U(u).
\end{equation}



### Independent Private Values Models

- So far we have in the \textbf{Independent Private Values (IPV)} models.

- The utilities are independent.
- The signals are not informative about others' values.

- Moreover, the signal was equal to the value.
- Furthermore, the distribution was assumed to be symmetric across bidders.
- Introducing some dependence into the values or information, or allowing asymmetry into the distribution makes the problems complicated both in theory and in econometrics.



### The Mineral Rights Model

- The value of a project (a mineral right project) is the same across bidders: $U_i = U_0, \forall i$.
- The signal $X_i$ is:
\begin{equation}
X_i = U_0 + A_i,
\end{equation}
where $A$ are mutually independent conditional on $U_0$.



### The Mineral Rights Model: First-price Auction

- The first-order condition is the same after replacing $v$ with $x$:
\begin{equation}
X_i = U_0 + A_i = b_i + \frac{H(b_i)}{(N - 1)h(b_i)}.
\end{equation}
- From this, one can identify the distribution of $X_i$.
- A deconvolution method allows to identify the distribution of $U_0$ and the conditional distribution of $A_i$.
- The deconvolution \textbf{does not} work if $U_i \neq U_0$ for some $i$.



### Dynamic Auctions

- The state variable of a bidder may depend on the behavior and the outcome of the previous auctions.
- The cost to construct a road depend on the remaining capacity of a firm, and the remaining capacity of a firm depends on how many projects the firm have won recently.
- After the Great Recession, the government significantly increased the expenditure to a public good such as highway, but this may have significantly increased the construction cost by screwing the capacities of the construction companies.



### Dynamic Auctions: Capacity Constraints

- $c_{i, t}$: bidder $i$'s publicly observed remaining capacity in period $t$.
- $F_U(\cdot|c_{i, t})$: The distribution of bidder $i$'s valuation in period $t$.
- The transition of the capacity:
\begin{equation}
c_{i, t + 1} = \omega_i(c_t, k),
\end{equation}
where $k$ is the identify of the winning bidder in period $t$.
- A Markov bidding strategy $b(u_{i, t}, c_t)$.



### Dynamic Auctions: Value Function

- The value function of bidder $i$ when the value is $u_i$ and the vector of capacities is $c$:
\begin{equation}
\begin{split}
&W_i(u_i, c) = \max_{b_i} \Bigg\{(u_i - b_i) \mathbb{P}\{b_i = \max_j b_j\} \\
&+ \delta \sum_{j = 1}^N \mathbb{P}\{j\text{   wins   }|b_i, c\} \int_{u_i'} W_i(u_i', \omega(c, j)) f_{U_i}(u_i'|\omega_i(c, j)) du_i'
\Bigg\}\end{split}
\end{equation}



### Dynamic Auctions: Ex-ante Value Function

- The ex-ante value function of bidder $i$ when the vector of capacity is $c$:
\begin{equation}
V_i(c) = \int W_i(u_i, c) f_{U_i}(u_i|c) d u_i.
\end{equation}



### Dynamic Auctions: Probability of Winning

- The probability of winning for bidder $i$ when bids $b_i$:
\begin{equation}
\prod_{j \neq i} F_{B_j}(b_i|c) \equiv F_{M_i}(b_i|c).
\end{equation}
- The probability of winning for bidder $j \neq i$ when $i$'s bid is $b_i$.
\begin{equation}
\int_{b_i} \prod_{k \neq i, j} F_{B_k}(b_j|c) f_{B_j} (b_j|c) db_j.
\end{equation} 



### Dynamic Auctions: First-order Condition

- The value function:
\begin{equation}
\begin{split}
&W_i(u_i, c) = \max_{b_i} \Bigg\{(u_i - b_i)F_{M_i}(b_i|c) + \delta V_i(\omega(c, i)) \\
&+ \delta \sum_{j \neq i} \int_{b_i} \prod_{k \neq i, j} F_{B_k}(b_j|c) f_{B_j} (b_j|c) db_j [V_i(\omega(c, j)) - V_i(\omega(c, i))] \}.
\end{split}
\end{equation}
- The first-order condition:
\begin{equation}
u_i = b_i + \frac{F_{M_i}(b_i|c)}{f_{M_i}(b_i|c)} + \delta \sum_{j \neq i} \frac{F_{M_i}(b_i|c)}{f_{M_i}(b_i|c)} \frac{f_{B_j}(b_i|c)}{F_{B_j}(b_i|c)}[V_i(\omega(c, j)) - V_i(\omega(c, i))].
\end{equation}
- The ex-ante value function $V_i$ can be computed from the observed choice probabilities.



### Bid Distribution with Capacity Constraints
\begin{figure}
\includegraphics[width = \textwidth]{figuretable/dynamicbid.png}
\end{figure}


### Cost Distribution with Capacity Constraints
\begin{figure}
\includegraphics[width = \textwidth]{figuretable/dynamiccost.png}
\end{figure}

<!--chapter:end:08-auction.Rmd-->



<!--chapter:end:references.Rmd-->

