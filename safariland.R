# Script to produce the Safariland plot using the bipartite::plotweb function

rm(list = ls())
# Load the package
library(bipartite)

# Load the Safariland dataset
data(Safariland)
# Open a PNG device (you can also use pdf(), svg(), etc.)
pdf("myimages/safariland_plotweb.pdf", width = 16, height = 8)
plotweb(Safariland, text.rot = 90,y.lim = c(-2, 4),labsize=2.5)

dev.off()

