# ---
# title:community_weighted_mean
# description:Calculate trait community weighted means
# author: helen metcalfe
# date created: 2024-09-18
# ---

library("dplyr")

# Load data -------------------------------------------------------------------
# Load a csv of trait data - Rows should be species, and traits as columns

traits <- read.csv("traits.csv")


## Load csv of species observations - There should be a column sfor each species containing the counts. (formatting should match the names in traits.csv)

species_counts <- read.csv("species_counts.csv")

# Format species names ---------------------------------------------------------
# Set the rownames in the traits data.frame to the species names and remove the column

rownames(traits) <- traits$species_name
traits <- select(
  traits,
  -species_name
)


# check that the two data.frames contain the same list of species
# This should be "TRUE", if not the data need curating so that the species lists are identical in both data.frames

identical(rownames(traits), colnames(species_counts))

# Calculate the community weighted mean ----------------------------------------

cwm <- weighted.mean(traits$trait_name, species_counts)
