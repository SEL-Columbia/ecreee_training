require(networkplanner)

# load it
base_dir <- "ecreee_training/leona_500kwh_dmd"
np <- read_networkplan(base_dir)

# sequence it
nps <- sequence_plan_far(np, sequence_model=mv_v_dmd_sequence_model)

# remove unnecessary fields
# helper function to merge vertices back
join_vertex_df_igraph <- function(g, vertex_df) {

    vertex_df$id <- 1:nrow(vertex_df)
    col_names <- setdiff(names(vertex_df), "id")
    col_names <- c("id", col_names)
    vertex_df <- vertex_df[,col_names]
    edge_df <- get.data.frame(g, what="edges")
    graph.data.frame(edge_df, directed=F, vertices=vertex_df)
}     

fields <- c("X", "Y", "Name",
"Sequence..Far.sighted.sequence",
"Sequence..Downstream.demand.sum.kwh",
"Sequence..Downstream.distance.sum.m",
"Sequence..Downstream.distance.sum.m.per.downstream.demand.sum.kwh",
"Population")

vertex_df <- get.data.frame(nps@network, what="vertices")
vertex_df <- vertex_df[,fields]
network <- join_vertex_df_igraph(nps@network, vertex_df)

# write it as json
js <- igraph_to_json(network)
write(js, "ecreee_training/leona_500kwh_dmd/igraph.json")

