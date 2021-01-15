# ewascatalog
This package allows users to query the EWAS Catalog from R.

## Functions
ewascatalog - function to query the EWAS Catalog.

## Installation
1. install.packages("devtools")
2. library(devtools)
3. install_github("ewascatalog/ewascatalog-r")
4. library(ewascatalog)

## Examples
\# CpG site
res <- ewascatalog("cg00029284","cpg")

\# Region
res <- ewascatalog("6:15000000-25000000","region")

\# Gene
res <- ewascatalog("FTO","gene")

\# Trait
res <- ewascatalog("body mass index","trait")

\# EFO
res <- ewascatalog("EFO_0002950","efo")

\# Study
res <- ewascatalog("27040690","study")

