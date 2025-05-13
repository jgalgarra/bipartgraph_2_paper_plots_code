# Script to produce the Polidori 2025 mosaic of plots

library(kcorebip)
library(patchwork) 

legacy <- bipartite_graph("data/","Polidori_2025.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = FALSE,plotsdir = "plot_results/" ,guild_gap_increase = 2.6 ,style = "legacy" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                          ,alpha_link = 0.3 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 4.95 ,lsize_legend = 4.95 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Plant" ,label_strguildb = "Pollinator" ,backg_color = "white" ,show_title = FALSE ,show_legend = "TOP" ,svg_scale_factor = 1 ,weighted_links = "sqrt",progress = NULL)
kcoreorder <- bipartite_graph("data/","Polidori_2025.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = FALSE,plotsdir = "plot_results/" ,guild_gap_increase = 2.6 ,style = "kcoreorder" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                              ,alpha_link = 0.3 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 4.95 ,lsize_legend = 4.95 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Plant" ,label_strguildb = "Pollinator" ,backg_color = "white" ,show_title = FALSE ,show_legend = "HIDE" ,svg_scale_factor = 1 ,weighted_links = "sqrt",progress = NULL)
chilopod <- bipartite_graph("data/","Polidori_2025.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = FALSE,plotsdir = "plot_results/" ,guild_gap_increase = 2.2 ,style = "chilopod" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                            ,alpha_link = 0.3 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 4.95 ,lsize_legend = 4.95 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Plant" ,label_strguildb = "Pollinator" ,backg_color = "white" ,show_title = FALSE ,show_legend = "HIDE" ,svg_scale_factor = 1 ,weighted_links = "sqrt",progress = NULL)


plot_polidori <- 
  (legacy$plot / kcoreorder$plot / chilopod$plot) +
    plot_annotation(tag_levels = 'A') & 
    theme(text = element_text(size = 18, face='bold'), plot.tag.position  = c(.05, .9))  # auto-labels A, B, C
if (!dir.exists("myimages")) {
  dir.create("myimages")
}
mw = 10
mh = 12
ggsave("myimages/polidori_all.png", width = mw, height = mh, dpi = 300)
ggsave("myimages/polidori_all.tiff", plot = plot_polidori, width = mw, height = mh, device = "tiff")
ggsave("myimages/polidori_all.pdf", plot = plot_polidori, width = mw, height = mh, device = "pdf")
ggsave("myimages/polidori_all.svg", plot = plot_polidori, width = mw, height = mh, device = "svg")
