% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funcoes.R
\name{grafico}
\alias{grafico}
\title{Gera um gráfico de valores preditos vs observados}
\usage{
grafico(y, preditos)
}
\arguments{
\item{y}{Um vetor numérico com os valores observados da variável dependente.}

\item{preditos}{Um vetor numérico com os valores preditos da variável dependente. Recomenda-se o uso da função 'preditos'}
}
\value{
Um gráfico de valores preditos vs observados.
}
\description{
Esta função gera um gráfico comparando os valores observados com os valores preditos para o modelo de regressão.
}
\examples{
y <- c(2, 4, 6, 8, 10)
y_pred <- matrix(c(2.5, 4.6, 6.2, 8.9, 11), nrow = 5, ncol = 1)
grafico(y, y_pred)
}
