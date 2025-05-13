# Script to produce the SD_020 mosaic of a frugivory network in 
# Southeastern Brazil (Galetti and Pizo, 1996

library(kcorebip)
library(patchwork) 

ziggurat <- ziggurat_graph("data/","M_SD_012.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius",print_to_file = TRUE,plotsdir = "plot_results/" ,alpha_level = 0.2,color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                           ,alpha_link = 0.5 ,size_link = 0.3 ,color_link = "#888888",displace_y_b = c( 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),displace_y_a = c( 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) ,lsize_kcoremax = 5 ,lsize_zig = 4 ,lsize_kcore1 = 4 ,lsize_legend = 5 ,lsize_core_box = 4 ,labels_color = NULL ,height_box_y_expand = 1 ,kcore2tail_vertical_separation = 1,kcore1tail_disttocore = c( 1,1) ,innertail_vertical_separation = 1 ,factor_hop_x = 1,fattailjumphoriz = c( 1,1),fattailjumpvert = c( 1,1) ,coremax_triangle_height_factor = 1.1 ,paint_outsiders = TRUE,displace_outside_component = c( 0,0) ,coremax_triangle_width_factor = 1.1 ,outsiders_separation_expand = 1 ,outsiders_legend_expand = 1 ,specialistskcore2_horizontal_dist_rootleaf_expand = 0.2 ,specialistskcore2_vertical_dist_rootleaf_expand = 0.5 ,specialists_boxes_separation_count = 0.5,root_specialist_expand = c( 0.6,1) ,hide_plot_border = TRUE,rescale_plot_area = c( 1,1) ,kcore1specialists_leafs_vertical_separation = 1 ,corebox_border_size = 0 ,label_strguilda = "Disperser" ,label_strguildb = "Seed" ,landscape_plot = TRUE ,backg_color = "transparent" ,show_title = FALSE ,show_legend = "HIDE" ,use_spline = TRUE ,spline_points = 10 ,file_name_append = "" ,svg_scale_factor = 25 ,aspect_ratio = 1 ,weighted_links = "sqrt" ,square_nodes_size_scale = 1,progress = NULL)

chilopod <- bipartite_graph("data/","M_SD_012.csv" ,sep = "," ,speciesinheader = TRUE ,paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = FALSE,plotsdir = "plot_results/" ,guild_gap_increase = 1.5 ,style = "chilopod" ,flip_results = FALSE ,alpha_level = 0.2,color_guild_a = c("#4169E1","#00008B"),color_guild_b = c("#F08080","#FF0000") 
                            ,alpha_link = 0.3 ,size_link = 0.3 ,color_link = "#888888" ,lsize_kcoremax = 4.5 ,lsize_legend = 4.5 ,lsize_core_box = 2.5 ,hide_plot_border = TRUE ,label_strguilda = "Disperser" ,label_strguildb = "Seed" ,backg_color = "white" ,show_title = FALSE ,show_legend = "TOP" ,svg_scale_factor = 1 ,weighted_links = "sqrt",progress = NULL)

plot_sd012 <- (chilopod$plot / ziggurat$plot) +
    plot_annotation(tag_levels = 'A') & 
    theme(text = element_text(size = 14, face='bold'), plot.tag.position  = c(.05, .9))  # auto-labels A, B, C
if (!dir.exists("myimages")) {
  dir.create("myimages")
}
mw = 12
mh = 12
ggsave("myimages/sd012_all.png", width = mw, height = mh, dpi = 300)
ggsave("myimages/sd012_all.eps", plot = plot_sd012, width = mw, height = mh, device = "eps")
ggsave("myimages/sd012_all.pdf", plot = plot_sd012, width = mw, height = mh, device = "pdf")