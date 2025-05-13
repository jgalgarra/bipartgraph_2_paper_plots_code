# Script to produce the Dáttilo 2014 mosaic of plots

library(kcorebip)
library(patchwork) 

legacy <- bipartite_graph("data/","dattilo2014.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = TRUE,plotsdir = "plot_results/" ,guild_gap_increase = 1.8 ,style = "legacy" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#2A56E8","#2A56E8"),color_guild_b = c("#F24E4B","#F24E4B") 
                          ,alpha_link = 0.5 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 6.8 ,lsize_legend = 5.5 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Ant" ,label_strguildb = "Plant" ,backg_color = "white" ,show_title = FALSE ,show_legend = "TOP" ,svg_scale_factor = 1 ,weighted_links = "none",progress = NULL)
kcoreorder <- bipartite_graph("data/","dattilo2014.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = TRUE,plotsdir = "plot_results/" ,guild_gap_increase = 1.8 ,style = "kcoreorder" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#2A56E8","#2A56E8"),color_guild_b = c("#F24E4B","#F24E4B") 
                              ,alpha_link = 0.5 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 6.2 ,lsize_legend = 8 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Ant" ,label_strguildb = "Plant" ,backg_color = "white" ,show_title = FALSE ,show_legend = "HIDE" ,svg_scale_factor = 1 ,weighted_links = "none",progress = NULL)
chilopod <- bipartite_graph("data/","dattilo2014.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = TRUE,plotsdir = "plot_results/" ,guild_gap_increase = 1.8 ,style = "chilopod" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#2A56E8","#2A56E8"),color_guild_b = c("#F24E4B","#F24E4B") 
                            ,alpha_link = 0.5 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 6.8 ,lsize_legend = 8 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Ant" ,label_strguildb = "Plant" ,backg_color = "white" ,show_title = FALSE ,show_legend = "HIDE" ,svg_scale_factor = 1 ,weighted_links = "none",progress = NULL)



plot_dattilo <- 
  (legacy$plot / kcoreorder$plot / chilopod$plot) +
    plot_annotation(tag_levels = 'A') & 
    theme(text = element_text(size = 18, face='bold'), plot.tag.position  = c(.05, .9))  # auto-labels A, B, C
if (!dir.exists("myimages")) {
  dir.create("myimages")
}
mw = 9
mh = 15
ggsave("myimages/dattilo_all.png", width = mw, height = mh, dpi = 300)
ggsave("myimages/dattilo_all.tiff", plot = plot_dattilo, width = mw, height = mh, device = "tiff")
ggsave("myimages/dattilo_all.pdf", plot = plot_dattilo, width = mw, height = mh, device = "pdf")
