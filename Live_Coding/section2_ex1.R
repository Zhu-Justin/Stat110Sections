set.seed(1);
# Defining your parameters
sims = 1;
bedtime_before_11 = rep(0,sims);
attend_section = rep(0,sims);


for(i in 1:sims)
{
  bedtime = sample(1:10,1)
  attend = runif(1)
  if (bedtime <= 3){
    bedtime_before_11[i] = 1;
    if (attend <= 0.8){
      attend_section[i] = 1;
    }
  }
  if (bedtime>3){
    if (attend <= 0.4){
      attend_section[i] = 1;
    }
  }
}

ans1 = mean(bedtime_before_11);
ans2 = mean(attend_section);

print(ans1)
print(ans2)