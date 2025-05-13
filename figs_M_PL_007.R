# Script to produce the M_PL_007 mosaic of a frugivory network in 
# Norfolk (UK) (Dicks et al., 2002)

library(kcorebip)
library(patchwork) 

chilopod <- bipartite_graph("data/","M_PL_007.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,
                            orderkcoremaxby = "kradius" ,print_to_file = FALSE,plotsdir = "plot_results/" ,
                            guild_gap_increase = 3.7 ,style = "chilopod" ,flip_results = TRUE ,alpha_level = 0.2,
                            color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                            ,alpha_link = 0.3 ,size_link = 0.2 ,color_link = "#888888" ,lsize_kcoremax = 3.6 ,
                            lsize_legend = 3.6 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,
                            label_strguilda = "Pollinator" ,label_strguildb = "Plant" ,backg_color = "white" ,
                            show_title = FALSE ,show_legend = "TOP" ,svg_scale_factor = 1 ,
                            weighted_links = "ln",progress = NULL)

if (!dir.exists("myimages")) {
  dir.create("myimages")
}
mw =3.5
mh =6
ggsave("myimages/PL007_all.png", width = mw, height = mh, dpi = 300)
ggsave("myimages/PL007_all.eps", plot = chilopod$plot, width = mw, height = mh, device = "eps")
ggsave("myimages/PL007_all.pdf", plot = chilopod$plot, width = mw, height = mh, device = "pdf")