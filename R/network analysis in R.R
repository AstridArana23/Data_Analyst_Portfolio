library(tm)
library(igraph)
textCorpus <- Corpus(DirSource("C:/Users/jessi/OneDrive/Documents/cisi40"))
textCorpus
textCorpus <- tm_map(textCorpus, content_transformer(tolower)) #Converts everything to lowercase, so we don't count "Information" and "information" as different words#
textCorpus <- tm_map(textCorpus, removeWords, stopwords("english"))
textCorpus <- tm_map(textCorpus, removeNumbers)
textCorpus <- tm_map(textCorpus, removePunctuation)
tdm <- TermDocumentMatrix(textCorpus)
tdm
dim(tdm)
tdmDense <- removeSparseTerms(tdm,sparse=0.88)
dim(tdmDense)
tdmPlain <- as.matrix(tdmDense)
tdmPlain[1:10,1:3]
tdmBool <- tdmPlain
tdmBool[tdmBool>=1] <- 1
tdmBool[1:10, 1:3]  
tt <- tdmBool %*% t(tdmBool)
tt[1:10, 1:5]
g<-graph.adjacency(tt,weighted=T,mode='undirected')
plot(g)
g <- simplify(g)
plot(g,layout = layout.fruchterman.reingold)
myDegree <- degree(g, v = V(g), mode = c("all", "out", "in", "total"),loops = TRUE, normalized = FALSE)
myDegree
sort(myDegree, decreasing=TRUE)[1:10]
sort(betweenness(g),decreasing=TRUE)[1:20]
wtc <- cluster_walktrap(g)
modularity(g, membership(wtc))
tkplot(g,layout=layout.grid,vertex.color='yellow')
