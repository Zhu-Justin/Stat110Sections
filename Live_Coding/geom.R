n = 10
p.geom = 1/2

Y_geom = rgeom(n, p.geom)

hist(Y_geom, main="Y~Geom(n,p)", ylab="Density", xlab = "Values")