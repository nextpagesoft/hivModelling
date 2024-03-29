#' ReadInputData
#'
#' Description
#'
#' @param inputDataPath Input data path
#' @param verbose Logical indicating to print out messages (TRUE) or not (FALSE)
#'
#' @return
#' Input data as list
#'
#' @examples
#' \dontrun{
#' ReadInputData(inputDataPath)
#' }
#'
#' @export
ReadInputData <- function(
  inputDataPath,
  verbose = TRUE
) {
  inputData <- NULL
  if (is.null(inputDataPath)) {
    return(NULL)
  }

  pathInfo <- file.info(inputDataPath)

  if (!is.na(pathInfo$mode)) {
    # Unzip zip file
    if (!isTRUE(pathInfo$isdir) && tolower(tools::file_ext(inputDataPath)) == 'zip') {
      inDir <- tempfile()
      dir.create(inDir, recursive = TRUE)
      on.exit({
        unlink(inDir, recursive = TRUE, force = TRUE)
      })

      unzip(inputDataPath, exdir = inDir)

      fileNames <- list.files(inDir, recursive = TRUE, full.names = TRUE)
      inputDataPath <- unique(dirname(fileNames))
    }

    # All files should be present in a single folder
    if (length(inputDataPath) == 1L) {
      pathInfo <- file.info(inputDataPath)
      # Read a single file
      if (!isTRUE(pathInfo$isdir)) {
        fileNames <- inputDataPath
      } else {
        # Read directory
        fileNames <- list.files(
          inputDataPath,
          pattern = '(HIV|HIVAIDS|AIDS|Dead|HIV_CD4_[1-4])\\.csv$',
          full.names = TRUE,
          ignore.case = FALSE
        )
      }

      inputData <- setNames(
        lapply(fileNames, function(fileName) {
          dt <- try(suppressWarnings(fread(fileName, fill = TRUE)), silent = TRUE)
          if (inherits(dt, 'try-error')) {
            dt <- NULL
          } else {
            if (length(colnames(dt)) > 0) {
              dt[!is.na(dt) & dt < 0] <- NA
              setnames(dt, 1, 'Year')
              suppressWarnings(dt[, Year := as.integer(Year)])
              dt <- dt[!is.na(Year) & !duplicated(Year)]
              colNames <- colnames(dt)[-1]
              if (length(colNames) > 0) {
                suppressWarnings(dt[, (colNames) := lapply(.SD, as.numeric), .SDcols = colNames])
                dt[, AllDataMissing := all(is.na(.SD)), by = .(Year), .SDcols = colNames]
                dt <- dt[AllDataMissing == FALSE][, AllDataMissing := NULL]
                if (nrow(dt) == 0) {
                  dt <- NULL
                } else {
                  PrintAlert('Data file {.file {fileName}} loaded', verbose = verbose)
                }
              }
            } else {
              dt <- NULL
            }
          }
          return(dt)
        }),
        tools::file_path_sans_ext(basename(fileNames))
      )
    }
  }

  if (is.null(inputData)) {
    return(NULL)
  }

  return(inputData)
}
