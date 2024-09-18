# plant_comm_analysis
Generic R scripts for various plant community analyses

# functional_diversity.R
Calculates the functional diversity (following the method of Petchey & Gaston (2007)). Trait data are scaled and centred, and a Gower dissimilarity matrix is computed using the vegan package (Oksanen et al 2019). Hierarchical cluster analysis on the dissimilarity matrix forms a tree (using the ape package, Paradis & Schliep, 2019) where the branch length represents functional dissimilarity and each node is a species. Functional diversity of the community is calculated as the sum of the total branch length present in that community (using picante pacage).

# trait_density_plots.R
Creates plots showing the distribution of a trait within a community. There are two options shown here, one for creating a density plot of a continuous trait e.g. plant height, the other for discrete traits e.g. Ellenberg N