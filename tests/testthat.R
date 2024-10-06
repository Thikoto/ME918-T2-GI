# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(Regressao)

#test_check("Regressao")

betas_estimados = betas(dados_teste, matrix(c(dados_teste$x1, dados_teste$x2, dados_teste$x3), ncol = 3), dados_teste$y_erro)
valores_preditos = preditos(matrix(c(dados_teste$x1, dados_teste$x2, dados_teste$x3), ncol = 3), betas = betas_estimados)
residuos_obtido = residuos(dados_teste$y_erro, valores_preditos)
graficos = grafico(dados_teste$y_erro, valores_preditos, residuos_obtido)


#install.packages("testthat")
#library(testthat)

usethis::use_test("coluna_constante")

###########################################################

usethis::use_test("posto_incompleto")

###########################################################
usethis::use_test("overfitting")
