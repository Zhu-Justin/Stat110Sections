# Parameters
sims = 1000
monty = rep(NA, sims)
car = rep(NA, sims)

# Simulate
for(i in 1:sims){
  doors = sample(c(1,0,0))
  car[i] = which(doors == 1)
  # Door 1 is a car
  if (car[i] == 1){
    monty[i] = sample(c(2,3), 1)
  }
  # Door 1 is a goat
  if (car[i] != 1){
    doors[1] = 1
    monty[i] = which(doors == 0)
  }
}

length(car[car == 1 & monty == 2]) / length(car[monty == 2])
length(car[car == 3 & monty == 2]) / length(car[monty == 2])