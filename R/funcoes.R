#' Calcula os coeficientes (betas) da regressão linear
#'
#' Esta função calcula os coeficientes estimados (\(\hat{\beta}\)) da regressão linear
#' utilizando a fórmula matricial \deqn{\hat{\beta} = (X^T X)^{-1} X^T y}.
#'
#' @param dados Um data frame ou matriz contendo as variáveis independentes e dependentes.
#' @param x Uma matriz das variáveis independentes. Deve ser numérica, sem a coluna do intercepto.
#' @param y Um vetor numérico com os valores observados da variável dependente.
#'
#' @return Um vetor numérico com os coeficientes estimados (betas).
#' @export
#'
#' @examples
#' X <- matrix(c(1, 2, 3, 4, 5), ncol = 1)
#' y <- c(2, 4, 6, 8, 10)
#' betas_est <- betas(dados = NULL, X, y)
betas = function(dados, x, y) {
  # Validações de entrada
  if (!is.matrix(x) && !is.data.frame(x)) {
    stop("x deve ser uma matriz ou data frame numérico.")
  }
  if (!is.numeric(y)) {
    stop("y deve ser um vetor numérico.")
  }
  if (nrow(as.matrix(x)) != length(y)) {
    stop("O número de linhas de x deve ser igual ao comprimento de y.")
  }

  # Verifica se a matriz X tem posto completo
  qr_decomp <- qr(x)
  rank_x <- qr_decomp$rank
  if (rank_x < ncol(x)) {
    stop("A matriz X não possui posto completo.")
  }

  # Cálculo dos betas
  x = cbind(1, x)
  x_t = t(x)
  prod = x_t %*% x
  inv_prod = solve(prod)  # (X^T * X)^(-1)
  beta_est = inv_prod %*% x_t %*% y  # (X^T * X)^(-1) * X^T * y

  return(beta_est)
}

#' Calcula os valores preditos do modelo de regressão linear
#'
#' Esta função calcula os valores preditos com base nas variáveis independentes
#' e nos coeficientes estimados pelo modelo de regressão.
#'
#' @param dados Um data frame ou matriz contendo as variáveis independentes e dependentes.
#' @param x Uma matriz das variáveis independentes. Deve ser numérica, sem a coluna do intercepto.
#' @param y Um vetor numérico com os valores observados da variável dependente.
#'
#' @return Um vetor numérico com os valores preditos.
#' @export
#'
#' @examples
#' X <- matrix(c(1, 2, 3, 4, 5), ncol = 1)
#' y <- c(2, 4, 6, 8, 10)
#' y_pred <- preditos(dados = NULL, X, y)

preditos = function(x, betas) {
  # Validações de entrada
  if (!is.matrix(x) && !is.data.frame(x)) {
    stop("x deve ser uma matriz ou data frame numérico.")
  }
  # Calcula os valores preditos usando os betas estimados
  x = cbind(1, x)
  y_pred = x %*% betas

  return(y_pred)
}

#' Calcula os resíduos do modelo de regressão linear
#'
#' Esta função calcula os resíduos (diferença entre os valores observados e os preditos)
#' para um modelo de regressão linear.
#'
#' @param dados Um data frame ou matriz contendo as variáveis independentes e dependentes.
#' @param x Uma matriz das variáveis independentes. Deve ser numérica, sem a coluna do intercepto.
#' @param y Um vetor numérico com os valores observados da variável dependente.
#'
#' @return Um vetor numérico com os resíduos.
#' @export
#'
#' @examples
#' X <- matrix(c(1, 2, 3, 4, 5), ncol = 1)
#' y <- c(2, 4, 6, 8, 10)
#' res <- residuos(dados = NULL, X, y)
residuos = function(y, preditos) {
  # Validações de entrada
  if (!is.numeric(y)) {
    stop("y deve ser um vetor numérico.")
  }

  # Calcula os resíduos
  residuo = y - preditos

  return(residuo)
}

#' Faz a predição de novos valores com base no modelo ajustado
#'
#' Esta função realiza predições para novos dados com base em um modelo de regressão ajustado manualmente.
#'
#' @param dados Um data frame ou matriz contendo as variáveis independentes e dependentes.
#' @param novos_dados Uma matriz ou data frame numérico com os novos valores para predição.
#' O número de colunas deve ser o mesmo da matriz X original (sem a coluna de intercepto).
#' @param x Uma matriz das variáveis independentes utilizadas no ajuste do modelo original.
#' @param y Um vetor numérico com os valores observados da variável dependente.
#'
#' @return Um vetor numérico com os valores preditos para os novos dados.
#' @export
#'
#' @examples
#' X <- matrix(c(1, 2, 3, 4, 5), ncol = 1)
#' y <- c(2, 4, 6, 8, 10)
#' novos_dados <- matrix(c(6, 7), ncol = 1)
#' novas_predicoes <- predizer_novos_valores(dados = NULL, novos_dados, X, y)

novos_preditos = function(novox, betas) {
  # Validações de entrada
  if (!is.matrix(novox) && !is.data.frame(novox)) {
    stop("x deve ser uma matriz ou data frame numérico.")
  }
  # Calcula os valores preditos usando os betas estimados
  novox = cbind(1, novox)
  y_pred = novox %*% betas

  return(y_pred)
}

#' Gera um gráfico de valores preditos vs observados
#'
#' Esta função gera um gráfico comparando os valores observados com os valores preditos para o modelo de regressão.
#'
#' @param dados Um data frame ou matriz contendo as variáveis independentes e dependentes.
#' @param x Uma matriz das variáveis independentes utilizadas no ajuste do modelo original.
#' @param y Um vetor numérico com os valores observados da variável dependente.
#'
#' @return Um gráfico de valores preditos vs observados.
#' @export
#'
#' @examples
#' X <- matrix(c(1, 2, 3, 4, 5), ncol = 1)
#' y <- c(2, 4, 6, 8, 10)
#' plot_predito_vs_observado(dados = NULL, X, y)

grafico = function(y, preditos, residuos){
  par(mfrow = c(2,2))
  plot(y , preditos, main = "Valores Observados vs Valores Preditos", xlab = "Valores Observados", ylab = "Valores Preditos")
  abline(0, 1, col = "deeppink2")

  plot(preditos, residuos, main = "Residuos vs Valores Preditos",
       xlab = "Valores Previstos", ylab = "Residuos")
  abline(h = 0, col = "#D9006E")

  hist(residuos, main = "Histograma dos Residuos",
       xlab = "Residuos", breaks = 30, col = "pink2")

  qqnorm(residuos, main = "QQ Plot dos Residuos")
  qqline(residuos, col ="#D9006E")
}
