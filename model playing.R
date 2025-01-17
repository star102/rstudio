library(tidyverse)        # ggplot, dplyr, %>%, and friends
library(brms)             # Bayesian modeling through Stan
library(tidybayes)        # Manipulate Stan objects in a tidy way
library(broom)            # Convert model objects to data frames
library(broom.mixed)      # Convert brms model objects to data frames
library(vdemdata)         # Use data from the Varieties of Democracy (V-Dem) project
library(betareg)          # Run beta regression models
library(extraDistr)       # Use extra distributions like dprop()
library(ggdist)           # Special geoms for posterior distributions
library(gghalves)         # Special half geoms
library(ggbeeswarm)       # Special distribution-shaped point jittering
library(ggrepel)          # Automatically position labels
library(patchwork)        # Combine ggplot objects
library(marginaleffects)  # Calculate marginal effects for frequentist models
library(emmeans)          # Calculate marginal effects in even fancier ways
library(modelsummary)     # Create side-by-side regression tables

set.seed(1234)  # Make everything reproducible

# Define the goodness-of-fit stats to include in modelsummary()
gof_stuff <- tribble(
  ~raw, ~clean, ~fmt,
  "nobs", "N", 0,
  "r.squared", "R²", 3
)

# Custom ggplot theme to make pretty plots
# Get the font at https://fonts.google.com/specimen/Barlow+Semi+Condensed
theme_clean <- function() {
  theme_minimal(base_family = "Barlow Semi Condensed") +
    theme(panel.grid.minor = element_blank(),
          plot.title = element_text(family = "BarlowSemiCondensed-Bold"),
          axis.title = element_text(family = "BarlowSemiCondensed-Medium"),
          strip.text = element_text(family = "BarlowSemiCondensed-Bold",
                                    size = rel(1), hjust = 0),
          strip.background = element_rect(fill = "grey80", color = NA))
}

# Make labels use Barlow by default
update_geom_defaults("label_repel", 
                     list(family = "Barlow Semi Condensed"))
