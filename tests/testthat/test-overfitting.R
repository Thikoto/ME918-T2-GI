library(testthat)
devtools::load_all()

betas_estimados2 = betas(dados_teste, matrix(dados_teste$x_y, ncol = 1), dados_teste$y_erro)
valores_preditos2 = preditos(matrix(dados_teste$x_y, ncol = 1), betas = betas_estimados2)
residuos_obtido2 = residuos(dados_teste$y_erro, valores_preditos2)

test_that("overfitting", {
  expect_equal(as.vector(residuos_obtido2), rep(0, length(dados_teste$y_erro)), tolerance = 1e-8)
})
