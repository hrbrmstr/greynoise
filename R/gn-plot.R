#' Generate a simple port summary plot
#'
#' @md
#' @param port,protocol,gn_key same as [research_time_series()]
#' @param save if not `NULL`, the full path to save the file (with `.png` extension)
#' @export
gn_port_summary <- function(port, protocol = c("tcp", "udp"),
                            save = NULL,
                            gn_key = Sys.getenv("GREYNOISE_API_KEY")) {

  research_time_series(
    port = port, protocol = protocol, summary = TRUE, gn_key = gn_key
  ) -> psum

  logo <- png::readPNG(system.file("img", "gn-small.png", package="greynoise"))
  ann <- rasterGrob(logo, width=unit(10, "lines"))

  ggplot(gn5555, aes(date, ips)) +
    geom_area(color = "white", fill = "#ffffff55") +
    scale_x_date(expand=c(0,0)) +
    scale_y_continuous(expand = c(0,0), labels=scales::comma) +
    labs(
      x = NULL, y ="# Unique IPvs",
      title = sprintc("Port %s Summary History", port),
      caption = "Source: GreyNoise Intelligence"
    ) +
    theme_gn() -> gg

  gg <- flush_ticks(gg, cat = FALSE)

  gb <- ggplot_build(gg)
  gt <- ggplot_gtable(gb)

  gt$grobs[[17]] <- ann

  plot(gt)

  if (!is.null(save)) {

    ggsave(
      filename = path.expand(save),
      plot = gt,  device = "png", dpi = "retina",
      width = 7.5, height = 4.5, bg = "#131111"
    )

    message(sprintC("Plot saved to [%s]", path.expand(save)))

  }

}