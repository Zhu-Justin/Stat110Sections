sims = 1000
n = 10
p.binom = 9/10
Y_binom = rbinom(sims, n, p.binom)

hist(Y_binom, main="Y~ Bern(n,p)", ylab="Density", xlab = "Values")

mean(Y_binom)
var(Y_binom)