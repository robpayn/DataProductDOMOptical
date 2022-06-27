rmarkdown::render(
   input = "./02_protocol/10_metadata.Rmd",
   output_format = "html_document",
   output_file = "metadata_summary.html",
   output_dir = "./03_incremental",
   knit_root_dir = getwd()
)

zip(
  zipfile = "./04_product/03_incremental.zip",
  files = c(
    "./03_incremental/metadata_summary.html"
  ),
  flags = ifelse(
    file.exists("./04_product/03_incremental.zip"), 
    "-r9u", 
    "-r9"
  )
)

makeEML();
EMLassemblyline::issues()
