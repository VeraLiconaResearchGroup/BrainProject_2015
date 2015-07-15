genrand50<-function(n) {
nodes<-numeric(n)
edges<-numeric(n)
extraZero<-"00"
for (i in 1:n) {
  if (i < 100 & i > 9) {
    extraZero <- "0"
  }
  if (i >= 100) {
    extraZero <- ""
  }
  net<-paste("rand_", extraZero ,i,".txt",sep="")
  g<-erdos.renyi.game(50,0.05,directed=TRUE)
  nodes[i]<-vcount(g)
  edges[i]<-ecount(g)
  write.graph(g, net, "edgelist")
}
data<-data.frame(nodes, edges)
write.table(data, "attributes.txt", sep="\t", row.names = FALSE, col.names = FALSE)
}
