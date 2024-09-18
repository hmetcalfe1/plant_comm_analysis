# ---
# title:functional_diversity
# description: Calculates the functional diversity (following the method of Petchey & Gaston (2007)). Trait data are scaled and centred, and a Gower dissimilarity matrix is computed using the vegan package (Oksanen et al 2019). Hierarchical cluster analysis on the dissimilarity matrix forms a tree (using the ape package, Paradis & Schliep, 2019) where the branch length represents functional dissimilarity and each node is a species. Functional diversity of the community is calculated as the sum of the total branch length present in that community (using picante pacage).

# author: helen metcalfe
# date created: 2024-09-18
# ---

library("vegan")
library("ape")
library("picante")


# Load data ---------------------------------------------------------------
# Load a csv of trait data - Rows should be species, and traits as columns

traits <- read.csv("traits.csv")

## Load csv of species observations - There should be a column sfor each species containing the counts. (formatting should match the names in traits.csv)

species_counts <- read.csv("species_counts.csv")


# Standardize the traits data --------------------------------------------------

z_traits <- traits |>
  scale(center = TRUE, scale = TRUE)


# Create tree -------------------------------------------------------------------

trait_distances <- vegdist(z_traits, "gower", na.rm = FALSE)
trait_tree <- hclust(trait_distances, method = "average")
tree_phylo <- as.phylo(trait_tree)


# Calculate functional diversity -----------------------------------------------
# Use tree to caluclate functional diversity (phylogenetic distance function from )

functional_div <- pd(species_counts, tree_phylo)
