library(tidyverse)
lbres <- read_csv("../../RCrashCourse2023/Datasets/labresults_wide.csv")
lbres

pivot_longer(lbres, LBORRES.ACA:LBORRES.WBC)
print(colorDF::summary_colorDF(lbres), n=1000)

lbres$LBORRES.GFR <- as.numeric(lbres$LBORRES.GFR)
lbres$LBORRES.GFR <- NULL

pivot_longer(lbres, c(-1, -LBORRES.GFR))

## which column is LBORRES.GFR?
colnames(lbres) == "LBORRES.GFR"
which(colnames(lbres) == "LBORRES.GFR")

## we can reverse the order of arguments if we use named arguments
pivot_longer(cols = -1, data = lbres[,-10])
pivot_longer()

library(tidyverse)
res <- read_csv("../../RCrashCourse2023/Datasets/transcriptomics_results.csv")

## only a few interesting columns
res <- res[ , c(3, 5, 8:9) ]
colnames(res) <- c("Gene", "Description", "LFC", "p.value")
res <- arrange(res, desc(abs(LFC)))

plot(mtcars)

plot(res$LFC, res$p.value, log="y")
plot(res$LFC[1:250])
plot(res$p.value[1:250], log="y", type = "b")

res_filtered <- filter(res, LFC < -1)
res_filtered <- res |> filter(LFC < -1)


res_filtered <- filter(res, LFC < -1 & p.value < 0.0000001)
res_filtered <- filter(res, LFC < -1, p.value < 0.0000001)

interferon <- c("TAP1","IFIH1","IRF7","PARP9","STAT1","PLSCR1",
                "IFITM1","HERC5","DDX60","USP18","RSAD2","IFIT1")

res$Gene %in% interferon
interferon_res <- filter(res, Gene %in% interferon)

# grep, grepl
grep("^IFIT", res$Gene)
# this will not work
filter(res, grep("^IFIT", Gene))

grepl("^IFIT", res$Gene)

ifits_res <- filter(res, p.value < 0.05 & grepl("^IFIT", Gene))
ifits_res <- filter(res, p.value < 0.05, grepl("^IFIT", Gene))
ifits_res <- filter(res, p.value < 0.05) |> filter(grepl("^IFIT", Gene))

grep("interferon", res$Description, ignore.case = TRUE)

interferon_genes <- filter(res, grepl("interferon", Description, ignore.case = TRUE))

cc_genes <- filter(res, grepl("(chemokine|cytokine)", Description, ignore.case = TRUE)) |>
            filter(p.value < 0.05)

sel_genes <- filter(res, grepl("^(GBP|SERPIN)", Gene))

ribosomal_genes <- filter(res, grepl("ribosom", Description, ignore.case = TRUE))
ribosomal_genes <- filter(res, grepl("^[MR]?RP[LS]", Gene))

# note: str_match uses a different order of the arguments
known_genes <- filter(res, !grepl("Unknown", Description))
known_genes <- filter(res, Description != "Unknown")
filter(known_genes, grepl("Unknown", Description))
