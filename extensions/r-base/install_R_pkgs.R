options(repos = c("CRAN" = "https://cran.rstudio.com/", "US" = "https://cran.us.r-project.org", "CLOUD" = "https://cloud.r-project.org"))
options(Ncpus = 4)
library(dplyr)
library(remotes)


installedPreviously <- read.csv("/r-pkgs.csv")
baseR <- as.data.frame(installed.packages())
baseR <- baseR[, c("Package", "Version")]
df <- as.data.frame(setdiff(installedPreviously, baseR))
gitRepoPkgs <- c("anytime", "BH", "bit64")
basePkgs <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tcltk", "tools", "utils")
df <- filter(df, Package %in% basePkgs)
df$pkgInstall <- paste(df$Package, df$Version, sep = "=")
# For each package
for (pkg in df$Package) {
  # Try to install from CRAN first and then from GitHub if it fails
  tryCatch({
    install.packages(pkg$pkgInstall)
  }, error = function(e) {
    # Install from GitHub
    remotes::install_github(df[df$Package == pkg, "Repo"])
  })
}