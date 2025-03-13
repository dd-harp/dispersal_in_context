# Networks 

knitr::purl("Dispersal-in-Context-code.Rmd", output = "Dispersal_in_Context.R", documentation = 0, quiet=TRUE)
source ("Dispersal_in_Context.R")

source ("Dispersal_in_Context.R")
require(igraph)
require(deldir)
set.seed(24)
CutIt = FALSE 


NODES_ALPHA = 'EE'
LINKS_ALPHA = '77'
HULLS_ALPHA = 'CC'
ARROW_LENGTH = 0.0
CUT_AT = 0.85
ADJ = 2

changeOpacity = function(colorsList, alpha='BB'){
  colorsReplaced=list()
  for (i in 1:length(colorsList)) {
    colorsReplaced[[i]] = paste0(substr(colorsList[i], start=1, stop=7), alpha)
  }
  colorsReplaced = unlist(colorsReplaced)
  return(colorsReplaced)
}


load("Models/mod1.rda")

tilesQ = with(mod1,deldir(q[,1], q[,2]))
tilesB = with(mod1,deldir(b[,1], b[,2]))

if(CutIt == FALSE){
  # pdf("Figures/network.pdf", width=12, height=8)
  png("Figures/network.png", units="in", width=12, height=8, res=400)
}

if(CutIt == TRUE){
  N=15
  # pdf("Figures/networkN15.pdf", width=12, height=8)
  png("Figures/networkN15.png", units="in", width=12, height=8, res=400)
}
## NOTE: NetworkN.pdf is in the paper 

par(mfrow = c(2,3))
#################
# K_bb 
#################
if(CutIt == FALSE){
  membershipIXb = membership(mod1$Kbb_net$clusters_walktrap) 
  N = max(membershipIXb)
}

if(CutIt == TRUE)
    membershipIXb = cut_at(mod1$Kbb_net$clusters_walktrap, N) 

#palb = inferno(2*N)[N-3 +sample(1:N)]
palb = turbo(N)[sample(1:N)]
clrsb = palb[membershipIXb] 
palBHull = changeOpacity(palb, alpha=HULLS_ALPHA)
clrsbNode=changeOpacity(clrsb, alpha=NODES_ALPHA)
clrsbArrow=changeOpacity(clrsb, alpha=LINKS_ALPHA)
#################
# K_qq 
#################
if(CutIt == FALSE){
  membershipIXq = membership(mod1$Kqq_net$clusters_walktrap) 
  N = max(membershipIXq)
} 

if(CutIt == TRUE)
  membershipIXq = cut_at(mod1$Kqq_net$clusters_walktrap, N) 

#pal = mako(N)[sample(1:N)]
#palq = mako(2*N)[N-3+sample(1:N)]
palq = turbo(N)[sample(1:N)]
clrsq = palq[membershipIXq] 
palQHull = changeOpacity(palq, alpha=HULLS_ALPHA)
clrsqNode=changeOpacity(clrsq, alpha=NODES_ALPHA)
clrsqArrow=changeOpacity(clrsq, alpha=LINKS_ALPHA)

##############################
# First Row
##############################
with(mod1, {
  frame_bq(b, q, mtl = expression(K[b%->%b]))
  #bentArrowsX2Y(b, b, Kbb, clr=clrsb, bbend=2)
  arrowsX2Y(b, b, Kbb, cutat=CUT_AT, lng=ARROW_LENGTH, clr=clrsbArrow)
  addP.b(b, wts=rowSums(Kbb), adj=ADJ, clr=clrsbNode)
})

with(mod1, frame_bq(b, q, mtl = expression("Convex Hulls")))
addConvexHulls(membershipIXb, mod1$b, palBHull, stretch=-0.1, lwd=4)
addConvexHulls(membershipIXq, mod1$q, palQHull, stretch=-0.1, lwd=4)

with(mod1, {
  frame_bq(b, q, mtl = expression(K[q%->%q]))
  # bentArrowsX2Y(q, q, Kqq, clr=clrsq, bbend=2)
  arrowsX2Y(q, q, Kqq, cutat=CUT_AT, lng=ARROW_LENGTH, clr=clrsqArrow)
  addP.q(q, wts = rowSums(Kqq), adj=ADJ, clr=clrsqNode)
})

set.seed(24)

#################
# VC 
#################
if(CutIt == FALSE){
  membershipIXv = membership(mod1$VC_net$clusters_walktrap) 
  N = max(membershipIXv)
}  
if(CutIt == TRUE)
  membershipIXv = cut_at(mod1$VC_net$clusters_walktrap, N) 
#palv = (2*N)[N-3 +sample(1:N)]
palv = turbo(N)[sample(1:N)]
clrsv = palv[membershipIXv] 
palVHull = changeOpacity(palv, alpha=HULLS_ALPHA)
clrsvNode=changeOpacity(clrsv, alpha=NODES_ALPHA)
clrsvArrow=changeOpacity(clrsv, alpha=LINKS_ALPHA)

# GG and VC 

with(mod1, {
  frame_bq(b, q, mtl = expression("Potential Parasite Dispersal, Population"))
  #bentArrowsX2Y(b, b, VC, clr=clrsv, bbend=2)
  arrowsX2Y(b, b, VC, cutat=CUT_AT, lng=ARROW_LENGTH, clr=clrsvArrow)
  addP.b(b, wts = rowSums(VC), adj=ADJ, clr=clrsvNode)
})

if(CutIt == FALSE){
  membershipIXg = membership(mod1$GG_net$clusters_walktrap) 
  N = max(membershipIXg)
}

if(CutIt == TRUE)
  membershipIXg = cut_at(mod1$GG_net$clusters_walktrap, N) 
#pal = mako(N)[sample(1:N)]
#palg = mako(2*N)[N-3+sample(1:N)]
palg = turbo(N)[sample(1:N)]
clrsg = palg[membershipIXg] 
palGHull = changeOpacity(palg, alpha=HULLS_ALPHA)
clrsgNode=changeOpacity(clrsg, alpha=NODES_ALPHA)
clrsgArrow=changeOpacity(clrsg, alpha=LINKS_ALPHA)

with(mod1, frame_bq(b, q, mtl = expression("Convex Hulls")))
addConvexHulls(membershipIXv, mod1$b, palVHull, stretch=-0.1, lwd=4)
addConvexHulls(membershipIXg, mod1$q, palGHull, stretch=-0.1, lwd=4)

with(mod1, {
  frame_bq(b, q, mtl = expression("Lifetime Egg Dispersal, Population"))
  arrowsX2Y(q, q, GG, cutat=CUT_AT, lng=ARROW_LENGTH, clr=clrsgArrow)
  addP.q(q, wts = rowSums(GG), adj=ADJ, clr=clrsgNode)
  
})

dev.off(dev.cur())


