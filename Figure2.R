# Lattice vs. random figure

set.seed(24328)
source ("Dispersal_in_Context.R")

kFb = kFmake.exp(k=2, s=1, gamma=1.5)
kFq = kFmake.exp(k=2, s=2, gamma=2)

q0 = lattice(17, -8, 8)
b0 = lattice(16, -7.5, 7.5)
lattice_mod = makeSimObj_BQ(b0, q0, kFb, kFq)
lattice_mod = steadyState(lattice_mod)
lattice_mod = steadyState(lattice_mod)

b1 = cbind(runif(dim(b0)[1], -7.5, 7.5), runif(dim(b0)[1], -7.5, 7.5)) 
q1 = cbind(runif(dim(q0)[1], -8, 8), runif(dim(q0)[1], -8, 8))
random_mod = makeSimObj_BQ(b1, q1, kFb, kFq)
random_mod = steadyState(random_mod)
random_mod = steadyState(random_mod)

ltot = rbind(
    B=mean(lattice_mod$steadyState$B),
    Q=mean(lattice_mod$steadyState$Q)
) 

rtot = rbind(
    B=mean(random_mod$steadyState$B),
    Q=mean(random_mod$steadyState$Q)
)
data.frame(ltot, rtot) -> Avg 

lVar = rbind(
  B=var(lattice_mod$steadyState$B),
  Q=var(lattice_mod$steadyState$Q)
) 

rVar = rbind(
  B=var(random_mod$steadyState$B),
  Q=var(random_mod$steadyState$Q)
)
data.frame(lVar, rVar) -> Var 

cv = function(x){sd(x)/mean(x)}

lcv = rbind(
    B=cv(lattice_mod$steadyState$B),
    Q=cv(lattice_mod$steadyState$Q)
) 
rcv = rbind(
    B=cv(random_mod$steadyState$B),
    Q=cv(random_mod$steadyState$Q)
)
data.frame(lcv, rcv) -> CoV

cv(random_mod$steadyState$B)/cv(lattice_mod$steadyState$B) 
cv(random_mod$steadyState$Q)/cv(lattice_mod$steadyState$Q) 

sum(random_mod$steadyState$B)/sum(lattice_mod$steadyState$B) 
sum(random_mod$steadyState$Q)/sum(lattice_mod$steadyState$Q) 
  
  
Brng = range(random_mod$steadyState$B, lattice_mod$steadyState$B)
Qrng = range(random_mod$steadyState$Q, lattice_mod$steadyState$Q)

adjfac = 2
pdf("Figures/Lattice_V_Random.pdf", width = 8, height = 9)
par(mfrow = c(2,2))

frame_bq(b1, q1, mtl = "Random")
addP.q(q1,wts=random_mod$steadyState$Q, adj=adjfac)
addP.b(b1,wts=random_mod$steadyState$B, adj=adjfac)

frame_bq(b0, q0, mtl = "Lattice")
addP.b(b0,wts=lattice_mod$steadyState$B, adj=adjfac*ltot[1]/rtot[1])
addP.q(q0,wts=lattice_mod$steadyState$Q, adj=adjfac*ltot[2]/rtot[2])


#plotPoints_bq(b0, q0, adj=0.5, bwts=lattice_mod$steadyState$B, qwts=lattice_mod$steadyState$Q, mtl = "Lattice")
#plotPoints_bq(b1, q1, adj=0.5, bwts=random_mod$steadyState$B, qwts=random_mod$steadyState$Q, mtl = "Random")
hist(random_mod$steadyState$B, 40, main = "B, Steady State", xlim = Brng, col = "red", ylim = c(0,60), xlab = "B, Steady State")
hist(lattice_mod$steadyState$B, 40, add=T, col = "black", border="purple") 
hist(random_mod$steadyState$Q, 40, main = "Q, Steady State", xlim = Qrng, col = "blue", ylim = c(0,40), xlab = "Q, Steady State")
hist(lattice_mod$steadyState$Q, 40, add = T, col = "black", border= "chocolate1") 
dev.off(dev.cur())
