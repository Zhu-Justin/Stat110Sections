# Justin Zhu 
# Math 23 Final R script project
# Credit to Paul Bamberg and Math 23 staff for prior R script videos and instruction
# Credit to Joe Blitzstein for his instruction and R script notes in Stat 110

# This project relates to the Markov chain as studied from the linear algebra unit from week 1 
# Topic is related to linear algebra, real analysis, or multivariable calculus.
# It generates a nice-looking graphic
# This project also will be frequently commented in describing certain features
# YouTube video with presentation link attached with submission

# This problem also relates to a topic in probability and statistics known as Gambler's Ruin problem
# The Gambler's Ruin problem basically asks, given a finite money of N between two gamblers A and B, 
# what is the probability p of gambler A winning a given round, over a time period t.
# This represents a Markov process, in that every round player A either wins or loses one dollar
# Every time player A loses a dollar, player A moves down the Markov chain to the lower ranked node
# Every time player A wins a dollar, player A moves up the Markov chain to the higher ranked node
# This process repeats itself until A is on the highest ranked node (N) or A is in the lowest ranked node (0)
# because at that point one player can no longer play any more (i.e. is "ruined" because he has no more money to gamble with)

# We create our variable N for total money -- in this case 10 dollars
N <- 10; N
# We create our probability p, in this case it's 1/2, so 50-50 chance of winning for A and B
p <- 1/2; p
# An interesting concept to bridge from Week 5 dealing with countable and infinitely countible numbers
# Because p can take on only rational numbers, it is countable infinite, as probabilities must be expressed as 
# the number of occurences of an event over the total occurences of possible events
# Therefore probabilities are rational and must be countibly infinite values between 0 and 1

# We create and define random number generator function that chooses a number between 50 and 100
# This function being defined and used is the sample function, 
# which takes in the first argument as the range of values that can be sampled
# and the second argument being the total number of samples
# The sample function is an R function that has not appeared in any Math 23 lecture script

sample(50:100, 1)

# We create the number of rounds to be t, assigning a different random number between 50 and 100 as t
t <- sample(50:100, 1); t

# We now create a vector of length t called x, which stores the values of a Markov chain for Player A
x <- rep(0,t); x
# The rep(a, b) function creates a vector that contains repeats the value a for b times
# The rep(a, b) function is an R function that has not appeared in any Math 23 lecture script

# Initially, let us allocate 5 dollars for both gamblers by setting the first entry of x equal to 5
x[1] = 5; x[1]

# Alternatively, we can also randomly allocate any value between 0 and N dollars exclusive to player A, 
# while player B has N minus the amount of dollars allocated to player A
x[1] = sample(1:N-1, 1); x[1]

# We now simulate subsequent values of Player A's Markov chain
for (i in 2:t){
  # This is a 'for loop' that that specifies all the code inside to be executed over and over for t-1 times
  # Each pass through the loop represents one step in the Markov chain
  if (x[i-1]==0 || x[i-1]==N){
    # This if statement checks if chain is already at 0 or N
    x[i] <- x[i-1]
    # If so, we set the value equal to its previous value, as the gambler's ruin problem states that once a player is "ruined"
    # no more gambling can occur, which in other words means that this Markov chain cannot escape 0 or N
  }
  else{
    # Otherwise the chain is not at 0 or N
    # Player A's Markov chain is free to move right 1 (win a dollar) or move left 1 (lose a dollar) with probabilities p and 1-p respectively
    x[i] <- x[i-1] + sample(c(1,-1),1, prob=c(p,1-p))
  }
}
# We can view the final result of Player A after t rounds and the total Markov chain path over each round of Player A
x[t]; x
# We can also view the total Markov chain path over each round of Player B by subtracting Player A's money from the total money N available
y <- N-x; y
# We can plot our values of x as a function of time (number of rounds)

# This is the graphic corresponding to player A's earnings (the path of the Markov chain in this simulation we created)
plot(x, type='l',ylim=c(0,N),xlab="Rounds",ylab="Player A Dollars")

# This is the graphic corresponding to player B's earnings (simply the total money minus Player A's money)
plot(y, type='l',ylim=c(0,N),xlab="Rounds",ylab="Player B Dollars")

# This also relates to the Law of Large Numbers, a topic in statistics that states
# if you were to repeat this test by implementing this code over multiple times, you would eventually
# get around an equal number of cases where player A wins the game and where player B wins the game with probability 1
