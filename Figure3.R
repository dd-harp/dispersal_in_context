
# Kxy, Kxx 
knitr::purl(
    "Dispersal-in-Context-code.Rmd", 
    output="Dispersal_in_Context.R", 
    documentation=0, quiet=TRUE
)

source ("Dispersal_in_Context.R")
load("Models/mod1.rda")

CUT_AT = 1
ADJ1 = 0.75
ADJ2 = 0.75

# pdf("Figures/Kxy.pdf", width=8.1, height=4)
png("Figures/Kxy.png", units="in", width=8.1, height=4, res=500)
KxyProfiles(
    mod1, pw=0.8, 
    adj1=ADJ1, adj2=ADJ2, cutat=CUT_AT, 
    clrLA="#f7258588", clrLB="#8d78d277",
    clrA='#abc4ffCC', clrB='#d8115999',
    clrNB='#d81159CC', clrNQ='#27187eCC'
)
dev.off(dev.cur())

# pdf("Figures/Kxx.pdf", width=8.1, height=4)
png("Figures/Kxx.png", units="in", width=8.1, height=4, res=500)
KxxProfiles(
    mod1, wd=.8, lng=0,
    adj1=ADJ1, adj2=ADJ2, cutat=CUT_AT,
    clrLA="#f7258533", clrLB="#8d78d277", clrLS='#00000011',
    clrB="#abc4ffBB", clrA="#f72585CC",
    clrNB="#ff0a54CC", clrNQ="#4e148cCC"
)
dev.off(dev.cur())
