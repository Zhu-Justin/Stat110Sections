# Defining your parameters
sims = 10000;
Sam = rep(0,sims);
Frodo = rep(0,sims);

for(i in 1:sims)
{
  Sam.flip = runif(1);
  Frodo.flip = runif(1);
  
  if (Sam.flip <= 0.8){
    Sam[i] = 1
    if (Frodo.flip <= 0.9){
      Frodo[i] = 1
    }
  }
  if (Sam.flip > 0.8){
    if (Frodo.flip <= 0.1){
      Frodo[i] = 1
    }
  }
}

mean(Sam)