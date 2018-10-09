# Parameter
N <- 1000
p <- 1/4
time <- 1000000

A_values <- rep(NA, time)
B_values <- rep(NA, time)

# We begin the simulation
A_values[1] = N/2

for (i in 2:time){
  # Base Case
  if (A_values[i-1] == 0 || A_values[i-1] == N){
    A_values[i] <- A_values[i-1]
  }
  else{
    A_values[i] <- A_values[i-1] + sample(c(1,-1),1,prob=c(p, 1-p))
  }
}

A_values[time]
B_values <- N - A_values
B_values[time]

plot(A_values, type='l', ylim = c(0,N), xlab="Rounds", ylab = "Player A Earnings (Dollars)")
plot(B_values, type='l', ylim = c(0,N), xlab="Rounds", ylab = "Player B Earnings (Dollars)")


