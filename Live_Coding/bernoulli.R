library(Rlab)

#Bernoulli

set.seed(110)
n = 10
p.bern = 1/2
Y = rbern(n, p.bern)

Y;

hist(Y,main="Y ~ Bern(n,p)", ylab = "Density", xlab="Values")

sum(Y)