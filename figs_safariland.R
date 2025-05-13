# Script to produce the Safariland plots mosaic 
# You have to run in advance safariland.R to create safarinald_plotweb.pdf inside the
# folder myimages


rm(list = ls())

# Load required libraries
library(ggplot2)
library(magick)
library(grid)
library(patchwork)

# Function to read a PDF page and convert it to a ggplot image
pdf_to_ggplot <- function(pdf_file, page = 1) {
  img <- image_read_pdf(pdf_file, density = 150, pages = page)
  img_raster <- as.raster(img)
  
  ggplot() + 
    annotation_custom(rasterGrob(img_raster), xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf) +
    theme_void()
}

# Read images from PDF files
plot_safariland <- pdf_to_ggplot("myimages/safariland_plotweb.pdf", page = 1)

library(kcorebip)
chilopod <- bipartite_graph("data/","Safariland.csv" ,sep = "," ,speciesinheader = TRUE ,
                            paintlinks = TRUE ,orderkcoremaxby = "kradius" ,print_to_file = FALSE,
                            plotsdir = "plot_results/" ,guild_gap_increase = 1.8 ,
                            style = "chilopod" ,flip_results = FALSE ,alpha_level = 0.2,
                            color_guild_a = c("#4169E1","#4169E1"),color_guild_b = c("#F08080","#F08080") 
                ,alpha_link = 0.3 ,size_link = 0.3 ,color_link = "#919191" ,lsize_kcoremax = 6.3 ,lsize_legend = 4.5 ,
                lsize_core_box = 2.5 ,hide_plot_border = TRUE ,
                label_strguilda = "Pollinator" ,label_strguildb = "Plant" ,
                backg_color = "white" ,show_title = FALSE ,show_legend = "TOP" ,svg_scale_factor = 1 ,
                weighted_links = "sqrt",progress = NULL)

mw = 10
mh = 4.6
ggsave("myimages/Safariland_chilopod.pdf", plot = chilopod$plot, width = mw, height = mh, device = "pdf")
dev.off()


# Combine plots vertically with labels
final_plot <-  plot_safariland +  chilopod$plot +  
  plot_layout(ncol = 1, guides = "collect", heights = c(1,1)) & 
  plot_annotation(tag_levels = 'A')& 
  theme(text = element_text(size = 14, face='bold'), 
        plot.tag.position  = c(.1, .9))

# Display or save the result
print(final_plot)
ggsave("myimages/Safariland_all.pdf", final_plot, width = 8, height = 8)
dev.off()
