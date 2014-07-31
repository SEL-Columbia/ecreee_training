require(networkplanner)

# load it
base_dir <- "leona_500kwh_dmd"
np <- read_networkplan(base_dir)

# sequence it
nps <- sequence_plan_far(np, sequence_model=mv_v_dmd_sequence_model)

# write it as json
js <- igraph_to_json(nps@network)
write(js, "leona_500kwh_dmd/igraph.json")

