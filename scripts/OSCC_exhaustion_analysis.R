library(GEOquery)

gset <- getGEO(filename = "C:/GEO/GSE30784_series_matrix.txt.gz")
length(gset)
expr <- exprs(gset[[1]])
class(gset)
expr <- exprs(gset)
pheno <- pData(gset)
dim(expr)
dim(pheno)
head(pheno$title)
colnames(pheno)
head(pheno)
exhaustion_genes <- c(
  "PDCD1",
  "LAG3",
  "CTLA4",
  "TIGIT",
  "HAVCR2",
  "ENTPD1",
  "TOX"
)
available_genes <- intersect(exhaustion_genes, rownames(expr))
available_genes
fdata <- fData(gset)
head(fdata)
colnames(fdata)
rownames(expr) <- fdata$<gene_symbol_column>
  fdata <- fData(gset)
colnames(fdata)
head(fdata)
annotation <- fData(gset)
map <- data.frame(
  probe = rownames(annotation),
  symbol = annotation$`Gene Symbol`
)

annotation <- fData(gset)
head(annotation$`Gene Symbol`)
table(is.na(annotation$`Gene Symbol`))
gene_symbols <- annotation$`Gene Symbol`
head(gene_symbols)
expr_symbols <- expr
rownames(expr_symbols) <- gene_symbols
sum(duplicated(rownames(expr_symbols)))
valid_idx <- gene_symbols != "" & !is.na(gene_symbols)
expr_clean <- expr[valid_idx, ]
gene_clean <- gene_symbols[valid_idx]
rownames(expr_clean) <- gene_clean
library(dplyr)

expr_df <- as.data.frame(expr_clean)
expr_df$gene <- rownames(expr_clean)

expr_final <- expr_df %>%
  group_by(gene) %>%
  summarise(across(where(is.numeric), mean))

expr_final <- as.data.frame(expr_final)
rownames(expr_final) <- expr_final$gene
expr_final$gene <- NULL
dim(expr_final)
head(expr_final[, 1:5])
expr_final <- as.data.frame(expr_final)
rownames(expr_final) <- expr_final$gene
expr_final$gene <- NULL
"PDCD1" %in% rownames(expr_final)
"LAG3" %in% rownames(expr_final)
gene_clean <- sapply(strsplit(gene_symbols, " /// "), `[`, 1)
valid_idx <- gene_clean != "" & !is.na(gene_clean)

expr_clean <- expr[valid_idx, ]
gene_clean <- gene_clean[valid_idx]

rownames(expr_clean) <- gene_clean
library(dplyr)

expr_df <- as.data.frame(expr_clean)
expr_df$gene <- rownames(expr_clean)

expr_final <- expr_df %>%
  group_by(gene) %>%
  summarise(across(where(is.numeric), mean))

expr_final <- as.data.frame(expr_final)
rownames(expr_final) <- expr_final$gene
expr_final$gene <- NULL
"PDCD1" %in% rownames(expr_final)
"LAG3" %in% rownames(expr_final)
exhaustion_genes <- c(
  "PDCD1",
  "LAG3",
  "CTLA4",
  "TIGIT",
  "HAVCR2",
  "ENTPD1",
  "TOX"
)
available_genes <- intersect(exhaustion_genes, rownames(expr_final))
available_genes
ex_mat <- expr_final[available_genes, ]
ex_score <- colMeans(ex_mat)
hist(ex_score,
     main = "T cell Exhaustion Score in OSCC",
     xlab = "Exhaustion Score")
png("plots/exhaustion_histogram.png", width = 800, height = 600)
hist(ex_score,
     main = "T cell Exhaustion Score in OSCC",
     xlab = "Exhaustion Score")
dev.off()
dir.create("plots", showWarnings = FALSE)
png("plots/exhaustion_histogram.png", width = 800, height = 600)
hist(ex_score,
     main = "T cell Exhaustion Score in OSCC",
     xlab = "Exhaustion Score")
dev.off()
null device 
1
dir.create("plots", showWarnings = FALSE)
getwd()
png("plots/exhaustion_histogram.png", width = 800, height = 600)

hist(ex_score,
     main = "T cell Exhaustion Score in OSCC",
     xlab = "Exhaustion Score")

dev.off()
while (!is.null(dev.list())) dev.off()
getwd()
setwd(getwd())  # or set your project folder manually
dir.create("plots", showWarnings = FALSE, recursive = TRUE)
grDevices::png("plots/exhaustion_histogram.png", width = 800, height = 600)

hist(ex_score,
     main = "T cell Exhaustion Score in OSCC",
     xlab = "Exhaustion Score")

grDevices::dev.off()
file.exists("plots/exhaustion_histogram.png")
browseURL("plots/exhaustion_histogram.png")
high_ex <- ex_score > median(ex_score)
table(high_ex)
boxplot(expr_final["PDCD1", ] ~ high_ex,
        main = "PDCD1 Expression in High vs Low Exhaustion",
        col = c("skyblue", "tomato"))
boxplot(
  as.numeric(expr_final["PDCD1", ]) ~ high_ex,
  main = "PDCD1 Expression in High vs Low Exhaustion",
  col = c("skyblue", "tomato")
)
boxplot(
  as.numeric(expr_final["LAG3", ]) ~ high_ex,
  main = "LAG3 Expression in High vs Low Exhaustion",
  col = c("skyblue", "tomato")
)
exhaustion_genes <- c(
  "PDCD1",
  "LAG3",
  "CTLA4",
  "TIGIT",
  "HAVCR2",
  "ENTPD1",
  "TOX"
)
par(mfrow = c(3,3))

for(gene in exhaustion_genes){
  
  if(gene %in% rownames(expr_final)){
    
    boxplot(
      as.numeric(expr_final[gene, ]) ~ high_ex,
      main = gene,
      col = c("skyblue", "tomato")
    )
    
  }
  
}
png("plots/exhaustion_marker_boxplots.png",
    width = 1200,
    height = 1000)

par(mfrow = c(3,3))

for(gene in exhaustion_genes){
  
  if(gene %in% rownames(expr_final)){
    
    boxplot(
      as.numeric(expr_final[gene, ]) ~ high_ex,
      main = gene,
      col = c("skyblue", "tomato")
    )
    
  }
  
  png("plots/exhaustion_marker_boxplots.png",
      width = 1200,
      height = 1000)
  
  par(mfrow = c(3,3))
  
  for(gene in exhaustion_genes){
    
    if(gene %in% rownames(expr_final)){
      
      boxplot(
        as.numeric(expr_final[gene, ]) ~ high_ex,
        main = gene,
        col = c("skyblue", "tomato")
      )
      
    }
    
  }
  
  dev.off()
  par(mfrow = c(3,3))
  
  for(gene in exhaustion_genes){
    
    if(gene %in% rownames(expr_final)){
      
      boxplot(
        as.numeric(expr_final[gene, ]) ~ high_ex,
        main = gene,
        col = c("skyblue", "tomato")
      )
      
    }
    
  }
  getwd()
  png("C:/OSCC_Project/plots/exhaustion_marker_boxplots.png",
      width = 1200,
      height = 1000)
  
  par(mfrow = c(3,3))
  
  for(gene in exhaustion_genes){
    
    if(gene %in% rownames(expr_final)){
      
      boxplot(
        as.numeric(expr_final[gene, ]) ~ high_ex,
        main = gene,
        col = c("skyblue", "tomato")
      )
      png("C:/OSCC Project/plots/exhaustion_marker_boxplots.png",
          width = 1200,
          height = 1000)
      
      par(mfrow = c(3,3))
      
      for(gene in exhaustion_genes){
        
        if(gene %in% rownames(expr_final)){
          
          boxplot(
            as.numeric(expr_final[gene, ]) ~ high_ex,
            main = gene,
            col = c("skyblue", "tomato")
          )
          
        }
        
      }
      
      dev.off()
      cor_matrix <- cor(t(ex_mat))
      round(cor_matrix, 2)
      plot(as.numeric(expr_final["PDCD1", ]),
           as.numeric(expr_final["LAG3", ]),
           xlab = "PDCD1",
           ylab = "LAG3",
           main = "PDCD1 vs LAG3")
      cor(as.numeric(expr_final["PDCD1", ]),
          as.numeric(expr_final["LAG3", ]))
      png("C:/OSCC Project/plots/PDCD1_vs_LAG3.png",
          width = 800,
          height = 600)
      
      plot(as.numeric(expr_final["PDCD1", ]),
           as.numeric(expr_final["LAG3", ]),
           xlab = "PDCD1",
           ylab = "LAG3",
           main = "PDCD1 vs LAG3")
      
      dev.off()
      round(cor_matrix, 2)
      heatmap_matrix <- ex_mat
      heatmap(
        as.matrix(heatmap_matrix),
        scale = "row"
      )
      png("C:/OSCC Project/plots/exhaustion_heatmap_large.png",
          width = 1800,
          height = 1400,
          res = 200)
      
      heatmap(
        as.matrix(heatmap_matrix),
        scale = "row"
      )
      
      dev.off()
      cor_matrix
      heatmap(
        cor_matrix,
        scale = "none"
      )
      png("C:/OSCC Project/plots/correlation_heatmap.png",
          width = 1200,
          height = 1000,
          res = 200)
      
      heatmap(
        cor_matrix,
        scale = "none"
      )
      
      dev.off()
      pca_res <- prcomp(t(ex_mat), scale. = TRUE)
      plot(
        pca_res$x[,1],
        pca_res$x[,2],
        col = ifelse(high_ex, "red", "blue"),
        pch = 16,
        xlab = "PC1",
        ylab = "PC2",
        main = "PCA of T cell Exhaustion Markers"
        
      )
