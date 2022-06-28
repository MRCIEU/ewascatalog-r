#' ewascatalog
#'
#' ewascatalog queries the EWAS Catalog from R.
#' @param query Query text.
#' @param type Type of query, either 'cpg', 'region', 'gene', 'trait', 'efo', 'study' (Default: 'cpg').
#' @param url url of website to query - default is http://www.ewascatalog.org
#'
#' @return Data frame of EWAS Catalog results.
#' @examples
#' # CpG
#' res <- ewascatalog("cg00029284", "cpg")
#'
#' # Region
#' res <- ewascatalog("6:15000000-25000000", "region")
#'
#' # Gene
#' res <- ewascatalog("FTO", "gene")
#'
#' # Trait
#' res <- ewascatalog("Alzheimers disease", "trait")
#'
#' # EFO
#' res <- ewascatalog("EFO_0002950", "efo")
#'
#' # Study
#' res <- ewascatalog("27040690", "study")
#' @author James R Staley <js16174@bristol.ac.uk>
#' @author Thomas Battram <thomas.battram@bristol.ac.uk>
#' @export
ewascatalog <- function(query, type = c("cpg", "loc", "region", "gene", "trait", "efo", "study"),
                        url = "http://www.ewascatalog.org") {
  type <- match.arg(type)
  if (type == "region") {
    ub <- as.numeric(sub(".*-", "", sub(".*:", "", query)))
    lb <- as.numeric(sub("-.*", "", sub(".*:", "", query)))
    dist <- ub - lb
    if (any(dist > 10000000)) stop("region query can be maximum of 10mb in size")
  }
  else if (type == "trait") {
    query <- gsub(" ", "+", tolower(query))
  }
  json_file <- paste0(url, "/api/?", type, "=", query)
  json_data <- rjson::fromJSON(file = json_file)
  if (length(json_data) == 0) {
    return(NULL)
  }
  fields <- json_data$fields
  results <- as.data.frame(matrix(unlist(json_data$results), ncol = length(fields), byrow = T), stringsAsFactors = F)
  names(results) <- fields
  for (field in c("n")) {
    results[[field]] <- as.integer(results[[field]])
  }
  for (field in c("p", "se", "pos")) {
    results[[field]] <- as.numeric(results[[field]])
  }
  return(results)
}
