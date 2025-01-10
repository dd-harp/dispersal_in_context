# Kxy, Kxx 

knitr::purl("Dispersal-in-Context-code.Rmd", output = "Dispersal_in_Context.R", documentation = 0, quiet=TRUE)
source ("Dispersal_in_Context.R")
load("Models/mod1.rda")

CUT_AT = 0.75
PWD = 0.5
ADJ_1 = 1
FAC_1 = 1.75
FAC_2 = 0.25

# pdf("Figures/GV.pdf", width=8.2, height=8)
# tiff("Figures/GV.tiff", units="in", width=8.2, height=8, res=300, compression="lzw")
png("Figures/GV.png", units="in", width=8.2, height=8, res=400)
par(mfrow = c(2,2))
GProfile(
  mod1,  cutat=CUT_AT, pw=PWD, adj=ADJ_1, 
  fac1=FAC_1, fac2=FAC_2,
  clrA="#27187e44",  clrS="#ff005422", 
  clrQA='#394a89BB', clrQB='#394a89BB'
)
GGProfile(
  mod1, cutat=CUT_AT, pw=PWD, adj=ADJ_1, 
  fac1=FAC_1, fac2=FAC_2,
  clrA="#27187e44", clrS="#ff005422", 
  clrQA='#394a89BB', clrQB='#394a89BB'
)
VProfile(
  mod1,  cutat=CUT_AT, pw=PWD, adj=ADJ_1, 
  fac1=FAC_1, fac2=FAC_2, 
  clrA="#d8115933", clrS="#9eb7e533",
  clrBA='#d8115977', clrBB='#d8115977'
)
VCProfile(
  mod1, cutat=CUT_AT, pw=PWD, adj=ADJ_1, 
  fac1=FAC_1, fac2=FAC_2,
  clrA="#d8115933", clrS="#9eb7e533",
  clrBA='#d8115977', clrBB='#d8115977'
)
dev.off(dev.cur())

