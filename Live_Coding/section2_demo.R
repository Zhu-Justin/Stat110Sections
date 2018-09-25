set.seed(1);
# Defining your parameters
sims = 1000;
success_simulation = rep(0,sims);

for(i in 1:sims)
{
  event = runif(1);
  if (event <= 0.5){
    success_simulation[i] = 1;
  }
}

ans = mean(success_simulation);

print(ans)