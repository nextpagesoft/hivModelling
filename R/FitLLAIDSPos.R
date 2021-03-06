FitLLAIDSPos <- function(
  modelResults,
  info,
  data,
  param
) {
  totModels <- modelResults[, 'N_HIV_Stage_S_Obs_5']
  totDatas <- data[, 'N_HIV_Stage_5']
  modelYears <- modelResults[, 'Year']

  vals <- rep(0, length(totModels))
  sel <-
    totModels > 0 &
    modelYears >= info$FitAIDSPosMinYear &
    modelYears <= info$FitAIDSPosMaxYear

  if (info$ModelFitDist == 'POISSON') {
    vals[sel] <- FitLLPoisson(totModels[sel], totDatas[sel])
  } else  if (info$ModelFitDist == 'NEGATIVE_BINOMIAL') {
    vals[sel] <- FitLLNegBin(totModels[sel], totDatas[sel], param$RDispRest)
  } else {
    stop(sprintf('info$ModelFitDist equal "%s" is unsupported', info$ModelFitDist))
  }

  ll <- sum(vals)

  return(list(
    LL = ll,
    Vals = vals,
    ColName = 'LL_AIDSPos_Year'
  ))
}
