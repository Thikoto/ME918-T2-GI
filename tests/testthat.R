# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(Regressao)

test_check("Regressao")

#data(mtcars)

#constantes = rep(1, 32)

betas_estimados2 = betas(mtcars, matrix(c(constantes, mtcars$hp, mtcars$disp), ncol = 3), mtcars$mpg)
valores_preditos = preditos(matrix(c(mtcars$cyl, mtcars$hp, mtcars$disp), ncol = 3), betas = betas_estimados)
residuos_obtido = residuos(mtcars$mpg, valores_preditos)
#graficos = grafico(mtcars$mpg, valores_preditos, residuos_obtido)


#install.packages("testthat")
#library(testthat)

test_that("erro com colunas constantes", {
  expect_error(betas(mtcars, matrix(c(constantes, mtcars$hp, mtcars$disp), ncol = 3), mtcars$mpg), "singular", info = "Matriz X^T*X não é invertível.")
})


#x1 = seq(1:32)
#x2 = 2*seq(1:32)

betas(mtcars, matrix(c(x1, x2, mtcars$disp), ncol = 3), mtcars$mpg)

test_that("erro quando a matriz X não possui posto completo", {
  expect_error(betas(mtcars, matrix(c(x1, x2, mtcars$disp), ncol = 3), mtcars$mpg), "posto completo", info = "X não possui posto completo")
})


###########################################################

coluna = 0.5*mtcars$mpg
betas_estimados2 = betas(mtcars, matrix(coluna, ncol = 1), mtcars$mpg)
valores_preditos2 = preditos(matrix(coluna, ncol = 1), betas = betas_estimados2)
residuos_obtido2 = residuos(mtcars$mpg, valores_preditos2)
test_that("residuos iguais a zero", {
  expect_equal(as.vector(residuos_obtido2), rep(0, length(mtcars$mpg)), tolerance = 1e-8)
})

isZero(residuos_obtido2)
