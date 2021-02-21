
<!-- README.md is generated from README.Rmd. Please edit that file -->

ewascatalog
===========

<!-- badges: start -->
<!-- badges: end -->

This package allows users to query the EWAS Catalog from R.

Installation
------------

You can install the package from [GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("MRCIEU/ewascatalog-r")

Examples
--------

This is a basic example which shows you how to solve a common problem:

    library(ewascatalog)
    ## CpG site query
    res <- ewascatalog("cg00029284", "cpg")

    ## Region query
    res <- ewascatalog("6:15000000-25000000", "region")
    #> Warning in ewascatalog("6:15000000-25000000", "region"): NAs introduced by
    #> coercion

    ## Gene
    res <- ewascatalog("FTO", "gene")
    #> Warning in ewascatalog("FTO", "gene"): NAs introduced by coercion

    ## Trait
    res <- ewascatalog("body mass index", "trait")
    #> Warning in ewascatalog("body mass index", "trait"): NAs introduced by coercion

    ## EFO
    res <- ewascatalog("EFO_0002950", "efo")
    #> Warning in ewascatalog("EFO_0002950", "efo"): NAs introduced by coercion

    ## Study
    res <- ewascatalog("27040690", "study")
    #> Warning in ewascatalog("27040690", "study"): NAs introduced by coercion
