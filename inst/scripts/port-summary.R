#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(greynoise))

args_pre <- commandArgs(trailingOnly = FALSE)
args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 1) {
  cat(
    "Usage: gnportsum [port] [tcp|udp]\n\n",
    "You need to have your GreyNoise API key in the GREYNOISE_API_KEY environment variable.\n\n",
    "If 'tcp' or 'udp' is not specified, 'tcp' will be assumed.\n\n",
    "A file will be created in the local directory named '#####.png'.\n",
    sep=""
  )
  quit(save = "no")
}

port <- as.integer(args[1])
protocol <- if (is.na(args[2])) "tcp" else args[2]

if (!((port >= 0) & (port <= 65535))) {
  message("Invalid port.")
  quit(save = "no")
}

if (!(trimws(tolower(protocol)) %in% c("tcp", "udp"))) {
  message("Invalid protocol.")
  quit(save = "no")
}

message("Querying GreyNoise API...")

options(device = png)

gn_port_summary(port, protocol, save = sprintf("%s.png", port))

message(sprintf("[%s] generated in [%s]", sprintf("%s.png", port), getwd()))
