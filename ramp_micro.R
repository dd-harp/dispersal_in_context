
#' Make a set of convex hulls to visualize the community
#'
#' @param model a model defined as a compound [list]
#' @param net a network object
#' @param cut if !null, the number of communities for igraph::cut_at
#' @param f_color a function that returns a list of colors (e.g. viridis::turbo)
#'
#' @return the network object with convex hulls attached
#' @export
mod_convex_hulls_i = function(model, i, cut=NULL, f_color=viridis::turbo, stretch=0.1, lwd=2){
  net = get_net(model, i)
  mod_convex_hulls.i(model, net, cut, f_color, stretch, lwd)
}

#' Make a set of convex hulls to visualize the community
#'
#' @param model a model defined as a compound [list]
#' @param net a network object
#' @param cut if !null, the number of communities for igraph::cut_at
#' @param f_color a function that returns a list of colors (e.g. viridis::turbo)
#'
#' @return the network object with convex hulls attached
#' @export
mod_convex_hulls = function(model, net, cut=NULL, f_color=viridis::turbo, stretch=0.1, lwd=2, clrs=NULL){
  clusters = net$clusters_walktrap
  memix = if(is.null(cut)){
    membership(clusters)
  } else {
    cut_at(clusters, cut)
  }
  if(net$type == "b"){
    xy = model$b
  }
  if(net$type == "q"){
    xy = model$q
  }
  if(net$type == "bq"){
    xy = with(model,rbind(b, q))
  }
  if(is.null(clrs)) clrs = f_color(max(memix))
  add_convex_hulls(memix, xy, clrs, stretch, lwd)
}
