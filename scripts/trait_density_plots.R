# ---
# title:trait_density_plots
# description:Create plots showing the distribution of a trait within a community. There are two options shown here, one for creating a density plot of a continuous trait e.g. plant height, the other for discrete traits e.g. Ellenberg N
# author: helen metcalfe
# date created: 2024-09-18
# ---

library("ggplot2")
library("dplyr")

# Load data -------------------------------------------------------------------
# Load a csv of trait data - Rows should be species, and traits as columns

traits <- read.csv("traits.csv")


## Load csv of species observations - There should be a column of species names and a second column containing the counts. (formatting of species names should match the names in traits.csv)

species_counts <- read.csv("species_counts.csv")


# Merge trait and count data ---------------------------------------------------

count_traits <- merge(species_counts, traits, by = "species_name")


# Create Plots -----------------------------------------------------------------

## For continuous traits -------------------------------------------------------

### Calculate weighting for each species ---------------------------------------

count_traits$weight <-
  as.numeric(count_traits$count) / sum(as.numeric(count_traits$count))


### Draw plot ------------------------------------------------------------------
ggplot(na.omit(count_traits), aes(continuous_trait)) +
  geom_density(aes(x = continuous_trait_1, weight = weight)) +
  scale_x_continuous()


## For discrete traits ---------------------------------------------------------

### Summarize the data ---------------------------------------------------------

discrete_summ <- count_traits %>%
  group_by(as.factor(eval(as.name(discrete_trait)))) %>%
  summarise(n = sum(count))

discrete_summ$density <- discrete_summ$n / sum(discrete_summ$n)


### Draw plot ------------------------------------------------------------------

ggplot() +
  geom_bar(
    data = discrete_summ,
    aes_string(x = trait, y = density),
    alpha = 0.4,
    stat = "identity",
    position = position_dodge()
  )
