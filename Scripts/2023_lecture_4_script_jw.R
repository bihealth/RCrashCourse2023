res <- read_csv("../Datasets/transcriptomics_results.csv")
res

sign <- res$qval.F.D1 < 0.05
nrow(res) == length(sign)

strong <- abs(res$logFC.F.D1) > 1.5

sel <- sign & strong
length(sel)

res_strong_sign <- res[ sel, ]
nrow(res_strong_sign)


ribo_rows <- grep("ribosomal", res$Description, 
                  ignore.case = TRUE)
length(ribo_rows)

ribo_rows_l <- grepl("ribosomal", res$Description, 
                  ignore.case = TRUE)
length(ribo_rows_l)
sum(ribo_rows_l)

ribosomal <- res[ ribo_rows_l, ]
nrow(ribosomal)
