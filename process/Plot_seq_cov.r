#Make a plot of coverage for the loci

ggplot(data = Results, aes(x = bcov, y = mdcov, color=Locus_name)) + geom_point() + 
  labs(
    x = "Breadth of coverage (%)", # x axis title
    y = "Mean Depth of coverage (X)", # y axis title
    title = "Sequencing Coverage for the target panel", # main title of figure
    color = "Target type" # title of legend
) + xlim(0, 100)