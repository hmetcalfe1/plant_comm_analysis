# plant_comm_analysis
Generic R scripts for various plant community analyses

# functional_diversity.R
Calculates the functional diversity (following the method of Petchey & Gaston (2007)). Trait data are scaled and centred, and a Gower dissimilarity matrix is computed using the vegan package (Oksanen et al 2019). Hierarchical cluster analysis on the dissimilarity matrix forms a tree (using the ape package, Paradis & Schliep, 2019) where the branch length represents functional dissimilarity and each node is a species. Functional diversity of the community is calculated as the sum of the total branch length present in that community (using picante pacage).

# trait_density_plots.R
Creates plots showing the distribution of a trait within a community. There are two options shown here, one for creating a density plot of a continuous trait e.g. plant height, the other for discrete traits e.g. Ellenberg N

# community_weighted_mean.R
Calculates community weighted means of a trait

# fidelity_score.R
Calculates a fidelity score based on the relative observed species frequencies within the habitat of interest compared to other habitats (Following Chytrý, Tichý, Holt, & Botta-Dukát, 2002). Fidelity scores range from −1 to +1 with positive (negative) values indicating that the species and the habitat of interest co-occur more (less) frequently than would be expected by chance. Larger positive values indicate a greater degree of joint fidelity.