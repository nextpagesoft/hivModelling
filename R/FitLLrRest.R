FitLLrRest <- function(
  r,
  extraArgs
) {
  modelResults <- extraArgs$ModelResults
  data <- extraArgs$Data
  info <- extraArgs$Info
  param <- extraArgs$Param

  psiry <- 0

  noCD4 <- param$NoStage - 1
  N_HIV_Stage_S_Obs_HIVAIDS <- sprintf('N_HIV_Stage_S_Obs_%d', param$NoStage)
  N_HIV_Stage_HIVAIDS <- sprintf('N_HIV_Stage_%d', param$NoStage)
  totModelsHIVAIDS <- modelResults[[N_HIV_Stage_S_Obs_HIVAIDS]]
  totDatasHIVAIDS <- data[[N_HIV_Stage_HIVAIDS]]
  totModelsHIV <- modelResults[['N_HIV_S_Obs']]
  totDatasHIV <- data[['N_HIV']]
  totModelsCD4 <-
    modelResults[, sprintf('N_HIV_Stage_S_Obs_%d', seq_len(noCD4)),
                 with = FALSE]
  totDatasCD4 <- data[, sprintf('N_HIV_Stage_%d', seq_len(noCD4)), with = FALSE]

  for (year in seq_len(nrow(modelResults))) {
    # Category HIV/AIDS
    if (
      totModelsHIVAIDS[year] > 0 &&
      modelResults$Year[year] >= info$FitAIDSPosMinYear &&
      modelResults$Year[year] <= info$FitAIDSPosMaxYear
    ) {
      psiry <- psiry +
        digamma(r + totDatasHIVAIDS[year]) -
        digamma(r) +
        (totModelsHIVAIDS[year] - totDatasHIVAIDS[year]) / (r + totModelsHIVAIDS[year]) +
        log(r / (r + totModelsHIVAIDS[year]))
    }

    # HIV
    if (
      totModelsHIV[year] > 0 &&
      modelResults$Year[year] >= info$FitPosMinYear &&
      modelResults$Year[year] <= info$FitPosMaxYear &&
      (modelResults$Year[year] < info$FitPosCD4MinYear ||
       modelResults$Year[year] > info$FitPosCD4MaxYear)
    ) {
      psiry <- psiry +
        digamma(r + totDatasHIV[year]) -
        digamma(r) +
        (totModelsHIV[year] - totDatasHIV[year]) / (r + totModelsHIV[year]) +
        log(r / (r + totModelsHIV[year]))
    }

    # HIV by CD4
    for (j in seq_len(noCD4)) {
      if (
        totModelsCD4[[j]][year] > 0 &&
        modelResults$Year[year] >= info$FitPosCD4MinYear &&
        modelResults$Year[year] <= info$FitPosCD4MaxYear
      ) {
        psiry <- psiry +
          digamma(r + totDatasCD4[[j]][year]) -
          digamma(r) +
          (totModelsCD4[[j]][year] - totDatasCD4[[j]][year]) / (r + totModelsCD4[[j]][year]) +
          log(r / (r + totModelsCD4[[j]][year]))
      }
    }
  }

  return(psiry)
}