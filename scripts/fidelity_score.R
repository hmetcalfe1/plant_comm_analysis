# ---
# title:fidelity_score
# description:Calculates a fidelity score based on the relative observed species frequencies within the habitat of interest compared to other habitats (Following Chytrý, Tichý, Holt, & Botta-Dukát, 2002). Fidelity scores range from −1 to +1 with positive (negative) values indicating that the species and the habitat of interest co-occur more (less) frequently than would be expected by chance. Larger positive values indicate a greater degree of joint fidelity.
# author: helen metcalfe
# date created: 2024-09-18
# ---


# Load data -------------------------------------------------------------------
## Load csv of site, habitat,species observations - There should be 4 columns: 1) site names, 2) habitats, 3) species names, 4)counts

site_hab_sp <- read.csv("site_hab_sp.csv")


# Calculate fidelity parameters ------------------------------------------------

# N=number of releves in the data set

N <- length(unique(site_hab_sp$site))


# Np=number of releves in the particular vegetation unit

Np <-
  length(unique(site_hab_sp$site[which(site_hab_sp$habitat == my_habitat)]))


# n=number of occurrences of the species in the data set

species_occ <- subset(site_hab_sp, species_name == my_species)
n <- nrow(species_occ)


# np= number of occurrences of the species in the particular vegetation unit

species_hab_occ <- subset(species_occ, habitat == my_habitat)
np <- nrow(species_hab_occ)


# Calculate Fidelity score -----------------------------------------------------

Fidelity <-
  ((N * np) - (n * Np)) / (sqrt(n * Np * (N - n) * (N - Np)))
