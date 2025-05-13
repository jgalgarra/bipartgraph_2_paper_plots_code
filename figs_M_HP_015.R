# Script to produce the HP_015_ mosaic of a host parasite network in 
# Siberia (Hadfield et al., 2014)

library(kcorebip)
library(patchwork) 

kcoreorder <- bipartite_graph("data/","RA_HP_015.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = FALSE,plotsdir = "plot_results/" ,guild_gap_increase = 1 ,style = "kcoreorder" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                            ,alpha_link = 0.3 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 4.5 ,lsize_legend = 4.5 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Host" ,label_strguildb = "Parasite" ,backg_color = "white" ,show_title = FALSE ,show_legend = "TOP" ,svg_scale_factor = 1 ,weighted_links = "none",progress = NULL)

if (!dir.exists("myimages")) {
  dir.create("myimages")
}
mw =3.5
mh =6
ggsave("myimages/RA_HP_015-kcoreorder.png", width = mw, height = mh, dpi = 300)
ggsave("myimages/RA_HP_015-kcoreorder.eps", plot = kcoreorder$plot, width = mw, height = mh, device = "eps")
ggsave("myimages/RA_HP_015-kcoreorder.pdf", plot = kcoreorder$plot, width = mw, height = mh, device = "pdf")