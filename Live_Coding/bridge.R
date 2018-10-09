# Parameters
sims = 1000
n = 10
p.bern = 9/10
Y_sum = rep(0,sims)

# Take multiple Bernoullis
for (i in 1:sims){
  Y = rbern(n, p.bern)
  Y_sum[i] = sum(Y)
}

hist(Y_sum, main="Y_sum = n * Bern(p)", ylab="Density", xlab="Values")

mean(Y_sum)
var(Y_sum)